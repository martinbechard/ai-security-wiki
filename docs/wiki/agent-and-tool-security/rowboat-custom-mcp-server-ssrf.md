---
type: "Topic"
title: "Rowboat Custom MCP Server SSRF"
description: "Security analysis for CVE-2026-86122 SSRF through Rowboat custom MCP server and webhook URL configuration."
tags: ["agent-and-tool-security", "infrastructure-and-supply-chain"]
---

# Rowboat Custom MCP Server SSRF

## Current Understanding

The [September 5 topic collector source](../../../raw/processed/2026-09-05/ai-security-wiki-topic-news-collector-2026-09-05T233231Z.json) records CVE-2026-86122 for Rowboat through 0.9.1. Broad Rowboat product and agent-platform coverage belongs upstream; this page owns the local custom MCP server URL, webhook URL, and agent-runtime network egress boundary.

[CVE-2026-86122](https://cveawg.mitre.org/api/cve/CVE-2026-86122) and [NVD](https://nvd.nist.gov/vuln/detail/CVE-2026-86122) describe insufficient validation of custom MCP server and webhook URLs. Authenticated users can configure arbitrary destinations, allowing server-side requests to internal services and cloud metadata endpoints and enabling internal network-topology enumeration.

Rowboat publishes tags and releases after 0.9.1, including [v0.9.2](https://github.com/rowboatlabs/rowboat/releases/tag/v0.9.2) and [v0.9.3](https://github.com/rowboatlabs/rowboat/releases/tag/v0.9.3), but the public [issue #621](https://github.com/rowboatlabs/rowboat/issues/621) remains open and the CVE record does not identify a fixed version. Treat the fixed boundary as unconfirmed until a maintainer advisory or release note ties a later release to URL/IP validation, metadata blocking, redirect handling, or DNS rebinding defenses.

## Security Impact

- Threat: authenticated project members can turn agent integration configuration into private-network and metadata-service SSRF.
- Affected boundary: rowboatlabs/rowboat through 0.9.1; custom MCP server and webhook URL handling.
- Exploit or incident status: public CVE and open public issue; no local in-the-wild exploitation evidence is recorded.
- Mitigation state: fixed version not yet confirmed; block private, loopback, link-local, reserved, and metadata destinations for every configured MCP or webhook URL and revalidate after DNS resolution and redirects.
- Confidence: high for the affected range and SSRF boundary from direct CVE and NVD evidence; medium for remediation status because later releases exist without a confirmed security fix in the checked evidence.
- Residual risk: agent platforms can expose many connector URL fields, so scheme-only validation or UI trust is not enough to contain runtime egress.

## Authoritative Sources

- [September 5 topic collector source](../../../raw/processed/2026-09-05/ai-security-wiki-topic-news-collector-2026-09-05T233231Z.json)
- [CVE-2026-86122](https://cveawg.mitre.org/api/cve/CVE-2026-86122)
- [NVD CVE-2026-86122](https://nvd.nist.gov/vuln/detail/CVE-2026-86122)
- [Rowboat issue #621](https://github.com/rowboatlabs/rowboat/issues/621)
- [Rowboat v0.9.3 release](https://github.com/rowboatlabs/rowboat/releases/tag/v0.9.3)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [agent network egress controls](agent-network-egress-controls.md)

## Open Questions

- Which Rowboat release, advisory, or commit confirms complete private-destination checks for custom MCP server and webhook URLs?

## Maintenance Notes

- Created on 2026-09-05 from the [September 5 topic collector source](../../../raw/processed/2026-09-05/ai-security-wiki-topic-news-collector-2026-09-05T233231Z.json) after live release checks found later Rowboat releases but no confirmed fixed version.
