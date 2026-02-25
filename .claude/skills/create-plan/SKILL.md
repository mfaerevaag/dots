---
description: Produce a detailed implementation plan from a spec (read-only; designed for Plan Mode)
argument-hint: "<path-to-spec.md>"
allowed-tools: Read, Grep, Glob
---

You are producing an IMPLEMENTATION PLAN from a SPEC. You must not modify the repo.

IMPORTANT
- This command is designed to be run in Claude Code Plan Mode (read-only). If the user is not in Plan Mode, still behave as if you are: do not write files or propose “I already changed X”. Plan Mode prevents edits and command execution. :contentReference[oaicite:2]{index=2}

INPUT
Spec path:
$ARGUMENTS

PROCESS
1) Read the spec file at the given path.
2) Identify impacted areas by scanning the repo (Glob/Grep/Read).
3) Produce a concrete, step-by-step plan that an engineer can execute.
4) Every step/phase must include:
   - What to do
   - Where (file paths / modules)
   - How to validate (tests, commands, or checks)
5) If the spec has unknowns, include a "Clarifications Needed" section and show how the plan branches depending on answers.

OUTPUT FORMAT (Markdown; required)
# Implementation Plan: <feature>

## 1. Spec Summary
- One paragraph summary
- Key constraints
- Explicit assumptions (only if spec had them)

## 2. Clarifications Needed (if any)
- Q:
  - Option A -> impact on design/plan
  - Option B -> impact on design/plan

## 3. Architecture / Approach
- Components/modules involved (with repo evidence: file paths)
- Data flow (bullets)
- API/contracts (if any)

## 4. Work Breakdown (sequenced)
### Phase 1: <name>
1. Step:
   - Files:
   - Details:
   - Validate:

### Phase 2: <name>
...

## 5. Test Plan
- Unit:
- Integration (if applicable)
- Negative/security tests:

