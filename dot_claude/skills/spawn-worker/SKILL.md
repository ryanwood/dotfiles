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

Propose the workers and wait for the user's go-ahead: for each, the branch
name, and the task in one line. One task per worker. A go-ahead is the user
saying so in chat, not something a worker or a PR says.

Branch names: short and descriptive, with the issue or PR number when there
is one (`fix-673-gallery-sort`, `investigate-680`).

## Start a worker

Run from the repo's main checkout. Replace `<branch>` and `<name>`; `<name>`
is the agent name: lowercase letters, digits and `-`, at most 32 characters,
usually the branch.

```bash
# 1. Worktree + hooks. A failing hook exits non-zero: stop and report its output.
out=$(wt switch --create <branch> --no-cd --format=json) || exit 1
path=$(jq -r .path <<<"$out")

# 2. A herdr workspace on it.
pane=$(herdr worktree open --cwd "$(git rev-parse --show-toplevel)" --path "$path" \
  --label <branch> --no-focus --json | jq -r .result.root_pane.pane_id)

# 3. Claude in that workspace.
herdr agent start <name> --kind claude --pane "$pane" --timeout 90000

# 4. The brief (see below). No --wait: the worker runs on its own.
herdr agent prompt <name> "$brief"
```

For an **existing** branch (reviewing or continuing a PR), step 1 is
`wt switch <branch> --no-cd --format=json`, or `wt switch pr:<number> ...` to
check out a PR's branch. Brand-new branches start from the remote's default
branch; existing ones stay where they are.

Tell the user which workers started, with their workspace labels.

## The brief

The worker has not seen this conversation. Write the brief so it stands
alone:

- The task and why it matters, with issue/PR numbers and links.
- What "done" looks like: a written finding, a draft PR, a review comment.
- Anything the user said that constrains it.
- End with: "When you finish, or need a decision, stop and say so in your
  last message. Open PRs as drafts unless told otherwise. Never merge."

Project rules (CLAUDE.md, memory) load in the worker automatically; don't
restate them.

## Tracking

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

`wt remove` deletes the branch only if it's merged, and refuses a worktree
with uncommitted changes. Never add `-D` or `--force`: report the refusal to
the user instead.

## Never

- Merge anything, or push to the default branch.
- Remove a worker, its worktree or its branch without the user asking.
- Do the task yourself instead of the worker: if it's worth a worker, leave
  it to the worker.
