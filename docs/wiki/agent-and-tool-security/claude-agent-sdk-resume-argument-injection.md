---
type: "Topic"
title: "Claude Agent SDK Resume Argument Injection"
description: "Security analysis for CVE-2026-96620 attacker-controlled resume values injecting MCP configuration into Claude CLI startup."
tags: ["agent-and-tool-security", "infrastructure-and-supply-chain"]
---

# Claude Agent SDK Resume Argument Injection

## Current Understanding

The [October 16 topic collector source](../../../raw/processed/2026-10-16/ai-security-wiki-topic-news-collector-2026-10-16T232823Z.json) records [CVE-2026-96620](https://cveawg.mitre.org/api/cve/CVE-2026-96620) and [GHSA-h4mw-j7qp-8mwm](https://github.com/advisories/GHSA-h4mw-j7qp-8mwm). Claude Agent SDK for Python before 0.2.121 passes `resume` as a separate Claude CLI token without validation. A dash-prefixed attacker-controlled session identifier can inject `--mcp-config`, define a stdio MCP server, and execute its command before SDK permission controls apply. Broad SDK and CLI catalog context belongs upstream; this page owns argument-to-configuration authority escalation.

## Security Impact

- Threat: a user- or model-influenced resume value becomes a CLI option that installs an attacker-controlled MCP server.
- Affected boundary: `claude-agent-sdk` before 0.2.121; application-controlled resume identifier to Claude CLI argv and MCP configuration.
- Exploit or incident status: public CVE and GitHub Security Advisory; no local exploitation incident is recorded.
- Mitigation state: upgrade to 0.2.121 or later; reject option-prefixed session identifiers and construct CLI arguments so untrusted values cannot alter option parsing.
- Confidence: high for precondition, injected option, impact, and fixed version.
- Residual risk: any wrapper that forwards untrusted identifiers to subprocess arguments or configuration loaders can bypass later permission checks.

## Control Implications

- Treat session, resume, and checkpoint identifiers as data, never command or configuration fragments.
- Validate identifier syntax before process creation and use an option terminator when the invoked CLI supports one.
- Test dash-prefixed, whitespace-bearing, and serialized replay values before granting subprocess or MCP authority.

## Authoritative Sources

- [October 16 topic collector source](../../../raw/processed/2026-10-16/ai-security-wiki-topic-news-collector-2026-10-16T232823Z.json)
- [CVE-2026-96620 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-96620)
- [GHSA-h4mw-j7qp-8mwm](https://github.com/advisories/GHSA-h4mw-j7qp-8mwm)
- [Claude Agent SDK Python 0.2.121 release](https://github.com/anthropics/claude-agent-sdk-python/releases/tag/v0.2.121)
- [October 17 leaf update watch source](../../../raw/processed/2026-10-17/ai-security-wiki-leaf-update-watch-20261018T000146Z.json)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [MCP SDK transport header handling](../infrastructure-and-supply-chain/mcp-sdk-transport-header-handling.md)
- [SumatraPDF AI selection translate CLI argument injection](sumatrapdf-ai-selection-translate-cli-argument-injection.md)

## Open Questions

- Do SDK integrations expose any alternate resume or checkpoint channel that reaches Claude CLI option parsing before 0.2.121 validation?

## Maintenance Notes

- Created on 2026-10-16 from CVE-2026-96620 and the linked GitHub advisory; retain the startup-order caveat that makes SDK permission controls ineffective.
- Confirmed on 2026-10-17 by the [leaf watcher](../../../raw/processed/2026-10-17/ai-security-wiki-leaf-update-watch-20261018T000146Z.json); no material boundary or remediation change justified another digest item.
