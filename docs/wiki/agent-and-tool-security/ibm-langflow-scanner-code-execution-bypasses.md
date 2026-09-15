---
type: "Topic"
title: "IBM Langflow scanner code-execution bypasses"
description: "Security analysis for IBM Langflow OSS custom component scanner, denylist, and eval bypass CVEs."
tags: ["agent-and-tool-security", "infrastructure-and-supply-chain"]
---

# IBM Langflow scanner code-execution bypasses

## Current Understanding

The [September 13 topic collector source](../../../raw/processed/2026-09-13/ai-security-wiki-topic-news-collector-2026-09-13T171540Z.json) records sampled IBM Langflow OSS 1.0.0 through 1.11.5 CVEs where scanner or code-validation controls fail before execution. The [September 14 topic collector source](../../../raw/processed/2026-09-14/ai-security-wiki-topic-news-collector-2026-09-14T233124Z.json) adds [CVE-2026-12944](https://cveawg.mitre.org/api/cve/CVE-2026-12944), where IBM Langflow OSS 1.0.0 through 1.10.0 allows arbitrary Python code execution with root privileges when custom components use `socket` or `urllib` imports that bypass an incomplete scanner blocklist. Broad Langflow product context belongs upstream; this page owns the static-scanner and interpreter-sink boundary.

The sampled records include [CVE-2026-76059](https://cveawg.mitre.org/api/cve/CVE-2026-76059) for annotated class-body assignment alias tracking that bypasses a dangerous callable blocklist, [CVE-2026-78569](https://cveawg.mitre.org/api/cve/CVE-2026-78569) for incomplete denylist code execution, and [CVE-2026-78571](https://nvd.nist.gov/vuln/detail/CVE-2026-78571) for an unguarded `eval()` call on attacker-controlled input. The collector also observed related in-window NVD records for environment-variable blocklist, graph-construction code injection, stored-flow custom-component authorization, flow-display-name command execution, and path-limitation code execution variants.

## Security Impact

- Threat: custom component scanners and deny lists can be bypassed when analysis misses aliases, environment access, eval sinks, or graph-construction paths.
- Affected boundary: IBM Langflow OSS 1.0.0 through 1.11.5 for the sampled scanner/eval records; CVE-2026-12944 reports 1.0.0 through 1.10.0 and some related variants report 1.0.0 through 1.10.3.
- Exploit or incident status: public IBM PSIRT-sourced CVE and NVD evidence; no local exploitation incident is recorded.
- Mitigation state: follow IBM bulletin remediation, disable custom components or code-capable generation paths until fixed, and replace denylist scanning with allow-listed execution and sandboxing.
- Confidence: high for the sampled CVE mechanics; medium for the complete in-window inventory because the raw source sampled five records and a direct NVD recheck returned a larger set.
- Residual risk: scanner-only controls remain brittle when model-generated or user-supplied code can reach runtime execution paths.

## Authoritative Sources

- [September 13 topic collector source](../../../raw/processed/2026-09-13/ai-security-wiki-topic-news-collector-2026-09-13T171540Z.json)
- [September 14 topic collector source](../../../raw/processed/2026-09-14/ai-security-wiki-topic-news-collector-2026-09-14T233124Z.json)
- [IBM Langflow OSS bulletin](https://www.ibm.com/support/pages/node/7286666)
- [CVE-2026-12944 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-12944)
- [IBM CVE-2026-12944 support advisory](https://www.ibm.com/support/pages/node/7278919)
- [CVE-2026-76059 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-76059)
- [CVE-2026-78569 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-78569)
- [CVE-2026-78571 NVD record](https://nvd.nist.gov/vuln/detail/CVE-2026-78571)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [IBM Langflow public MCP endpoint RCE](ibm-langflow-public-mcp-endpoint-rce.md)
- [IBM Langflow MCP stdio command execution](ibm-langflow-mcp-stdio-command-execution.md)
- [Flowise CSV Agent prompt-injection RCE](flowise-csv-agent-prompt-injection-rce.md)

## Open Questions

- Which IBM Langflow OSS release fixes each scanner/eval/code-injection CVE in the September 2026 bulletin?
- Which of the broader in-window NVD Langflow records should become separate leaves after direct CVE-level reconciliation?
- Does IBM publish a fixed release for CVE-2026-12944, and does it replace the import blocklist or only expand denied imports?

## Maintenance Notes

- Updated on 2026-09-15 from the [September 14 topic collector](../../../raw/processed/2026-09-14/ai-security-wiki-topic-news-collector-2026-09-14T233124Z.json) with CVE-2026-12944 scanner-blocklist bypass evidence and IBM support provenance.
- Created on 2026-09-13 from the [September 13 topic collector](../../../raw/processed/2026-09-13/ai-security-wiki-topic-news-collector-2026-09-13T171540Z.json) after verifier correction split the Langflow advisory sample by security boundary.
