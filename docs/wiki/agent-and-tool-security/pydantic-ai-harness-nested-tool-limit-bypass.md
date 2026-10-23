---
type: "Topic"
title: "Pydantic AI Harness Nested-Tool Limit Bypass"
description: "Security analysis for CVE-2026-114386 nested Pydantic AI Harness tool calls bypassing configured usage limits."
tags: ["agent-and-tool-security", "model-and-prompt-security"]
---

# Pydantic AI Harness Nested-Tool Limit Bypass

## Current Understanding

The [October 21 topic collector source](../../../raw/processed/2026-10-21/ai-security-wiki-topic-news-collector-2026-10-21T193103-0400.json) records [CVE-2026-114386](https://nvd.nist.gov/vuln/detail/CVE-2026-114386) for Pydantic AI Harness before 0.59.0. Broad Pydantic AI coverage belongs upstream; this leaf owns the nested delegated-tool authority boundary, distinct from the existing web-fetch and local-web service findings.

## Security Impact

- Threat: user-controlled or prompt-injected content can cause nested `run_code` calls to exceed a configured tool-call limit, amplifying spend or side effects.
- Affected boundary: Pydantic AI Harness before 0.59.0 where `CodeMode` reaches nested `run_nested_call()` dispatch.
- Exploit or incident status: public CVE disclosure; no local exploitation incident is recorded.
- Mitigation state: upgrade to 0.59.0 or later and independently enforce budget and authorization checks at tool execution boundaries.
- Confidence: medium because NVD supplies a concrete version and mechanism but the collected run did not locate the primary maintainer advisory.
- Residual risk: a framework counter is insufficient when nested execution paths can reach costly or effectful tools.

## Authoritative Sources

- [October 21 topic collector source](../../../raw/processed/2026-10-21/ai-security-wiki-topic-news-collector-2026-10-21T193103-0400.json)
- [October 23 leaf update watch source](../../../raw/processed/2026-10-23/ai-security-wiki-leaf-update-watch-20261023T000535Z.json)
- [NVD CVE-2026-114386](https://nvd.nist.gov/vuln/detail/CVE-2026-114386)
- [Pydantic AI releases](https://github.com/pydantic/pydantic-ai/releases)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [Pydantic AI web fetch resource exhaustion](pydantic-ai-web-fetch-resource-exhaustion.md)

## Open Questions

- Which primary Pydantic AI advisory or release note confirms the affected package lineage and 0.59.0 remediation?

## Maintenance Notes

- Updated on 2026-10-23 with watcher provenance; no distinct security delta was reported.
- Created on 2026-10-21 from the October 21 topic collector; retain the version-lineage uncertainty until primary evidence resolves it.
