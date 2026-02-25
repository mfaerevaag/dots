---
name: review-pr-comment
description: Review a PR comment and decide whether to accept or reject the feedback, then update code if accepted
argument-hint: "[comment-url or comment-text]"
---

You are reviewing a PR comment and the related code. Analyze the feedback and decide whether to accept or reject it.

## Input
$ARGUMENTS

## Selected Code (if provided)
```
$SELECTION
```

## Instructions

1. **Parse input**:
   - If input is a GitHub URL (contains `github.com` and `/pull/`), fetch the comment using `gh api`
   - Otherwise, treat input as the comment text directly

2. **If URL provided**, extract and fetch:
   - PR review comment: `gh api repos/OWNER/REPO/pulls/comments/COMMENT_ID`
   - Or issue comment: `gh api repos/OWNER/REPO/issues/comments/COMMENT_ID`
   - Then read the referenced file and lines from the comment metadata

3. **If no selection provided**, use the file path and line numbers from the fetched comment to read the relevant code

4. **Analyze** the PR comment and understand what change is being requested

5. **Assess** whether the suggestion is valid, improves code quality, correctness, or follows best practices

6. **Decide**: Accept or Reject

## Output Format

### Decision: [ACCEPT / REJECT]

### Reasoning
[Brief explanation of why you're accepting or rejecting]

### Response Comment
[Draft a professional response to post on the PR]

### Code Changes (if accepted)
If accepted, make the necessary code changes to the file. If rejected, skip this step.
