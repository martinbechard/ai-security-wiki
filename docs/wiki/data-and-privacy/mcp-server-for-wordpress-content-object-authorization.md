---
type: "Topic"
title: "MCP Server For WordPress Content Object Authorization"
description: "Security analysis for CVE-2026-96526, where an MCP Server for WordPress workflow route exposed unpublished content metadata."
tags: ["data-and-privacy", "identity-and-access"]
---

# MCP Server For WordPress Content Object Authorization

## Current Understanding

The [September 26 topic collector source](../../../raw/processed/2026-09-26/ai-security-wiki-topic-news-collector-2026-09-26T233301Z.json) records CVE-2026-96526 for MCP Server for WordPress before 1.8.2. Broad WordPress plugin context belongs upstream; this page owns the local workflow route object-authorization and content-metadata exposure boundary.

## Security Impact

- Threat: workflow routes can expose titles and publication status for private, draft, pending, and scheduled content without object-level authorization.
- Affected boundary: MCP Server for WordPress before 1.8.2, workflow routes, unpublished content metadata, and WordPress object authorization.
- Exploit or incident status: disclosed CVE; no confirmed exploitation is recorded in the collector.
- Mitigation state: upgrade to 1.8.2 or later and enforce object-level authorization before returning content metadata to MCP workflows.
- Confidence: medium from NVD-backed collector evidence; maintainer or WordPress security-advisory detail should be reconciled.
- Residual risk: titles and publication state can reveal embargoed content, editorial plans, or private operational data to MCP clients.

## Authoritative Sources

- [September 26 topic collector source](../../../raw/processed/2026-09-26/ai-security-wiki-topic-news-collector-2026-09-26T233301Z.json)
- [NVD CVE-2026-96526](https://nvd.nist.gov/vuln/detail/CVE-2026-96526)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [data and privacy](index.md)
- [identity and access](../identity-and-access/index.md)

## Open Questions

- Which content object types were exposed through the MCP Server for WordPress workflow route before 1.8.2?

## Maintenance Notes

- Created on 2026-09-27 from the [September 26 topic collector source](../../../raw/processed/2026-09-26/ai-security-wiki-topic-news-collector-2026-09-26T233301Z.json) after verifier correction split the WordPress MCP advisory family.
