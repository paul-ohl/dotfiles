---
description: Run checks, review changes, and commit with a Conventional Commit message
---

# Commit

Load the `commit-conventions` skill, then follow these steps. Never push.

Supports a `--wip` flag: if `$ARGUMENTS` contains `--wip`, skip steps 1 and 2 and use `wip:` as the commit type.

## Steps

1. **Detect check commands** — look in `AGENTS.md`, `package.json`, `Makefile`, `pyproject.toml` in that order.

2. **Run checks** — lint and type-check only (not the full test suite). If a check fails, show the output and ask: fix first, or proceed anyway?

3. **Review changes** — run `git status --porcelain` and `git diff --stat HEAD`. If the working tree is clean, report "Nothing to commit." and stop.

4. **Stage** — if nothing is staged, run `git add -A`. Show what will be committed with `git diff --cached --stat`.

5. **Generate a commit message** — follow the `commit-conventions` skill. If changes span unrelated concerns, propose splitting into multiple commits first.

6. **Confirm** — show the proposed message and ask: commit / edit / cancel.

7. **Commit** — `git commit -m "<message>"`. Show the resulting hash. Never run `git push`.
