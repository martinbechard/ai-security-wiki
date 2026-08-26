---
type: "Topic"
title: "mcp-ffmpeg-helper Command Injection"
description: "Security analysis for CVE-2026-78430 command injection in mcp-ffmpeg-helper tool handling."
tags: ["agent-and-tool-security", "infrastructure-and-supply-chain"]
---

# mcp-ffmpeg-helper Command Injection

## Current Understanding

The [August 25 late topic news collector source](../../../raw/processed/2026-08-25/ai-security-wiki-topic-news-collector-2026-08-25T233059Z.json) records [CVE-2026-78430](https://nvd.nist.gov/vuln/detail/CVE-2026-78430) for sworddut mcp-ffmpeg-helper. Broad MCP server catalog details belong upstream in the AI wiki; this page owns the local agent-tool command-execution boundary.

[NVD](https://nvd.nist.gov/vuln/detail/CVE-2026-78430) and the [late collector source](../../../raw/processed/2026-08-25/ai-security-wiki-topic-news-collector-2026-08-25T233059Z.json) identify OS command injection in versions 0.1.0, 0.1.1, and 0.2.1 through argument handling in `src/tools/handlers.ts`. The CNA text captured by the collector says exploit material is public and that the project had not responded at collection time, which keeps mitigation confidence lower than the advisory identity.

## Security Impact

- Threat: media-processing tool arguments selected by an agent can cross into local OS command execution.
- Affected boundary: mcp-ffmpeg-helper Tool Handler in versions 0.1.0, 0.1.1, and 0.2.1; NVD records CWE-77 and CWE-78.
- Exploit or incident status: public exploit evidence according to CNA/NVD text; no local compromise case is recorded.
- Mitigation state: no maintainer patch was visible in the collector evidence; isolate or remove the server until a verified fix is available.
- Confidence: high for advisory existence and affected versions; medium for remediation state because maintainer response may change.
- Residual risk: helper MCP servers that wrap media tools often inherit shell quoting and filesystem exposure risks from native binaries.

## Control Implications

- Treat FFmpeg and similar media helpers as command-capable dependencies even when exposed through a friendly MCP tool schema.
- Avoid shell concatenation; pass validated argv arrays to subprocess APIs with explicit option and path allowlists.
- Run media helpers in least-privilege sandboxes without access to source repositories, credentials, or host-level network by default.

## Authoritative Sources

- [August 25 late topic news collector source](../../../raw/processed/2026-08-25/ai-security-wiki-topic-news-collector-2026-08-25T233059Z.json)
- [NVD CVE-2026-78430](https://nvd.nist.gov/vuln/detail/CVE-2026-78430)
- [mcp-ffmpeg-helper repository](https://github.com/sworddut/mcp-ffmpeg-helper/)
- [Public issue reference](https://github.com/sworddut/mcp-ffmpeg-helper/issues/6)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [agent build and dependency execution boundaries](../infrastructure-and-supply-chain/agent-build-and-dependency-execution-boundaries.md)
- [token-optimizer-mcp command injection](token-optimizer-mcp-command-injection.md)

## Open Questions

- Which mcp-ffmpeg-helper release, if any, removes CVE-2026-78430 and how does it validate FFmpeg arguments?

## Maintenance Notes

- Created on 2026-08-26 from the [August 25 late topic collector](../../../raw/processed/2026-08-25/ai-security-wiki-topic-news-collector-2026-08-25T233059Z.json) as a distinct media-helper MCP command-injection leaf.
