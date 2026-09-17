---
type: "Topic"
title: "Contentful MCP Server network option injection"
description: "Security analysis for CVE-2026-53957 Contentful MCP Server exposing model-controlled network options in migration tools."
tags: ["agent-and-tool-security", "data-and-privacy"]
---

# Contentful MCP Server network option injection

## Current Understanding

The [September 16 topic collector source](../../../raw/processed/2026-09-16/ai-security-wiki-topic-news-collector-2026-09-16T233115Z.json) records [CVE-2026-53957](https://cveawg.mitre.org/api/cve/CVE-2026-53957) for Contentful MCP Server and `@contentful/mcp-server` before 1.7.19 and `@contentful/mcp-tools` before 0.4.5. Broad Contentful and MCP server product context belongs upstream; this page owns the local boundary where LLM-controlled tool arguments can alter privileged network behavior.

The CVE says `export_space` and `import_space` allowed model-controlled `host`, `proxy`, `rawProxy`, and `insecure` options to reach Contentful Management API requests. That means a tool call generated or influenced by an LLM can redirect management traffic, weaken transport checks, or expose management tokens unless privileged client configuration is separated from ordinary model-selected parameters.

## Security Impact

- Threat: an induced or malicious tool call can steer Contentful management requests through attacker-selected network options.
- Affected boundary: Contentful MCP Server before 1.7.19, `@contentful/mcp-tools` before 0.4.5, migration tooling, network request destination, proxy, and TLS-check configuration.
- Exploit or incident status: public CVE and NVD records; no local exploitation incident is recorded.
- Mitigation state: upgrade to fixed package versions and keep host, proxy, raw proxy, and TLS-relaxation settings outside LLM-controlled tool schemas.
- Confidence: high for CVE/NVD publication, affected versions, and option names; medium for deployment exposure until MCP server configuration and token scope are audited.
- Residual risk: MCP migration tools can combine content-management authority with model-selected action parameters, so configuration authority must be narrower than tool invocation authority.

## Control Implications

- Treat destination, proxy, and TLS options as administrative configuration, not ordinary MCP tool arguments.
- Bind management API tokens to approved Contentful endpoints and monitor unexpected proxy or host overrides.
- Review MCP tool schemas for hidden privileged fields that can affect network, credential, or transport boundaries.

## Authoritative Sources

- [September 16 topic collector source](../../../raw/processed/2026-09-16/ai-security-wiki-topic-news-collector-2026-09-16T233115Z.json)
- [CVE-2026-53957 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-53957)
- [NVD CVE-2026-53957 record](https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2026-53957)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [MCP data movement exposure controls](../data-and-privacy/mcp-data-movement-exposure-controls.md)
- [AI provider override trust boundaries](../data-and-privacy/ai-provider-override-trust-boundaries.md)

## Open Questions

- Which Contentful MCP deployments expose management tokens to migration tools that accept model-selected network options?

## Maintenance Notes

- Created on 2026-09-17 from the [September 16 topic collector](../../../raw/processed/2026-09-16/ai-security-wiki-topic-news-collector-2026-09-16T233115Z.json) as an MCP network-configuration authority leaf.
