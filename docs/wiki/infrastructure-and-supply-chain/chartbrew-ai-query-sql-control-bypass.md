---
type: "Topic"
title: "Chartbrew AI Query SQL Control Bypass"
description: "Security analysis for CVE-2026-61851 and CVE-2026-61852 AI-orchestrated SQL control bypasses in Chartbrew."
tags: ["infrastructure-and-supply-chain", "agent-and-tool-security"]
---

# Chartbrew AI Query SQL Control Bypass

## Current Understanding

The [September 21 topic collector source](../../../raw/processed/2026-09-21/ai-security-wiki-topic-news-collector-2026-09-21T233156Z.json) records [CVE-2026-61851](https://cveawg.mitre.org/api/cve/CVE-2026-61851) and [CVE-2026-61852](https://cveawg.mitre.org/api/cve/CVE-2026-61852) for Chartbrew before 5.2.2. Broad Chartbrew product context belongs upstream; this page owns the AI query-tool SQL-control boundary.

`server/modules/ai/orchestrator/tools/runQuery.js` uses a short SQL keyword blocklist for read-only enforcement, allowing dangerous statements or database functions outside the list. A second flaw interpolates the AI tool `row_limit` parameter into a `LIMIT` clause without runtime integer validation, so a model-influenced non-integer value can append SQL after the earlier keyword check. The [GitHub advisory](https://github.com/chartbrew/chartbrew/security/advisories/GHSA-cp8j-2xwc-hxg8), [patch commit](https://github.com/chartbrew/chartbrew/commit/8c8412edce56093e81b524e0235a796c7dd42336), and [5.2.2 release](https://github.com/chartbrew/chartbrew/releases/tag/v5.2.2) are the captured fix evidence.

## Security Impact

- Threat: model-mediated query tools can bypass read-only SQL controls and append injected SQL through parameter formatting.
- Affected boundary: Chartbrew before 5.2.2; AI orchestrator `runQuery` read-only enforcement and `row_limit` handling.
- Exploit or incident status: public CVE records and GitHub advisory; no local exploitation evidence is recorded.
- Mitigation state: upgrade to 5.2.2 or later, enforce read-only behavior with parser or database role controls, and validate numeric AI-tool parameters at runtime.
- Confidence: high because CVE Services, NVD, GitHub advisory, commit, and release references agree on mechanism and fix.
- Residual risk: keyword deny-lists are weak controls for AI-generated SQL because dangerous operations can hide behind dialect functions, comments, compound statements, or untyped parameters.

## Authoritative Sources

- [September 21 topic collector source](../../../raw/processed/2026-09-21/ai-security-wiki-topic-news-collector-2026-09-21T233156Z.json)
- [CVE-2026-61851 JSON](https://cveawg.mitre.org/api/cve/CVE-2026-61851)
- [CVE-2026-61852 JSON](https://cveawg.mitre.org/api/cve/CVE-2026-61852)
- [NVD CVE-2026-61851](https://nvd.nist.gov/vuln/detail/CVE-2026-61851)
- [NVD CVE-2026-61852](https://nvd.nist.gov/vuln/detail/CVE-2026-61852)
- [GitHub advisory GHSA-cp8j-2xwc-hxg8](https://github.com/chartbrew/chartbrew/security/advisories/GHSA-cp8j-2xwc-hxg8)
- [Chartbrew 5.2.2 release](https://github.com/chartbrew/chartbrew/releases/tag/v5.2.2)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [agent and tool security](../agent-and-tool-security/index.md)
- [final query authorization for AI data tools](../agent-and-tool-security/final-query-authorization-for-ai-data-tools.md)

## Open Questions

- No open wiki questions are recorded for this topic.

## Maintenance Notes

- Created on 2026-09-21 from the [September 21 topic collector source](../../../raw/processed/2026-09-21/ai-security-wiki-topic-news-collector-2026-09-21T233156Z.json); grouped the two Chartbrew CVEs because both affect the same AI query tool and read-only SQL boundary.
