---
type: "Topic"
title: "Better Messages AI Chatbot Authorization Cluster"
description: "Security analysis for CVE-2026-89334 and CVE-2026-89093 AI chat-bot transcript access and internal bot identity spoofing in Better Messages."
tags: ["identity-and-access", "data-and-privacy", "agent-and-tool-security"]
---

# Better Messages AI Chatbot Authorization Cluster

## Current Understanding

The [September 20 leaf update watch source](../../../raw/processed/2026-09-20/ai-security-wiki-leaf-update-watch-20260921T000220Z.json) adds in-window CVE Services update evidence for both Better Messages issues: CVE-2026-89093 covers AI bot spoofing through 2.15.33, and CVE-2026-89334 covers a separate action-authorization failure through 2.15.33. The two failure modes stay clustered because they share the AI chatbot authorization surface but should not be treated as one undifferentiated vulnerability.

The [September 19 topic collector source](../../../raw/processed/2026-09-19/ai-security-wiki-topic-news-collector-2026-09-19T233221Z.json) records [CVE-2026-89334](https://cveawg.mitre.org/api/cve/CVE-2026-89334) and [CVE-2026-89093](https://cveawg.mitre.org/api/cve/CVE-2026-89093) for Better Messages - Chat Rooms, Group Chat, Private Messages & AI Chat Bots for WordPress through 2.15.33. Broad WordPress-plugin background belongs upstream; this page owns the tightly coupled AI chat-bot authorization, identity, and transcript-exposure boundary.

CVE-2026-89334 is a chat-room thread authorization failure: authenticated custom-level users can access message transcripts, thread metadata, and user data for chat-room threads when the default read setting permits it. CVE-2026-89093 is an AI-specific identity confusion issue: `is_ai_bot_user()` recognizes internal AI bot accounts from an `ai-chat-bot-` prefix in a guest record IP address populated from client-controlled `X-Real-IP`, letting unauthenticated guests spoof internal bot identity and bypass room filters.

## Security Impact

- Threat: attackers can access AI-assisted chat transcripts or obtain privileged room access by spoofing the plugin's internal AI bot identity.
- Affected boundary: Better Messages through 2.15.33; chat-room thread access, `only_joined_can_read`, guest registration, `X-Real-IP`, and `is_ai_bot_user()`.
- Exploit or incident status: public CVE, GHSA, and Wordfence evidence for [CVE-2026-89334](https://www.wordfence.com/threat-intel/vulnerabilities/id/b3243fe4-9d11-49f0-884b-0162cd776993?source=cve) and [CVE-2026-89093](https://www.wordfence.com/threat-intel/vulnerabilities/id/df28ecd7-d463-48b7-95e6-8adc9f34d6bd?source=cve); no local exploitation incident is recorded.
- Mitigation state: fixed version needs patch reconciliation; block client-controlled headers from defining internal bot identity and require thread-level authorization on transcript reads.
- Confidence: high for affected version and issue mechanics from CVE/GHSA evidence; medium for exact fixed-version boundary until a plugin changeset is mapped.
- Residual risk: AI bot identities often receive special access to rooms and drafts, so bot recognition must be based on server-owned identity state rather than user-supplied request metadata.

## Authoritative Sources

- [September 20 leaf update watch source](../../../raw/processed/2026-09-20/ai-security-wiki-leaf-update-watch-20260921T000220Z.json)
- [September 19 topic collector source](../../../raw/processed/2026-09-19/ai-security-wiki-topic-news-collector-2026-09-19T233221Z.json)
- [CVE-2026-89334 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-89334)
- [CVE-2026-89093 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-89093)
- [NVD CVE-2026-89334](https://nvd.nist.gov/vuln/detail/CVE-2026-89334)
- [NVD CVE-2026-89093](https://nvd.nist.gov/vuln/detail/CVE-2026-89093)
- [GitHub advisory GHSA-4f44-p79q-6vj4](https://github.com/advisories/GHSA-4f44-p79q-6vj4)
- [GitHub advisory GHSA-53vp-fjc5-cqj6](https://github.com/advisories/GHSA-53vp-fjc5-cqj6)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [data and privacy](../data-and-privacy/index.md)
- [agent and tool security](../agent-and-tool-security/index.md)

## Open Questions

- Which Better Messages release fixes CVE-2026-89334 and CVE-2026-89093, and did it replace `X-Real-IP` bot recognition with server-owned identity state?

## Maintenance Notes

- Updated on 2026-09-20 from the [September 20 leaf update watch source](../../../raw/processed/2026-09-20/ai-security-wiki-leaf-update-watch-20260921T000220Z.json) with in-window disclosed vulnerability evidence while preserving local security-boundary scope.
- Created on 2026-09-20 from the [September 19 topic collector source](../../../raw/processed/2026-09-19/ai-security-wiki-topic-news-collector-2026-09-19T233221Z.json) as one closely coupled AI chat-bot authorization cluster rather than two digest-batch pages.
