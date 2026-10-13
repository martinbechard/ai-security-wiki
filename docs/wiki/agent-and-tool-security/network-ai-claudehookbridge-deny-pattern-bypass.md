---
type: "Topic"
title: "Network-AI ClaudeHookBridge Deny-Pattern Bypass"
description: "Security analysis for CVE-2026-109331, where ClaudeHookBridge deny-pattern checks can miss prompt-hidden payload fields."
tags: ["agent-and-tool-security", "model-and-prompt-security"]
---

# Network-AI ClaudeHookBridge Deny-Pattern Bypass

## Current Understanding

The [October 12 topic collector source](../../../raw/processed/2026-10-12/ai-security-wiki-topic-news-collector-2026-10-12T233447Z.json) records [CVE-2026-109331](https://nvd.nist.gov/vuln/detail/CVE-2026-109331) for Network-AI 5.14.0 before 5.15.2. Broad Network-AI product context belongs upstream; this page owns the local tool-hook policy boundary where model-controllable arguments must all be inspected before a file write, command, or MCP script runs.

The CVE evidence says ClaudeHookBridge `PreToolUse` deny patterns are checked only against the first present candidate field. A prompt-injected agent can pair a benign first field, such as a file path or command, with a dangerous payload in another field such as Write content or an MCP script parameter.

## Security Impact

- Threat: prompt-hidden payloads can evade deny rules and cross into command or file-write authority.
- Affected boundary: Network-AI npm package 5.14.0 before 5.15.2; ClaudeHookBridge `PreToolUse` deny-pattern enforcement.
- Exploit or incident status: public CVE, GitHub advisory, VulnCheck, and AI Sec Watch evidence; no confirmed exploitation incident is recorded locally.
- Mitigation state: update to 5.15.2 or later and validate every model-controllable tool argument field before dispatch.
- Confidence: high for affected range and bypass shape from NVD-backed source evidence.
- Residual risk: deny-pattern controls remain brittle when they inspect serialized prompts or a selected field instead of the normalized execution request.

## Control Implications

- Treat tool-hook validation as an all-fields policy decision over the final action request.
- Avoid allow or deny decisions that depend on argument ordering or first-present-field shortcuts.
- Regression-test prompt-injected payloads in secondary fields, nested MCP parameters, and file-write content.

## Authoritative Sources

- [October 12 topic collector source](../../../raw/processed/2026-10-12/ai-security-wiki-topic-news-collector-2026-10-12T233447Z.json)
- [NVD CVE-2026-109331](https://nvd.nist.gov/vuln/detail/CVE-2026-109331)
- [GitHub advisory GHSA-9p2w-prp8-5722](https://github.com/Jovancoding/Network-AI/security/advisories/GHSA-9p2w-prp8-5722)
- [VulnCheck Network-AI advisory](https://www.vulncheck.com/advisories/network-ai-5.14.0-before-5.15.2-deny-pattern-bypass-via-claudehookbridge-extractfulltarget)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [Network-AI ApprovalInbox authorization bypass](network-ai-approval-inbox-authorization-bypass.md)
- [approval metadata access control](approval-metadata-access-control.md)

## Open Questions

- Which Network-AI regression test proves deny patterns inspect every final tool argument field after the 5.15.2 fix?

## Maintenance Notes

- Created on 2026-10-13 from the October 12 topic collector after routing broad Network-AI product context upstream.
