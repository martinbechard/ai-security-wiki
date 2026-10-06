---
type: "Topic"
title: "Docling Remote Image Credential Forwarding"
description: "Security analysis for CVE-2026-105742 credential forwarding through Docling remote image loading."
tags: ["data-and-privacy", "agent-and-tool-security"]
---

# Docling Remote Image Credential Forwarding

## Current Understanding

The [October 5 topic collector source](../../../raw/processed/2026-10-05/ai-security-wiki-topic-news-collector-2026-10-05T233142Z.json) records [CVE-2026-105742](https://nvd.nist.gov/vuln/detail/CVE-2026-105742) for Docling 2.95.0 until 2.132.0. Broad Docling product and document-AI context belongs upstream; this page owns credential forwarding during AI document ingestion.

The NVD record says the HTML image resource loader forwards headers configured through `HTMLBackendOptions.headers` to every remote image URL named by an untrusted document when remote fetching and image fetching are enabled. Cross-origin redirects can expose configured headers such as API keys or cookies to a document author.

## Security Impact

- Threat: untrusted documents can cause Docling to forward caller-supplied credentials to attacker-controlled image origins.
- Affected boundary: Docling 2.95.0 until 2.132.0; `enable_remote_fetch=True`; `fetch_images=True`; configured HTML backend headers; remote image URLs and redirects.
- Exploit or incident status: public NVD record; no local exploitation incident is recorded.
- Mitigation state: update to Docling 2.132.0 or later and avoid attaching credentials to untrusted remote document fetches.
- Confidence: high for affected version and fix from NVD; medium on vendor-specific operational guidance until direct project advisory text is captured.
- Residual risk: RAG and agent ingestion workers may use service credentials that should not leave the source-origin boundary.

## Authoritative Sources

- [October 5 topic collector source](../../../raw/processed/2026-10-05/ai-security-wiki-topic-news-collector-2026-10-05T233142Z.json)
- [NVD CVE-2026-105742](https://nvd.nist.gov/vuln/detail/CVE-2026-105742)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [data and privacy](index.md)
- [agent and tool security](../agent-and-tool-security/index.md)
- [MCP data movement exposure controls](mcp-data-movement-exposure-controls.md)

## Open Questions

- Which deployments configure Docling HTML backend headers for authenticated source retrieval and therefore need header rotation after exposure?

## Maintenance Notes

- Created on 2026-10-06 from the [October 5 topic collector source](../../../raw/processed/2026-10-05/ai-security-wiki-topic-news-collector-2026-10-05T233142Z.json) after verifier correction split the Docling cluster by independent boundary.
