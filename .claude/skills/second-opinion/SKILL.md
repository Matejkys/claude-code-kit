---
name: second-opinion
description: "Get second opinion from Google Gemini. Use when validating architectural decisions, reviewing code security, comparing implementation approaches, or when multi-model consensus adds value. Triggers: get second opinion, validate with another model, multi-model analysis, compare perspectives, architectural review, security audit, code review needing external validation."
---

# Second Opinion via Gemini CLI

Get external perspective from Google Gemini in an **isolated session** (no shared context).

## Quick Pattern

```bash
# Simple question - isolated session, no context sharing
gemini "Your question here"

# With specific model
gemini -m gemini-3-pro "Your question here"

# Save output to file
gemini "Your question here" > /tmp/gemini/answer.txt
cat /tmp/gemini/answer.txt
```

**Important:** Positional prompt runs a one-shot query without interactive session - completely isolated from current conversation context.

## Architecture Review
```bash
# Create prompt file
cat > /tmp/gemini/prompt.txt << 'EOF'
Review this architecture:

[Your architecture description]

Assess: scalability, security, maintainability, alternatives.
Provide recommendation with reasoning.
EOF

# Run isolated review
gemini "$(cat /tmp/gemini/prompt.txt)"
```

## Security Audit
```bash
cat > /tmp/gemini/security.txt << 'EOF'
Security review:

[Your code]

Check: input validation, auth issues, data exposure, OWASP Top 10.
Provide vulnerabilities with severity and fixes.
EOF

gemini "$(cat /tmp/gemini/security.txt)"
```

## Code Review
```bash
cat > /tmp/gemini/review.txt << 'EOF'
Review for bugs, performance, maintainability:

[Your code]

Provide line-level recommendations.
EOF

gemini "$(cat /tmp/gemini/review.txt)"
```

## Models

- `gemini-3-pro` - Most capable, complex analysis (default)
- `gemini-3-flash` - Faster, balanced quality/speed

Use `-m <model>` to specify model.

## Presenting Results

1. Label: "Second opinion (Google Gemini)"
2. Compare with your (Claude) analysis
3. Highlight agreement, disagreement, new insights
4. Synthesize recommendation

## Prerequisites

```bash
# Verify gemini CLI works
gemini --version

# Authenticate with Google Cloud (if not already done)
# The CLI will prompt for auth on first use
gemini "test"
```

## Key Points

- **Isolated:** Positional prompt = one-shot query, NO context from current session
- **Cost:** Check your Google Cloud/Gemini API billing
- **Speed:** Expect fast responses with Gemini Flash models
- **Quality:** Gemini 3 Pro provides thorough analysis comparable to Claude Opus
