---
type: "Topic"
title: "Omnigent Agent Bundle CWD Workspace Bypass"
description: "Security analysis for CVE-2026-62677 Omnigent os_env.cwd traversal that moves agent tool roots outside the workspace."
tags: ["agent-and-tool-security", "infrastructure-and-supply-chain"]
---

# Omnigent Agent Bundle CWD Workspace Bypass

## Current Understanding

The [August 22 topic news collector source](../../../raw/processed/2026-08-22/ai-security-wiki-topic-news-collector-2026-08-22T233049Z.json) records CVE-2026-62677 for Omnigent before 0.3.0. This page owns the local workspace-root containment boundary where agent bundles can influence current working directory for file and shell tools.

The [NVD record](https://nvd.nist.gov/vuln/detail/CVE-2026-62677) describes authenticated session-scoped agent bundles with absolute or traversal-containing `os_env.cwd` values. When `OMNIGENT_RUNNER_WORKSPACE` was unset, `sys_os_read`, write, edit, and shell tools could treat attacker-selected paths as trusted roots. The [0.3.0 release](https://github.com/omnigent-ai/omnigent/releases/tag/v0.3.0) is the patch boundary captured by the source.

## Security Impact

- Threat: a bundle-controlled working directory can move file and shell tools outside the intended workspace root.
- Affected boundary: Omnigent before 0.3.0 `os_env.cwd`, `OMNIGENT_RUNNER_WORKSPACE`, and file/shell tool root selection.
- Exploit or incident status: public NVD evidence; no local exploitation evidence is recorded.
- Mitigation state: upgrade to 0.3.0 or later, canonicalize tool roots, reject absolute/traversal CWD values, and require an explicit immutable runner workspace.
- Confidence: high for advisory identifier and fix version from NVD and release evidence.
- Residual risk: session-scoped agent configuration remains a filesystem authority surface whenever it can affect tool roots.

## Authoritative Sources

- [August 22 topic news collector source](../../../raw/processed/2026-08-22/ai-security-wiki-topic-news-collector-2026-08-22T233049Z.json)
- [August 23 leaf update watch source](../../../raw/processed/2026-08-23/ai-security-wiki-leaf-update-watch-20260824T000259Z.json)
- [NVD CVE-2026-62677](https://nvd.nist.gov/vuln/detail/CVE-2026-62677)
- [Omnigent 0.3.0 release](https://github.com/omnigent-ai/omnigent/releases/tag/v0.3.0)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [agent tool filesystem path containment](../infrastructure-and-supply-chain/agent-tool-filesystem-path-containment.md)
- [AI development workstation containment](../infrastructure-and-supply-chain/ai-development-workstation-containment.md)

## Open Questions

- Does Omnigent 0.3.0 require `OMNIGENT_RUNNER_WORKSPACE`, or does it independently canonicalize every bundle-supplied working directory?

## Maintenance Notes

- Created on 2026-08-22 from the [August 22 topic news collector source](../../../raw/processed/2026-08-22/ai-security-wiki-topic-news-collector-2026-08-22T233049Z.json) as the workspace-root member of the Omnigent 0.3.0 advisory set.
