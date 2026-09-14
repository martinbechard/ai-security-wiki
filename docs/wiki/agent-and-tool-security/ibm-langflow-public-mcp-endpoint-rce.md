---
type: "Topic"
title: "IBM Langflow public MCP endpoint RCE"
description: "Security analysis for CVE-2026-85025 public MCP project endpoint code execution and chat-session access in IBM Langflow OSS."
tags: ["agent-and-tool-security", "identity-and-access"]
---

# IBM Langflow public MCP endpoint RCE

## Current Understanding

The [September 13 topic collector source](../../../raw/processed/2026-09-13/ai-security-wiki-topic-news-collector-2026-09-13T171540Z.json) records [CVE-2026-85025](https://cveawg.mitre.org/api/cve/CVE-2026-85025) for IBM Langflow OSS 1.0.0 through 1.11.5. Broad Langflow product context belongs upstream; this page owns the public MCP project endpoint boundary.

The direct CVE record says publicly shared MCP project endpoints could allow unauthenticated arbitrary code execution and access or modification of chat sessions because public-flow security restrictions and session-isolation controls were not properly enforced.

## Security Impact

- Threat: public MCP project sharing can expose both code execution and chat-session authority without authentication.
- Affected boundary: IBM Langflow OSS 1.0.0 through 1.11.5, public MCP project endpoints, public-flow restrictions, and session-isolation controls.
- Exploit or incident status: public IBM PSIRT-sourced CVE and NVD evidence; no local exploitation incident is recorded.
- Mitigation state: follow IBM bulletin remediation, disable public MCP project endpoints until fixed, and require authentication plus session ownership checks for public-flow execution.
- Confidence: high for the public MCP endpoint and version range from direct CVE evidence; medium for fixed-version detail until the IBM bulletin is reconciled.
- Residual risk: public flow sharing needs explicit negative tests for code-capable nodes and chat-session mutation.

## Authoritative Sources

- [September 13 topic collector source](../../../raw/processed/2026-09-13/ai-security-wiki-topic-news-collector-2026-09-13T171540Z.json)
- [CVE-2026-85025 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-85025)
- [IBM Langflow OSS bulletin](https://www.ibm.com/support/pages/node/7286666)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [IBM Langflow MCP stdio command execution](ibm-langflow-mcp-stdio-command-execution.md)
- [IBM Langflow scanner code-execution bypasses](ibm-langflow-scanner-code-execution-bypasses.md)
- [IBM Langflow file and endpoint disclosure](ibm-langflow-file-and-endpoint-disclosure.md)

## Open Questions

- Which IBM Langflow OSS release fixes CVE-2026-85025?

## Maintenance Notes

- Created on 2026-09-13 from the [September 13 topic collector](../../../raw/processed/2026-09-13/ai-security-wiki-topic-news-collector-2026-09-13T171540Z.json) after verifier correction split the Langflow advisory sample by security boundary.
