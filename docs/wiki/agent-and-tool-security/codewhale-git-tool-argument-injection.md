---
type: "Topic"
title: "CodeWhale Git Tool Argument Injection"
description: "Security analysis for CodeWhale git_blame and git_show argument injection allowing file reads."
tags: ["agent-and-tool-security", "infrastructure-and-supply-chain"]
---

# CodeWhale Git Tool Argument Injection

## Current Understanding

The [August 18 topic news collector source](../../../raw/processed/2026-08-18/ai-security-wiki-topic-news-collector-2026-08-18T233017Z.json) records CodeWhale `git_blame` and `git_show` argument injection allowing file reads. Broad coding-agent workflow practice belongs upstream; this page owns the local git-wrapper argument boundary.

[CodeWhale agent control plane vulnerabilities](codewhale-agent-control-plane-vulnerabilities.md) routes the broader advisory cluster. This leaf keeps git argument injection separate because wrapper argument validation can change independently from approval policy, project configuration, or environment exposure.

The [August 20 leaf update watch source](../../../raw/processed/2026-08-20/ai-security-wiki-leaf-update-watch-20260821T000216Z.json) adds [CVE Program](https://www.cve.org/CVERecord?id=CVE-2026-75912), [NVD](https://nvd.nist.gov/vuln/detail/CVE-2026-75912), and [Rapid7](https://www.rapid7.com/db/vulnerabilities/cve-2026-75912/) evidence that `git_blame` and `git_show` accepted option-injection paths such as `--contents` or output redirection arguments.

## Security Impact

- Threat: git wrapper tools can be steered into reading files outside the intended repository object or path target.
- Affected boundary: CodeWhale before 0.8.64 or `>=0.8.41` and `<0.8.64`, depending on the exact CVE.
- Exploit or incident status: public CVE/NVD records and Rapid7 advisory coverage; no local exploitation evidence is recorded.
- Mitigation state: update to 0.8.64 or later, terminate options, constrain paths, and reject arbitrary git flags from model or repository input.
- Confidence: high for git-wrapper argument-injection mechanics from CVE/NVD/Rapid7 evidence; exact CVSS/CWE fields still need source reconciliation.
- Residual risk: git is often treated as read-only and safe, but option injection can expose local files or repository-adjacent secrets.

## Authoritative Sources

- [August 18 topic news collector source](../../../raw/processed/2026-08-18/ai-security-wiki-topic-news-collector-2026-08-18T233017Z.json)
- [August 20 leaf update watch source](../../../raw/processed/2026-08-20/ai-security-wiki-leaf-update-watch-20260821T000216Z.json)
- [NVD CVE-2026-75912](https://nvd.nist.gov/vuln/detail/CVE-2026-75912)
- [NVD CVE-2026-75913](https://nvd.nist.gov/vuln/detail/CVE-2026-75913)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [CodeWhale agent control plane vulnerabilities](codewhale-agent-control-plane-vulnerabilities.md)
- [agent tool filesystem path containment](../infrastructure-and-supply-chain/agent-tool-filesystem-path-containment.md)

## Open Questions

- Which primary CodeWhale advisories identify the exact argument vectors for `git_blame` and `git_show`?

## Maintenance Notes

- Created on 2026-08-19 after verifier correction split the CodeWhale advisory cluster.
- Updated on 2026-08-20 from the [August 20 leaf update watch source](../../../raw/processed/2026-08-20/ai-security-wiki-leaf-update-watch-20260821T000216Z.json) with additional advisory evidence for `git_blame` and `git_show` option injection.
