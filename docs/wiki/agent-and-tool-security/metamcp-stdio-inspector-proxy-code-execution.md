---
type: "Topic"
title: "MetaMCP stdio Inspector Proxy Code Execution"
description: "Security analysis for CVE-2026-79538, where MetaMCP exposes code execution through the stdio inspector proxy endpoint."
tags: ["agent-and-tool-security", "infrastructure-and-supply-chain"]
---

# MetaMCP stdio Inspector Proxy Code Execution

## Current Understanding

The [September 29 topic collector source](../../../raw/processed/2026-09-29/ai-security-wiki-topic-news-collector-2026-09-29T233133Z.json) records [CVE-2026-79538](https://nvd.nist.gov/vuln/detail/CVE-2026-79538) for MetaMCP through 2.4.22. General MetaMCP product and MCP aggregation practice belongs upstream; this page owns the local inspector proxy and stdio command-execution boundary.

The source says the internal MCP inspector proxy endpoint `GET /mcp-proxy/server/stdio` can reach code execution. The related [MetaMCP session IDOR](../identity-and-access/metamcp-session-idor.md) is tracked separately because it is a tenant-isolation failure, while this leaf is about a local proxy endpoint that can start or control stdio execution.

## Security Impact

- Threat: an exposed inspector proxy endpoint can convert MCP control-plane access into local code execution.
- Affected boundary: MetaMCP through 2.4.22; `/mcp-proxy/server/stdio`; internal MCP inspector proxy; stdio server launch or execution path.
- Exploit or incident status: public NVD entry and Traceforce advisory; no active exploitation was identified in the collector source.
- Mitigation state: restrict inspector proxy access, require authenticated and authorized administrative subjects, avoid attacker-controlled stdio command construction, and upgrade once a fixed release is identified.
- Confidence: high for affected range and execution boundary from NVD and Traceforce; medium for exact exploit mechanics and fixed-version status because the collector did not capture patch details.
- Residual risk: MCP control planes that expose stdio launch helpers need the same hardening as command-execution APIs.

## Authoritative Sources

- [September 29 topic collector source](../../../raw/processed/2026-09-29/ai-security-wiki-topic-news-collector-2026-09-29T233133Z.json)
- [CVE-2026-79538 NVD entry](https://nvd.nist.gov/vuln/detail/CVE-2026-79538)
- [MetaMCP repository](https://github.com/metatool-ai/metamcp)
- [Traceforce CVE-2026-79538 advisory](https://www.traceforce.ai/security-advisories/cve-2026-79538)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [MetaMCP session IDOR](../identity-and-access/metamcp-session-idor.md)
- [Bifrost MCP stdio registration RCE](bifrost-mcp-stdio-registration-rce.md)
- [IBM Langflow MCP stdio command execution](ibm-langflow-mcp-stdio-command-execution.md)
- Upstream AI wiki owns broad MetaMCP product catalog context if needed.

## Open Questions

- Which MetaMCP release fixes CVE-2026-79538 and what endpoint-level authorization was added?

## Maintenance Notes

- Created on 2026-09-30 from the [September 29 topic collector source](../../../raw/processed/2026-09-29/ai-security-wiki-topic-news-collector-2026-09-29T233133Z.json) after splitting the code-execution proxy issue from the MetaMCP session-isolation issue.
