---
type: "Topic"
title: "CodeWhale Auto-Approved Execution Tools"
description: "Security analysis for CodeWhale CVEs where code-executing tools bypass approval boundaries."
tags: ["agent-and-tool-security", "identity-and-access"]
---

# CodeWhale Auto-Approved Execution Tools

## Current Understanding

The [August 18 topic news collector source](../../../raw/processed/2026-08-18/ai-security-wiki-topic-news-collector-2026-08-18T233017Z.json) records CodeWhale CVEs for automatic approval of code-executing `exec_shell_interact` and `rlm_eval` tools. Broad coding-agent workflow practice belongs upstream; this page owns the local approval-boundary failure for execution-capable tools.

[CodeWhale agent control plane vulnerabilities](codewhale-agent-control-plane-vulnerabilities.md) routes the broader advisory cluster. This leaf keeps the approval issue separate because execution-tool approval can change independently from repository configuration, git tool arguments, or environment exposure.

The [August 20 leaf update watch source](../../../raw/processed/2026-08-20/ai-security-wiki-leaf-update-watch-20260821T000216Z.json) adds [CVE Program](https://www.cve.org/CVERecord?id=CVE-2026-75857), [NVD](https://nvd.nist.gov/vuln/detail/CVE-2026-75857), and [Rapid7](https://www.rapid7.com/db/vulnerabilities/cve-2026-75857/) evidence that `exec_shell_interact`/`exec_interact` and `rlm_eval` returned automatic approval for model-supplied shell or Python execution inputs.

## Security Impact

- Threat: code-executing tools can run without the approval boundary users expect for shell or evaluator execution.
- Affected boundary: CodeWhale before 0.8.64 or `>=0.8.41` and `<0.8.64`, depending on the exact CVE.
- Exploit or incident status: public CVE/NVD records and Rapid7 advisory coverage; no local exploitation evidence is recorded.
- Mitigation state: update to 0.8.64 or later and require explicit approval for execution-capable tools.
- Confidence: high for approval-bypass mechanics from CVE/NVD/Rapid7 evidence; exact CVSS/CWE fields still need source reconciliation.
- Residual risk: tool-name allowlists do not prove approval correctness unless the exact execution capability is bound into the policy.

## Authoritative Sources

- [August 18 topic news collector source](../../../raw/processed/2026-08-18/ai-security-wiki-topic-news-collector-2026-08-18T233017Z.json)
- [August 20 leaf update watch source](../../../raw/processed/2026-08-20/ai-security-wiki-leaf-update-watch-20260821T000216Z.json)
- [NVD CVE-2026-75857](https://nvd.nist.gov/vuln/detail/CVE-2026-75857)
- [NVD CVE-2026-75858](https://nvd.nist.gov/vuln/detail/CVE-2026-75858)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [CodeWhale agent control plane vulnerabilities](codewhale-agent-control-plane-vulnerabilities.md)
- [coding agent command approval boundaries](coding-agent-command-approval-boundaries.md)

## Open Questions

- Which exact CodeWhale CVE maps to `exec_shell_interact` versus `rlm_eval`, and what are the final CVSS/CWE fields?

## Maintenance Notes

- Created on 2026-08-19 after verifier correction split the CodeWhale advisory cluster.
- Updated on 2026-08-20 from the [August 20 leaf update watch source](../../../raw/processed/2026-08-20/ai-security-wiki-leaf-update-watch-20260821T000216Z.json) with additional advisory evidence for automatic approval of execution-capable tools.
