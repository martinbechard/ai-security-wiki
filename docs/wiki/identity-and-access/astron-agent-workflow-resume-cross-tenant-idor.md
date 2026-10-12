---
type: "Topic"
title: "Astron Agent Workflow Resume Cross-Tenant IDOR"
description: "Security analysis for CVE-2026-108864 iFlytek Astron Agent workflow resume endpoint crossing tenant boundaries."
tags: ["identity-and-access", "agent-and-tool-security"]
---

# Astron Agent Workflow Resume Cross-Tenant IDOR

## Current Understanding

The [October 11 topic collector source](../../../raw/processed/2026-10-11/ai-security-wiki-topic-news-collector-2026-10-11T233138Z.json) records [CVE-2026-108864](https://nvd.nist.gov/vuln/detail/CVE-2026-108864) for iFlytek Astron Agent through 1.1.2. Broad Astron Agent product context belongs upstream; this page owns cross-tenant workflow-resume authorization.

The NVD evidence says authenticated applications can resume other applications' paused workflows by supplying `event_id` values to `POST /workflow/v1/resume`. Attackers can inject resume content into victim workflows and read continuation output streams.

## Security Impact

- Threat: authenticated applications can interfere with another tenant's paused workflow and observe continuation output.
- Affected boundary: iFlytek Astron Agent through 1.1.2, `POST /workflow/v1/resume`, paused workflow `event_id` values, resume content, output streams, and application ownership.
- Exploit or incident status: public NVD and CVE Services records; no confirmed exploitation incident is recorded locally.
- Mitigation state: bind workflow resume events to application owner and tenant, validate event state before accepting content, and audit cross-application `event_id` use.
- Confidence: high for affected range and IDOR mechanics from NVD evidence.
- Residual risk: paused agent workflows are control-plane state and need the same ownership checks as initial workflow invocation.

## Authoritative Sources

- [October 11 topic collector source](../../../raw/processed/2026-10-11/ai-security-wiki-topic-news-collector-2026-10-11T233138Z.json)
- [NVD CVE-2026-108864](https://nvd.nist.gov/vuln/detail/CVE-2026-108864)
- [CVE-2026-108864 record](https://cveawg.mitre.org/api/cve/CVE-2026-108864)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [Astron Agent LocalExecutor Tenant Root Code Execution](../infrastructure-and-supply-chain/astron-agent-localexecutor-tenant-root-code-execution.md)
- [Dify MCP server status tenant ownership](dify-mcp-server-status-tenant-ownership.md)

## Open Questions

- Does Astron Agent 1.1.2 fix both LocalExecutor tenant isolation and workflow resume ownership, or do the version boundaries differ?

## Maintenance Notes

- Created on 2026-10-12 from the [October 11 topic collector source](../../../raw/processed/2026-10-11/ai-security-wiki-topic-news-collector-2026-10-11T233138Z.json).
