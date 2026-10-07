---
type: "Topic"
title: "Microsoft UFO Mobile MCP ADB Command Injection"
description: "Security analysis for CVE-2026-105788 and CVE-2026-105791 command injection in Microsoft UFO mobile MCP ADB shell tools."
tags: ["agent-and-tool-security"]
---

# Microsoft UFO Mobile MCP ADB Command Injection

## Current Understanding

The [October 6 topic collector source](../../../raw/processed/2026-10-06/ai-security-wiki-topic-news-collector-2026-10-06T233203Z.json) records [CVE-2026-105788](https://nvd.nist.gov/vuln/detail/CVE-2026-105788) and [CVE-2026-105791](https://nvd.nist.gov/vuln/detail/CVE-2026-105791) for Microsoft UFO mobile MCP server tools. Broad Microsoft UFO framework context belongs upstream; this page owns the local Android Debug Bridge command-boundary failure.

The NVD records say authenticated caller-controlled input reaches `adb shell` command positions. Shell metacharacters can execute additional Android-shell commands on authorized connected devices when mobile automation tools such as `type_text`, `launch_app`, and `press_key` build commands without safe argument boundaries. The records identify fixes in UFO 3.0.9 and 3.0.10.

## Security Impact

- Threat: authenticated agent or MCP calls can turn mobile automation parameters into Android shell command execution.
- Affected boundary: Microsoft UFO before 3.0.10 for mobile `type_text` and `launch_app`, and before 3.0.9 for mobile `press_key`; MCP mobile server tools, ADB invocation, and attached Android devices.
- Exploit or incident status: public NVD CVE records; no local exploitation incident is recorded.
- Mitigation state: update to UFO 3.0.10 or later, use argument arrays instead of shell interpolation, reject shell metacharacters where text input is intended, and treat device-control MCP tools as high-risk delegated execution.
- Confidence: medium-high because NVD provides affected tool paths and fixed versions; medium for patch mechanics until vendor repository advisories or release notes are captured.
- Residual risk: device-control MCP bridges can span workstation and attached-device authority, so first-token allowlists are insufficient when caller-controlled arguments reach `adb shell`.

## Authoritative Sources

- [October 6 topic collector source](../../../raw/processed/2026-10-06/ai-security-wiki-topic-news-collector-2026-10-06T233203Z.json)
- [NVD CVE-2026-105788](https://nvd.nist.gov/vuln/detail/CVE-2026-105788)
- [NVD CVE-2026-105791](https://nvd.nist.gov/vuln/detail/CVE-2026-105791)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [ADB MCP command injection](adb-mcp-command-injection.md)
- [Microsoft UFO Windows command executor injection](microsoft-ufo-windows-command-executor-injection.md)
- [coding agent command approval boundaries](coding-agent-command-approval-boundaries.md)

## Open Questions

- Which Microsoft UFO commits or release notes describe the exact mobile MCP ADB escaping fixes for 3.0.9 and 3.0.10?

## Maintenance Notes

- Created on 2026-10-07 from the [October 6 topic collector source](../../../raw/processed/2026-10-06/ai-security-wiki-topic-news-collector-2026-10-06T233203Z.json) after verifier correction split the Microsoft UFO mobile ADB command boundary from the Windows desktop command-executor boundary.
