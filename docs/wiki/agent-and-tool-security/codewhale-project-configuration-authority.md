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

## Security Impact

- Threat: repository-controlled configuration or instructions can escalate from local project content into shell execution or arbitrary file reads.
- Affected boundary: CodeWhale before 0.8.64 or `>=0.8.41` and `<0.8.64`, depending on the exact CVE.
- Exploit or incident status: public NVD keyword evidence; full per-CVE records still need direct re-fetch.
- Mitigation state: update to 0.8.64 or later and treat project config as untrusted until explicitly promoted.
- Confidence: medium-high from collector evidence; exact CVSS, CWE, and per-CVE mapping need primary records.
- Residual risk: agents that load repository instructions before trust classification can let the repository redefine its own authority.

## Authoritative Sources

- [August 18 topic news collector source](../../../raw/processed/2026-08-18/ai-security-wiki-topic-news-collector-2026-08-18T233017Z.json)
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
