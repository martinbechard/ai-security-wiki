---
type: "Topic"
title: "Kali-GPT MCP Scanner Command Injection"
description: "Security analysis for CVE-2026-117569 scanner-parameter shell injection."
tags: ["agent-and-tool-security"]
---

# Kali-GPT MCP Scanner Command Injection

## Current Understanding

The [October 28 collector source](../../../raw/processed/2026-10-28/ai-security-wiki-topic-news-collector-2026-10-28T233111Z.json) records [CVE-2026-117569](https://cveawg.mitre.org/api/cve/CVE-2026-117569): Kali-GPT through commit `a608c74` runs scanner parameters through `subprocess.run(shell=True)`. Broad tool catalog context belongs upstream; this page owns the security-scanner delegated-authority boundary.

## Security Impact

- Threat: a prompt-influenced scan field executes commands under a network-privileged server identity.
- Affected boundary: Kali-GPT through `a608c74e99910232dd208fee99de860458672b82`; target, ports, domain, wordlist, and URL fields.
- Exploit or incident status: public CVE; no local incident is recorded.
- Mitigation state: no fixed release is identified; restrict network reach and disable shell execution.
- Confidence: high; residual risk is elevated for security scanners with broad egress.

## Control Implications

- Use typed scan profiles and argv-based process calls.
- Separate scanner workers from production networks and credentials.

## Authoritative Sources

- [October 28 collector source](../../../raw/processed/2026-10-28/ai-security-wiki-topic-news-collector-2026-10-28T233111Z.json)
- [CVE-2026-117569](https://cveawg.mitre.org/api/cve/CVE-2026-117569)

## Related Code

- Not yet identified.
## Related Tests

- Not yet identified.
## Related Backlog Items

- Not yet identified.
## Related Wiki Pages

- [agent and tool security](index.md)
## Open Questions

- Which maintained release removes `shell=True`?
## Maintenance Notes

- Created on 2026-10-28 from the October 28 collector.
