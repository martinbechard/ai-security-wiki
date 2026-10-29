---
type: "Topic"
title: "mcp-ffmpeg Command Injection"
description: "Security analysis for CVE-2026-117568 media-tool shell injection."
tags: ["agent-and-tool-security"]
---

# mcp-ffmpeg Command Injection

## Current Understanding

The [October 28 collector source](../../../raw/processed/2026-10-28/ai-security-wiki-topic-news-collector-2026-10-28T233111Z.json) records [CVE-2026-117568](https://cveawg.mitre.org/api/cve/CVE-2026-117568): mcp-ffmpeg through 1.0.5 builds `child_process.exec` strings from media paths. This is distinct from [mcp-ffmpeg-helper](mcp-ffmpeg-helper-command-injection.md); this page owns the mcp-ffmpeg file-to-command boundary.

## Security Impact

- Threat: crafted video names or output paths execute shell commands.
- Affected boundary: mcp-ffmpeg through 1.0.5; resize-video, extract-audio, and get-video-info inputs.
- Exploit or incident status: public CVE; no local incident is recorded.
- Mitigation state: no fixed version is identified; sandbox execution and avoid shell-string construction.
- Confidence: high; residual risk remains where agent-provided filenames reach native tools.

## Control Implications

- Use validated argv calls and canonicalized paths.
- Run media tooling with least privilege and no repository or credential access.

## Authoritative Sources

- [October 28 collector source](../../../raw/processed/2026-10-28/ai-security-wiki-topic-news-collector-2026-10-28T233111Z.json)
- [CVE-2026-117568](https://cveawg.mitre.org/api/cve/CVE-2026-117568)

## Related Code

- Not yet identified.
## Related Tests

- Not yet identified.
## Related Backlog Items

- Not yet identified.
## Related Wiki Pages

- [agent and tool security](index.md)
- [mcp-ffmpeg-helper command injection](mcp-ffmpeg-helper-command-injection.md)
## Open Questions

- Has mcp-ffmpeg published a patched release?
## Maintenance Notes

- Created on 2026-10-28 from the October 28 collector.
