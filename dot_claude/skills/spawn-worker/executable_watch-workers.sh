#!/usr/bin/env bash
# Usage: watch-workers.sh <state-dir>   (run from the repo; state-dir is the
# session's scratchpad). Run it under Monitor and re-arm it on expiry.
#
# Emits one line per actionable event:
# - a named herdr agent leaving "working" (idle, done, blocked), or newly blocked;
# - a new comment or review on a PR listed in <state-dir>/watch.prs (one
#   number per line, re-read every poll) whose body lacks the Claude
#   attribution.
# Statuses and the comment cursor are kept in <state-dir>, so a re-arm
# neither repeats nor misses an event. Add or remove PRs by editing
# watch.prs; never restart the monitor for that.
set -u
dir=${1:?state dir}
repo=$(gh repo view --json nameWithOwner --jq .nameWithOwner) || exit 1
state=$dir/watch.state sincef=$dir/watch.since prsf=$dir/watch.prs
declare -A prev
[ -f "$state" ] && while IFS=$'\t' read -r n st; do prev[$n]=$st; done < "$state"
since=$(cat "$sincef" 2>/dev/null || date -u +%Y-%m-%dT%H:%M:%SZ)
while true; do
  if list=$(herdr agent list 2>/dev/null); then
    while IFS=$'\t' read -r name status; do
      [ -z "$name" ] && continue
      old=${prev[$name]-}
      # Leaving "working", or any new "blocked"; done <-> idle is noise.
      if [ -n "$old" ] && [ "$old" != "$status" ] && { [ "$old" = working ] || [ "$status" = blocked ]; } && [ "$status" != working ]; then
        echo "worker $name: $old -> $status"
      fi
      prev[$name]=$status
    done < <(jq -r '.result.agents[] | select(.name) | "\(.name)\t\(.agent_status)"' <<<"$list")
    for n in "${!prev[@]}"; do printf '%s\t%s\n' "$n" "${prev[$n]}"; done > "$state"
  fi

  now=$(date -u +%Y-%m-%dT%H:%M:%SZ)
  for pr in $(cat "$prsf" 2>/dev/null); do
    for ep in issues/$pr/comments pulls/$pr/comments pulls/$pr/reviews; do
      gh api "repos/$repo/$ep" --paginate 2>/dev/null \
        | jq -r --arg s "$since" --arg pr "$pr" '.[] | select((.created_at // .submitted_at // "") > $s)
            | select((.body // "") | test("Claude Code|Generated with") | not)
            | "PR #\($pr) new comment by \(.user.login): \((.body // "")[0:120] | gsub("\n"; " "))"' || true
    done
  done
  since=$now; echo "$since" > "$sincef"
  sleep 30
done
