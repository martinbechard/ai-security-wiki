---
type: "Topic"
title: "CodeWhale JS Execution Environment Exposure"
description: "Security analysis for CodeWhale js_execution environment-variable exposure."
tags: ["agent-and-tool-security", "identity-and-access", "data-and-privacy"]
---

# CodeWhale JS Execution Environment Exposure

## Current Understanding

The [August 18 topic news collector source](../../../raw/processed/2026-08-18/ai-security-wiki-topic-news-collector-2026-08-18T233017Z.json) records CodeWhale `js_execution` environment-variable exposure. Broad coding-agent workflow practice belongs upstream; this page owns the local inherited-environment and secret-exposure boundary.

[CodeWhale agent control plane vulnerabilities](codewhale-agent-control-plane-vulnerabilities.md) routes the broader advisory cluster. This leaf keeps JavaScript execution environment exposure separate because inherited environment scoping can change independently from approval policy, project configuration, or git argument handling.

The [August 20 leaf update watch source](../../../raw/processed/2026-08-20/ai-security-wiki-leaf-update-watch-20260821T000216Z.json) adds [CVE Program](https://www.cve.org/CVERecord?id=CVE-2026-75915), [NVD](https://nvd.nist.gov/vuln/detail/CVE-2026-75915), and [Rapid7](https://www.rapid7.com/db/vulnerabilities/cve-2026-75915/) evidence that `js_execution` inherited parent-process environment variables before spawning Node.js, exposing API keys, cloud credentials, and authentication tokens to malicious JavaScript.

The [September 13 leaf update watch source](../../../raw/processed/2026-09-13/ai-security-wiki-leaf-update-watch-20260914T000631Z.json) adds NVD analysis metadata for [CVE-2026-75915](https://nvd.nist.gov/vuln/detail/CVE-2026-75915): CVSS v4.0 HIGH 8.7, CVSS v3.1 HIGH 7.5, CWE-200, and references to the GitHub commit, GHSA-h539-c7r8-3xq4, and VulnCheck advisory. The durable control remains explicit environment minimization for code-execution tools.

## Security Impact

- Threat: JavaScript execution tools can expose host environment variables, including credentials, to model-visible or repository-influenced code.
- Affected boundary: CodeWhale before 0.8.64 or `>=0.8.41` and `<0.8.64`, depending on the exact CVE.
- Exploit or incident status: public CVE/NVD records and Rapid7 advisory coverage; no local exploitation evidence is recorded.
- Mitigation state: update to 0.8.64 or later and run execution tools with explicit minimal environment variables.
- Confidence: high for inherited-environment exposure mechanics and severity metadata from CVE/NVD/Rapid7 evidence.
- Residual risk: execution sandboxes need secret inventory evidence because inherited environment variables can be invisible in normal approval prompts.

## Authoritative Sources

- [August 18 topic news collector source](../../../raw/processed/2026-08-18/ai-security-wiki-topic-news-collector-2026-08-18T233017Z.json)
- [August 20 leaf update watch source](../../../raw/processed/2026-08-20/ai-security-wiki-leaf-update-watch-20260821T000216Z.json)
- [September 13 leaf update watch source](../../../raw/processed/2026-09-13/ai-security-wiki-leaf-update-watch-20260914T000631Z.json)
- [NVD CVE-2026-75915](https://nvd.nist.gov/vuln/detail/CVE-2026-75915)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [CodeWhale agent control plane vulnerabilities](codewhale-agent-control-plane-vulnerabilities.md)
- [development agent credential isolation](../identity-and-access/development-agent-credential-isolation.md)

## Open Questions

- Which environment variables does the fixed CodeWhale `js_execution` tool preserve by default?

## Maintenance Notes

- Created on 2026-08-19 after verifier correction split the CodeWhale advisory cluster.
- Updated on 2026-08-20 from the [August 20 leaf update watch source](../../../raw/processed/2026-08-20/ai-security-wiki-leaf-update-watch-20260821T000216Z.json) with additional advisory evidence for `js_execution` environment-variable exposure.
- Updated on 2026-09-13 from the [September 13 leaf watcher](../../../raw/processed/2026-09-13/ai-security-wiki-leaf-update-watch-20260914T000631Z.json) with NVD CVSS/CWE enrichment for CVE-2026-75915.
