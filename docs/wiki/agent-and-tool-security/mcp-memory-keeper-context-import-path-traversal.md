---
type: "Topic"
title: "MCP Memory Keeper context import path traversal"
description: "Security analysis for CVE-2026-54561 MCP Memory Keeper context_import reading server-readable files through caller-controlled paths."
tags: ["agent-and-tool-security", "data-and-privacy"]
---

# MCP Memory Keeper context import path traversal

## Current Understanding

The [September 16 topic collector source](../../../raw/processed/2026-09-16/ai-security-wiki-topic-news-collector-2026-09-16T233115Z.json) records [CVE-2026-54561](https://cveawg.mitre.org/api/cve/CVE-2026-54561) for `mkreyman/mcp-memory-keeper` before 0.13.0. Broad MCP memory-tool catalog context belongs upstream; this page owns the local file-read and persistent-agent-memory boundary.

The CVE says `context_import` passed caller-controlled `filePath` directly to `fs.readFileSync` without restricting reads to an export directory. An MCP client or induced LLM agent can therefore use traversal or absolute paths to import files readable by the server process into memory context, where they can be retained or forwarded through downstream model and tool flows.

## Security Impact

- Threat: malicious or prompt-injected MCP calls can import local files into an agent memory surface.
- Affected boundary: MCP Memory Keeper before 0.13.0, `context_import`, server-readable filesystem paths, and persistent context storage.
- Exploit or incident status: public CVE and NVD records; no local exploitation incident is recorded.
- Mitigation state: upgrade to 0.13.0 or later, restrict imports to an explicit export directory, reject absolute and traversal paths, and avoid storing imported context without provenance.
- Confidence: high for CVE/NVD publication, affected version, and vulnerable file-read primitive.
- Residual risk: memory tools can turn one file-read failure into durable context contamination that later prompts, summaries, and tools may treat as ordinary project memory.

## Control Implications

- Treat memory import as a data-ingress and file-read authority, not only a convenience operation.
- Canonicalize import paths after symlink resolution and enforce directory containment before reading files.
- Mark imported memory with source provenance and review whether sensitive local files can enter long-lived agent context.

## Authoritative Sources

- [September 16 topic collector source](../../../raw/processed/2026-09-16/ai-security-wiki-topic-news-collector-2026-09-16T233115Z.json)
- [CVE-2026-54561 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-54561)
- [NVD CVE-2026-54561 record](https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2026-54561)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [MCP data movement exposure controls](../data-and-privacy/mcp-data-movement-exposure-controls.md)
- [knowns MCP doc and memory path traversal](knowns-mcp-doc-memory-path-traversal.md)

## Open Questions

- Does MCP Memory Keeper 0.13.0 constrain imports after symlink resolution and across absolute path variants?

## Maintenance Notes

- Created on 2026-09-17 from the [September 16 topic collector](../../../raw/processed/2026-09-16/ai-security-wiki-topic-news-collector-2026-09-16T233115Z.json) as a memory-tool file-read boundary leaf.
