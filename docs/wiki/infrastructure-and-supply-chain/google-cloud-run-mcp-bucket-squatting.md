---
type: "Topic"
title: "Google Cloud Run MCP Bucket Squatting"
description: "Security analysis for CVE-2026-85297 Cloud Run MCP bucket-squatting supply-chain exposure."
tags: ["infrastructure-and-supply-chain"]
---

# Google Cloud Run MCP Bucket Squatting

## Current Understanding

The October 26 collector records [CVE-2026-85297](https://nvd.nist.gov/vuln/detail/CVE-2026-85297) and [GHSA-cg86-fr78-hv98](https://github.com/advisories/GHSA-cg86-fr78-hv98) in Google Cloud Run MCP before 1.11.0. Broad Cloud Run MCP context belongs upstream; this page owns resource-name provenance where an agent plugin's cloud bucket becomes a code and data authority boundary.

## Security Impact

- Threat: bucket squatting can intercept proprietary source, execute code, and exfiltrate data.
- Affected boundary: Google Cloud Run MCP releases before 1.11.0.
- Exploit or incident status: public advisory; no local incident evidence is recorded.
- Mitigation state: upgrade to [1.11.0](https://github.com/GoogleCloudPlatform/cloud-run-mcp/releases/tag/v1.11.0) or later and use explicitly owned, pinned storage resources.
- Confidence: high for the fixed version and reported impacts.
- Residual risk: unclaimed or dynamically derived cloud-resource names can recreate the same dependency-substitution condition.

## Authoritative Sources

- [October 26 collector source](../../../raw/processed/2026-10-26/ai-security-wiki-topic-news-collector-2026-10-26T233009Z.json)
- [CVE-2026-85297 record](https://www.cve.org/CVERecord?id=CVE-2026-85297)
- [Cloud Run MCP 1.11.0 release](https://github.com/GoogleCloudPlatform/cloud-run-mcp/releases/tag/v1.11.0)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [AI supply chain provenance credentialing](ai-supply-chain-provenance-credentialing.md)

## Open Questions

- Which storage resource-ownership checks were added in 1.11.0?

## Maintenance Notes

- Created on 2026-10-26 from the October 26 collector.
