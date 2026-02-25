---
description: Generate a comprehensive README for a Rust crate following the project's standard format
argument-hint: "<crate-name>  |  <path-to-crate>"
allowed-tools: Read, Grep, Glob, Bash, Write
---

You are generating a README.md for a Rust crate in this repository.

## Goal

Create a comprehensive, accurate README that helps developers understand what the crate does, how it fits into the architecture, and how to use it.

## Input

User arguments: $ARGUMENTS

Interpretation:
- If $ARGUMENTS is a crate name (e.g., "normalizer"), look for it in `crates/<name>/`
- If $ARGUMENTS is a path, use that directory directly
- If the crate doesn't exist, report an error

## Process

1. **Gather information** (read-only):
   - Read `Cargo.toml` for dependencies, features, and package metadata
   - Read `src/lib.rs` or `src/main.rs` for module structure and doc comments
   - Scan key modules to understand functionality
   - Check for existing config files (`config.*.toml`, `.env.example`)
   - Look for tests to understand usage patterns

2. **Analyze architecture**:
   - Identify the crate's role in the system (connector, service, library, etc.)
   - Map dependencies to other workspace crates
   - Understand data flow (inputs, outputs, side effects)
   - Note any message bus topics, database tables, or external APIs

3. **Write README** using the template below

4. **Output**: Write to `crates/<name>/README.md`

## Required Template

Follow this structure (adapt sections as needed for the crate type):

```markdown
# <Crate Name>

## Overview

<2-4 sentences describing what this crate does and its role in the system>

<Bullet list of key responsibilities>

## Architecture

<Mermaid diagram showing data flow or component relationships>

### <Subsection for key architectural concepts>

<Explain important design decisions, patterns, or flows>

## Configuration

<If applicable: config file format, environment variables, defaults>

### Configuration Structure

<TOML/JSON example of config>

### Environment Variables

<Table or list of env vars with descriptions>

## Usage

### Running Locally

<Commands to run the crate locally>

### Building for Production

<Build commands>

### Running with Docker

<If applicable>

## Dependencies

### Required Services

<External services this crate needs (Redis, Postgres, message bus, etc.)>

### Workspace Dependencies

<Other crates in this workspace that this crate depends on>

## Key Types

<Important structs, enums, traits with brief descriptions>

## Development

### Adding <relevant extension point>

<How to extend the crate (add a new normalizer, check, connector, etc.)>

### Testing

<How to run tests, what's covered>

### Debugging

<Useful log patterns, debug flags>

## Related Documentation

<Links to related crate READMEs or external docs>
```

## Guidelines

- **Be accurate**: Only document what exists in the code. Don't invent features.
- **Include code references**: Use `file:line` format when referencing specific code.
- **Mermaid diagrams**: Use flowcharts for data flow, sequence diagrams for protocols.
- **Config examples**: Use actual values from config files, not placeholders.
- **No fluff**: Skip sections that don't apply (e.g., no "Docker" section for libraries).
- **Link related crates**: Reference other workspace crates when relevant.

## Section Applicability by Crate Type

| Section | Binary | Library | Connector | Service |
|---------|--------|---------|-----------|---------|
| Overview | Yes | Yes | Yes | Yes |
| Architecture | Yes | Maybe | Yes | Yes |
| Configuration | Yes | No | Yes | Yes |
| Usage | Yes | No | Yes | Yes |
| Dependencies | Yes | Yes | Yes | Yes |
| Key Types | Maybe | Yes | Yes | Yes |
| Development | Yes | Yes | Yes | Yes |

## Output

After writing the README:
1. Print the file path
2. Print a 5-bullet summary of what was documented
3. Note any sections that were skipped and why