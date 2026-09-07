---
type: "Topic"
title: "Bifrost HTTP Custom Plugin RCE"
description: "Security analysis for CVE-2026-86242 Bifrost HTTP custom-plugin loading RCE and SSRF."
tags: ["infrastructure-and-supply-chain", "agent-and-tool-security"]
---

# Bifrost HTTP Custom Plugin RCE

## Current Understanding

The [September 6 topic collector source](../../../raw/processed/2026-09-06/ai-security-wiki-topic-news-collector-2026-09-06T233209Z.json) records [CVE-2026-86242](https://cveawg.mitre.org/api/cve/CVE-2026-86242) and [GHSA-2qp8-4xgm-fw6g](https://github.com/maximhq/bifrost/security/advisories/GHSA-2qp8-4xgm-fw6g) for Bifrost HTTP transport before 2.0.0. Broad Bifrost product and gateway runtime context belongs upstream; this page owns the local security boundary for unauthenticated custom plugin loading inside an AI gateway process.

This issue is separate from [Bifrost AI Gateway multimodal SSRF](bifrost-ai-gateway-multimodal-ssrf.md). The earlier leaf covers model-request media URL fetching. This page covers the management path where unauthenticated `POST /api/plugins` can accept a custom plugin path that is an HTTP URL when management authentication is disabled. Dynamic builds can download a shared object and pass it to Go `plugin.Open`, while static Docker images reduce the path to SSRF because dynamic loading fails.

## Security Impact

- Threat: unauthenticated plugin management can become remote code execution in a credential-bearing AI gateway process.
- Affected boundary: Bifrost HTTP transport before 2.0.0, vulnerable 1.6.x HTTP transport line through 1.6.11, custom Go plugin loading, and default-disabled management authentication.
- Exploit or incident status: public CVE, NVD, GitHub advisory, pull-request, commit, and release evidence; no local in-the-wild exploitation evidence is recorded.
- Mitigation state: upgrade to the fixed HTTP transport line, enable management authentication, block remote plugin paths, and treat dynamic plugin builds as privileged extension surfaces.
- Confidence: high from direct CVE/NVD, GitHub advisory, PR, commit, and release references.
- Residual risk: AI gateways often hold provider credentials and route privileged model traffic, so extension loading needs authentication, source pinning, artifact integrity, and egress policy even after this patch.

## Authoritative Sources

- [September 6 topic collector source](../../../raw/processed/2026-09-06/ai-security-wiki-topic-news-collector-2026-09-06T233209Z.json)
- [CVE-2026-86242](https://cveawg.mitre.org/api/cve/CVE-2026-86242)
- [NVD CVE-2026-86242](https://nvd.nist.gov/vuln/detail/CVE-2026-86242)
- [GitHub security advisory GHSA-2qp8-4xgm-fw6g](https://github.com/maximhq/bifrost/security/advisories/GHSA-2qp8-4xgm-fw6g)
- [Bifrost pull request 5763](https://github.com/maximhq/bifrost/pull/5763)
- [Bifrost patch commit](https://github.com/maximhq/bifrost/commit/e0057ff355f831c251eabe9d0e44f3a3748532c6)
- [Bifrost transports v2.0.0 release](https://github.com/maximhq/bifrost/releases/tag/transports/v2.0.0)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [Bifrost AI Gateway multimodal SSRF](bifrost-ai-gateway-multimodal-ssrf.md)
- [agent network egress controls](../agent-and-tool-security/agent-network-egress-controls.md)
- [agent build and dependency execution boundaries](agent-build-and-dependency-execution-boundaries.md)

## Open Questions

- Which Bifrost dynamic-plugin deployment modes expose immediate `Init` execution, and which production images are static enough to remain SSRF-only?

## Maintenance Notes

- Created on 2026-09-06 from the [September 6 topic collector source](../../../raw/processed/2026-09-06/ai-security-wiki-topic-news-collector-2026-09-06T233209Z.json) as a separate Bifrost vulnerability pattern from multimodal URL SSRF.
