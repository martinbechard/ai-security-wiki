---
type: "Topic"
title: "MaxKB Function Library Sandbox Escape"
description: "Security analysis for CVE-2026-79919 dlsym and dlopen sandbox bypass in MaxKB function-library code."
tags: ["infrastructure-and-supply-chain", "agent-and-tool-security"]
---

# MaxKB Function Library Sandbox Escape

## Current Understanding

The [September 21 topic collector source](../../../raw/processed/2026-09-21/ai-security-wiki-topic-news-collector-2026-09-21T233156Z.json) records [CVE-2026-79919](https://cveawg.mitre.org/api/cve/CVE-2026-79919) for MaxKB before 2.10.6-lts. Broad MaxKB product context belongs upstream; this page owns function-library sandbox escape risk.

Function-library code running under the LD_PRELOAD sandbox can invoke `ctypes.CDLL` from an `importlib.abc.MetaPathFinder` callback so the `dlopen` call-stack heuristic sees a Python import frame. The code can then use unhooked `dlsym` with `RTLD_NEXT` to resolve glibc's real `syscall` and bypass the sandbox syscall blacklist. An authenticated workspace member can read or write files, execute processes, or access networks as the sandbox user. Version 2.10.6-lts fixes the issue.

## Security Impact

- Threat: authenticated function-library code can bypass call-stack and symbol-resolution assumptions in the sandbox.
- Affected boundary: MaxKB before 2.10.6-lts; function-library LD_PRELOAD sandbox, `dlopen`, `dlsym`, and syscall filtering.
- Exploit or incident status: public GitHub advisory with commit and release references; no local exploitation evidence is recorded.
- Mitigation state: upgrade to 2.10.6-lts or later and isolate function-library execution with OS/container controls in addition to language/runtime hooks.
- Confidence: high because the CVE record includes mechanism, patch, and fixed release.
- Residual risk: function libraries are code-execution surfaces; stack heuristics and LD_PRELOAD hooks can miss dynamic loading and symbol-resolution bypasses.

## Authoritative Sources

- [September 21 topic collector source](../../../raw/processed/2026-09-21/ai-security-wiki-topic-news-collector-2026-09-21T233156Z.json)
- [CVE-2026-79919 JSON](https://cveawg.mitre.org/api/cve/CVE-2026-79919)
- [GitHub advisory GHSA-6h35-c779-4v37](https://github.com/1Panel-dev/MaxKB/security/advisories/GHSA-6h35-c779-4v37)
- [MaxKB 2.10.6-lts release](https://github.com/1Panel-dev/MaxKB/releases/tag/v2.10.6-lts)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [MaxKB prompt-injectable shell execution](../agent-and-tool-security/maxkb-prompt-injectable-shell-execution.md)
- [MaxKB fexecve sandbox escape](maxkb-fexecve-sandbox-escape.md)

## Open Questions

- No open wiki questions are recorded for this topic.

## Maintenance Notes

- Created on 2026-09-21 from the [September 21 topic collector source](../../../raw/processed/2026-09-21/ai-security-wiki-topic-news-collector-2026-09-21T233156Z.json).
