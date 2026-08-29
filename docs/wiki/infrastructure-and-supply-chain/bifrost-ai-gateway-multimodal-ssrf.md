---
type: "Topic"
title: "Bifrost AI Gateway multimodal SSRF"
description: "Security analysis for CVE-2026-55245 Bifrost AI Gateway multimodal fetch SSRF and cloud metadata exposure."
tags: ["infrastructure-and-supply-chain", "data-and-privacy"]
---

# Bifrost AI Gateway multimodal SSRF

## Current Understanding

The [August 28 topic collector source](../../../raw/processed/2026-08-28/ai-security-wiki-topic-news-collector-2026-08-28T233139Z.json) records [CVE-2026-55245](https://nvd.nist.gov/vuln/detail/CVE-2026-55245) for Bifrost AI Gateway multimodal fetch handling. Broad Bifrost product and multimodal gateway integration context belongs upstream; this page owns the local AI gateway SSRF boundary where model-request media URLs can reach internal services or cloud metadata.

## Security Impact

- Threat: client-controlled image or document URLs in Bedrock or Vertex request paths can bypass incomplete public-IP checks and fetch CGNAT, IPv6 transition, NAT64, deprecated site-local, or metadata destinations.
- Affected boundary: Bifrost before core v1.5.17; the GitHub advisory lists <= 1.5.15 and patched >= 1.5.16 while NVD references a v1.5.17 release.
- Exploit or incident status: public NVD and GitHub advisory evidence; no local in-the-wild exploitation evidence is recorded.
- Mitigation state: use a fixed Bifrost release, validate resolved destinations across IPv4, IPv6, redirects, and cloud metadata ranges, and bind provider credentials to server-side policy.
- Confidence: high for the SSRF mechanics; medium for exact fixed-version boundary because public sources differ.
- Residual risk: AI gateways concentrate provider credentials and network reach, so media fetch helpers need stricter egress policy than ordinary client-side URL validation.

## Authoritative Sources

- [August 28 topic collector source](../../../raw/processed/2026-08-28/ai-security-wiki-topic-news-collector-2026-08-28T233139Z.json)
- [NVD CVE-2026-55245](https://nvd.nist.gov/vuln/detail/CVE-2026-55245)
- [GitHub security advisory](https://github.com/maximhq/bifrost/security/advisories/GHSA-w98g-5w9p-p3rc)
- [Bifrost core v1.5.17 release](https://github.com/maximhq/bifrost/releases/tag/core/v1.5.17)
- [GitHub commit](https://github.com/maximhq/bifrost/commit/54ec431fc5255ff42c36420d88549477e0b33d89)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [agent network egress controls](../agent-and-tool-security/agent-network-egress-controls.md)
- [MCP data movement exposure controls](../data-and-privacy/mcp-data-movement-exposure-controls.md)

## Open Questions

- Which Bifrost release should local guidance treat as the first fully fixed version when NVD and GitHub advisory metadata differ?

## Maintenance Notes

- Created on 2026-08-29 from the [August 28 topic collector](../../../raw/processed/2026-08-28/ai-security-wiki-topic-news-collector-2026-08-28T233139Z.json) after routing broad gateway product context upstream.
