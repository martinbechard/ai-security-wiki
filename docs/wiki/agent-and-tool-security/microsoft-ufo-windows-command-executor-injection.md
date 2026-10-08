---
type: "Topic"
title: "Microsoft UFO Windows Command Executor Injection"
description: "Security analysis for CVE-2026-105791 Windows Explorer delegation command execution in Microsoft UFO CommandLineExecutor."
tags: ["agent-and-tool-security"]
---

# Microsoft UFO Windows Command Executor Injection

## Current Understanding

The [October 6 topic collector source](../../../raw/processed/2026-10-06/ai-security-wiki-topic-news-collector-2026-10-06T233203Z.json) records Microsoft UFO command-injection records, and the [October 8 leaf update watch source](../../../raw/processed/2026-10-08/ai-security-wiki-leaf-update-watch-20261008T001800Z.json) corrects the Windows mapping to [CVE-2026-105791](https://cveawg.mitre.org/api/cve/CVE-2026-105791) for Microsoft UFO `CommandLineExecutor`. Broad Microsoft UFO framework context belongs upstream; this page owns the local Windows desktop command-execution boundary.

The public CVE data says an attacker-influenced agent call can use Windows Explorer delegation to launch arbitrary executables or scripts as the desktop user. This boundary changes independently from UFO's mobile MCP ADB shell tools because it concerns Windows desktop process launch semantics rather than attached Android-device commands. The record identifies a fix in UFO 3.0.9.

## Security Impact

- Threat: agent-selected command execution can cross from desktop automation into arbitrary Windows process launch as the user.
- Affected boundary: Microsoft UFO before 3.0.9, `CommandLineExecutor`, Windows Explorer delegation, and desktop-user process launch.
- Exploit or incident status: public NVD CVE record; no local exploitation incident is recorded.
- Mitigation state: update to UFO 3.0.9 or later, constrain command execution to explicit allowlisted binaries and arguments, and avoid Explorer delegation for untrusted agent-selected payloads.
- Confidence: medium-high because the October 8 watcher reconciles CVE API mappings with the affected component and fixed version; medium for patch mechanics until vendor repository advisories or release notes are captured.
- Residual risk: desktop automation frameworks need final payload validation because shell, Explorer, and file-association delegation can all bypass a nominal tool-name check.

## Authoritative Sources

- [October 6 topic collector source](../../../raw/processed/2026-10-06/ai-security-wiki-topic-news-collector-2026-10-06T233203Z.json)
- [October 8 leaf update watch source](../../../raw/processed/2026-10-08/ai-security-wiki-leaf-update-watch-20261008T001800Z.json)
- [CVE-2026-105791 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-105791)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [Microsoft UFO mobile MCP ADB command injection](microsoft-ufo-mobile-mcp-adb-command-injection.md)
- [coding agent command approval boundaries](coding-agent-command-approval-boundaries.md)

## Open Questions

- Which Microsoft UFO commit or release note describes the exact Windows Explorer delegation fix for CVE-2026-105791 in 3.0.9?

## Maintenance Notes

- Updated on 2026-10-08 from the [October 8 leaf update watch source](../../../raw/processed/2026-10-08/ai-security-wiki-leaf-update-watch-20261008T001800Z.json) to correct the Windows `CommandLineExecutor` mapping to CVE-2026-105791.
- Created on 2026-10-07 from the [October 6 topic collector source](../../../raw/processed/2026-10-06/ai-security-wiki-topic-news-collector-2026-10-06T233203Z.json) after verifier correction split the Windows command executor from the Microsoft UFO mobile ADB command boundary.
