---
type: "Topic"
title: "Flowise LangChain Allowlist vm2 Sandbox Escape"
description: "Security analysis for CVE-2026-119978 allowlisted dependency composition."
tags: ["agent-and-tool-security", "testing-and-assurance"]
---

# Flowise LangChain Allowlist vm2 Sandbox Escape

## Current Understanding

The [October 30 collector](../../../raw/processed/2026-10-30/ai-security-wiki-topic-news-collector-2026-10-30T232632Z.json) records [CVE-2026-119978](https://nvd.nist.gov/vuln/detail/CVE-2026-119978): Flowise through 3.1.4 lets authenticated users escape vm2 and execute OS commands through allowlisted LangChain and mammoth modules when `ALLOW_BUILTIN_DEP` is enabled.

## Security Impact

- Threat: individually approved modules compose into a sandbox-escape path.
- Affected boundary: Flowise through 3.1.4, custom-function vm2 sandbox, and builtin-dependency allowlist.
- Exploit or incident status: public CVE; no confirmed exploitation incident is recorded locally.
- Mitigation state: maintainer remediation is not established by the collector; disable builtin dependencies in untrusted custom-function environments.
- Confidence and residual risk: high for the disclosed condition; allowlists require composition-aware testing.

## Authoritative Sources

- [October 30 collector](../../../raw/processed/2026-10-30/ai-security-wiki-topic-news-collector-2026-10-30T232632Z.json)
- [NVD CVE-2026-119978](https://nvd.nist.gov/vuln/detail/CVE-2026-119978)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [Flowise agent node code execution](flowise-agent-node-code-execution.md)

## Open Questions

- Which Flowise release removes the unsafe LangChain and mammoth composition?

## Maintenance Notes

- Created on 2026-10-30 as a sandbox-assurance boundary.
