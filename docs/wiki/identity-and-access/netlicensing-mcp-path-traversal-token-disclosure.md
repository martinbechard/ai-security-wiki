---
type: "Topic"
title: "NetLicensing MCP Path Traversal Token Disclosure"
description: "Security analysis for CVE-2026-57496 path traversal that exposes NetLicensing API tokens through an MCP tool."
tags: ["identity-and-access", "agent-and-tool-security"]
---

# NetLicensing MCP Path Traversal Token Disclosure

## Current Understanding

The [October 15 topic collector source](../../../raw/processed/2026-10-15/ai-security-wiki-topic-news-collector-2026-10-15T232644Z.json) records [CVE-2026-57496](https://cveawg.mitre.org/api/cve/CVE-2026-57496): NetLicensing MCP Server before 0.1.8 interpolates an authenticated caller's `product_number` into a REST path without segment validation. Traversal can reach `/token`, whose response reaches a non-redacting serializer and exposes APIKEY, number, and SHOP fields. Broad NetLicensing and MCP catalog context belongs upstream; this page owns the local credential-redaction and delegated-authority boundary.

The [NetLicensing 0.1.8 changelog](https://netlicensing.io/wiki/changelog) confirms that the patch applies input validation across HTTP helpers and adds regression tests for this token-redaction bypass.

## Security Impact

- Threat: an authenticated MCP caller can turn a path parameter into a credential-discovery request.
- Affected boundary: Labs64 NetLicensing MCP Server before 0.1.8; product lookup path construction and token-output redaction.
- Exploit or incident status: public CVE; no local exploitation incident is recorded.
- Mitigation state: upgrade to 0.1.8 or later, constrain tool inputs to validated path segments, rotate potentially exposed tokens, and apply redaction after route resolution.
- Confidence: high for affected version, route behavior, and remediation evidence.
- Residual risk: a low-privilege MCP credential remains a pivot if any tool can resolve an unintended route or serialize credential fields.

## Authoritative Sources

- [October 15 topic collector source](../../../raw/processed/2026-10-15/ai-security-wiki-topic-news-collector-2026-10-15T232644Z.json)
- [CVE-2026-57496 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-57496)
- [NetLicensing changelog](https://netlicensing.io/wiki/changelog)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [NetLicensing MCP Server operator key fallback](netlicensing-mcp-server-operator-key-fallback.md)
- [MCP tool-level IAM authorization](mcp-tool-level-iam-authorization.md)

## Open Questions

- Does every supported NetLicensing MCP transport use the 0.1.8 path-segment validation and post-resolution token redaction path?

## Maintenance Notes

- Created on 2026-10-15 from CVE-2026-57496 and vendor release evidence; keep product catalog context upstream.
