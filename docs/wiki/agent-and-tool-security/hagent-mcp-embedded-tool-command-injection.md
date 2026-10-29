---
type: "Topic"
title: "hagent MCP Embedded-Tool Command Injection"
description: "Security analysis for CVE-2026-117573 embedded-device tool command injection."
tags: ["agent-and-tool-security"]
---

# hagent MCP Embedded-Tool Command Injection

## Current Understanding

The [October 28 collector source](../../../raw/processed/2026-10-28/ai-security-wiki-topic-news-collector-2026-10-28T233111Z.json) records [CVE-2026-117573](https://cveawg.mitre.org/api/cve/CVE-2026-117573): hagent through commit `761eec6` interpolates MCP arguments into Arduino CLI and `idf.py` shell commands. Broad tool catalog context belongs upstream; this page owns agent-to-device execution risk.

## Security Impact

- Threat: MCP tool arguments execute commands as the embedded tooling server identity.
- Affected boundary: hagent through `761eec627a1e6fb128a2a8ce9245aa595cc2f7af`; hagent_arduino and hagent_esp32 arguments.
- Exploit or incident status: public CVE; no local incident is recorded.
- Mitigation state: no fixed release is identified; disable or isolate the server pending non-shell execution.
- Confidence: high; residual risk includes host and connected-device impact.

## Control Implications

- Use typed, validated argv execution for Arduino and ESP tooling.
- Isolate device-control workers from production systems and secrets.

## Authoritative Sources

- [October 28 collector source](../../../raw/processed/2026-10-28/ai-security-wiki-topic-news-collector-2026-10-28T233111Z.json)
- [CVE-2026-117573](https://cveawg.mitre.org/api/cve/CVE-2026-117573)

## Related Code

- Not yet identified.
## Related Tests

- Not yet identified.
## Related Backlog Items

- Not yet identified.
## Related Wiki Pages

- [agent and tool security](index.md)
## Open Questions

- Is a maintainer-supported fixed release available?
## Maintenance Notes

- Created on 2026-10-28 from the October 28 collector.
