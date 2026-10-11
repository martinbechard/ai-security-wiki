---
type: "Topic"
title: "AstronRPA Smart Component Chat IPC Command Execution"
description: "Security analysis for CVE-2026-108159 prompt-injected LLM output reaching desktop IPC command execution in AstronRPA."
tags: ["agent-and-tool-security", "model-and-prompt-security"]
---

# AstronRPA Smart Component Chat IPC Command Execution

## Current Understanding

The [October 10 leaf update watch source](../../../raw/processed/2026-10-10/ai-security-wiki-leaf-update-watch-20261010T235801Z.json) confirms CVE-2026-108159 as a disclosed vulnerability in the same exploit chain:

1. Prompt-influenced smart-component chat output is rendered with `v-html`.
2. HTML event handlers can invoke an unrestricted desktop IPC open-path handler.
3. Shell metacharacters can execute commands as the desktop user.

The [October 9 topic collector source](../../../raw/processed/2026-10-09/ai-security-wiki-topic-news-collector-2026-10-09T233308Z.json) records [CVE-2026-108159](https://cveawg.mitre.org/api/cve/CVE-2026-108159) for AstronRPA through 1.1.6. Broad AstronRPA and desktop RPA product context belongs upstream; this page owns the local security chain from untrusted web content to model output rendering and desktop IPC command execution.

The [CVE record](https://cveawg.mitre.org/api/cve/CVE-2026-108159) and [VulnCheck advisory](https://www.vulncheck.com/advisories/astronrpa-through-1.1.6-rce-via-smart-component-chat-xss-and-ipc-bridge) describe a smart-component chat XSS where prompt-injection content in a web page can cause the model to emit HTML event handlers. The desktop client renders that output with `v-html`, and the injected handler can invoke an unrestricted open-path IPC handler with shell metacharacters, executing commands as the desktop user.

## Security Impact

- Threat: indirect prompt injection can become desktop command execution when model output is rendered as trusted HTML and connected to a privileged IPC bridge.
- Affected boundary: iflytek AstronRPA through 1.1.6, smart-component chat, LLM output rendering, `v-html`, open-path IPC, shell metacharacter handling, and desktop user authority.
- Exploit or incident status: public CVE Services and VulnCheck advisory evidence; no confirmed exploitation incident is recorded locally.
- Mitigation state: no fixed version is recorded locally; sanitize or escape model output before rendering, remove shell interpretation from IPC arguments, and require explicit mediation before local path or command actions.
- Confidence: high for affected version range and exploit chain from CVE/VulnCheck evidence; medium for remediation state because the linked issue should be rechecked for maintainer response.
- Residual risk: desktop agent UIs need separate trust boundaries for retrieved content, model text, rendered UI, IPC calls, and local command execution.

## Authoritative Sources

- [October 10 leaf update watch source](../../../raw/processed/2026-10-10/ai-security-wiki-leaf-update-watch-20261010T235801Z.json)
- [October 9 topic collector source](../../../raw/processed/2026-10-09/ai-security-wiki-topic-news-collector-2026-10-09T233308Z.json)
- [CVE-2026-108159 record](https://cveawg.mitre.org/api/cve/CVE-2026-108159)
- [VulnCheck AstronRPA advisory](https://www.vulncheck.com/advisories/astronrpa-through-1.1.6-rce-via-smart-component-chat-xss-and-ipc-bridge)
- [AstronRPA issue 892](https://github.com/iflytek/astron-rpa/issues/892)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [model and prompt security](../model-and-prompt-security/index.md)
- [local agent execution and processing boundaries](local-agent-execution-and-processing-boundaries.md)

## Open Questions

- Which AstronRPA release removes unsafe `v-html` rendering or constrains the open-path IPC handler for smart-component chat output?

## Maintenance Notes

- Updated on 2026-10-10 with watcher provenance for CVE-2026-108159; no duplicate digest entry was added.
- Created on 2026-10-10 from the [October 9 topic collector source](../../../raw/processed/2026-10-09/ai-security-wiki-topic-news-collector-2026-10-09T233308Z.json) as a prompt-injection-to-desktop-IPC boundary.
