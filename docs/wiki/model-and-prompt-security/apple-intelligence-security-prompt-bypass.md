---
type: "Topic"
title: "Apple Intelligence security prompt bypass"
description: "Security analysis for CVE-2026-84601 Apple Intelligence security prompt state-management bypass fixed in macOS Golden Gate 27."
tags: ["model-and-prompt-security", "identity-and-access", "agent-and-tool-security"]
---

# Apple Intelligence security prompt bypass

## Current Understanding

The [September 14 topic collector source](../../../raw/processed/2026-09-14/ai-security-wiki-topic-news-collector-2026-09-14T233124Z.json) records [CVE-2026-84601](https://cveawg.mitre.org/api/cve/CVE-2026-84601) for macOS versions before Golden Gate 27. Broad Apple Intelligence product context belongs upstream; this page owns the local assistant permission-prompt boundary.

Apple's CVE text is sparse: a permissions issue was addressed with improved state management, and an app may have been able to bypass Apple Intelligence security prompts. The local security lesson is that local AI assistant prompts are consent and authorization gates, so prompt state must be bound to the app, requested action, data scope, and user decision.

The [September 16 leaf update watch source](../../../raw/processed/2026-09-16/ai-security-wiki-leaf-update-watch-20260916T000740Z.json) adds NVD's September 15 Undergoing Analysis metadata and Apple support reference. That enriches analysis state without changing the prompt-permission boundary.

## Security Impact

- Threat: an app can bypass an Apple Intelligence security prompt and weaken user consent for AI-mediated action or data access.
- Affected boundary: macOS versions before Golden Gate 27, Apple Intelligence security prompts, permission state management, and app-to-assistant delegation.
- Exploit or incident status: public CVE and Apple support reference; no local exploitation incident is recorded.
- Mitigation state: update macOS to Golden Gate 27 or later and avoid treating AI assistant prompt display as sufficient unless state binding and audit evidence are available.
- Confidence: medium-high because Apple confirms the prompt bypass class and fixed OS boundary, but public technical detail is limited.
- Residual risk: desktop AI assistant permission prompts need replay-resistant state, app identity binding, and post-action auditability to be useful as security controls.

## Authoritative Sources

- [September 14 topic collector source](../../../raw/processed/2026-09-14/ai-security-wiki-topic-news-collector-2026-09-14T233124Z.json)
- [September 16 leaf update watch source](../../../raw/processed/2026-09-16/ai-security-wiki-leaf-update-watch-20260916T000740Z.json)
- [CVE-2026-84601 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-84601)
- [NVD CVE-2026-84601 record](https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2026-84601)
- [Apple security updates for macOS Golden Gate 27](https://support.apple.com/en-us/149035)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [model and prompt security](index.md)
- [Microsoft Edge iOS LLM prompt spoofing](microsoft-edge-ios-llm-prompt-spoofing.md)
- [Production agent identity and access controls](../identity-and-access/production-agent-identity-and-access-controls.md)

## Open Questions

- Which Apple Intelligence security prompts were bypassable before macOS Golden Gate 27, and were prior user decisions replayed or mismatched across app state?

## Maintenance Notes

- Created on 2026-09-15 from the [September 14 topic collector](../../../raw/processed/2026-09-14/ai-security-wiki-topic-news-collector-2026-09-14T233124Z.json) as a local-assistant permission-prompt boundary leaf.
- Updated on 2026-09-16 with NVD analysis-state metadata from the [September 16 leaf update watch](../../../raw/processed/2026-09-16/ai-security-wiki-leaf-update-watch-20260916T000740Z.json).
