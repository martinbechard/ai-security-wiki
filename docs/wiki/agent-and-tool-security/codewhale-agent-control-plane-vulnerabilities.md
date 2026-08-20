---
type: "Topic"
title: "CodeWhale Agent Control Plane Vulnerabilities"
description: "Security analysis for CodeWhale CVEs affecting approvals, project configuration, git tool arguments, and environment exposure."
tags: ["agent-and-tool-security", "infrastructure-and-supply-chain", "identity-and-access"]
---

# CodeWhale Agent Control Plane Vulnerabilities

## Current Understanding

The [August 18 topic news collector source](../../../raw/processed/2026-08-18/ai-security-wiki-topic-news-collector-2026-08-18T233017Z.json) records a CodeWhale vulnerability cluster affecting versions before 0.8.64 or the range `>=0.8.41` and `<0.8.64`. Broad coding-agent workflow practice belongs upstream in the AI development wiki; this page owns the local security boundary around agent approval, repository-controlled configuration, git tool arguments, and inherited runtime environments.

The cluster is split into focused leaves because the boundaries can change independently:

- [CodeWhale auto-approved execution tools](codewhale-auto-approved-execution-tools.md) owns the `exec_shell_interact` and `rlm_eval` approval bypass issues.
- [CodeWhale project configuration authority](codewhale-project-configuration-authority.md) owns malicious project configuration and instruction-driven shell or file-read authority.
- [CodeWhale git tool argument injection](codewhale-git-tool-argument-injection.md) owns `git_blame` and `git_show` argument injection allowing file reads.
- [CodeWhale JS execution environment exposure](codewhale-js-execution-environment-exposure.md) owns `js_execution` environment-variable exposure.

The collector notes [NVD](https://nvd.nist.gov/) keyword results supplied concrete descriptions but per-CVE detail fetches hit HTTP 429, so exact CVSS, CWE, and references still need re-fetching.

## Security Impact

- Threat: a coding-agent control plane can lose separation between approval policy, repository content, local file reads, git arguments, and environment secrets; the linked leaves own issue-specific details.
- Affected boundary: CodeWhale before 0.8.64, with several tool issues identified for `>=0.8.41` and `<0.8.64`.
- Exploit or incident status: public vulnerability database cluster; no local exploitation evidence is recorded.
- Mitigation state: update to 0.8.64 or later, disable auto-approval for code execution, sanitize git tool arguments, and run code tools with minimal inherited environment.
- Confidence: medium-high because the collector captured detailed NVD keyword descriptions but not full per-CVE records.
- Residual risk: repository-controlled instructions and config should not be able to change approval policy or expose host environment variables without a separate trust decision.

## Control Implications

- Approval policy must bind to exact tool capability and caller context, not only tool name.
- Project configuration loaded from a repository should run in an untrusted mode until explicitly promoted.
- Git wrapper tools need option termination and path allowlists.
- JavaScript or shell execution tools should receive scoped environment variables, not the full host environment.

## Authoritative Sources

- [August 18 topic news collector source](../../../raw/processed/2026-08-18/ai-security-wiki-topic-news-collector-2026-08-18T233017Z.json)
- [NVD CVE-2026-75857](https://nvd.nist.gov/vuln/detail/CVE-2026-75857)
- [NVD CVE-2026-75858](https://nvd.nist.gov/vuln/detail/CVE-2026-75858)
- [NVD CVE-2026-75859](https://nvd.nist.gov/vuln/detail/CVE-2026-75859)
- [NVD CVE-2026-75911](https://nvd.nist.gov/vuln/detail/CVE-2026-75911)
- [NVD CVE-2026-75912](https://nvd.nist.gov/vuln/detail/CVE-2026-75912)
- [NVD CVE-2026-75913](https://nvd.nist.gov/vuln/detail/CVE-2026-75913)
- [NVD CVE-2026-75915](https://nvd.nist.gov/vuln/detail/CVE-2026-75915)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [coding agent command approval boundaries](coding-agent-command-approval-boundaries.md)
- [local agent execution and processing boundaries](local-agent-execution-and-processing-boundaries.md)
- [development agent credential isolation](../identity-and-access/development-agent-credential-isolation.md)
- [CodeWhale auto-approved execution tools](codewhale-auto-approved-execution-tools.md)
- [CodeWhale project configuration authority](codewhale-project-configuration-authority.md)
- [CodeWhale git tool argument injection](codewhale-git-tool-argument-injection.md)
- [CodeWhale JS execution environment exposure](codewhale-js-execution-environment-exposure.md)

## Open Questions

- Which primary CodeWhale advisories confirm the exact CVSS, CWE, and fixed behavior for each CVE in the cluster?

## Maintenance Notes

- Created on 2026-08-19 from the [August 18 topic collector](../../../raw/processed/2026-08-18/ai-security-wiki-topic-news-collector-2026-08-18T233017Z.json) as a coding-agent control-plane advisory router.
- Split on 2026-08-19 after verifier correction into approval, project-configuration, git-argument, and environment-exposure leaves.
