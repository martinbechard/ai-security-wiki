---
type: "Topic"
title: "CodeWhale instructions file-read authority"
description: "Security analysis for CVE-2026-75859 malicious CodeWhale project instructions reading files outside the workspace."
tags: ["agent-and-tool-security", "data-and-privacy"]
---

# CodeWhale instructions file-read authority

## Current Understanding

The [September 13 leaf update watch source](../../../raw/processed/2026-09-13/ai-security-wiki-leaf-update-watch-20260914T000631Z.json) adds NVD analysis metadata for [CVE-2026-75859](https://nvd.nist.gov/vuln/detail/CVE-2026-75859). Broad CodeWhale coding-agent workflow practice belongs upstream; this page owns the local file-read and prompt-injection-through-project-instructions boundary.

NVD describes malicious `.codewhale/config.toml` instructions reading outside-workspace files into the AI system prompt. NVD assigns CVSS v4.0 HIGH 8.7, CVSS v3.1 HIGH 7.5, and CWE-22.

## Security Impact

- Threat: repository-controlled instructions can exfiltrate host files by pulling outside-workspace content into model-visible prompts.
- Affected boundary: CodeWhale before 0.8.64 or the affected range recorded by NVD for CVE-2026-75859.
- Exploit or incident status: public NVD/VulnCheck/GitHub advisory evidence; no local exploitation incident is recorded.
- Mitigation state: update to 0.8.64 or later, constrain instruction file reads to the trusted workspace, and classify repository instructions as untrusted until the project is trusted.
- Confidence: high for file-read mechanics, CWE-22 classification, and severity metadata from NVD; medium for exact trust-transition behavior until primary CodeWhale advisory text is reconciled.
- Residual risk: prompt-visible file reads can leak credentials or sensitive local context even when no shell command executes.

## Authoritative Sources

- [September 13 leaf update watch source](../../../raw/processed/2026-09-13/ai-security-wiki-leaf-update-watch-20260914T000631Z.json)
- [NVD CVE-2026-75859](https://nvd.nist.gov/vuln/detail/CVE-2026-75859)
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
- [CodeWhale allow_shell validation bypass](codewhale-allow-shell-validation-bypass.md)
- [AI development context exclusion controls](../data-and-privacy/ai-development-context-exclusion-controls.md)

## Open Questions

- Which CodeWhale advisory or commit defines the exact path-containment fix for project instructions?

## Maintenance Notes

- Created on 2026-09-13 from the [September 13 leaf watcher](../../../raw/processed/2026-09-13/ai-security-wiki-leaf-update-watch-20260914T000631Z.json) after verifier correction split file-read authority from shell enablement.
