---
type: "Topic"
title: "jina-ai Reader Private-Address SSRF"
description: "Security analysis for CVE-2026-82638 jina-ai Reader private-address guard bypass outside Google Cloud."
tags: ["infrastructure-and-supply-chain", "data-and-privacy"]
---

# jina-ai Reader Private-Address SSRF

## Current Understanding

The [August 30 topic collector source](../../../raw/processed/2026-08-30/ai-security-wiki-topic-news-collector-2026-08-30T233055Z.json) records [CVE-2026-82638](https://nvd.nist.gov/vuln/detail/CVE-2026-82638) for jina-ai Reader. Broad Jina AI and Reader product coverage belongs upstream; this page owns the local retrieval SSRF and metadata-exposure boundary.

NVD and the [VulnCheck advisory](https://www.vulncheck.com/advisories/jina-ai-reader-server-side-request-forgery-via-disabled-private-address-guard) say Reader disabled its private-address guard outside Google Cloud deployments. An unauthenticated caller could supply a public hostname that resolves to a private address and retrieve cloud metadata or internal service content through the Reader fetch path.

## Security Impact

- Threat: model-context retrieval can become SSRF into cloud metadata or private services.
- Affected boundary: jina-ai Reader private-address filtering outside Google Cloud deployments; the collector did not capture a precise affected-version range.
- Exploit or incident status: public vulnerability disclosure; no local exploitation incident is recorded.
- Mitigation state: enable private-address blocking across deployment environments, resolve and recheck DNS results, deny cloud metadata endpoints, and authenticate retrieval endpoints before model context ingestion.
- Confidence: high for the vulnerability fact from NVD and VulnCheck; medium for remediation and version status because the collector flagged that patch-boundary reconciliation is still needed.
- Residual risk: public-hostname allow checks can miss DNS rebinding, redirects, and resolver differences that matter for model-context pipelines.

## Control Implications

- Treat URL retrieval services as data-ingress and network-egress controls for model context.
- Block link-local, loopback, private, and cloud metadata ranges after DNS resolution and redirects.
- Preserve the fetched-source audit trail when retrieval output enters prompts or retrieval indexes.

## Authoritative Sources

- [August 30 topic collector source](../../../raw/processed/2026-08-30/ai-security-wiki-topic-news-collector-2026-08-30T233055Z.json)
- [NVD CVE-2026-82638](https://nvd.nist.gov/vuln/detail/CVE-2026-82638)
- [VulnCheck advisory](https://www.vulncheck.com/advisories/jina-ai-reader-server-side-request-forgery-via-disabled-private-address-guard)
- [jina-ai Reader issue 1253](https://github.com/jina-ai/reader/issues/1253)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [data and privacy](../data-and-privacy/index.md)
- [Kimi Code FetchURL SSRF](../agent-and-tool-security/kimi-code-fetchurl-ssrf.md)

## Open Questions

- Which Reader release or deployment configuration restores private-address blocking outside Google Cloud?

## Maintenance Notes

- Created on 2026-08-30 from the [August 30 topic collector](../../../raw/processed/2026-08-30/ai-security-wiki-topic-news-collector-2026-08-30T233055Z.json) as a retrieval SSRF leaf.
