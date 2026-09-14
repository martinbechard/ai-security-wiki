---
type: "Topic"
title: "CodeWhale allow_shell validation bypass"
description: "Security analysis for CVE-2026-75911 CodeWhale project configuration enabling shell tools."
tags: ["agent-and-tool-security", "infrastructure-and-supply-chain"]
---

# CodeWhale allow_shell validation bypass

## Current Understanding

The [September 13 leaf update watch source](../../../raw/processed/2026-09-13/ai-security-wiki-leaf-update-watch-20260914T000631Z.json) adds NVD analysis metadata for [CVE-2026-75911](https://nvd.nist.gov/vuln/detail/CVE-2026-75911). Broad CodeWhale coding-agent workflow practice belongs upstream; this page owns the local project-configuration-to-shell-tool boundary.

NVD describes project config `allow_shell` validation failure enabling `exec_shell` and `task_shell` access. NVD assigns CVSS v4.0 HIGH 8.5, CVSS v3.1 HIGH 7.8, and CWE-94.

## Security Impact

- Threat: repository-controlled configuration can enable shell-capable tools without a trustworthy project-approval transition.
- Affected boundary: CodeWhale before 0.8.64 or the affected range recorded by NVD for CVE-2026-75911.
- Exploit or incident status: public NVD/VulnCheck/GitHub advisory evidence; no local exploitation incident is recorded.
- Mitigation state: update to 0.8.64 or later, reject untrusted project config that enables shell access, and require explicit user approval before project policy can grant execution authority.
- Confidence: high for shell-enablement mechanics, CWE-94 classification, and severity metadata from NVD; medium for exact fixed validation behavior until primary CodeWhale advisory text is reconciled.
- Residual risk: config-driven tool enablement can be invisible to command approval when the agent treats repository policy as already trusted.

## Authoritative Sources

- [September 13 leaf update watch source](../../../raw/processed/2026-09-13/ai-security-wiki-leaf-update-watch-20260914T000631Z.json)
- [NVD CVE-2026-75911](https://nvd.nist.gov/vuln/detail/CVE-2026-75911)
- [CodeWhale project configuration authority](codewhale-project-configuration-authority.md)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [CodeWhale project configuration authority](codewhale-project-configuration-authority.md)
- [CodeWhale instructions file-read authority](codewhale-instructions-file-read-authority.md)
- [local agent execution and processing boundaries](local-agent-execution-and-processing-boundaries.md)

## Open Questions

- Which CodeWhale advisory or commit defines the exact fixed `allow_shell` validation behavior?

## Maintenance Notes

- Created on 2026-09-13 from the [September 13 leaf watcher](../../../raw/processed/2026-09-13/ai-security-wiki-leaf-update-watch-20260914T000631Z.json) after verifier correction split shell enablement from instruction-driven file reads.
