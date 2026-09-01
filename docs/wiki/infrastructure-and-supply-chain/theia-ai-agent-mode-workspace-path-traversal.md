---
type: "Topic"
title: "Theia AI Agent Mode Workspace Path Traversal"
description: "Security analysis for CVE-2026-82217 Eclipse Theia AI Agent Mode file writes and deletes outside the workspace."
tags: ["infrastructure-and-supply-chain", "agent-and-tool-security"]
---

# Theia AI Agent Mode Workspace Path Traversal

## Current Understanding

The [August 31 topic collector source](../../../raw/processed/2026-08-31/ai-security-wiki-topic-news-collector-2026-08-31T233224Z.json) records [CVE-2026-82217](https://nvd.nist.gov/vuln/detail/CVE-2026-82217) for Eclipse Theia 1.73.0 through before 1.75.0. Eclipse Theia as a developer tool belongs upstream; this page owns the local coding-agent workspace containment boundary.

NVD, the [Eclipse vulnerability report](https://gitlab.eclipse.org/security/vulnerability-reports/-/work_items/624), and the referenced [Theia fix commit](https://github.com/eclipse-theia/theia/commit/28da106c254) describe AI Agent Mode file-change tools resolving model-supplied relative, absolute, or home-expanded paths without workspace containment. Prompt injection could steer the agent into changing host-executed files such as shell startup files or `authorized_keys`.

## Security Impact

- Threat: model-supplied file paths can write or delete files outside the approved workspace.
- Affected boundary: Eclipse Theia versions 1.73.0 through before 1.75.0, AI Agent Mode file-change tools including `writeFileContent` and `suggestFileContent`.
- Exploit or incident status: public CVE with Eclipse and GitHub fix evidence; no local incident is recorded.
- Mitigation state: upgrade to Theia 1.75.0 or later, canonicalize paths before writes/deletes, and require confirmation for writes outside trusted roots.
- Confidence: high for advisory identity, affected range, and fix reference from NVD and Eclipse-linked evidence.
- Residual risk: prompt-injection defenses are insufficient unless path containment is enforced after model output is parsed.

## Control Implications

- Resolve and compare canonical paths after symlink, home-directory, absolute-path, and relative-path expansion.
- Apply [agent tool filesystem path containment](agent-tool-filesystem-path-containment.md) before file creation, deletion, and diff application.
- Treat workspace-boundary violations as a high-severity coding-agent approval failure, not as ordinary path hygiene.

## Authoritative Sources

- [August 31 topic collector source](../../../raw/processed/2026-08-31/ai-security-wiki-topic-news-collector-2026-08-31T233224Z.json)
- [NVD CVE-2026-82217](https://nvd.nist.gov/vuln/detail/CVE-2026-82217)
- [Eclipse vulnerability report](https://gitlab.eclipse.org/security/vulnerability-reports/-/work_items/624)
- [Theia fix commit](https://github.com/eclipse-theia/theia/commit/28da106c254)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [agent tool filesystem path containment](agent-tool-filesystem-path-containment.md)
- [coding agent command approval boundaries](../agent-and-tool-security/coding-agent-command-approval-boundaries.md)

## Open Questions

- Which Theia 1.75.0 tests cover home expansion, symlinks, and delete operations in AI Agent Mode?

## Maintenance Notes

- Created on 2026-08-31 from the [August 31 topic collector](../../../raw/processed/2026-08-31/ai-security-wiki-topic-news-collector-2026-08-31T233224Z.json) as a workspace-containment leaf rather than broad Theia product coverage.
