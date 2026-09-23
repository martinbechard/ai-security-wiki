---
type: "Topic"
title: "FastGPT Safe Axios DNS Rebinding SSRF"
description: "Security analysis for CVE-2026-84301 FastGPT safe Axios hostname validation bypass through DNS rebinding."
tags: ["agent-and-tool-security", "infrastructure-and-supply-chain"]
---

# FastGPT Safe Axios DNS Rebinding SSRF

## Current Understanding

The [September 22 topic collector source](../../../raw/processed/2026-09-22/ai-security-wiki-topic-news-collector-2026-09-22T233219Z.json) records [CVE-2026-84301](https://cveawg.mitre.org/api/cve/CVE-2026-84301) / [GHSA-6jwp-qf29-hpj9](https://github.com/labring/FastGPT/security/advisories/GHSA-6jwp-qf29-hpj9) for FastGPT before 4.15.2. Broad FastGPT product coverage belongs upstream; this page owns the local outbound-request guard and SSRF containment boundary.

FastGPT's safe Axios interceptor checks a hostname with `isInternalAddress()` before the later HTTP connection performs a separate DNS lookup. An authenticated attacker who controls a hostname can pass the preflight check with a public address and then rebind the name to loopback, private, link-local, or cloud metadata addresses during connection.

## Security Impact

- Threat: authenticated user-controlled fetch targets can bypass FastGPT's internal-address guard and reach private services or cloud metadata endpoints.
- Affected boundary: labring/FastGPT before 4.15.2, `packages/service/common/api/axios.ts`, safe Axios outbound requests, DNS resolution, and backend network egress.
- Exploit or incident status: public CVE, NVD, GitHub advisory, pull request, patch commit, and release evidence; no local exploitation incident is recorded.
- Mitigation state: upgrade to 4.15.2 or later, pin the resolved IP used for validation and connection, and apply egress denial for loopback, private, link-local, and metadata ranges at the network layer.
- Confidence: high for advisory existence, affected version, and validation/connect split; medium for which FastGPT features expose attacker-controlled URLs in each deployment.
- Residual risk: retrieval, workflow, plugin, and document-loading features need SSRF defenses that bind DNS validation to the actual socket destination.

## Authoritative Sources

- [September 22 topic collector source](../../../raw/processed/2026-09-22/ai-security-wiki-topic-news-collector-2026-09-22T233219Z.json)
- [CVE-2026-84301 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-84301)
- [NVD CVE-2026-84301](https://nvd.nist.gov/vuln/detail/CVE-2026-84301)
- [GitHub Security Advisory GHSA-6jwp-qf29-hpj9](https://github.com/labring/FastGPT/security/advisories/GHSA-6jwp-qf29-hpj9)
- [FastGPT v4.15.2 release](https://github.com/labring/FastGPT/releases/tag/v4.15.2)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [FastGPT WeChat outLink auth bypass](../identity-and-access/fastgpt-wechat-outlink-auth-bypass.md)
- [agent network egress controls](agent-network-egress-controls.md)

## Open Questions

- Which FastGPT tools, retrieval connectors, or workflow nodes invoke safe Axios with user-controlled hostnames in common deployments?

## Maintenance Notes

- Created on 2026-09-23 from the [September 22 topic collector source](../../../raw/processed/2026-09-22/ai-security-wiki-topic-news-collector-2026-09-22T233219Z.json) as a separate SSRF guard bypass from the existing WeChat outLink authorization leaf.
