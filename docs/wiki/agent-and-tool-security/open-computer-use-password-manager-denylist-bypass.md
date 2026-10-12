---
type: "Topic"
title: "Open Computer Use Password-Manager Denylist Bypass"
description: "Security analysis for CVE-2026-108721 Open Computer Use password-manager denylist case bypass on macOS."
tags: ["agent-and-tool-security", "data-and-privacy"]
---

# Open Computer Use Password-Manager Denylist Bypass

## Current Understanding

The [October 11 topic collector source](../../../raw/processed/2026-10-11/ai-security-wiki-topic-news-collector-2026-10-11T233138Z.json) records [CVE-2026-108721](https://nvd.nist.gov/vuln/detail/CVE-2026-108721) for Open Computer Use through 1.0.0 on macOS. Broad computer-use product context belongs upstream; this page owns the local credential-manager isolation boundary.

The NVD summary says local MCP callers, including prompt-injected model turns, can bypass a password-manager denylist by supplying case-variant bundle identifiers such as `com.1Password.1Password`. Once the denylist check is bypassed, app-state and action tools can read accessibility trees, capture screenshots, and drive unlocked password-manager interfaces.

## Security Impact

- Threat: prompt-steered local MCP tools can bypass app deny rules and interact with unlocked credential managers.
- Affected boundary: Open Computer Use through 1.0.0 on macOS, bundle-identifier matching, `get_app_state`, screenshot capture, action tools, macOS Accessibility, and password-manager UIs.
- Exploit or incident status: public NVD and CVE Services records; no confirmed exploitation incident is recorded locally.
- Mitigation state: normalize bundle identifiers before policy checks, deny credential-manager accessibility by default, and require explicit human approval for sensitive app reads or actions.
- Confidence: high for NVD-described bypass mechanics; medium for final remediation until upstream advisory or patch notes are captured.
- Residual risk: local computer-use tools need app-isolation policies that are canonicalized and resistant to prompt-injected target names.

## Authoritative Sources

- [October 11 topic collector source](../../../raw/processed/2026-10-11/ai-security-wiki-topic-news-collector-2026-10-11T233138Z.json)
- [NVD CVE-2026-108721](https://nvd.nist.gov/vuln/detail/CVE-2026-108721)
- [CVE-2026-108721 record](https://cveawg.mitre.org/api/cve/CVE-2026-108721)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [development agent credential isolation](../identity-and-access/development-agent-credential-isolation.md)
- [AI development workstation containment](../infrastructure-and-supply-chain/ai-development-workstation-containment.md)
- [agentic browser intent collision](agentic-browser-intent-collision.md)

## Open Questions

- Which Open Computer Use release normalizes bundle identifiers before denylist enforcement?

## Maintenance Notes

- Created on 2026-10-12 from the [October 11 topic collector source](../../../raw/processed/2026-10-11/ai-security-wiki-topic-news-collector-2026-10-11T233138Z.json).
