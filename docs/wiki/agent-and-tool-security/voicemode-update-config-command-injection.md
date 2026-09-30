---
type: "Topic"
title: "VoiceMode update_config Command Injection"
description: "Security analysis for CVE-2026-79535, where VoiceMode update_config values reach shell-interpreted environment configuration."
tags: ["agent-and-tool-security", "infrastructure-and-supply-chain"]
---

# VoiceMode update_config Command Injection

## Current Understanding

The [September 29 topic collector source](../../../raw/processed/2026-09-29/ai-security-wiki-topic-news-collector-2026-09-29T233133Z.json) records [CVE-2026-79535](https://nvd.nist.gov/vuln/detail/CVE-2026-79535) for VoiceMode through 8.10.1. General VoiceMode and voice-agent context belongs upstream; this page owns the MCP configuration command-injection boundary.

The source says caller-supplied MCP `update_config` values are written to `~/.voicemode/voicemode.env` without shell-safe escaping, creating OS command-injection risk. References include the [v8.10.2 release](https://github.com/mbailey/voicemode/releases/tag/v8.10.2), [fixing commit](https://github.com/mbailey/voicemode/commit/c1cef85333fca497c46a11950911d10123f61e48), and [Traceforce advisory](https://www.traceforce.ai/security-advisories/cve-2026-79535).

## Security Impact

- Threat: delegated configuration updates can become shell command execution when environment-file values are later sourced or interpreted.
- Affected boundary: VoiceMode through 8.10.1; MCP `update_config`; `~/.voicemode/voicemode.env`; local OS command execution.
- Exploit or incident status: public NVD entry, Traceforce advisory, release reference, and patch commit; no active exploitation was identified in the collector source.
- Mitigation state: update to VoiceMode v8.10.2 or later and audit existing `~/.voicemode/voicemode.env` values written by untrusted MCP callers.
- Confidence: high for affected range, fixed release, and command-injection boundary from NVD plus release and commit evidence.
- Residual risk: configuration-writing tools need typed serialization or strict value escaping before any shell-readable file is generated.

## Authoritative Sources

- [September 29 topic collector source](../../../raw/processed/2026-09-29/ai-security-wiki-topic-news-collector-2026-09-29T233133Z.json)
- [CVE-2026-79535 NVD entry](https://nvd.nist.gov/vuln/detail/CVE-2026-79535)
- [VoiceMode v8.10.2 release](https://github.com/mbailey/voicemode/releases/tag/v8.10.2)
- [VoiceMode fixing commit](https://github.com/mbailey/voicemode/commit/c1cef85333fca497c46a11950911d10123f61e48)
- [Traceforce advisory](https://www.traceforce.ai/security-advisories/cve-2026-79535)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [Kimi Code MCP Configuration Loader command injection](kimi-code-mcp-configuration-loader-command-injection.md)
- [token-optimizer-mcp command injection](token-optimizer-mcp-command-injection.md)
- [infrastructure and supply chain](../infrastructure-and-supply-chain/index.md)
- Upstream AI wiki owns broad VoiceMode product or voice-agent context.

## Open Questions

- Does VoiceMode v8.10.2 sanitize existing unsafe values in `~/.voicemode/voicemode.env`, or only prevent future writes?

## Maintenance Notes

- Created on 2026-09-30 from the [September 29 topic collector source](../../../raw/processed/2026-09-29/ai-security-wiki-topic-news-collector-2026-09-29T233133Z.json) after routing general voice-agent context upstream.
