---
type: "Topic"
title: "Flowise agent node code execution"
description: "Security analysis for Flowise 3.1.3 code execution advisories in agent memory, record-manager, custom tool, CSVAgent, and Pyodide paths."
tags: ["agent-and-tool-security", "infrastructure-and-supply-chain"]
---

# Flowise agent node code execution

## Current Understanding

The [September 8 topic collector source](../../../raw/processed/2026-09-08/ai-security-wiki-topic-news-collector-2026-09-08T233200Z.json) records NVD in-window updates for Flowise code-execution and code-injection issues fixed in 3.1.3. Broad Flowise product context belongs upstream; this page owns the agent-builder boundary where node configuration, prompt-influenced values, CSV data, and Pyodide execution can become server-side or sandboxed code execution.

The covered records include agent memory and record-manager DataSource option injection, custom tool baseURL source interpolation, and CSVAgent/Pyodide prompt-injection execution paths. The common control is strict separation between untrusted flow data and executable templates or interpreter inputs.

## Security Impact

- Threat: untrusted prompt, flow, CSV, or tool configuration values can reach execution sinks.
- Affected boundary: Flowise versions before 3.1.3; memory nodes, record-manager nodes, custom tools, CSVAgent, and Pyodide paths.
- Exploit or incident status: public NVD/CVE/GitHub advisory evidence; no local exploitation incident is recorded.
- Mitigation state: upgrade to Flowise 3.1.3 or later and remove string interpolation from code-capable node boundaries.
- Confidence: high for NVD update timing and fixed-version signal; medium for exact per-node exploit prerequisites.
- Residual risk: low-code agent builders remain vulnerable when configuration fields are later evaluated as code or interpreter input.

## Authoritative Sources

- [September 8 topic collector source](../../../raw/processed/2026-09-08/ai-security-wiki-topic-news-collector-2026-09-08T233200Z.json)
- [Flowise 3.1.3 release](https://github.com/FlowiseAI/Flowise/releases/tag/flowise@3.1.3)
- [CVE-2026-69251 NVD record](https://nvd.nist.gov/vuln/detail/CVE-2026-69251)
- [CVE-2026-69253 NVD record](https://nvd.nist.gov/vuln/detail/CVE-2026-69253)
- [CVE-2026-69255 NVD record](https://nvd.nist.gov/vuln/detail/CVE-2026-69255)
- [CVE-2026-69256 NVD record](https://nvd.nist.gov/vuln/detail/CVE-2026-69256)

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

## Open Questions

- No open wiki questions are recorded for this topic.

## Maintenance Notes

- Created on 2026-09-08 from the September 8 topic collector after verifier correction split the Flowise release wave into focused security-boundary leaves.
