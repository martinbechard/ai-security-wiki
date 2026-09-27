---
type: "Topic"
title: "Flowise Chat History RBAC Bypass"
description: "Security analysis for CVE-2026-100605, where low-privileged Flowise API keys could read and delete chat history."
tags: ["data-and-privacy", "identity-and-access"]
---

# Flowise Chat History RBAC Bypass

## Current Understanding

The [September 26 topic collector source](../../../raw/processed/2026-09-26/ai-security-wiki-topic-news-collector-2026-09-26T233301Z.json) records CVE-2026-100605 for Flowise through 3.1.4. Broad Flowise workflow-builder context belongs upstream; this page owns the local chat-message route RBAC boundary.

## Security Impact

- Threat: low-privileged API keys can read and delete chat history.
- Affected boundary: Flowise through 3.1.4, chat-message endpoints, API keys, route-level RBAC, and conversation history.
- Exploit or incident status: disclosed CVE; no confirmed exploitation is recorded in the collector.
- Mitigation state: enforce route-level RBAC for chat-message read and delete operations and upgrade when the fixed Flowise release is confirmed.
- Confidence: medium-high from NVD-backed collector evidence; maintainer patch status needs recheck.
- Residual risk: chat histories contain prompts, retrieval outputs, model responses, files, and identifiers that can cross workspace boundaries.

## Authoritative Sources

- [September 26 topic collector source](../../../raw/processed/2026-09-26/ai-security-wiki-topic-news-collector-2026-09-26T233301Z.json)
- [NVD CVE-2026-100605](https://nvd.nist.gov/vuln/detail/CVE-2026-100605)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [data and privacy](index.md)
- [Flowise MongoDBMemory session leak](flowise-mongodbmemory-session-leak.md)

## Open Questions

- Which Flowise release first fixes CVE-2026-100605?

## Maintenance Notes

- Created on 2026-09-27 from the [September 26 topic collector source](../../../raw/processed/2026-09-26/ai-security-wiki-topic-news-collector-2026-09-26T233301Z.json) after verifier correction split Flowise chat-history RBAC from BullMQ dashboard authorization.
