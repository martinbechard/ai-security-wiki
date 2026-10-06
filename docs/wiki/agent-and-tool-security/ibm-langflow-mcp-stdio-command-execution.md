---
type: "Topic"
title: "IBM Langflow MCP stdio command execution"
description: "Security analysis for IBM Langflow OSS MCP stdio command-line argument and local subprocess execution CVEs."
tags: ["agent-and-tool-security", "infrastructure-and-supply-chain"]
---

# IBM Langflow MCP stdio command execution

## Current Understanding

The [September 13 topic collector source](../../../raw/processed/2026-09-13/ai-security-wiki-topic-news-collector-2026-09-13T171540Z.json) records MCP stdio command-execution issues in IBM Langflow OSS 1.0.0 through 1.11.5. Broad Langflow product and MCP catalog context belongs upstream; this page owns the MCP Tools local-subprocess boundary.

[CVE-2026-78575](https://cveawg.mitre.org/api/cve/CVE-2026-78575) describes improper validation of command-line arguments in MCP stdio server configuration. [CVE-2026-81941](https://cveawg.mitre.org/api/cve/CVE-2026-81941) describes authenticated non-admin OS command execution by constructing a flow with an MCP Tools component configured to use local stdio subprocess transport, bypassing `LANGFLOW_CUSTOM_COMPONENT_ADMIN_ONLY` and `LANGFLOW_BLOCK_CODE_INTERPRETER_COMPONENTS`.

The [October 5 topic collector source](../../../raw/processed/2026-10-05/ai-security-wiki-topic-news-collector-2026-10-05T233142Z.json) records two additional Langflow MCP stdio command-execution records in the same local-subprocess family. [CVE-2026-105697](https://cveawg.mitre.org/api/cve/CVE-2026-105697) covers MCP server settings and MCP Tools flows that launch user-supplied stdio commands before Langflow 1.10.3, with default development auto-login making exposed default deployments reachable without credentials. [CVE-2026-105740](https://cveawg.mitre.org/api/cve/CVE-2026-105740) covers authenticated stdio RCE before 1.9.0 through the command field and environment-variable injection.

## Security Impact

- Threat: MCP stdio connector configuration can grant non-admin users command execution under the Langflow server process.
- Affected boundary: IBM Langflow OSS 1.0.0 through 1.11.5 for the September records; Langflow before 1.10.3 for CVE-2026-105697; Langflow before 1.9.0 for CVE-2026-105740; MCP stdio server configuration, MCP Tools components, and server-side controls intended to block local subprocess transport.
- Exploit or incident status: public IBM PSIRT-sourced CVE and NVD evidence; no local exploitation incident is recorded.
- Mitigation state: follow IBM bulletin remediation, block non-admin local stdio subprocess transport, validate command-line arguments, and treat MCP server launch configuration as administrative code-execution authority.
- Confidence: high for command-execution mechanics and control-bypass framing from CVE evidence; medium for fixed-version detail until the IBM bulletin is reconciled.
- Residual risk: MCP stdio transports can look like configuration while carrying full process-spawn authority.

## Authoritative Sources

- [September 13 topic collector source](../../../raw/processed/2026-09-13/ai-security-wiki-topic-news-collector-2026-09-13T171540Z.json)
- [October 5 topic collector source](../../../raw/processed/2026-10-05/ai-security-wiki-topic-news-collector-2026-10-05T233142Z.json)
- [CVE-2026-78575 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-78575)
- [CVE-2026-81941 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-81941)
- [CVE-2026-105697 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-105697)
- [CVE-2026-105740 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-105740)
- [IBM Langflow OSS bulletin](https://www.ibm.com/support/pages/node/7286666)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [IBM Langflow public MCP endpoint RCE](ibm-langflow-public-mcp-endpoint-rce.md)
- [IBM Langflow scanner code-execution bypasses](ibm-langflow-scanner-code-execution-bypasses.md)
- [local agent execution and processing boundaries](local-agent-execution-and-processing-boundaries.md)

## Open Questions

- Which IBM Langflow OSS release fixes CVE-2026-78575 and CVE-2026-81941?
- Which deployments allowed non-admin users to configure local stdio MCP transports?

## Maintenance Notes

- Created on 2026-09-13 from the [September 13 topic collector](../../../raw/processed/2026-09-13/ai-security-wiki-topic-news-collector-2026-09-13T171540Z.json) after verifier correction split the MCP stdio subprocess boundary from other Langflow code-execution records.
- Updated on 2026-10-06 with October 5 CVE-2026-105697 and CVE-2026-105740 evidence; the digest links this existing stdio execution boundary instead of creating duplicate Langflow pages.
