---
type: "Topic"
title: "ATXP Gemini CLI MCP Command Injection"
description: "Security analysis for CVE-2026-117560 delegated-message command injection."
tags: ["agent-and-tool-security"]
---

# ATXP Gemini CLI MCP Command Injection

## Current Understanding

The [October 28 collector source](../../../raw/processed/2026-10-28/ai-security-wiki-topic-news-collector-2026-10-28T233111Z.json) records [CVE-2026-117560](https://cveawg.mitre.org/api/cve/CVE-2026-117560): ATXP [Gemini CLI](../../../upstream-ai-wiki/developer-tools/gemini-cli.md) through 1.0.0 accepts unsanitized email or SMS parameters in `runAtxp()`. Broad Gemini context belongs upstream; this page owns the message-to-command boundary.

## Security Impact

- Threat: prompt-planted message metadata becomes shell syntax.
- Affected boundary: ATXP Gemini CLI extension through 1.0.0; `message_id`, `subject`, and `query`.
- Exploit or incident status: public CVE; no local incident is recorded.
- Mitigation state: no fixed version is identified; remove or sandbox the extension.
- Confidence: high; residual risk persists in delegated messaging tools with shell execution.

## Control Implications

- Keep untrusted message fields out of shell strings and require argv-based execution.
- Require explicit user approval for consequential messaging-tool actions.

## Authoritative Sources

- [October 28 collector source](../../../raw/processed/2026-10-28/ai-security-wiki-topic-news-collector-2026-10-28T233111Z.json)
- [CVE-2026-117560](https://cveawg.mitre.org/api/cve/CVE-2026-117560)

## Related Code

- Not yet identified.
## Related Tests

- Not yet identified.
## Related Backlog Items

- Not yet identified.
## Related Wiki Pages

- [agent and tool security](index.md)
## Open Questions

- Has a fixed ATXP release been published?
## Maintenance Notes

- Created on 2026-10-28 from the October 28 collector.
