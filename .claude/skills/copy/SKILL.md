---
name: copy
description: Copy content to clipboard via wl-copy, with optional formatting
allowed-tools: Bash
user-invocable: true
arguments: "[format instructions]"
---

Copy the last response or specified content to the clipboard using `wl-copy`.

## Arguments

Optional format instructions, for example:
- `as markdown` - format as markdown
- `as json` - format as JSON
- `as code` - wrap in code block
- `as bullet points` - convert to bullet list
- `just the code` - extract only code blocks
- Any other transformation the user requests

## Steps

1. Identify the content to copy (usually your previous response or output)
2. Apply any requested formatting transformation
3. Pipe the result to `wl-copy`

## Execution

```bash
echo -n "CONTENT" | wl-copy
```

Use `echo -n` to avoid trailing newline. For multi-line content, use a heredoc:

```bash
wl-copy <<'EOF'
CONTENT
EOF
```

## Rules

- Preserve formatting unless transformation requested
- For "just the code", extract only content within code blocks
- For "as markdown", ensure proper markdown formatting
- Confirm what was copied to the user
- If no previous content exists, ask user what to copy