---
type: "Topic"
title: "CodeWhale Project Configuration Authority"
description: "Security analysis for CodeWhale vulnerabilities where project configuration or instructions can enable shell execution or file reads."
tags: ["agent-and-tool-security", "infrastructure-and-supply-chain"]
---

# CodeWhale Project Configuration Authority

## Current Understanding

The [August 18 topic news collector source](../../../raw/processed/2026-08-18/ai-security-wiki-topic-news-collector-2026-08-18T233017Z.json) records CodeWhale vulnerabilities where malicious project configuration can enable arbitrary shell execution or read arbitrary files through instructions. Broad coding-agent workflow practice belongs upstream; this page owns the repository-controlled configuration authority boundary.

[CodeWhale agent control plane vulnerabilities](codewhale-agent-control-plane-vulnerabilities.md) routes the broader advisory cluster. This leaf keeps project configuration separate because repository-controlled policy or instruction authority can change independently from tool approval, git argument handling, or environment exposure.

The [August 20 leaf update watch source](../../../raw/processed/2026-08-20/ai-security-wiki-leaf-update-watch-20260821T000216Z.json) adds [CVE Program](https://www.cve.org/CVERecord?id=CVE-2026-75859), [NVD](https://nvd.nist.gov/vuln/detail/CVE-2026-75859), and [VulnCheck](https://www.vulncheck.com/advisories/codewhale-before-arbitrary-file-read-via-instructions) evidence that `.codewhale/config.toml` can drive file reads through `instructions` and shell enablement through `allow_shell` in versions before 0.8.64.

## Security Impact

- Threat: repository-controlled configuration or instructions can escalate from local project content into shell execution or arbitrary file reads.
- Affected boundary: CodeWhale before 0.8.64 or `>=0.8.41` and `<0.8.64`, depending on the exact CVE.
- Exploit or incident status: public CVE/NVD records and VulnCheck advisory coverage; no local exploitation evidence is recorded.
- Mitigation state: update to 0.8.64 or later and treat project config as untrusted until explicitly promoted.
- Confidence: high for configuration-authority mechanics from CVE/NVD/VulnCheck evidence; exact CVSS/CWE fields still need source reconciliation.
- Residual risk: agents that load repository instructions before trust classification can let the repository redefine its own authority.

## Authoritative Sources

- [August 18 topic news collector source](../../../raw/processed/2026-08-18/ai-security-wiki-topic-news-collector-2026-08-18T233017Z.json)
- [August 20 leaf update watch source](../../../raw/processed/2026-08-20/ai-security-wiki-leaf-update-watch-20260821T000216Z.json)
- [NVD CVE-2026-75859](https://nvd.nist.gov/vuln/detail/CVE-2026-75859)
- [NVD CVE-2026-75911](https://nvd.nist.gov/vuln/detail/CVE-2026-75911)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [CodeWhale agent control plane vulnerabilities](codewhale-agent-control-plane-vulnerabilities.md)
- [local agent execution and processing boundaries](local-agent-execution-and-processing-boundaries.md)

## Open Questions

- Which primary CodeWhale advisories define the exact trusted-project transition and fixed configuration behavior?

## Maintenance Notes

- Created on 2026-08-19 after verifier correction split the CodeWhale advisory cluster.
- Updated on 2026-08-20 from the [August 20 leaf update watch source](../../../raw/processed/2026-08-20/ai-security-wiki-leaf-update-watch-20260821T000216Z.json) with additional advisory evidence for repository-controlled configuration and shell enablement.
