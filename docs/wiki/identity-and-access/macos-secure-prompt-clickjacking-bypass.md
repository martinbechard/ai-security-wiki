---
type: "Topic"
title: "macOS secure-prompt clickjacking bypass"
description: "Security analysis for CVE-2026-86911 macOS secure-prompt clickjacking protection bypass fixed in Golden Gate 27."
tags: ["identity-and-access", "model-and-prompt-security"]
---

# macOS secure-prompt clickjacking bypass

## Current Understanding

The [September 16 topic collector source](../../../raw/processed/2026-09-16/ai-security-wiki-topic-news-collector-2026-09-16T233115Z.json) records [CVE-2026-86911](https://cveawg.mitre.org/api/cve/CVE-2026-86911) for macOS versions before Golden Gate 27. Broad Apple and macOS product context belongs upstream; this page owns the local approval-prompt and human-consent security boundary.

Apple's public CVE text says a malicious app may have been able to bypass clickjacking protections for secure prompts, and that improved state management addressed the issue. The AI-security implication is broader than this single macOS prompt: assistant action approval, secure prompts, and delegated local actions depend on clickjacking-resistant state binding between the app, prompt, requested action, user decision, and resulting execution.

## Security Impact

- Threat: a local malicious app can weaken secure-prompt consent by bypassing clickjacking protections.
- Affected boundary: macOS versions before Golden Gate 27, secure prompts, clickjacking protection, and state management for user approval.
- Exploit or incident status: public CVE and NVD records; no local exploitation incident is recorded.
- Mitigation state: update to macOS Golden Gate 27 or later and avoid treating visible prompts as sufficient without app/action binding and audit evidence.
- Confidence: medium-high because Apple confirms the class and fixed OS boundary, but public technical detail is limited.
- Residual risk: desktop assistant and local-agent consent flows can fail if prompt display, app identity, and action authority are not bound to the same state.

## Control Implications

- Bind approval prompts to app identity, action details, data scope, and one-time user decisions.
- Preserve audit records that show which prompt authorized which sensitive action.
- Review local-agent approval UX for clickjacking, overlay, replay, and focus-confusion failure modes.

## Authoritative Sources

- [September 16 topic collector source](../../../raw/processed/2026-09-16/ai-security-wiki-topic-news-collector-2026-09-16T233115Z.json)
- [CVE-2026-86911 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-86911)
- [NVD CVE-2026-86911 record](https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2026-86911)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [Apple Intelligence security prompt bypass](../model-and-prompt-security/apple-intelligence-security-prompt-bypass.md)
- [Production agent identity and access controls](production-agent-identity-and-access-controls.md)

## Open Questions

- Which secure-prompt surfaces were affected, and do any assistant-mediated approval flows share the same state-management pattern?

## Maintenance Notes

- Created on 2026-09-17 from the [September 16 topic collector](../../../raw/processed/2026-09-16/ai-security-wiki-topic-news-collector-2026-09-16T233115Z.json) as a secure-prompt consent-boundary leaf.
