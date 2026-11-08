---
type: "Topic"
title: "GitHub Agentic Workflows Safe Outputs MCP Gateway"
description: "Security-control analysis of the Safe Outputs MCP Gateway working draft."
tags: ["agent-and-tool-security", "identity-and-access"]
---

# GitHub Agentic Workflows Safe Outputs MCP Gateway

## Current Understanding

The [November 8 collector source](../../../raw/processed/2026-11-08/ai-security-wiki-topic-news-collector-2026-11-08T003537Z.json) records the [Safe Outputs MCP Gateway Specification](https://github.github.com/gh-aw/specs/safe-outputs-specification/) version 1.29.20, published 2026-11-07 as a working draft. It describes an MCP gateway that lets a read-only agent declare structured intended GitHub operations for a permission-controlled execution context, with configurable constraints, validation, sanitization, and previews. General GitHub agent-workflow adoption belongs in ai-dev-wiki; this page retains only the security-control lens and working-draft caveat.

## Security Impact

- Threat addressed: prompt-influenced agents can otherwise combine untrusted reasoning context with direct write-capable credentials and imperative operations.
- Affected boundary: the transition from a read-only agent environment to permission-controlled GitHub operations in implementations of the specification.
- Exploit or incident status: this is design guidance, not a vulnerability disclosure, deployed-control attestation, or incident report.
- Mitigation state: use explicit operation allowlists, schema validation, content sanitization, preview or review steps, and fail-secure rejection at the privileged boundary; assess actual implementations independently.
- Confidence: medium. The first-party page defines the cited working draft, but its requirements may change and do not prove conformance by any deployment.
- Residual risk: a gateway narrows privilege transfer but cannot establish source trust, correct policy configuration, or security of the surrounding workflow.

## Authoritative Sources

- [November 8 collector source](../../../raw/processed/2026-11-08/ai-security-wiki-topic-news-collector-2026-11-08T003537Z.json)
- [Safe Outputs MCP Gateway Specification, version 1.29.20](https://github.github.com/gh-aw/specs/safe-outputs-specification/)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [identity and access](../identity-and-access/index.md)

## Open Questions

- Which implementations, if any, claim conformance to version 1.29.20, and what independent evidence validates their privilege-separation behavior?

## Maintenance Notes

- Created on 2026-11-08 from a first-party working draft. Recheck the live specification status and version before treating any stated control as a stable requirement.
