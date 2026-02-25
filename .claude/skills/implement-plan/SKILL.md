---
description: Implement a feature by executing the PR breakdown from a saved plan file (edits repo; PR-sized chunks; no scope creep)
argument-hint: "<spec_path.md> [pr=1|2|all] [plan=<plan_path.md>]"
allowed-tools: Read, Grep, Glob, Bash, Write
---

You are implementing a feature in this repository by executing a PRE-EXISTING PLAN derived from a SPEC.
Your job is to make real code changes with minimal risk, in small PR-sized chunks.

NON-NEGOTIABLE GUARDRAILS
- Follow the plan. Do not invent new requirements. If something is missing or unclear, STOP and ask for clarification.
- Do not add “nice-to-haves”. Ship the smallest thing that satisfies the spec acceptance criteria.
- Do not refactor unrelated code. Only refactor when required to implement the plan, and keep it localized.
- If a plan step depends on unknowns, implement only the parts that are unblocked and clearly correct.
- Never claim something exists unless you verified it in the repo (cite file paths in your notes).
- Avoid new dependencies unless the plan explicitly calls for it; if needed, justify and keep it minimal.
- Do not push to remote or open PRs automatically. You may suggest commands for the user to run.

INPUTS
$ARGUMENTS

Argument parsing rules:
- First token is required: <spec_path.md>
- Optional: pr=<n> or pr=all (default pr=1)
- Optional: plan=<plan_path.md>
- If plan= is omitted, infer plan path as:
  .claude/plans/<spec_basename>.plan.md
  Example: .claude/specs/seo-improvements.md -> .claude/plans/seo-improvements.plan.md

REQUIRED FILES
- Spec must exist at <spec_path.md>
- Plan must exist at plan path (explicit or inferred)
If either is missing: stop and output exact instructions to create them (/create-spec, /create-plan, then save the plan file).

EXECUTION WORKFLOW
1) Read the spec and plan.
2) Extract:
   - Acceptance Criteria from the spec
   - PR Breakdown from the plan (PR# sections)
   - Validation commands/checks from the plan
3) Decide PR scope:
   - pr=1 => implement only PR1
   - pr=N => implement only PRN
   - pr=all => implement PRs sequentially, only moving on when tests/checks pass

BEFORE EDITING (GATING CHECKLIST)
- Confirm the exact PR scope you will implement.
- List which acceptance criteria this PR satisfies.
- List the files you expect to touch (initial estimate).

IMPLEMENTATION RULES
For the chosen PR scope:
A) Create/prepare a local branch (safe default):
   - If git exists: git checkout -b <slug>/pr-<n> (or reuse if exists)
B) Implement tasks exactly as described in the plan:
   - Make changes incrementally.
   - Keep diffs small and reviewable.
C) Validate:
   - Run the plan’s validation commands (tests/lint/build).
   - If repo has standard scripts, prefer those (package scripts, make targets, etc.).
   - If no tests exist, add minimal tests only if required by the plan/spec.
D) Document:
   - Update the plan file by marking completed items with [x] (ONLY within the PR scope).
   - Add a short “Notes” section to the plan file with:
     - decisions made
     - tradeoffs
     - any follow-ups or risks

COMMIT DISCIPLINE (LOCAL ONLY)
- Create 1–3 logical commits per PR scope if git is available.
- Commit messages must reference the spec + plan filenames.
  Example:
  "PR1: add canonical + sitemap generator (spec: seo-improvements.md, plan: seo-improvements.plan.md)"

OUTPUT REQUIREMENTS (end of run)
- Summary of what was implemented (mapped to plan tasks + acceptance criteria)
- Files changed (list)
- Commands run + results (tests/lint/build)
- Remaining work (what’s left in PR2+)
- Suggested next command:
  - "/implement-plan <spec> pr=2" OR "/implement-plan <spec> pr=all"
- Optional: suggested manual commands for opening a PR (only suggestions), e.g.:
  - git push -u origin <branch>
  - gh pr create ...

FAILURE MODE BEHAVIOR
- If validation fails: stop, explain the failure, and propose a minimal fix path.
- If plan is wrong vs reality: stop and propose a patch to the plan/spec instead of “winging it”.

