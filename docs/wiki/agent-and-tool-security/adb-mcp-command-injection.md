---
type: "Topic"
title: "ADB MCP Command Injection"
description: "Security analysis for CVE-2025-59834 command injection in ADB MCP Server tool handling."
tags: ["agent-and-tool-security"]
---

# ADB MCP Command Injection

## Current Understanding

The [September 30 topic collector source](../../../raw/processed/2026-09-30/ai-security-wiki-topic-news-collector-2026-09-30T233235Z.json) records [CVE-2025-59834](https://nvd.nist.gov/vuln/detail/CVE-2025-59834) and [GHSA-54j7-grvr-9xwg](https://github.com/srmorete/adb-mcp/security/advisories/GHSA-54j7-grvr-9xwg) for `srmorete/adb-mcp` versions 0.1.0 and prior. Broad Android Debug Bridge and MCP server catalog context belongs upstream; this page owns the local tool-argument-to-command-execution boundary.

The source says MCP tool definitions and implementation are vulnerable to command injection. Because the server bridges agent calls to Android Debug Bridge, model-selected or remote caller-selected parameters can become host or device command execution unless the implementation avoids shell interpolation and validates arguments.

## Security Impact

- Threat: MCP tool arguments can cross into ADB or host shell command execution.
- Affected boundary: ADB MCP Server 0.1.0 and prior, MCP tool definitions, tool implementation, Android Debug Bridge invocation, and host/device command execution.
- Exploit or incident status: public NVD and GitHub advisory records; no local exploitation incident is recorded.
- Mitigation state: NVD points to commit `041729c` as the patch; verify the first versioned release containing that commit before closing deployment exposure.
- Confidence: high for affected boundary and patch reference; medium for fixed-release naming until release evidence is checked.
- Residual risk: device-control MCP bridges need strict argument handling because the target authority can span both the developer workstation and attached devices.

## Authoritative Sources

- [September 30 topic collector source](../../../raw/processed/2026-09-30/ai-security-wiki-topic-news-collector-2026-09-30T233235Z.json)
- [NVD CVE-2025-59834](https://nvd.nist.gov/vuln/detail/CVE-2025-59834)
- [GitHub advisory GHSA-54j7-grvr-9xwg](https://github.com/srmorete/adb-mcp/security/advisories/GHSA-54j7-grvr-9xwg)
- [ADB MCP patch commit](https://github.com/srmorete/adb-mcp/commit/041729c0b25432df3199ff71b3163a307cf4c28c)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [coding agent command approval boundaries](coding-agent-command-approval-boundaries.md)
- Upstream AI wiki owns broad Android Debug Bridge MCP server context.

## Open Questions

- Which ADB MCP Server version first contains commit `041729c`?

## Maintenance Notes

- Created on 2026-10-01 from the [September 30 topic collector source](../../../raw/processed/2026-09-30/ai-security-wiki-topic-news-collector-2026-09-30T233235Z.json).
