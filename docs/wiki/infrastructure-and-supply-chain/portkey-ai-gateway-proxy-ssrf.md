---
type: "Topic"
title: "Portkey AI Gateway proxy SSRF"
description: "Security analysis for CVE-2026-82270 Portkey AI Gateway proxy route SSRF."
tags: ["infrastructure-and-supply-chain", "agent-and-tool-security"]
---

# Portkey AI Gateway proxy SSRF

## Current Understanding

The [August 28 topic collector source](../../../raw/processed/2026-08-28/ai-security-wiki-topic-news-collector-2026-08-28T233139Z.json) records [CVE-2026-82270](https://nvd.nist.gov/vuln/detail/CVE-2026-82270) for Portkey AI Gateway through 1.15.2. Broad Portkey product and gateway deployment context belongs upstream; this page owns the local route-level model-gateway SSRF boundary.

## Security Impact

- Threat: the `/v1/proxy/*` route can accept `x-portkey-custom-host` values that point at internal addresses when request validation is missing.
- Affected boundary: Portkey AI Gateway through 1.15.2 proxy routing and gateway network position.
- Exploit or incident status: public NVD and issue/advisory evidence; no local in-the-wild exploitation evidence is recorded.
- Mitigation state: require request validation on proxy routes, reject private or metadata destinations, and pin upstream model destinations to server-side policy.
- Confidence: high for advisory existence and affected version; medium for patch status because the source says maintainer remediation should be rechecked.
- Residual risk: gateway-level SSRF can combine internal network access with stored provider credentials even when end-user model requests appear authenticated.

## Authoritative Sources

- [August 28 topic collector source](../../../raw/processed/2026-08-28/ai-security-wiki-topic-news-collector-2026-08-28T233139Z.json)
- [NVD CVE-2026-82270](https://nvd.nist.gov/vuln/detail/CVE-2026-82270)
- [Portkey AI Gateway repository](https://github.com/Portkey-AI/gateway)
- [Portkey issue 1718](https://github.com/Portkey-AI/gateway/issues/1718)
- [VulnCheck advisory](https://www.vulncheck.com/advisories/portkey-ai-gateway-server-side-request-forgery-via-v1-proxy)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [agent network egress controls](../agent-and-tool-security/agent-network-egress-controls.md)

## Open Questions

- Which Portkey release first enforces request validation and destination filtering for `/v1/proxy/*`?

## Maintenance Notes

- Created on 2026-08-29 from the [August 28 topic collector](../../../raw/processed/2026-08-28/ai-security-wiki-topic-news-collector-2026-08-28T233139Z.json) as an independently maintainable AI gateway SSRF leaf.
