---
type: "Topic"
title: "IBM FTM AI Agent RAG Poisoning"
description: "Security analysis for CVE-2026-18875, where unauthenticated runbook poisoning can steer IBM FTM AI agent MCP tool calls."
tags: ["model-and-prompt-security", "agent-and-tool-security"]
---

# IBM FTM AI Agent RAG Poisoning

## Current Understanding

The [September 23 topic collector source](../../../raw/processed/2026-09-23/ai-security-wiki-topic-news-collector-2026-09-23T233151Z.json) records [CVE-2026-18875](https://cveawg.mitre.org/api/cve/CVE-2026-18875) for IBM Financial Transaction Manager for Red Hat OpenShift 4.0.6.0 through 4.0.10.0. Broad IBM product context belongs upstream only if needed; this page owns the local retrieval-integrity and tool-action boundary.

The vulnerability is a direct retrieval-poisoning-to-agent-action path. An unauthenticated attacker can upsert malicious runbook content into the FTM AI agent server vector database. That poisoned retrieval context can influence AI-driven MCP tool calls and potentially drive unauthorized payment actions or payment-data exfiltration.

## Security Impact

- Threat: unauthenticated RAG poisoning that can alter agent guidance and steer consequential MCP tool calls.
- Affected boundary: IBM Financial Transaction Manager for Red Hat OpenShift 4.0.6.0 through 4.0.10.0, FTM AI agent server, vector database runbooks, and payment-operation MCP tools.
- Exploit or incident status: IBM CNA CVE, NVD, and IBM support advisory reference; no local in-the-wild exploitation evidence is recorded.
- Mitigation state: review IBM support advisory for fixed versions and compensating controls; restrict runbook ingestion APIs and validate retrieved runbooks before tool dispatch.
- Confidence: high for affected version range and product boundary; medium for remediation wording until the IBM bulletin is reviewed directly.
- Residual risk: financial operations agents need retrieval source authentication and tool-call authorization because poisoned operational knowledge can become transaction authority.

## Authoritative Sources

- [September 23 topic collector source](../../../raw/processed/2026-09-23/ai-security-wiki-topic-news-collector-2026-09-23T233151Z.json)
- [CVE-2026-18875 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-18875)
- [NVD CVE-2026-18875](https://nvd.nist.gov/vuln/detail/CVE-2026-18875)
- [IBM support advisory](https://www.ibm.com/support/pages/node/7288641)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [model and prompt security](index.md)
- [agent and tool security](../agent-and-tool-security/index.md)
- [MCP context injection transparency](../agent-and-tool-security/mcp-context-injection-transparency.md)

## Open Questions

- Which IBM FTM release or interim fix remediates CVE-2026-18875, and does IBM recommend disabling or restricting the affected runbook upsert path before upgrade?

## Maintenance Notes

- Created on 2026-09-24 from the [September 23 topic collector source](../../../raw/processed/2026-09-23/ai-security-wiki-topic-news-collector-2026-09-23T233151Z.json); this page owns the security-specific RAG poisoning and MCP action path rather than broad product usage.
