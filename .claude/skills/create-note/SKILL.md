---
name: create-note
description: Save Claude's previous answer to ~/notes as a markdown file
allowed-tools: Bash, Write
user-invocable: true
arguments: "[subject]"
---

Save the previous response to `~/notes/YYMMDD_SUBJECT.md`.

## Arguments

Optional subject for the filename. Examples:
- `/save kubernetes networking` → `260224_kubernetes_networking.md`
- `/save` → prompts for subject or derives from content

## Steps

1. Identify your previous response to save
2. Determine the subject:
   - If provided: slugify it (lowercase, spaces to underscores, remove special chars)
   - If not provided: derive from first meaningful words of the answer, or ask user
3. Get today's date in YYMMDD format
4. Construct filename: `~/notes/YYMMDD_SUBJECT.md`
5. If file exists, append `-1`, `-2`, etc. before `.md`
6. Create `~/notes` directory if it doesn't exist
7. Write the content
8. Confirm with full file path

## Filename Rules

- Date format: YYMMDD (e.g., `260224` for 2026-02-24)
- Subject: lowercase, spaces become underscores, strip non-alphanumeric chars except underscores
- Examples:
  - `My Topic!` → `my_topic`
  - `Kubernetes & Networking` → `kubernetes_networking`

## Execution

```bash
# Ensure directory exists
mkdir -p ~/notes

# Check for existing files and find available name
# Base: ~/notes/260224_subject.md
# If exists: ~/notes/260224_subject-1.md, -2, etc.
```

Then use the Write tool to save the content.

## Rules

- Save the complete previous response, preserving all markdown formatting
- Never truncate content
- Preserve code blocks exactly
- Confirm the saved file path to the user
- If no previous response exists, tell the user there's nothing to save
