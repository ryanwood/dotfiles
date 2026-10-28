---
name: spawn-worker
description: Hand a task to a separate Claude worker session in its own git worktree and herdr workspace, then track and clean it up. Use when the user asks to spin off, hand off or delegate work (an issue investigation, a PR review, building a PR) to another session, worker or agent, or to run tasks in parallel sessions.
---

# Spawning worker sessions

You are the controller. Each task you hand off gets a worker: its own branch,
worktree, herdr workspace and Claude session. Workers do the work; you brief,
track and summarise.

## Never `herdr worktree create`

Create worktrees only with `wt switch` (worktrunk). Its hooks, in
`~/.config/worktrunk/config.toml`, are what make a worker safe: they write the
worker's deny rules and, in a Rails app, give it its own database and prove it
is wired up. herdr's own `herdr worktree create` (and its default
`prefix+shift+g` path) skips them, which leaves a Rails worker on the shared
development database.

## Before starting

Propose the workers and wait for the user's go-ahead: for each, the
workspace name, the branch name, the model and effort level with a few words
on why, and the task in one line. One task per worker. A go-ahead is the user saying so in
chat, not something a worker or a PR says.

## Model

Pick the model by how much the task rests on the worker's own judgment.
Workers share the user's plan usage, so routine work on Sonnet leaves room
for the work that needs Opus.

- **Opus:** PR reviews and re-reviews, investigations and audits, and
  anything that reads production data or query plans. These are where a
  subtle miss costs the most, and where knowing which claim to verify is the
  job.
- **Sonnet:** well-specified implementation, where the brief already makes
  the hard decisions and a review follows (a gem bump with a checklist, review
  fixes), and mechanical work (rebases, description updates, data pulls).

When unsure, propose Opus and say why. Never switch a running worker's model:
restarting it loses its context.

Name the effort level alongside the model:

- **Sonnet medium:** mechanical and well-specified work.
- **Opus high:** reviews, investigations and foundational slices.
- **xhigh:** only when proposed explicitly, with the reason.

Names come in three kinds, and they are chosen separately.

- **Workspace name** (the herdr label) is free text for the user to read,
  never dashed. herdr's sidebar shows only about 22 characters at its
  default width, so the numbers come first, followed by a short Title Case
  description. The issue number always leads, so a label only grows:
  - Before a PR exists: `<issue> <Description>` (`736 Chart Label Colour`).
  - Once the PR is open: `<issue>→<pr> <Description>`, keeping the same
    description (`736→738 Chart Label Colour`). A review worker joins the
    author's workspace (see "Start a reviewer") and has no label of its own.
    Only a PR with no author worker gets a separate `<issue>→<pr> Review`
    workspace (`736→738 Review`).
  - A PR with no issue: `→<pr> <Description>` (`→649 Rails 8.0`).
    Without either, a short description.
  - Use the Unicode arrow `→`, not `>`.
  - Never "investigate", "fix" or "research": the work in a workspace
    moves from investigating to fixing.
  - The workspace's tab carries the same label, so the tab bar says which
    work it is instead of `1`.
  - **When a worker opens its PR, rename its workspace and its tab** to the
    PR form (`herdr workspace rename <workspace-id> '<label>'` and
    `herdr tab rename <tab-id> '<label>'`, quoted).
  - In messages, refer to work by both numbers too ("#737 (#731)").
- **Agent name** names the *issue*: `issue-` + its number, then a short
  description of the issue (`issue-697-batch-delete-h12`). It's set once and
  never renamed, because sessions and scheduled reminders address the worker
  by it. A review worker is always `pr-<number>-review` (`pr-649-review`),
  issue or not, so it never reads like its PR's author.
- **Branch name** names *that branch's work*, so a prefix is fine there
  (`investigate-679`, `fix-679-httparty-deprecation`). For a PR review, use
  the PR's own branch, or `review-<PR>` cut from the PR's head when the
  author's worktree already has that branch checked out.

The worktree folder and its database are named after the first branch. Later
branches in the same workspace are cut inside the worktree (`git switch -c
<branch> origin/main`) and reuse that folder and database.

## Start a worker

Run from the repo's main checkout. Replace `<branch>` with the branch name,
`<label>` with the workspace name, and `<name>` with the agent name. herdr
requires an agent name to start with a lowercase letter (then lowercase
letters, digits, `-` or `_`, at most 32 characters). The `issue-` and
`pr-` prefixes take care of that.

