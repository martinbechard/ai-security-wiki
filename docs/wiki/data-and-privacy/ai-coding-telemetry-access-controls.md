---
type: "Topic"
title: "AI Coding Telemetry Access Controls"
description: "Security controls for OAuth, scoped MCP access, and token handling when humans or agents query coding telemetry."
---

# AI Coding Telemetry Access Controls

## Current Understanding

[AI coding telemetry redaction controls](ai-coding-telemetry-redaction-controls.md) minimize sensitive prompt, code, tool I/O, and instruction data before telemetry is stored. This page owns the separate access-control boundary for querying that telemetry after collection.

The [July 26 leaf update watch source](../../../raw/processed/2026-07-26/ai-security-wiki-leaf-update-watch-2026-07-26T200447-0400.json) records [Dash0 Code RED newsletter 30](https://www.dash0.com/newsletter/code-red-newsletter-30) as evidence that agent-facing observability workflows can expose telemetry through MCP-style access. The durable security rule is that telemetry query paths need short-lived, scoped authorization because observability data can contain sensitive prompts, code, identifiers, and operational traces even when redaction is present.

## Control Implications

- Prefer short-lived OAuth access for MCP or agent telemetry queries.
- Scope telemetry access by workspace, project, service, data class, and caller identity.
- Avoid reusing static human tokens for automated coding-agent observability workflows.
- Log agent identity, user identity, query scope, exported fields, and token grant context for telemetry reads.
- Treat telemetry access controls as complementary to redaction; neither control replaces the other.

## Security Impact

- Threat: an agent, MCP client, or shared automation can over-read coding telemetry with a broad or long-lived token.
- Affected boundary: Dash0-style AI coding telemetry, MCP telemetry access, OAuth grants, CLI-driven telemetry queries, and agent observability workflows.
- Exploit or incident status: control-change evidence only; no exploit or incident was reported in the [July 26 watcher](../../../raw/processed/2026-07-26/ai-security-wiki-leaf-update-watch-2026-07-26T200447-0400.json).
- Mitigation state: use scoped OAuth, short token lifetimes, query auditing, and field-level redaction before broad telemetry access is granted.
- Confidence: medium for the generalized local control because the [July 26 leaf watcher](../../../raw/processed/2026-07-26/ai-security-wiki-leaf-update-watch-2026-07-26T200447-0400.json) names [Dash0 Code RED newsletter 30](https://www.dash0.com/newsletter/code-red-newsletter-30) and CLI signals but not a full local implementation contract.
- Residual risk: telemetry may still expose secrets or proprietary code when access controls are strong but redaction coverage is incomplete.

## Authoritative Sources

- [July 26 leaf update watch source](../../../raw/processed/2026-07-26/ai-security-wiki-leaf-update-watch-2026-07-26T200447-0400.json)
- Dash0 Code RED newsletter 30: https://www.dash0.com/newsletter/code-red-newsletter-30

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [data and privacy](index.md)
- [AI coding telemetry redaction controls](ai-coding-telemetry-redaction-controls.md)
- [agent and tool security](../agent-and-tool-security/index.md)
- [testing and assurance](../testing-and-assurance/index.md)
- Upstream AI development wiki owns general coding-agent telemetry and observability practice.

## Open Questions

- Which local MCP telemetry integrations use OAuth versus static tokens, and where are those token lifetimes audited?

## Maintenance Notes

- Created from the [July 26 leaf update watch source](../../../raw/processed/2026-07-26/ai-security-wiki-leaf-update-watch-2026-07-26T200447-0400.json) after verifier correction split telemetry access controls from telemetry redaction controls.
