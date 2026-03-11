---
description: Bootstrap an AGENTS.md for a project that doesn't have one
---

# Init

Analyse the project and create a well-structured `AGENTS.md` that documents conventions, commands, and architecture for future AI-assisted work.

## Instructions

### 1. Check if AGENTS.md already exists

If `AGENTS.md` exists in the project root:
- Read it and summarise its contents
- Ask: "AGENTS.md already exists. Overwrite it, append to it, or cancel?"
- **Overwrite**: proceed with full analysis and replace the file
- **Append**: run analysis and only add sections that are missing
- **Cancel**: stop

### 2. Analyse the project

Gather information from the repo to infer conventions. Read and consider:

**Identify the tech stack:**
- `package.json`, `Cargo.toml`, `pyproject.toml`, `go.mod`, `*.gemspec` — languages and frameworks
- Directory structure — where source, tests, and config live

**Find build/lint/test commands:**
- `package.json` scripts
- `Makefile` targets
- `justfile` targets
- `Taskfile.yml`
- CI config (`.github/workflows/`, `.gitlab-ci.yml`, `Jenkinsfile`)
- `pyproject.toml` [tool.ruff], [tool.mypy], [tool.pytest] sections

**Infer code style:**
- `.editorconfig`, `.prettierrc`, `.eslintrc`, `stylua.toml`, `rustfmt.toml`, `.flake8`
- Existing source files — indentation, naming conventions, file structure

**Check commit history:**
```sh
git log --oneline -20
```
- Detect existing commit message patterns (Conventional Commits, etc.)

**Check existing docs:**
- `README.md`, `CONTRIBUTING.md`, `DEVELOPMENT.md`
- Any `docs/` directory

### 3. Draft AGENTS.md

Write a clear, useful AGENTS.md with only the sections that apply to this project:

```markdown
# AGENTS.md

## Overview
<one paragraph: what the project does and its primary tech stack>

## Build, Lint, and Test Commands

<list commands for: format, lint, type-check, test, build>
<note any important flags or caveats>
<note single-file equivalents where relevant>

## Project Structure

<brief description of key directories and what lives in each>

## Code Style Guidelines

<language-by-language conventions: indentation, naming, imports, etc.>
<reference config files where applicable>

## Architecture Notes  (only if non-obvious decisions were made)

<key decisions, patterns, or constraints that affect how code is written>

## Commit Style

<detected or recommended commit message format>

## Agent Workflow Protocols  (only if helpful)

<any project-specific steps for common tasks like adding a new module, etc.>
```

Only include sections you have evidence for. Do not invent conventions — if you can't detect something, omit that section rather than guessing.

### 4. Present for approval

Show the full drafted AGENTS.md to the user and ask:

```
Draft AGENTS.md ready.

[show the content]

Write this to AGENTS.md? (yes / edit / cancel)
```

- **yes**: write the file
- **edit**: ask what to change, redraft, and present again
- **cancel**: stop without writing

### 5. Confirm

After writing, report:
- `AGENTS.md` written to project root
- "Run `/new-feature` to start work with these conventions loaded."
