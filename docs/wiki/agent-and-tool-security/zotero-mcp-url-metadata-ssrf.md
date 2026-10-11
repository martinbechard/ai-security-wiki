---
type: "Topic"
title: "zotero-mcp URL Metadata SSRF"
description: "Security analysis for CVE-2026-108583 prompt-steered SSRF through zotero-mcp URL metadata fetching."
tags: ["agent-and-tool-security"]
---

# zotero-mcp URL Metadata SSRF

## Current Understanding

The [October 10 topic collector source](../../../raw/processed/2026-10-10/ai-security-wiki-topic-news-collector-2026-10-10T232615Z.json) records [CVE-2026-108583](https://cveawg.mitre.org/api/cve/CVE-2026-108583) for zotero-mcp 0.10.0 through 0.14.1. Broad Zotero and MCP server context belongs upstream; this page owns prompt-injection-to-SSRF and metadata-leak analysis.

The affected `_fetch_embedded_metadata` path can be reached when prompt injection steers an agent into calling `zotero_add_by_url`. Direct or redirected requests can target:

- loopback hosts,
- private hosts, and
- link-local hosts.

Citation metadata or error details can leak information about those internal destinations.

## Security Impact

- Threat: prompt-injected citation workflows can become server-side internal fetches.
- Affected boundary: zotero-mcp 0.10.0 through 0.14.1, `_fetch_embedded_metadata`, `zotero_add_by_url`, redirects, and loopback/private/link-local destinations.
- Exploit or incident status: public CVE Services and NVD evidence; no confirmed exploitation incident is recorded locally.
- Mitigation state: patch to a fixed release when available, validate final fetch destinations after redirects, and treat URL-add tools as network egress tools requiring policy.
- Confidence: high for the SSRF boundary from NVD/CVE evidence; medium for exploit impact because leakage depends on reachable internal services.
- Residual risk: metadata fetch helpers need the same destination controls as general web-fetch tools because models can be steered into invoking them.

## Authoritative Sources

- [October 10 topic collector source](../../../raw/processed/2026-10-10/ai-security-wiki-topic-news-collector-2026-10-10T232615Z.json)
- [CVE-2026-108583 record](https://cveawg.mitre.org/api/cve/CVE-2026-108583)
- [NVD CVE-2026-108583](https://nvd.nist.gov/vuln/detail/CVE-2026-108583)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [Pydantic AI web fetch destination bypass](pydantic-ai-web-fetch-destination-bypass.md)
- [mcp-fetch IPv6 SSRF](mcp-fetch-ipv6-ssrf.md)

## Open Questions

- No open wiki questions are recorded for this topic.

## Maintenance Notes

- Created on 2026-10-11 from the [October 10 topic collector source](../../../raw/processed/2026-10-10/ai-security-wiki-topic-news-collector-2026-10-10T232615Z.json) after upstream index routing kept broad product and framework context outside the local security wiki.
