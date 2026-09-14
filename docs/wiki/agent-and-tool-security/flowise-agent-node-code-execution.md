---
type: "Topic"
title: "Flowise agent node code execution"
description: "Security analysis for Flowise 3.1.3 code execution advisories in agent memory, record-manager, and custom-tool paths."
tags: ["agent-and-tool-security", "infrastructure-and-supply-chain"]
---

# Flowise agent node code execution

## Current Understanding

The [September 8 topic collector source](../../../raw/processed/2026-09-08/ai-security-wiki-topic-news-collector-2026-09-08T233200Z.json) records NVD in-window updates for Flowise code-execution and code-injection issues fixed in 3.1.3. Broad Flowise product context belongs upstream; this page owns the agent-builder boundary where node configuration, prompt-influenced values, CSV data, and Pyodide execution can become server-side or sandboxed code execution.

The covered records include agent memory and record-manager DataSource option injection, custom tool baseURL source interpolation, and CSVAgent/Pyodide prompt-injection execution paths. The common control is strict separation between untrusted flow data and executable templates or interpreter inputs.

The [September 13 topic collector source](../../../raw/processed/2026-09-13/ai-security-wiki-topic-news-collector-2026-09-13T171540Z.json) adds in-window NVD evidence for [CVE-2026-70477](https://nvd.nist.gov/vuln/detail/CVE-2026-70477). [Flowise CSV Agent prompt-injection RCE](flowise-csv-agent-prompt-injection-rce.md) owns that distinct CSV Agent and Pyodide boundary. The older DataSource, record-manager, and custom-tool records remain grouped here as explicit follow-up deferrals until direct CVE-level source reconciliation justifies additional splits.

## Security Impact

- Threat: untrusted prompt, flow, or tool configuration values can reach execution sinks.
- Affected boundary: Flowise versions before 3.1.3; memory nodes, record-manager nodes, and custom tools. CSVAgent/Pyodide now has a focused leaf.
- Exploit or incident status: public NVD/CVE/GitHub advisory evidence; no local exploitation incident is recorded.
- Mitigation state: upgrade to Flowise 3.1.3 or later and remove string interpolation from code-capable node boundaries.
- Confidence: high for NVD update timing, CSV Agent severity, and fixed-version signal; medium for exact per-node exploit prerequisites.
- Residual risk: low-code agent builders remain vulnerable when configuration fields are later evaluated as code or interpreter input.

## Authoritative Sources

- [September 8 topic collector source](../../../raw/processed/2026-09-08/ai-security-wiki-topic-news-collector-2026-09-08T233200Z.json)
- [September 13 topic collector source](../../../raw/processed/2026-09-13/ai-security-wiki-topic-news-collector-2026-09-13T171540Z.json)
- [Flowise 3.1.3 release](https://github.com/FlowiseAI/Flowise/releases/tag/flowise@3.1.3)
- [CVE-2026-69251 NVD record](https://nvd.nist.gov/vuln/detail/CVE-2026-69251)
- [CVE-2026-69253 NVD record](https://nvd.nist.gov/vuln/detail/CVE-2026-69253)
- [CVE-2026-69255 NVD record](https://nvd.nist.gov/vuln/detail/CVE-2026-69255)
- [CVE-2026-69256 NVD record](https://nvd.nist.gov/vuln/detail/CVE-2026-69256)
- [CVE-2026-70477 NVD record](https://nvd.nist.gov/vuln/detail/CVE-2026-70477)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [local agent execution and processing boundaries](local-agent-execution-and-processing-boundaries.md)
- [infrastructure and supply chain](../infrastructure-and-supply-chain/index.md)
- [Flowise CSV Agent prompt-injection RCE](flowise-csv-agent-prompt-injection-rce.md)

## Open Questions

- Which direct CVE records and GitHub advisories should split the DataSource, record-manager, and custom-tool execution boundaries into separate leaves?

## Maintenance Notes

- Created on 2026-09-08 from the September 8 topic collector after verifier correction split the Flowise release wave into focused security-boundary leaves.
- Updated on 2026-09-13 from the [September 13 topic collector](../../../raw/processed/2026-09-13/ai-security-wiki-topic-news-collector-2026-09-13T171540Z.json) to route CVE-2026-70477 into a separate CSV Agent/Pyodide leaf and record remaining split deferrals.
