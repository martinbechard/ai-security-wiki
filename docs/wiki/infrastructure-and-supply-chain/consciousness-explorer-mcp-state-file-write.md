---
type: "Topic"
title: "consciousness-explorer MCP State File Write"
description: "Security analysis for CVE-2026-55609 caller-controlled MCP state and vector file paths."
tags: ["infrastructure-and-supply-chain", "agent-and-tool-security"]
---

# consciousness-explorer MCP State File Write

## Current Understanding

The [August 25 late topic news collector source](../../../raw/processed/2026-08-25/ai-security-wiki-topic-news-collector-2026-08-25T233059Z.json) records [CVE-2026-55609](https://nvd.nist.gov/vuln/detail/CVE-2026-55609) for consciousness-explorer/sublinear-time-solver, with sublinear-time-solver versions before the [1.6.0 release](https://github.com/ruvnet/sublinear-time-solver/releases/tag/v1.6.0) affected. The [August 26 leaf update watch source](../../../raw/processed/2026-08-26/ai-security-wiki-leaf-update-watch-20260827T000538Z.json) expands the mitigation boundary to consciousness-explorer 1.1.2 and clarifies that both state and vector file sinks are in scope. Broad package context belongs upstream; this page owns the local MCP state import/export filesystem boundary.

[NVD](https://nvd.nist.gov/vuln/detail/CVE-2026-55609) and linked repository evidence say MCP `export_state` and `import_state` operations plus `saveVectorToFile` and `loadVectorFromFile` accepted caller-supplied paths without traversal controls. The [1.6.0 release](https://github.com/ruvnet/sublinear-time-solver/releases/tag/v1.6.0) constrains files to dedicated directories and basename-only inputs, which is the expected containment shape for agent-accessible persistence tools.

## Security Impact

- Threat: an MCP caller can read, write, or overwrite files outside intended state and vector directories, creating disclosure, persistence, or host-compromise primitives.
- Affected boundary: sublinear-time-solver before 1.6.0, consciousness-explorer before 1.1.2, and MCP state/vector file operations; NVD records CVE-2026-55609, CVSS 3.1 HIGH 7.1, and CWE-73.
- Exploit or incident status: public vulnerability advisory; no local in-the-wild exploitation evidence is recorded.
- Mitigation state: upgrade sublinear-time-solver to 1.6.0 or later and consciousness-explorer to 1.1.2 or later, where patched path handling constrains files to dedicated directories and basename-only inputs.
- Confidence: high for advisory identity, affected range, fixed version, and mitigation shape from NVD/GitHub evidence.
- Residual risk: state export/import features can cross from benign persistence into arbitrary file write when tool schemas accept raw paths.

## Control Implications

- Keep agent-accessible state paths inside dedicated directories with canonical path checks.
- Accept logical state names instead of caller-provided filesystem paths where possible.
- Audit state import/export operations because they can preserve attacker-controlled instructions or data.

## Authoritative Sources

- [August 25 late topic news collector source](../../../raw/processed/2026-08-25/ai-security-wiki-topic-news-collector-2026-08-25T233059Z.json)
- [August 26 leaf update watch source](../../../raw/processed/2026-08-26/ai-security-wiki-leaf-update-watch-20260827T000538Z.json)
- [NVD CVE-2026-55609](https://nvd.nist.gov/vuln/detail/CVE-2026-55609)
- [sublinear-time-solver 1.6.0 release](https://github.com/ruvnet/sublinear-time-solver/releases/tag/v1.6.0)
- [sublinear-time-solver path-containment pull request](https://github.com/ruvnet/sublinear-time-solver/pull/20)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [agent tool filesystem path containment](agent-tool-filesystem-path-containment.md)
- [browse-mcp file path boundary](../agent-and-tool-security/browse-mcp-file-path-boundary.md)

## Open Questions

- No open wiki questions are recorded for this topic.

## Maintenance Notes

- Created on 2026-08-26 from the [August 25 late topic collector](../../../raw/processed/2026-08-25/ai-security-wiki-topic-news-collector-2026-08-25T233059Z.json) as a state-file path-containment leaf.
- Updated on 2026-08-27 from the [August 26 leaf watcher](../../../raw/processed/2026-08-26/ai-security-wiki-leaf-update-watch-20260827T000538Z.json) with consciousness-explorer 1.1.2 and vector file sink details.
