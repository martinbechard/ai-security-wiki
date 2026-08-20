---
type: "Topic"
title: "Apache SkyWalking MCP SSRF GraphQL Injection"
description: "Security analysis for CVE-2026-34884 in Apache SkyWalking MCP 0.1.0."
tags: ["agent-and-tool-security", "infrastructure-and-supply-chain"]
---

# Apache SkyWalking MCP SSRF GraphQL Injection

## Current Understanding

The [August 18 topic news collector source](../../../raw/processed/2026-08-18/ai-security-wiki-topic-news-collector-2026-08-18T233017Z.json) records CVE-2026-34884 for Apache SkyWalking MCP 0.1.0. Broad Apache SkyWalking product background belongs upstream if needed; this page owns the local observability-MCP attack surface.

[NVD CVE-2026-34884](https://nvd.nist.gov/vuln/detail/CVE-2026-34884) describes SSRF through the `set_skywalking_url` tool and GraphQL expression injection in Apache SkyWalking MCP 0.1.0, with upgrade to 0.2.0 recommended. The local security issue is that an observability MCP server can expose privileged telemetry and query paths to agent-mediated network and expression inputs.

## Security Impact

- Threat: agent-visible observability tools can be steered toward internal URLs or injected GraphQL expressions.
- Affected boundary: Apache SkyWalking MCP 0.1.0; `set_skywalking_url`, GraphQL query construction, and observability backend access.
- Exploit or incident status: public CVE with Apache advisory references.
- Mitigation state: upgrade to Apache SkyWalking MCP 0.2.0, restrict endpoint configuration, and validate GraphQL expression inputs.
- Confidence: high for affected version and fixed version from NVD and Apache references.
- Residual risk: observability MCP servers often hold high-context telemetry and should be treated as privileged operational tools.

## Authoritative Sources

- [August 18 topic news collector source](../../../raw/processed/2026-08-18/ai-security-wiki-topic-news-collector-2026-08-18T233017Z.json)
- [NVD CVE-2026-34884](https://nvd.nist.gov/vuln/detail/CVE-2026-34884)
- [Apache advisory thread](https://lists.apache.org/thread/s447p6h5dfr02lx17v27phoksgb8mkkp)
- [oss-security mirror](http://www.openwall.com/lists/oss-security/2026/04/13/5)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [cloud observability MCP response controls](cloud-observability-mcp-response-controls.md)
- [agent network egress controls](agent-network-egress-controls.md)

## Open Questions

- Which deployments expose SkyWalking MCP configuration tools to untrusted agent or user input?

## Maintenance Notes

- Created on 2026-08-19 from the [August 18 topic collector](../../../raw/processed/2026-08-18/ai-security-wiki-topic-news-collector-2026-08-18T233017Z.json) as an observability-MCP vulnerability leaf.
