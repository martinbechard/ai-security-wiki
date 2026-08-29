---
type: "Topic"
title: "Spring AI PDF Document Reader recursion DoS"
description: "Security analysis for CVE-2026-47851 Spring AI PDF Document Reader unbounded recursion DoS."
tags: ["infrastructure-and-supply-chain"]
---

# Spring AI PDF Document Reader recursion DoS

## Current Understanding

The [August 27 topic collector source](../../../raw/processed/2026-08-27/ai-security-wiki-topic-news-collector-2026-08-27T233104Z.json) records [CVE-2026-47851](https://nvd.nist.gov/vuln/detail/CVE-2026-47851) for Spring AI PDF Document Reader. Broad [Spring AI framework coverage](../../../upstream-ai-wiki/developer-tools/java-ai-application-frameworks.md) belongs upstream; this page owns the document-ingestion availability boundary.

## Security Impact

- Threat: deeply nested or cyclic PDF table-of-contents data can trigger `StackOverflowError` in an ingestion thread
- Affected boundary: Spring AI 2.0.0, 1.1.0-1.1.8, and 1.0.0-1.0.9
- Exploit or incident status: public advisory evidence; no local in-the-wild exploitation evidence is recorded.
- Mitigation state: Use [fixed versions 2.0.1, 2.0.0.1, 1.1.9, or 1.0.10](https://spring.io/security/cve-2026-47851) and isolate untrusted document parsing from shared ingestion workers.
- Confidence: high for advisory existence and affected boundary; medium for remediation details when the primary advisory does not name a fixed release.
- Residual risk: model- or browser-reachable helper surfaces can convert ordinary tool arguments into internal data access, credential use, or host execution when final authorization is missing.

## Authoritative Sources

- [August 28 topic collector source](../../../raw/processed/2026-08-28/ai-security-wiki-topic-news-collector-2026-08-28T233139Z.json)
- [August 27 topic collector source](../../../raw/processed/2026-08-27/ai-security-wiki-topic-news-collector-2026-08-27T233104Z.json)
- [NVD record](https://nvd.nist.gov/vuln/detail/CVE-2026-47851)
- [CVE record](https://www.cve.org/CVERecord?id=CVE-2026-47851)
- [Spring security advisory](https://spring.io/security/cve-2026-47851)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](../agent-and-tool-security/index.md)
- [infrastructure and supply chain](../infrastructure-and-supply-chain/index.md)
- [identity and access](../identity-and-access/index.md)

## Open Questions

- No open wiki questions are recorded for this topic.

## Maintenance Notes

- Updated on 2026-08-29 with [August 28 topic collector](../../../raw/processed/2026-08-28/ai-security-wiki-topic-news-collector-2026-08-28T233139Z.json) provenance while preserving the existing leaf boundary and avoiding duplicate digest grouping.
- Created on 2026-08-28 from the [August 27 topic collector](../../../raw/processed/2026-08-27/ai-security-wiki-topic-news-collector-2026-08-27T233104Z.json) as a focused AI security leaf after routing broad Spring AI context upstream; next check whether public exploit or incident evidence appears for adversarial PDF ingestion.
