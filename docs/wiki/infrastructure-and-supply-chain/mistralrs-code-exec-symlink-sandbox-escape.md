---
type: "Topic"
title: "mistral.rs Code-Exec Symlink Sandbox Escape"
description: "Security analysis for CVE-2026-108759 mistral.rs code-execution sandbox symlink file-boundary bypass."
tags: ["infrastructure-and-supply-chain", "agent-and-tool-security"]
---

# mistral.rs Code-Exec Symlink Sandbox Escape

## Current Understanding

The [October 11 topic collector source](../../../raw/processed/2026-10-11/ai-security-wiki-topic-news-collector-2026-10-11T233138Z.json) records [CVE-2026-108759](https://nvd.nist.gov/vuln/detail/CVE-2026-108759) for mistral.rs 0.9.0 through 0.9.4. Broad mistral.rs runtime context belongs upstream; this page owns the local sandbox file-boundary failure.

The CVE evidence says the `mistralrs-code-exec` sandbox follows symlinks in output names or reused session input paths. Sandboxed shell code can read or overwrite files outside the sandbox with the server process's permissions.

## Security Impact

- Threat: model- or user-supplied code can escape a file sandbox through symlink-following paths.
- Affected boundary: mistral.rs 0.9.0 through 0.9.4, `mistralrs-code-exec`, output names, reused session input paths, symlink resolution, and server-process filesystem authority.
- Exploit or incident status: public NVD and CVE Services records; no confirmed exploitation incident is recorded locally.
- Mitigation state: resolve real paths inside the sandbox root, reject symlink escapes, isolate session inputs, and confirm fixed version before claiming remediation.
- Confidence: high for affected range and symlink behavior from CVE evidence.
- Residual risk: code-execution sandboxes need canonical path enforcement for both outputs and reused inputs.

## Authoritative Sources

- [October 11 topic collector source](../../../raw/processed/2026-10-11/ai-security-wiki-topic-news-collector-2026-10-11T233138Z.json)
- [NVD CVE-2026-108759](https://nvd.nist.gov/vuln/detail/CVE-2026-108759)
- [CVE-2026-108759 record](https://cveawg.mitre.org/api/cve/CVE-2026-108759)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [agent tool filesystem path containment](agent-tool-filesystem-path-containment.md)
- [Phi symlink workspace write bypass](../agent-and-tool-security/phi-symlink-workspace-write-bypass.md)
- [open-multi-agent dangling symlink sandbox escape](../agent-and-tool-security/open-multi-agent-dangling-symlink-sandbox-escape.md)

## Open Questions

- Which mistral.rs release first rejects symlink escapes across both output and reused input paths?

## Maintenance Notes

- Created on 2026-10-12 from the [October 11 topic collector source](../../../raw/processed/2026-10-11/ai-security-wiki-topic-news-collector-2026-10-11T233138Z.json).