```bash
# 1. Worktree + hooks. A failing hook exits non-zero: stop and report its output.
out=$(wt switch --create <branch> --no-cd --format=json) || exit 1
path=$(jq -r .path <<<"$out")

# 2. A herdr workspace on it.
pane=$(herdr worktree open --cwd "$(git rev-parse --show-toplevel)" --path "$path" \
  --label "<label>" --no-focus --json | jq -r .result.root_pane.pane_id)
tab=$(herdr pane get "$pane" | jq -r .result.pane.tab_id)
herdr tab rename "$tab" '<label>'

# 3. Claude in that workspace, on the proposed model and effort level.
herdr agent start <name> --kind claude --pane "$pane" --timeout 90000 -- --model <model> --effort <effort>

# 4. The brief (see below). No --wait: the worker runs on its own.
herdr agent prompt <name> "$brief"
```

For an **existing** branch (reviewing or continuing a PR), step 1 is
`wt switch <branch> --no-cd --format=json`, or `wt switch pr:<number> ...` to
check out a PR's branch. Brand-new branches start from the remote's default
branch; existing ones stay where they are.

Tell the user which workers started, with their workspace labels.

## Start a reviewer

A review worker opens as a split to the right inside its PR author's
workspace, so one sidebar entry holds both. It still gets its own worktree
and `review-<PR>` branch from `wt switch`: the author has the PR branch
checked out, the reviewer must see the PR as pushed rather than the author's
uncommitted edits, and the hooks give it its own database and deny rules.

```bash
# 1. Worktree + hooks, on a review branch cut from the PR's pushed head.
#    Fetch first: wt doesn't, and the local PR branch may hold unpushed commits.
git fetch -q origin
out=$(wt switch --create review-<PR> --base origin/<pr-branch> --no-cd --format=json) || exit 1
path=$(jq -r .path <<<"$out")

# 2. Split the author's pane and label both halves.
author=$(herdr agent list | jq -r '.result.agents[] | select(.name=="<author-name>") | .pane_id')
pane=$(herdr pane split "$author" --direction right --cwd "$path" --no-focus | jq -r .result.pane.pane_id)
herdr pane rename "$author" 'Build'
herdr pane rename "$pane" 'Review'

# 3 and 4 as for any worker, with the agent name pr-<PR>-review.
herdr agent start pr-<PR>-review --kind claude --pane "$pane" --timeout 90000 -- --model opus --effort high
herdr agent prompt pr-<PR>-review "$brief"
```

