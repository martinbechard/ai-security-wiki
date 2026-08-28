---
type: "Topic"
title: "Spring AI ResourceCache fragment file write"
description: "Security analysis for CVE-2026-59294 Spring AI ResourceCacheService URI fragment file write."
tags: ["infrastructure-and-supply-chain"]
---

# Spring AI ResourceCache fragment file write

## Current Understanding

The [August 27 topic collector source](../../../raw/processed/2026-08-27/ai-security-wiki-topic-news-collector-2026-08-27T233104Z.json) records [CVE-2026-59294](https://nvd.nist.gov/vuln/detail/CVE-2026-59294) for Spring AI `ResourceCacheService`. Broad [Spring AI framework context](../../../upstream-ai-wiki/developer-tools/java-ai-application-frameworks.md) belongs upstream; this page owns the cache filename construction and arbitrary-write boundary.

## Security Impact

- Threat: URI fragments containing path separators or `..` sequences can be appended to cache filenames and write downloaded bytes outside the intended cache path
- Affected boundary: Spring AI 2.0.0, 1.1.0-1.1.8, and 1.0.9 and earlier
- Exploit or incident status: public advisory evidence; no local in-the-wild exploitation evidence is recorded.
- Mitigation state: Use the [Spring advisory fixed versions](https://spring.io/security/cve-2026-59294) when confirmed for this CVE and canonicalize cache filenames so URI fragments cannot control paths.
- Confidence: high for advisory existence and affected boundary; medium for remediation details when the primary advisory does not name a fixed release.
- Residual risk: model- or browser-reachable helper surfaces can convert ordinary tool arguments into internal data access, credential use, or host execution when final authorization is missing.

## Authoritative Sources

- [August 27 topic collector source](../../../raw/processed/2026-08-27/ai-security-wiki-topic-news-collector-2026-08-27T233104Z.json)
- [NVD record](https://nvd.nist.gov/vuln/detail/CVE-2026-59294)
- [CVE record](https://www.cve.org/CVERecord?id=CVE-2026-59294)
- [Spring security advisory](https://spring.io/security/cve-2026-59294)

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

- Which Spring AI release first fixes CVE-2026-59294, and does the fix strip or canonicalize URI fragments before constructing cache filenames?

## Maintenance Notes

- Created on 2026-08-28 from the [August 27 topic collector](../../../raw/processed/2026-08-27/ai-security-wiki-topic-news-collector-2026-08-27T233104Z.json) as a focused AI security leaf after routing broad Spring AI context upstream; next check fixed-version wording and exploit state once the Spring advisory exposes complete remediation detail.
