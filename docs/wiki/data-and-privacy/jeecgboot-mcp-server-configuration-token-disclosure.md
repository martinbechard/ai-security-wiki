---
type: "Topic"
title: "JeecgBoot MCP Server Configuration Token Disclosure"
description: "Security analysis for CVE-2026-108671 JeecgBoot MCP server configuration disclosure of endpoint headers and outbound tokens."
tags: ["data-and-privacy"]
---

# JeecgBoot MCP Server Configuration Token Disclosure

## Current Understanding

The [October 10 topic collector source](../../../raw/processed/2026-10-10/ai-security-wiki-topic-news-collector-2026-10-10T232615Z.json) records JeecgBoot through 3.9.5 low-privilege reads of MCP server configurations. Broad JeecgBoot and MCP catalog context belongs upstream; this page owns endpoint, header, and outbound token disclosure for CVE-2026-108671.

The collector says users can read MCP server configurations because permission checks are missing or commented out. The exposed fields include:

- endpoint URLs,
- headers, and
- outbound authentication tokens.

This is a distinct credential-disclosure boundary from the prompt-template, OCR, experiment, and video-record authorization issues.

## Security Impact

- Threat: low-privileged users can read MCP endpoint configuration and outbound authentication tokens.
- Affected boundary: JeecgBoot through 3.9.5, MCP server configuration records, endpoint URLs, headers, outbound tokens, and missing permission checks.
- Exploit or incident status: public NVD evidence in the October 10 JeecgBoot cluster; no confirmed exploitation incident is recorded locally.
- Mitigation state: restore configuration-read permission checks, redact tokens and headers from API responses, and rotate exposed outbound MCP credentials.
- Confidence: high for exposed fields and controller boundary from NVD evidence.
- Residual risk: MCP configuration records carry remote service authority and should be protected like provider credentials.

## Authoritative Sources

- [October 10 topic collector source](../../../raw/processed/2026-10-10/ai-security-wiki-topic-news-collector-2026-10-10T232615Z.json)
- [NVD CVE-2026-108671](https://nvd.nist.gov/vuln/detail/CVE-2026-108671)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [data and privacy](index.md)
- [MCP data movement exposure controls](mcp-data-movement-exposure-controls.md)
- [TencentCloud Octop Provider API Key Exposure](tencentcloud-octop-provider-api-key-exposure.md)

## Open Questions

- No open wiki questions are recorded for this topic.

## Maintenance Notes

- Created on 2026-10-11 from the [October 10 topic collector source](../../../raw/processed/2026-10-10/ai-security-wiki-topic-news-collector-2026-10-10T232615Z.json) after upstream index routing kept broad JeecgBoot product context outside the local security wiki.