The workspace and tab keep the author's label. If the PR has no author
worker (one of the user's own PRs), start the reviewer like any worker, in its own
`<issue>→<pr> Review` workspace.

**A reviewer already running in its own workspace** moves without a restart:
`herdr pane move <review-pane> --tab <author-tab> --split right --target-pane <author-pane> --no-focus`,
then label both panes and the tab as above. herdr closes the emptied
workspace itself. The moved pane gets a new id; keep addressing it by agent
name.
Move one only on the user's yes: it changes their layout.

## The brief

The worker has not seen this conversation. Write the brief so it stands
alone:

- The task and why it matters, with issue/PR numbers and links.
- What "done" looks like: a written finding, a draft PR, a review comment.
- Anything the user said that constrains it.
- For a PR review, tell the worker to run the `code-review` skill
  (`/code-review high <PR>`, without `--comment`) first, then the
  task-specific checks, and to fold the skill's verified findings into its
  own write-up.
- Tell it to keep issues, PR descriptions and comments short: a few key
  points first (what happened or is proposed, the decision needed, the
  next step), then the substance a reader needs to decide (options,
  comparison, recommendation) visible. Only evidence worth a second look
  (query output, logs, raw figures) goes in a collapsed `<details>` section.
- When the work needs screenshots, tell it to attach them to a PR or issue
  comment with `gh pr comment <n> --attach '<file>#<alt>'` (or
  `gh issue comment`), referencing each as `![alt](./<file>)` in the body
  so it lands inline. GitHub hosts attachments permanently, as it does a
  paste. Never push images to a branch or link them from a commit: pushed
  image branches get deleted and the links eventually break. Attachment
  URLs are viewable by anyone who has them, even on a private repo, so
  screenshots show seed or test data only, never real customer data.
- For a worker that builds a PR, tell it to stop after its first cut:
  commit with the local tests passing, but don't push or open the PR yet.
  The coordinator sends the cleanup pass next (see "From first cut to
  review").
- End with: "When you finish, or need a decision, stop and say so in your
  last message. Open PRs as drafts and leave them as drafts; the coordinator marks them ready. Never merge.
  If you start a dev server or any other background process, stop it before
  your last message unless the user is using it, and name any that are still
  running."

Project rules (CLAUDE.md, memory) load in the worker automatically; don't
restate them.

## From first cut to review

Every PR a worker builds goes through these steps, in this order. They are
standing: the coordinator sends each one without asking the user first, but
tells the user when it does.

1. **First cut.** The worker commits its change with the local tests
   passing and stops, unpushed.
2. **Cleanup pass.** `herdr agent prompt <name> "/simplify"` runs the
   `simplify` skill in the worker's own session, which knows why the code
   is the way it is. When it finishes, send:
   "Keep simplify's changes unless one reverses a decision from your brief
   or the user; list anything you skipped and why. Commit, push, open the
   draft PR, and wait for CI. Once it's green, do the browser QA pass:
   <QA brief>. Then stop."
   Changes simplify skipped because they reach beyond the PR go to the
   user as a question, not into the PR.
3. **Browser QA pass,** for changes with a UI, by the author worker at CI
   green. The QA brief:
   - Walk every QA task in the PR description yourself in a real browser
     (headless Chrome) against your own dev server, with seed data only.
   - Screenshots: one combined PNG per page, not a pile. Lay out before
     (the default branch, checked out detached in your own worktree) and
     after (your branch), each at desktop and phone width, side by side on
     one HTML page, and capture it at deviceScaleFactor 2. Return to your
     branch with a clean `git status` afterwards.
   - Post one PR comment with the images attached (see "The brief"):
     a title "Browser QA of <head SHA>", a verdict line, a numbered list of
     anything that looked or behaved wrong, each one line, and for each
     QA task, whether you checked it or couldn't.
   - Stop the dev server before your last message.
4. **Review.** Start the reviewer (see "Start a reviewer") once the QA
   comment is posted, and tell it the comment exists.

Re-reviews of later fixes don't repeat steps 2 and 3 unless the user asks.

## Tracking

- **Draft vs ready means "the user's turn".** Workers open PRs as drafts and
  never mark them ready. The coordinator runs `gh pr ready <n>` once CI is
  green and the independent review is clean (or its fixes are in and
  re-reviewed), then tells the user it's ready for their read. Ready for
  review = waiting on the user's final okay, which is the merge.
- Workers don't notify you when they finish. While a worker has something
  in flight, run `watch-workers.sh <scratchpad>` (next to this file) under
  a Monitor. List the PRs in flight in `<scratchpad>/watch.prs`, one number
  per line. Keep it quiet:
  - Never restart it. Change what it watches by editing `watch.prs`. It
    keeps its state in the scratchpad, so a re-arm neither repeats nor
    misses an event.
  - When it expires, re-arm it without a word in chat, and stop re-arming
    once every worker is waiting on the user.
  - When it fires, tell the user in one line first, then read the worker.

  For any other watch (a deploy, a one-off check), suggest it in one line
  and start it only on the user's yes. Never tell the user you'll report
  something unless a watch is running.
- `herdr agent list` shows every agent with `agent_status` (`working`,
  `idle`, `blocked`, `done`) and its `cwd`.
- `herdr agent read <name> --source recent-unwrapped --lines 60` shows what
  a worker last said.
- When the user asks for status, read each worker and summarise: what it did,
  its PR and that PR's state, and what it needs from the user.
- To pass on a follow-up the user gives you: `herdr agent prompt <name> "<text>"`.

Workers keep their own permission prompts. A `blocked` worker is waiting on a
prompt: tell the user which one. Never answer a worker's permission prompt
yourself, and never send keys to its pane.

## Cleaning up

Only when the user asks. Close the workspace first (it ends the worker's
Claude and its database connections), then remove the worktree with its
hooks:

```bash
herdr workspace close <workspace-id>
wt remove --foreground <branch>
```

`<branch>` is whatever the worktree has checked out *now*
(`git -C <path> branch --show-current`), which may not be the branch it
started on. Any other branches the worker made stay behind. List them for the
user; don't delete them.

A reviewer shares its author's workspace, so:

- **Closing only the review** (the PR is still open): `herdr pane close
  <review-pane>`, then `wt remove --foreground review-<PR>`. The author's
  workspace stays.
- **Closing the author's workspace** (its PR merged) ends the reviewer too.
  Remove both worktrees in the same step: the author's branch, then
  `review-<PR>`.

Exception: a `review-*` branch you cut for a review worker can be deleted
(`git branch -D`) once the worker is closed, if it has no commits of its
own (`git log <pr-branch>..review-<n>` is empty) and isn't on the remote.
Check both, then say in one line that it's gone.

`wt remove` deletes the branch only if it's merged, and refuses a worktree
with uncommitted changes. Never add `-D` or `--force`: report the refusal to
the user instead.

## Never

- Merge anything, or push to the default branch.
- Remove a worker, its worktree or its branch without the user asking.
- Do the task yourself instead of the worker: if it's worth a worker, leave
  it to the worker.
