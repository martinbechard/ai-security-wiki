---
type: "Topic"
title: "Docling Remote Fetch DNS Rebinding"
description: "Security analysis for CVE-2026-105743 DNS rebinding and internal fetch risk in Docling remote image and page rendering."
tags: ["agent-and-tool-security", "data-and-privacy"]
---

# Docling Remote Fetch DNS Rebinding

## Current Understanding

The [October 5 topic collector source](../../../raw/processed/2026-10-05/ai-security-wiki-topic-news-collector-2026-10-05T233142Z.json) records [CVE-2026-105743](https://nvd.nist.gov/vuln/detail/CVE-2026-105743) for Docling 2.91.0 until 2.132.0. Broad Docling context belongs upstream; this page owns internal-network fetch containment for document ingestion workers.

The NVD record says `validate_url_safety` validates a hostname with a single IPv4 lookup, then lets the HTTP client resolve and parse the original URL again. DNS rebinding, mixed public/internal records, and parser disagreement can reach internal services when remote fetching or `HTMLBackendOptions(render_page=True)` browser requests are enabled.

## Security Impact

- Threat: hostile documents can steer conversion workers to internal services through rebinding or URL parser disagreement.
- Affected boundary: Docling 2.91.0 until 2.132.0; remote image fetching; HTML page rendering; URL safety validation.
- Exploit or incident status: public NVD record; no local exploitation incident is recorded.
- Mitigation state: update to Docling 2.132.0 or later, resolve and pin destinations after validation, and deny private/internal ranges at the transport layer.
- Confidence: high for affected version and fix from NVD.
- Residual risk: document ingestion workers often sit inside trusted networks and can become SSRF pivots when fetch controls fail.

## Authoritative Sources

- [October 5 topic collector source](../../../raw/processed/2026-10-05/ai-security-wiki-topic-news-collector-2026-10-05T233142Z.json)
- [NVD CVE-2026-105743](https://nvd.nist.gov/vuln/detail/CVE-2026-105743)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [data and privacy](../data-and-privacy/index.md)
- [agent network egress controls](agent-network-egress-controls.md)

## Open Questions

- Which deployed Docling conversion workers allow remote fetching or HTML page rendering inside private networks?

## Maintenance Notes

- Created on 2026-10-06 from the [October 5 topic collector source](../../../raw/processed/2026-10-05/ai-security-wiki-topic-news-collector-2026-10-05T233142Z.json) after verifier correction split the Docling cluster by independent boundary.
