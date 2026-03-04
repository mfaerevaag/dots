---
name: commit-msg
description: Generate a commit message based on current staged and unstaged changes
allowed-tools: Bash
---

Generate a commit message for the current changes.

## Steps

1. Run `git diff --cached` to see staged changes
2. Run `git diff` to see unstaged changes
3. Run `git status` to see overall state
4. Analyze the changes and determine:
   - Type: feat, fix, refactor, docs, test, chore, style, perf
   - Scope: affected component/area (optional)
   - Description: concise summary of what changed

## Output Format

Output ONLY the commit message in Conventional Commit format:

```
type(scope): short description

- bullet point details if needed
- another detail
```

## Rules

- First line under 72 characters
- Use imperative mood: "add" not "added"
- Focus on WHY not WHAT (the diff shows what)
- Skip scope if changes span multiple areas
- Include bullet points only for complex changes
