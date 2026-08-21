---
type: "Topic"
title: "RAGFlow Agent Workflow Invoke SSRF"
description: "Security analysis for CVE-2026-75898 SSRF in RAGFlow agent workflow Invoke component."
tags: ["agent-and-tool-security", "data-and-privacy"]
---

# RAGFlow Agent Workflow Invoke SSRF

## Current Understanding

The [August 18 topic news collector source](../../../raw/processed/2026-08-18/ai-security-wiki-topic-news-collector-2026-08-18T233017Z.json) records CVE-2026-75898 / GHSA-9m4v-54qq-67fw for RAGFlow before 0.26.3. Broad RAGFlow product context belongs upstream; this page owns the local agent-workflow egress boundary.

The advisory says the agent workflow Invoke component builds outbound request URLs from canvas configuration and runtime template variables, then sends them without the shared safe-URL validator or resolved-address pinning. A user who can create or trigger an agent can reach loopback, link-local, RFC1918, and cloud metadata destinations. RAGFlow 0.26.3 is listed as fixed.

The [August 20 leaf update watch source](../../../raw/processed/2026-08-20/ai-security-wiki-leaf-update-watch-20260821T000216Z.json) adds [CVE Program](https://www.cve.org/CVERecord?id=CVE-2026-75898), [NVD](https://nvd.nist.gov/vuln/detail/CVE-2026-75898), [GHSA](https://github.com/advisories/GHSA-9m4v-54qq-67fw), and [RAGFlow issue](https://github.com/infiniflow/ragflow/issues/18280) evidence that the Invoke component lacked the shared validator and resolved-address pinning.

## Security Impact

- Threat: user-composable agent workflows can turn template variables into internal network and metadata-service access.
- Affected boundary: RAGFlow before 0.26.3; Invoke component outbound requests and agent workflow canvases.
- Exploit or incident status: public GitHub advisory and NVD record.
- Mitigation state: upgrade to 0.26.3, apply the shared safe-URL validator to every outbound path, and pin resolved addresses through redirects.
- Confidence: high for advisory mechanics and fixed version from GHSA/NVD evidence.
- Residual risk: agent workflow systems need validator coverage tests for every outbound component, not only the common request utility.

## Authoritative Sources

- [August 18 topic news collector source](../../../raw/processed/2026-08-18/ai-security-wiki-topic-news-collector-2026-08-18T233017Z.json)
- [August 20 leaf update watch source](../../../raw/processed/2026-08-20/ai-security-wiki-leaf-update-watch-20260821T000216Z.json)
- [GitHub advisory GHSA-9m4v-54qq-67fw](https://github.com/advisories/GHSA-9m4v-54qq-67fw)
- [NVD CVE-2026-75898](https://nvd.nist.gov/vuln/detail/CVE-2026-75898)
- [RAGFlow issue 15425](https://github.com/infiniflow/ragflow/issues/15425)
- [RAGFlow issue 18280](https://github.com/infiniflow/ragflow/issues/18280)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [agent network egress controls](agent-network-egress-controls.md)
- [MCP data movement exposure controls](../data-and-privacy/mcp-data-movement-exposure-controls.md)

## Open Questions

- Which RAGFlow components share the safe-URL validator and which need independent SSRF conformance tests?

## Maintenance Notes

- Created on 2026-08-19 from the [August 18 topic collector](../../../raw/processed/2026-08-18/ai-security-wiki-topic-news-collector-2026-08-18T233017Z.json) as an agent workflow SSRF leaf.
- Updated on 2026-08-20 from the [August 20 leaf update watch source](../../../raw/processed/2026-08-20/ai-security-wiki-leaf-update-watch-20260821T000216Z.json) with additional advisory evidence for missing shared safe-URL validation and resolved-address pinning.
