---
type: "Topic"
title: "Spring AI ONNX cache model substitution"
description: "Security analysis for CVE-2026-47852 Spring AI predictable ONNX cache model substitution."
tags: ["infrastructure-and-supply-chain"]
---

# Spring AI ONNX cache model substitution

## Current Understanding

The [August 27 topic collector source](../../../raw/processed/2026-08-27/ai-security-wiki-topic-news-collector-2026-08-27T233104Z.json) records [CVE-2026-47852](https://nvd.nist.gov/vuln/detail/CVE-2026-47852) for Spring AI ONNX cache behavior. Broad [Spring AI](../../../upstream-ai-wiki/developer-tools/java-ai-application-frameworks.md) and ONNX background belongs upstream; this page owns the multi-user host cache path and model-artifact substitution boundary.

## Security Impact

- Threat: a local attacker on a multi-user host can pre-create a predictable cache path and substitute a malicious ONNX model
- Affected boundary: Spring AI 2.0.0, 1.1.0-1.1.8, and 1.0.0-1.0.9
- Exploit or incident status: public advisory evidence; no local in-the-wild exploitation evidence is recorded.
- Mitigation state: Use [fixed versions 2.0.1, 2.0.0.1, 1.1.9, or 1.0.10](https://spring.io/security/cve-2026-47852) and place model caches in per-user, permission-protected directories.
- Confidence: high for advisory existence and affected boundary; medium for remediation details when the primary advisory does not name a fixed release.
- Residual risk: model- or browser-reachable helper surfaces can convert ordinary tool arguments into internal data access, credential use, or host execution when final authorization is missing.

## Authoritative Sources

- [August 28 topic collector source](../../../raw/processed/2026-08-28/ai-security-wiki-topic-news-collector-2026-08-28T233139Z.json)
- [August 27 topic collector source](../../../raw/processed/2026-08-27/ai-security-wiki-topic-news-collector-2026-08-27T233104Z.json)
- [NVD record](https://nvd.nist.gov/vuln/detail/CVE-2026-47852)
- [CVE record](https://www.cve.org/CVERecord?id=CVE-2026-47852)
- [Spring security advisory](https://spring.io/security/cve-2026-47852)

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
- Created on 2026-08-28 from the [August 27 topic collector](../../../raw/processed/2026-08-27/ai-security-wiki-topic-news-collector-2026-08-27T233104Z.json) as a focused AI security leaf after routing broad Spring AI and ONNX context upstream; next check whether fixed versions also change cache permissions or only cache path construction.
