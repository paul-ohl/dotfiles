---
description: Finalize a feature: full checks, test coverage, and AGENTS.md update
---

# Done Feature

Complete a feature branch: review all work done, run the full check suite, ensure sane test coverage, and update the project's AGENTS.md with anything learned.

## Instructions

### 1. Review the branch work

Identify the base branch (try `main`, then `master`, then `develop`):

```sh
git log <base>..HEAD --oneline
git diff <base>..HEAD --stat
```

Summarise what was done: list the commits, files changed, and the overall scope of the feature.

### 2. Run the full check suite

Detect commands from `AGENTS.md`, `package.json`, `Makefile`, or other project config files. Run ALL of the following that are available, in order:

1. **Format** — e.g. `prettier --check`, `black --check`, `stylua`
2. **Lint** — e.g. `eslint`, `ruff check`, `shellcheck`
3. **Type-check** — e.g. `tsc --noEmit`, `mypy`, `pyright`
4. **Tests** — e.g. `vitest`, `jest`, `pytest`, `cargo test`, `go test ./...`
5. **Production build** — e.g. `vite build`, `tsc`, `cargo build --release`, `go build`

If any step fails:
- Stop and fix the failure before continuing
- Re-run only the failed step to confirm it passes
- Only proceed once all steps pass

### 3. Evaluate and improve test coverage

After tests pass:
- Check if the project has a coverage tool configured (e.g. `vitest --coverage`, `jest --coverage`, `pytest --cov`, `cargo tarpaulin`)
- If yes: run it and review the output
- Identify code paths introduced or modified in this feature that lack test coverage
- Write or update tests to achieve sane coverage of the new/changed logic
  - "Sane" means: happy paths, key edge cases, and error paths — not 100% line coverage for its own sake
- Re-run the test suite after adding tests to confirm everything still passes

### 4. Draft AGENTS.md updates

Review `AGENTS.md` (create a new one if it doesn't exist — look at the project structure to infer sensible conventions).

Identify anything learned during this feature that would help future work:
- New patterns or idioms introduced
- Gotchas or non-obvious constraints discovered
- New commands or tools added to the project
- Architectural decisions made
- Testing conventions established

**Draft the additions/changes** and present them to the user:

```
Proposed AGENTS.md changes:

[show a diff or the new/updated sections]

Apply these changes? (yes / edit / skip)
```

- **yes**: write the changes to `AGENTS.md`
- **edit**: ask the user what to change, then re-present for confirmation
- **skip**: leave `AGENTS.md` unchanged

### 5. Final summary

Report:
- Commits on branch: N
- Files changed: N
- All checks: passed
- Tests added/updated: list them
- AGENTS.md: updated / skipped
- "Feature complete. Review the branch, then merge or open a PR."
