---
type: "Topic"
title: "Roo Code Privileged GitHub Actions Workflow RCE"
description: "Security analysis for CVE-2025-58371, where Roo Code pull-request metadata reached a privileged GitHub Actions workflow."
tags: ["infrastructure-and-supply-chain", "agent-and-tool-security"]
---

# Roo Code Privileged GitHub Actions Workflow RCE

## Current Understanding

The [September 30 topic collector source](../../../raw/processed/2026-09-30/ai-security-wiki-topic-news-collector-2026-09-30T233235Z.json) records [CVE-2025-58371](https://nvd.nist.gov/vuln/detail/CVE-2025-58371) and [GHSA-xr6r-vj48-29f6](https://github.com/RooCodeInc/Roo-Code/security/advisories/GHSA-xr6r-vj48-29f6) for Roo Code versions 3.26.6 and below. Broad Roo Code product context belongs upstream; this page owns the local coding-agent release automation and repository supply-chain boundary.

The advisory evidence says unsanitized pull-request metadata entered a privileged GitHub Actions workflow, enabling remote command execution on the runner. The affected workflow could modify the repository, access secrets, and create malicious releases or packages. Version 3.26.7 is recorded as the fix.

## Security Impact

- Threat: untrusted pull-request metadata can cross into privileged release automation for an AI coding-agent project.
- Affected boundary: Roo Code 3.26.6 and below, GitHub Actions, privileged workflow execution, repository write authority, secrets, releases, and packages.
- Exploit or incident status: public NVD and GitHub advisory records; no separate local exploitation incident is recorded.
- Mitigation state: upgrade Roo Code to 3.26.7 or later and treat pull-request metadata as untrusted before it reaches privileged CI or release jobs.
- Confidence: high for affected versions and fix because NVD, GitHub advisory, and patch references align; the in-window signal is an NVD update rather than first disclosure.
- Residual risk: coding-agent ecosystems often combine generated code, automation credentials, and release pipelines, so CI input boundaries need release-gate review even when the vulnerable component is not deployed as a service.

## Authoritative Sources

- [September 30 topic collector source](../../../raw/processed/2026-09-30/ai-security-wiki-topic-news-collector-2026-09-30T233235Z.json)
- [NVD CVE-2025-58371](https://nvd.nist.gov/vuln/detail/CVE-2025-58371)
- [GitHub advisory GHSA-xr6r-vj48-29f6](https://github.com/RooCodeInc/Roo-Code/security/advisories/GHSA-xr6r-vj48-29f6)
- [Roo Code patch commit](https://github.com/RooCodeInc/Roo-Code/commit/a0384f35d5ae3b7f66506cc62dda25d9bb673f49)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [agent and tool security](../agent-and-tool-security/index.md)
- Upstream AI wiki owns broad Roo Code product context.
- Upstream AI development wiki owns general coding-agent CI and release-governance practice.

## Open Questions

- No open wiki questions are recorded for this topic.

## Maintenance Notes

- Created on 2026-10-01 from the [September 30 topic collector source](../../../raw/processed/2026-09-30/ai-security-wiki-topic-news-collector-2026-09-30T233235Z.json) after routing broad Roo Code and CI governance context upstream.
