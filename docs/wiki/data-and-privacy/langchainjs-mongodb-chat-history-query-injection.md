---
type: "Topic"
title: "LangChain.js MongoDB Chat History Query Injection"
description: "Security analysis for CVE-2026-106119 cross-session access through MongoDBChatMessageHistory session identifier query injection."
tags: ["data-and-privacy", "identity-and-access"]
---

# LangChain.js MongoDB Chat History Query Injection

## Current Understanding

The [October 8 topic collector source](../../../raw/processed/2026-10-08/ai-security-wiki-topic-news-collector-2026-10-08T233132Z.json) records GitHub Advisory Database publication, review, and update of [GHSA-m6rx-h84q-8r95](https://github.com/advisories/GHSA-m6rx-h84q-8r95) for [CVE-2026-106119](https://cveawg.mitre.org/api/cve/CVE-2026-106119). Broad LangChain and LangChain.js framework context belongs upstream; this page owns the local chat-history isolation boundary.

`MongoDBChatMessageHistory` did not enforce session identifiers as strings at runtime. In shared-collection deployments, untrusted structured session identifiers could be interpreted as MongoDB query conditions, allowing cross-session read, modification, or deletion of stored conversations. CVE Services records `langchain-ai/langchainjs` before 1.5.14 and `@langchain/mongodb` before 1.3.1 as affected.

## Security Impact

- Threat: attackers can use structured session identifiers to access other users' stored chat history in shared MongoDB collections.
- Affected boundary: LangChain.js, `@langchain/mongodb`, `MongoDBChatMessageHistory`, session identifiers, MongoDB query construction, and multi-user chat-memory stores.
- Exploit or incident status: public GitHub advisory and CVE Services record; no confirmed exploitation incident is recorded locally.
- Mitigation state: update LangChain.js to 1.5.14 and `@langchain/mongodb` to 1.3.1 or later; validate session identifiers as scalar strings before query construction.
- Confidence: high for affected packages and fixed versions; medium for deployment impact because single-user or isolated-collection deployments do not have the same cross-session boundary.
- Residual risk: AI memory stores need type validation at the application boundary, not only in helper constructors, because session keys are authorization data.

## Authoritative Sources

- [October 8 topic collector source](../../../raw/processed/2026-10-08/ai-security-wiki-topic-news-collector-2026-10-08T233132Z.json)
- [GHSA-m6rx-h84q-8r95](https://github.com/advisories/GHSA-m6rx-h84q-8r95)
- [CVE-2026-106119 record](https://cveawg.mitre.org/api/cve/CVE-2026-106119)
- [@langchain/mongodb 1.3.1 release](https://github.com/langchain-ai/langchainjs/releases/tag/@langchain/mongodb@1.3.1)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [data and privacy](index.md)
- [Spring AI Redis chat memory query injection](spring-ai-redis-chat-memory-query-injection.md)
- [Kotaemon multi-user chat authorization bypass](kotaemon-multi-user-chat-authorization-bypass.md)
- Upstream AI wiki owns broad [LangChain framework coverage](../../../upstream-ai-wiki/agentic-frameworks/langchain-stack.md).

## Open Questions

- Does the fixed `@langchain/mongodb` release reject non-string session identifiers before every MongoDB query path?

## Maintenance Notes

- Created on 2026-10-09 from the [October 8 topic collector source](../../../raw/processed/2026-10-08/ai-security-wiki-topic-news-collector-2026-10-08T233132Z.json), preserving the shared-collection deployment condition.
