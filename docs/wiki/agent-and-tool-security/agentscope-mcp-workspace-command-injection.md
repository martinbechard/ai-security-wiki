---
type: "Topic"
title: "AgentScope MCP Workspace Command Injection"
description: "Security analysis for CVE-2026-123022 command injection at the AgentScope MCP Workspace API."
tags: ["agent-and-tool-security"]
---

# AgentScope MCP Workspace Command Injection

## Current Understanding

The [November 6 collector source](../../../raw/processed/2026-11-06/ai-security-wiki-topic-news-collector-2026-11-07T003626Z.json) records [CVE-2026-123022](https://github.com/advisories/GHSA-m997-8g56-6phf): AgentScope through 2.0.11 allows an externally supplied MCP Workspace API `command` value to reach `subprocess.Popen` without adequate neutralization. Broad AgentScope product coverage belongs upstream; this page owns the MCP configuration-to-process-execution boundary.

## Security Impact

- Threat: a remote caller can supply a command that is interpreted by the AgentScope service process.
- Affected boundary: AgentScope through 2.0.11, MCP Workspace API command handling in `src/agentscope/mcp/_config.py`.
- Exploit or incident status: the GitHub Advisory Database describes public exploit availability; no evidence in the retained sources establishes active exploitation or a local incident.
- Mitigation state: the advisory lists no patched version and says the referenced fix pull request awaited acceptance. Restrict the API to trusted network paths or disable it when unused until a maintained fixed release is confirmed.
- Confidence: high for CVE-2026-123022, the affected component, and the lack of a listed patched version; medium for the collector's related-CVE grouping.
- Residual risk: any exposed configuration API that can select agent subprocesses remains a delegated execution boundary even after command neutralization is improved.

## Authoritative Sources

- [November 6 collector source](../../../raw/processed/2026-11-06/ai-security-wiki-topic-news-collector-2026-11-07T003626Z.json)
- [CVE-2026-123022 / GHSA-m997-8g56-6phf](https://github.com/advisories/GHSA-m997-8g56-6phf)
- [AgentScope issue 3312](https://github.com/agentscope-ai/agentscope/issues/3312)
- [AgentScope pull request 3448](https://github.com/agentscope-ai/agentscope/pull/3448)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [identity and access](../identity-and-access/index.md)

## Open Questions

- Do direct maintainer-authored advisory pages for CVE-2026-123023 and CVE-2026-123024 confirm their affected versions and fixed releases independently of the collector's grouped disclosure?
- Which maintained AgentScope release, if any, contains the CVE-2026-123022 remediation?

## Maintenance Notes

- Created on 2026-11-06 from the November 5 GitHub Advisory Database publication. The related-CVE grouping is not treated as remediation evidence until direct maintainer records are available.
