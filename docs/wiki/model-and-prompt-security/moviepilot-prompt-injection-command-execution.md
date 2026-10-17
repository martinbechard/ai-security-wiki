---
type: "Topic"
title: "MoviePilot Prompt-Injection Command Execution"
description: "Security analysis for CVE-2026-77931 untrusted metadata inducing host command execution through MoviePilot's agent tool."
tags: ["model-and-prompt-security", "agent-and-tool-security"]
---

# MoviePilot Prompt-Injection Command Execution

## Current Understanding

The [October 15 topic collector source](../../../raw/processed/2026-10-15/ai-security-wiki-topic-news-collector-2026-10-15T232644Z.json) records [CVE-2026-77931](https://cveawg.mitre.org/api/cve/CVE-2026-77931): MoviePilot through 3.1.5 passes untrusted web, search, and torrent metadata to an unrestricted `ExecuteCommandTool` through `asyncio.create_subprocess_shell`. Crafted instructions can induce the model to set `confirm_dangerous=true`, bypassing the command denylist in an administrator session. Broad MoviePilot context belongs upstream; this page owns the untrusted-content-to-host-authority boundary.

## Security Impact

- Threat: indirect prompt injection in fetched metadata induces operating-system command execution.
- Affected boundary: MoviePilot through 3.1.5; external-content ingestion, model-controlled confirmation, command denylist, and administrator execution context.
- Exploit or incident status: public CVE; no local exploitation incident is recorded.
- Mitigation state: the captured primary record does not identify a fixed version. Upgrade when vendor remediation is available; meanwhile disable unrestricted command tools for untrusted-content workflows and use a constrained, non-shell executor.
- Confidence: high for the CVE-described exploit path; fixed-version status is open.
- Residual risk: denylist and confirmation parameters remain bypassable when model output can control them or when the tool runs with administrator privileges.

## Control Implications

- Keep retrieved web and metadata content untrusted through planning and execution.
- Make approval and policy decisions outside model-controlled arguments.
- Prefer typed, allowlisted operations over shell invocation; run required commands with a least-privileged account.

## Authoritative Sources

- [October 15 topic collector source](../../../raw/processed/2026-10-15/ai-security-wiki-topic-news-collector-2026-10-15T232644Z.json)
- [CVE-2026-77931 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-77931)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [model and prompt security](index.md)
- [LaVague indirect prompt injection RCE](lavague-indirect-prompt-injection-rce.md)
- [Mistral Vibe command permission-gate bypass](../agent-and-tool-security/mistral-vibe-command-permission-gate-bypass.md)

## Open Questions

- Which MoviePilot release or vendor advisory remediates CVE-2026-77931, and does it remove model control of confirmation state?

## Maintenance Notes

- Created on 2026-10-15 from CVE-2026-77931; retain vendor remediation uncertainty explicitly.
