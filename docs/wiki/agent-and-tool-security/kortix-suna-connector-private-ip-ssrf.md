---
type: "Topic"
title: "Kortix Suna Connector Private-IP SSRF"
description: "Security analysis for CVE-2026-108115 private-network reachability through Kortix Suna connector URL validation gaps."
tags: ["agent-and-tool-security"]
---

# Kortix Suna Connector Private-IP SSRF

## Current Understanding

The [October 10 topic collector source](../../../raw/processed/2026-10-10/ai-security-wiki-topic-news-collector-2026-10-10T232615Z.json) records [CVE-2026-108115](https://cveawg.mitre.org/api/cve/CVE-2026-108115) for Kortix Suna 0.10.7 before 0.13.52. Broad Suna product context belongs upstream; this page owns the connector SSRF boundary where project connector URLs can encode private IPv4 destinations through IPv6 transition formats.

Project managers with `project.connector.write` can supply IPv6 6to4 or Teredo addresses in connector URLs for:

- `base_url`,
- OpenAPI,
- Postman, and
- MCP.

The NVD summary says those URLs can reach internal services and cloud metadata endpoints and return responses, so the security issue is not just URL validation drift but private-network and metadata-service exposure through agent connectors.

## Security Impact

- Threat: untrusted connector configuration can become server-side private-network reachability.
- Affected boundary: Kortix Suna 0.10.7 before 0.13.52, connector URL validation, OpenAPI/Postman/MCP URL ingestion, and cloud metadata endpoints.
- Exploit or incident status: public CVE Services and NVD evidence; no confirmed exploitation incident is recorded locally.
- Mitigation state: update to 0.13.52 or later, canonicalize final destinations after IPv6 transition decoding, block cloud metadata ranges, and log connector egress decisions.
- Confidence: high for the CVE identity and affected range from same-window NVD/CVE evidence.
- Residual risk: connector allowlists need canonical address checks because agent-supplied integrations can hide private IPv4 targets inside alternate address families.

## Authoritative Sources

- [October 10 topic collector source](../../../raw/processed/2026-10-10/ai-security-wiki-topic-news-collector-2026-10-10T232615Z.json)
- [CVE-2026-108115 record](https://cveawg.mitre.org/api/cve/CVE-2026-108115)
- [NVD CVE-2026-108115](https://nvd.nist.gov/vuln/detail/CVE-2026-108115)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [cross-vendor MCP SSRF protocol pivoting](cross-vendor-mcp-ssrf-protocol-pivoting.md)
- [UTCP remote HTTP manual loopback SSRF](utcp-remote-http-manual-loopback-ssrf.md)

## Open Questions

- No open wiki questions are recorded for this topic.

## Maintenance Notes

- Created on 2026-10-11 from the [October 10 topic collector source](../../../raw/processed/2026-10-10/ai-security-wiki-topic-news-collector-2026-10-10T232615Z.json) after upstream index routing kept broad product and framework context outside the local security wiki.
