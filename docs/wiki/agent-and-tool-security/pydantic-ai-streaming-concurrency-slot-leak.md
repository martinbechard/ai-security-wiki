---
type: "Topic"
title: "Pydantic AI Streaming Concurrency Slot Leak"
description: "Security analysis for CVE-2026-107286 streaming requests retaining concurrency-limited model slots in Pydantic AI."
tags: ["agent-and-tool-security", "infrastructure-and-supply-chain"]
---

# Pydantic AI Streaming Concurrency Slot Leak

## Current Understanding

The [October 8 topic collector source](../../../raw/processed/2026-10-08/ai-security-wiki-topic-news-collector-2026-10-08T233132Z.json) records [CVE-2026-107286](https://cveawg.mitre.org/api/cve/CVE-2026-107286) for Pydantic AI concurrency-limited models. Broad framework background belongs upstream; this page owns the local shared-model availability and concurrency-gate boundary.

The CVE title says concurrency-limited models can keep their slot when a streamed request ends early. CVE Services lists Pydantic AI and `pydantic-ai-slim` versions 2.10.0 before 2.53.0 as affected and points to the 2.53.0 release as the fix.

## Security Impact

- Threat: interrupted streaming requests can retain scarce concurrency slots and deny later users or agents access to shared model execution.
- Affected boundary: Pydantic AI and `pydantic-ai-slim` 2.10.0 through before 2.53.0, streaming request cleanup, concurrency-limited model wrappers, and shared model execution capacity.
- Exploit or incident status: public CVE Services record and GitHub advisory; no confirmed exploitation incident is recorded locally.
- Mitigation state: update to Pydantic AI 2.53.0 or later and test early stream termination, client disconnects, exceptions, and cancellation paths for slot release.
- Confidence: high for advisory identity and affected range; medium for deployment impact because it depends on concurrency-limit configuration and streaming use.
- Residual risk: availability controls need cancellation-path tests because successful-stream tests do not prove cleanup under client disconnects.

## Authoritative Sources

- [October 8 topic collector source](../../../raw/processed/2026-10-08/ai-security-wiki-topic-news-collector-2026-10-08T233132Z.json)
- [CVE-2026-107286 record](https://cveawg.mitre.org/api/cve/CVE-2026-107286)
- [GHSA-6fqq-452j-qhrp](https://github.com/pydantic/pydantic-ai/security/advisories/GHSA-6fqq-452j-qhrp)
- [Pydantic AI 2.53.0 release](https://github.com/pydantic/pydantic-ai/releases/tag/v2.53.0)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [Pydantic AI web fetch resource exhaustion](pydantic-ai-web-fetch-resource-exhaustion.md)
- Upstream AI wiki owns broad [Pydantic AI framework coverage](../../../upstream-ai-wiki/agentic-frameworks/pydantic-ai.md).

## Open Questions

- Which Pydantic AI 2.53.0 test proves concurrency slots are released for every streaming cancellation and disconnect path?

## Maintenance Notes

- Created on 2026-10-09 from the [October 8 topic collector source](../../../raw/processed/2026-10-08/ai-security-wiki-topic-news-collector-2026-10-08T233132Z.json) as a distinct shared-capacity availability leaf.
