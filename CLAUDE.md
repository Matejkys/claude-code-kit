# Global Instructions for Claude Code

These instructions apply to all projects unless overridden by project-specific CLAUDE.md files.

## Language

- **Communicate with user in Czech** (mluvíme česky)
- **Write all files in English** (code, comments, documentation, config files)
- Variable names, function names, commit messages - all in English

## Research

- **Use Perplexity MCP** (or WebSearch/WebFetch) before implementing any external API, library, or technology you haven't used in this project before
- When encountering errors or unexpected behavior - research first
- When deciding between approaches - research to find best practices

## Implementation

- **ALWAYS use parallel sub-agents** (Task tool) when working on multiple independent tasks (writing tests, fixing files, implementing features). This is NOT optional - spawn one agent per task for maximum speed.
- For tasks with 3+ steps, **create a plan first** (use TodoWrite) and mark tasks as completed when done
- **Document in code comments**, not separate files. Create documentation files (README, docs/) only when explicitly requested
- **Write tests for all new code** - business logic, API endpoints, utilities. Skip only: config files, type definitions, trivial one-liners

### Implementation Integrity - No Mocks, No Skipping

- **NEVER create mock implementations** when real implementation is required
- **NEVER skip or stub out** functionality that is specified in the task or plan
- If something is in the plan/task, it MUST be fully implemented - no placeholders, no "TODO: implement later", no fake data
- If implementation is blocked, **ask the user** instead of silently mocking
- This applies to: API integrations, database operations, business logic, UI components - everything

### Configuration - Zero Hardcoded Values

- **NEVER hardcode** constants, values, or numbers directly in code
- All configuration must be in dedicated config files:
  - `config/` or `src/config/` folder for application settings
  - `.env` / `.env.local` for secrets and environment-specific values
- This applies to: timeouts, limits, URLs, feature flags, UI constants, etc.

### Configuration - No Silent Defaults

- **NEVER invent default values** for required configuration
- If a required variable is missing, **fail fast at startup** with a clear error message
- Do NOT silently fall back to made-up defaults that might cause unexpected behavior

## Git Commits & Pull Requests

When creating git commits:
- Do NOT include "Co-Authored-By: Claude <noreply@anthropic.com>" in commit messages
- Keep commit messages clean and concise

## Browser Automation

- **Use Claude Chrome (MCP)** for all browser automation
- Use Playwright only when Claude Chrome is unavailable or something doesn't work in it
