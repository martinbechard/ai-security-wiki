---
type: "Topic"
title: "Token Optimizer MCP Dashboard Log Traversal"
description: "Security analysis for CVE-2026-55156 unauthenticated dashboard log traversal in token-optimizer-mcp."
tags: ["data-and-privacy", "agent-and-tool-security"]
---

# Token Optimizer MCP Dashboard Log Traversal

## Current Understanding

The [September 28 topic collector source](../../../raw/processed/2026-09-28/ai-security-wiki-topic-news-collector-2026-09-28T233057Z.json) records [CVE-2026-55156](https://cveawg.mitre.org/api/cve/CVE-2026-55156) for token-optimizer-mcp versions before 5.1.0. Broad Token Optimizer MCP product and context-optimization practice belongs upstream; this page owns the local session telemetry disclosure boundary.

The source says dashboard session-summary and session-events endpoints were exposed without authentication and joined caller-controlled `sessionId` values into filesystem paths. That allowed unauthenticated reads of reachable `.jsonl` files, including prompts, events, and local session traces from coding-agent sessions and live knowledge-graph context.

## Security Impact

- Threat: unauthenticated log traversal can expose prompts, tool events, local agent traces, and session context that may contain secrets or sensitive project data.
- Affected boundary: token-optimizer-mcp before 5.1.0; dashboard session summary and event endpoints.
- Exploit or incident status: public CVE and NVD records with GitHub advisory, patch, and release references; no local incident evidence is recorded.
- Mitigation state: update to 5.1.0 or later, authenticate dashboard endpoints, normalize and contain session identifiers, and treat agent telemetry as sensitive data.
- Confidence: high from in-window CVE Program, NVD, GitHub advisory, and release evidence.
- Residual risk: context-optimization tools can accumulate high-value prompts, tool outputs, and knowledge graph state even when they are not intended to be primary data stores.

## Authoritative Sources

- [September 28 topic collector source](../../../raw/processed/2026-09-28/ai-security-wiki-topic-news-collector-2026-09-28T233057Z.json)
- [CVE-2026-55156 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-55156)
- [GitHub advisory GHSA-76pc-mqxp-3rq5](https://github.com/ooples/token-optimizer-mcp/security/advisories/GHSA-76pc-mqxp-3rq5)
- [Patch commit b4ee96d](https://github.com/ooples/token-optimizer-mcp/commit/b4ee96dac799cbfba0a9f9c17844ce9d613cbcc7)
- [Release v5.1.0](https://github.com/ooples/token-optimizer-mcp/releases/tag/v5.1.0)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [data and privacy](index.md)
- [token-optimizer-mcp command injection](../agent-and-tool-security/token-optimizer-mcp-command-injection.md)
- [AI coding telemetry redaction controls](ai-coding-telemetry-redaction-controls.md)
- Upstream ai-dev-wiki owns general coding-agent context-optimization practice.

## Open Questions

- Which dashboard routes and filesystem roots were reachable before token-optimizer-mcp 5.1.0?

## Maintenance Notes

- Created on 2026-09-29 from the [September 28 topic collector source](../../../raw/processed/2026-09-28/ai-security-wiki-topic-news-collector-2026-09-28T233057Z.json) after splitting Token Optimizer MCP disclosure and command-execution boundaries into separate leaves.
