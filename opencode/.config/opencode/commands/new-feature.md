---
description: Start a new feature branch with an evocative name
---

# New Feature

Start work on a new feature by creating a well-named branch and orienting on the project.

## Instructions

### 1. Get the feature description

If `$ARGUMENTS` is provided, use it as the feature description.
If not, ask the user: "What feature are you working on? Describe it briefly."

### 2. Derive an evocative branch name

From the feature description, generate a kebab-case branch name that:
- Is concise but descriptive (3–6 words max)
- Captures the *intent* of the feature, not just a ticket number
- Uses only lowercase letters, numbers, and hyphens
- Does NOT include prefixes like `feature/` or `feat/` — just the name itself

Examples of good branch names:
- `user-avatar-upload`
- `dark-mode-toggle`
- `stripe-checkout-integration`
- `rate-limit-api-endpoints`
- `fix-memory-leak-on-unmount`

Show the proposed branch name to the user and ask for confirmation or an alternative before creating it.

### 3. Create the branch

Once the name is confirmed:

```sh
git checkout -b <branch-name>
```

Report the result. If the branch already exists or git fails, report the error clearly.

### 4. Orient on the project

Check if `AGENTS.md` exists in the project root:
- If it exists: read it and summarize the key conventions relevant to this feature (coding standards, test requirements, commit style, check commands, etc.)
- If it does not exist: note that there is no AGENTS.md and suggest the user run `/init` to create one, or that one will be created when `/done-feature` is run.

### 5. Confirm and report

Output a short summary:
- Branch created: `<branch-name>`
- Base branch: `<previous-branch>`
- AGENTS.md: found / not found
- Key conventions to keep in mind (if AGENTS.md was found)
- "Ready to work. Commit often with `/commit`, and run `/done-feature` when complete."
