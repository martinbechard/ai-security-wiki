---
type: "Topic"
title: "Flowise MongoDBMemory session leak"
description: "Security analysis for CVE-2026-91937 Flowise MongoDBMemory NoSQL injection leaking cross-session chat history."
tags: ["data-and-privacy", "identity-and-access"]
---

# Flowise MongoDBMemory session leak

## Current Understanding

The [September 15 topic collector source](../../../raw/processed/2026-09-15/ai-security-wiki-topic-news-collector-2026-09-15T233112Z.json) records [CVE-2026-91937](https://cveawg.mitre.org/api/cve/CVE-2026-91937) for Flowise versions before 3.1.4. Broad Flowise product and workflow-builder coverage belongs upstream; this page owns the local chat-memory isolation and prompt/data confidentiality boundary.

The CVE says Flowise failed to sanitize `overrideConfig.sessionId` before using it in MongoDBMemory queries. Unauthenticated attackers could pass MongoDB operator objects through the prediction API and read other users' chat-history records from the shared collection. The GitHub advisory describes the affected surface as public chatflows and recommends coercing session identifiers to strings before they reach MongoDB queries.

## Security Impact

- Threat: unauthenticated prediction API callers can cross session boundaries and read chat history for other users.
- Affected boundary: Flowise before 3.1.4, MongoDBMemory, MongoDB Atlas Chat Memory, public chatflows, `overrideConfig.sessionId`, and shared chat-history collections.
- Exploit or incident status: public CVE, GitHub advisory, and VulnCheck advisory reference; no local exploitation incident is recorded.
- Mitigation state: upgrade Flowise to 3.1.4 or later and type-check session identifiers before query construction.
- Confidence: high for the CVE timing, affected version, and session-isolation class; medium for long-term remediation availability because repository/archive status should be reconciled during future maintenance.
- Residual risk: AI memory backends can hold prompts, credentials, and internal configuration, so query construction must treat session IDs as authorization-scoped data rather than flexible JSON.

## Authoritative Sources

- [September 15 topic collector source](../../../raw/processed/2026-09-15/ai-security-wiki-topic-news-collector-2026-09-15T233112Z.json)
- [CVE-2026-91937 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-91937)
- [GitHub advisory GHSA-wpvf-4vfx-rgxm](https://github.com/FlowiseAI/Flowise/security/advisories/GHSA-wpvf-4vfx-rgxm)
- [VulnCheck Flowise NoSQL injection advisory](https://www.vulncheck.com/advisories/flowise-before-3.1.4-nosql-injection-via-sessionid)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [data and privacy](index.md)
- [identity and access](../identity-and-access/index.md)
- [Open WebUI knowledge object access control](open-webui-knowledge-object-access-control.md)
- [Spring AI Redis chat memory query injection](spring-ai-redis-chat-memory-query-injection.md)

## Open Questions

- Are Flowise deployments with public chatflows able to disable user-supplied `overrideConfig.sessionId` independently of upgrading?

## Maintenance Notes

- Created on 2026-09-16 from the [September 15 topic collector](../../../raw/processed/2026-09-15/ai-security-wiki-topic-news-collector-2026-09-15T233112Z.json) as a chat-memory data-isolation leaf.
