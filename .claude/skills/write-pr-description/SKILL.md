---
name: write-pr-description
description: Generate a PR description based on branch changes
allowed-tools: Bash
---

Generate a pull request description for the current branch.

## Arguments

- `<base-branch>` (optional): The branch to compare against. Defaults to `dev` if not provided.

## Steps

1. Run `git log <base-branch>..HEAD --oneline` to see commits on this branch
2. Run `git diff <base-branch>...HEAD --stat` to see changed files summary
3. Run `git diff <base-branch>...HEAD` to see actual changes
4. Analyze the changes and determine:
   - Summary: high-level description of what the PR does
   - Changes: key modifications grouped logically
   - Testing: how to verify the changes work

## Output Format

Output a PR description in this format:

```
## Summary

Brief description of what this PR accomplishes.

## Changes

- Bullet point of key change
- Another key change

## Test Plan

- How to verify the changes
```

## Rules

- Keep summary to 1-2 sentences
- Group related changes together
- Focus on user-facing impact and why changes were made
- Include any breaking changes prominently
- Mention dependencies or follow-up work if relevant
