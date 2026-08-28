---
type: "Topic"
title: "sentry-selfhosted-mcp raw_sentry_api SSRF"
description: "Security analysis for CVE-2026-81421 ddfourtwo sentry-selfhosted-mcp raw_sentry_api SSRF."
tags: ["agent-and-tool-security"]
---

# sentry-selfhosted-mcp raw_sentry_api SSRF

## Current Understanding

The [August 27 topic collector source](../../../raw/processed/2026-08-27/ai-security-wiki-topic-news-collector-2026-08-27T233104Z.json) records [CVE-2026-81421](https://nvd.nist.gov/vuln/detail/CVE-2026-81421) for `ddfourtwo/sentry-selfhosted-mcp` 0.4.0. Broad Sentry and [MCP server catalog](../../../upstream-ai-wiki/mcp-servers/index.md) context belongs upstream; this page owns the local tool-argument SSRF and internal-network read boundary.

## Security Impact

- Threat: model-influenced `raw_sentry_api` endpoint arguments can make the MCP server fetch internal or unintended URLs and return responses into the agent workflow
- Affected boundary: ddfourtwo sentry-selfhosted-mcp 0.4.0
- Exploit or incident status: public advisory evidence; no local in-the-wild exploitation evidence is recorded.
- Mitigation state: No fixed version is recorded in the source; disable the tool or enforce destination allowlists, private-range blocks, and final URL validation.
- Confidence: high for advisory existence and affected boundary; medium for remediation details when the primary advisory does not name a fixed release.
- Residual risk: model- or browser-reachable helper surfaces can convert ordinary tool arguments into internal data access, credential use, or host execution when final authorization is missing.

## Authoritative Sources

- [August 27 topic collector source](../../../raw/processed/2026-08-27/ai-security-wiki-topic-news-collector-2026-08-27T233104Z.json)
- [NVD record](https://nvd.nist.gov/vuln/detail/CVE-2026-81421)
- [CVE record](https://www.cve.org/CVERecord?id=CVE-2026-81421)
- [Tenable CVE page](https://www.tenable.com/cve/CVE-2026-81421)
- [GitHub issue](https://github.com/ddfourtwo/sentry-selfhosted-mcp/issues/2)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](../agent-and-tool-security/index.md)
- [infrastructure and supply chain](../infrastructure-and-supply-chain/index.md)
- [identity and access](../identity-and-access/index.md)

## Open Questions

- No open wiki questions are recorded for this topic.

## Maintenance Notes

- Created on 2026-08-28 from the [August 27 topic collector](../../../raw/processed/2026-08-27/ai-security-wiki-topic-news-collector-2026-08-27T233104Z.json) as a focused Sentry MCP `raw_sentry_api` SSRF leaf after routing broad Sentry and MCP catalog context upstream; next check maintainer response and fixed-version status.
