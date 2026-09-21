---
type: "Topic"
title: "Online Scheduling AI Booking Conversation Authorization"
description: "Security analysis for CVE-2026-91847 unauthenticated AI booking-assistant conversation access and message injection."
tags: ["identity-and-access", "data-and-privacy", "agent-and-tool-security"]
---

# Online Scheduling AI Booking Conversation Authorization

## Current Understanding

The [September 20 leaf update watch source](../../../raw/processed/2026-09-20/ai-security-wiki-leaf-update-watch-20260921T000220Z.json) adds disclosed vulnerability evidence dated 2026-09-19T13:18:25.713Z: CVE Services published an unauthenticated ownership-check failure in Online Scheduling before 28.2 that lets visitors read or mutate another visitor's AI booking-assistant conversation.

The [September 19 topic collector source](../../../raw/processed/2026-09-19/ai-security-wiki-topic-news-collector-2026-09-19T233221Z.json) records [CVE-2026-91847](https://cveawg.mitre.org/api/cve/CVE-2026-91847) for the Online Scheduling and Appointment Booking System WordPress plugin before 28.2. Broad plugin or WordPress product context belongs upstream; this page owns the assistant-conversation ownership, privacy, and injection boundary.

The advisory evidence says unauthenticated conversation actions do not verify that the requester owns the referenced AI booking-assistant conversation. An unauthenticated visitor can read another visitor's assistant messages and inject messages into an active assistant thread.

## Security Impact

- Threat: unauthenticated users can view or alter another visitor's AI booking-assistant conversation state.
- Affected boundary: Online Scheduling and Appointment Booking System WordPress plugin before 28.2; unauthenticated AI booking-assistant conversation actions.
- Exploit or incident status: public CVE, WPScan, and GitHub advisory evidence; no local exploitation incident is recorded.
- Mitigation state: upgrade to 28.2 or later and bind every assistant-thread action to the visitor or account that owns the conversation.
- Confidence: high for affected version and vulnerability class from CVE/GHSA metadata.
- Residual risk: unauthenticated assistants often use lightweight session identifiers, so backend ownership checks must not rely only on UI-hidden conversation IDs.

## Authoritative Sources

- [September 20 leaf update watch source](../../../raw/processed/2026-09-20/ai-security-wiki-leaf-update-watch-20260921T000220Z.json)
- [September 19 topic collector source](../../../raw/processed/2026-09-19/ai-security-wiki-topic-news-collector-2026-09-19T233221Z.json)
- [CVE-2026-91847 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-91847)
- [NVD CVE-2026-91847](https://nvd.nist.gov/vuln/detail/CVE-2026-91847)
- [WPScan CVE-2026-91847](https://wpscan.com/vulnerability/9eef3086-3a67-4ee2-bd78-e346e7b05d62)
- [GitHub advisory GHSA-mj5r-8jcf-67xr](https://github.com/advisories/GHSA-mj5r-8jcf-67xr)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [data and privacy](../data-and-privacy/index.md)
- [Kibana AI Assistant conversation ownership bypass](kibana-ai-assistant-conversation-ownership-bypass.md)

## Open Questions

- Does version 28.2 remediate both transcript reads and injected assistant messages, or only one unauthenticated action path?

## Maintenance Notes

- Updated on 2026-09-20 from the [September 20 leaf update watch source](../../../raw/processed/2026-09-20/ai-security-wiki-leaf-update-watch-20260921T000220Z.json) with in-window disclosed vulnerability evidence while preserving local security-boundary scope.
- Created on 2026-09-20 from the [September 19 topic collector source](../../../raw/processed/2026-09-19/ai-security-wiki-topic-news-collector-2026-09-19T233221Z.json) as an AI booking-assistant conversation authorization leaf.
