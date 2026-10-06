---
type: "Topic"
title: "Langflow Flow Build Ownership Bypass"
description: "Security analysis for CVE-2026-105698 deprecated Langflow build endpoints missing flow ownership checks."
tags: ["identity-and-access", "agent-and-tool-security"]
---

# Langflow Flow Build Ownership Bypass

## Current Understanding

The [October 5 topic collector source](../../../raw/processed/2026-10-05/ai-security-wiki-topic-news-collector-2026-10-05T233142Z.json) records [CVE-2026-105698](https://cveawg.mitre.org/api/cve/CVE-2026-105698) for Langflow 1.0.0 until 1.10.1. Broad Langflow product coverage belongs upstream; this page owns flow ownership checks on build endpoints.

The CVE record says deprecated `POST /api/v1/build/{flow_id}/vertices` and `POST /api/v1/build/{flow_id}/vertices/{vertex_id}` handlers did not verify flow ownership. Attackers who knew another user's flow UUID could load and cache the private graph, enumerate vertex identifiers, and execute selected vertices to receive results, with unauthenticated reachability through 1.7.1 and authenticated reachability from 1.7.2 through 1.10.0.

## Security Impact

- Threat: callers can execute or inspect another user's flow build graph without owning the flow.
- Affected boundary: Langflow 1.0.0 until 1.10.1; deprecated build endpoints; private graph, vertex identifier, and build result access.
- Exploit or incident status: public CVE record; no local exploitation incident is recorded.
- Mitigation state: update to Langflow 1.10.1 / langflow-base 0.10.1 or later and enforce owner checks before loading or building any flow graph.
- Confidence: high for affected range and fix from CVE Services.
- Residual risk: flow-build endpoints can trigger victim-configured side effects even when they do not modify stored flows or expose variable-store credentials.

## Authoritative Sources

- [October 5 topic collector source](../../../raw/processed/2026-10-05/ai-security-wiki-topic-news-collector-2026-10-05T233142Z.json)
- [CVE-2026-105698 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-105698)
- [NVD CVE-2026-105698](https://nvd.nist.gov/vuln/detail/CVE-2026-105698)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [agent and tool security](../agent-and-tool-security/index.md)
- [Langflow Smart Transform code execution](../agent-and-tool-security/langflow-smart-transform-code-execution.md)

## Open Questions

- Which deployments still expose the deprecated build endpoints after upgrading past Langflow 1.10.1?

## Maintenance Notes

- Created on 2026-10-06 from the [October 5 topic collector source](../../../raw/processed/2026-10-05/ai-security-wiki-topic-news-collector-2026-10-05T233142Z.json) after verifier correction split Langflow flow ownership from MCP resource and configuration boundaries.
