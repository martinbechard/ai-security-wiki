---
type: "Topic"
title: "Kotaemon Multi-User Chat Authorization Bypass"
description: "Security analysis for CVE-2026-86867, where Kotaemon chat handlers can cross conversation ownership boundaries."
tags: ["data-and-privacy", "identity-and-access"]
---

# Kotaemon Multi-User Chat Authorization Bypass

## Current Understanding

The [September 23 topic collector source](../../../raw/processed/2026-09-23/ai-security-wiki-topic-news-collector-2026-09-23T233151Z.json) records [CVE-2026-86867](https://cveawg.mitre.org/api/cve/CVE-2026-86867) and [CERT/CC VU#754548](https://kb.cert.org/vuls/id/754548) for Cinnamon AI Kotaemon through v0.12.0. Broad Kotaemon product context belongs upstream if needed; this page owns the local RAG chat data and conversation ownership boundary.

The affected multi-user chat handlers load `Conversation` records by ID without verifying ownership. Authenticated users can read other users' chat transcripts, RAG retrieval history, generated plots, and suggestions, and can delete, rename, or overwrite another user's conversation suggestions.

## Security Impact

- Threat: cross-user read and mutation of RAG chat state.
- Affected boundary: Cinnamon AI Kotaemon through v0.12.0, `libs/ktem/ktem/pages/chat/control.py`, `Conversation` records, retrieval history, generated artifacts, and suggestions.
- Exploit or incident status: public CERT/CC note, CVE, and NVD evidence; patch status not identified in the collector metadata.
- Mitigation state: restrict multi-user chat handlers to owner-verified conversation IDs and watch for an upstream fixed release or patch.
- Confidence: high for authorization failure and affected version range from CERT/CC, CVE, and NVD; medium for remediation state until upstream patch metadata is located.
- Residual risk: RAG chat systems store prompts, retrieved context, and generated artifacts, so conversation ownership must be enforced before every read and mutation.

## Authoritative Sources

- [September 23 topic collector source](../../../raw/processed/2026-09-23/ai-security-wiki-topic-news-collector-2026-09-23T233151Z.json)
- [CVE-2026-86867 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-86867)
- [NVD CVE-2026-86867](https://nvd.nist.gov/vuln/detail/CVE-2026-86867)
- [CERT/CC VU#754548](https://kb.cert.org/vuls/id/754548)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [data and privacy](index.md)
- [identity and access](../identity-and-access/index.md)
- [Open WebUI chat channel authorization](../identity-and-access/open-webui-chat-channel-authorization.md)

## Open Questions

- Which Kotaemon release or patch fixes CVE-2026-86867, and are all four affected handler methods owner-scoped after the fix?

## Maintenance Notes

- Created on 2026-09-24 from the [September 23 topic collector source](../../../raw/processed/2026-09-23/ai-security-wiki-topic-news-collector-2026-09-23T233151Z.json) as a RAG chat data-privacy and ownership leaf.
