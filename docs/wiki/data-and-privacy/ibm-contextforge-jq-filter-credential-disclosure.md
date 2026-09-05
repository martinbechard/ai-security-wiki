---
type: "Topic"
title: "IBM ContextForge jq Filter Credential Disclosure"
description: "Security analysis for CVE-2026-18486 credential disclosure and privilege escalation through ContextForge jq filters."
tags: ["data-and-privacy", "agent-and-tool-security"]
---

# IBM ContextForge jq Filter Credential Disclosure

## Current Understanding

The [September 4 topic collector source](../../../raw/processed/2026-09-04/ai-security-wiki-topic-news-collector-2026-09-04T233156Z.json) records CVE-2026-18486 for IBM ContextForge MCP Gateway through 1.0.7. Broad ContextForge product coverage belongs upstream; this page owns credential disclosure, privilege escalation, and tool-response transformation risk.

[CVE-2026-18486](https://cveawg.mitre.org/api/cve/CVE-2026-18486), [NVD](https://nvd.nist.gov/vuln/detail/CVE-2026-18486), and [IBM support advisory 7286052](https://www.ibm.com/support/pages/node/7286052) describe insufficient validation of `jq` filters that can expose sensitive credentials and escalate privileges.

## Security Impact

- Threat: unvalidated response-transformation filters can read or expose credentials and change privilege boundaries.
- Affected boundary: IBM ContextForge MCP Gateway through 1.0.7 jq filter execution.
- Exploit or incident status: public CVE and IBM advisory; no local exploitation evidence is recorded.
- Mitigation state: validate or constrain transformation filters and keep credentials out of filter-reachable data.
- Confidence: high for advisory identity and affected boundary from CVE, NVD, and IBM advisory evidence.
- Residual risk: filter languages embedded in gateways can become code-adjacent execution and data-selection surfaces.

## Authoritative Sources

- [September 4 topic collector source](../../../raw/processed/2026-09-04/ai-security-wiki-topic-news-collector-2026-09-04T233156Z.json)
- [CVE-2026-18486](https://cveawg.mitre.org/api/cve/CVE-2026-18486)
- [NVD CVE-2026-18486](https://nvd.nist.gov/vuln/detail/CVE-2026-18486)
- [IBM support advisory 7286052](https://www.ibm.com/support/pages/node/7286052)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [data and privacy](index.md)
- [MCP data movement exposure controls](mcp-data-movement-exposure-controls.md)

## Open Questions

- Which ContextForge release fixes CVE-2026-18486 and what filter operations remain allowed?

## Maintenance Notes

- Created on 2026-09-04 from the [September 4 topic collector source](../../../raw/processed/2026-09-04/ai-security-wiki-topic-news-collector-2026-09-04T233156Z.json).
