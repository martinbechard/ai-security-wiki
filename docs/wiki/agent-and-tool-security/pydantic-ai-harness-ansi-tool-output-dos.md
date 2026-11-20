---
type: "Topic"
title: "Pydantic AI Harness ANSI tool-output denial of service"
description: "Security analysis for CVE-2026-133161, where ANSI stripping can block an agent event loop before output limits apply."
tags: ["agent-and-tool-security", "testing-and-assurance"]
---

# Pydantic AI Harness ANSI tool-output denial of service

## Current Understanding

The [November 20 collector source](../../../raw/processed/2026-11-20/ai-security-wiki-topic-news-collector-2026-11-20T003127Z.json) records [CVE-2026-133161](https://nvd.nist.gov/vuln/detail/CVE-2026-133161). Broad [Pydantic AI framework context](../../../upstream-ai-wiki/agentic-frameworks/pydantic-ai.md) belongs upstream; this leaf owns the untrusted-tool-output and event-loop availability boundary.

When `ToolOutputLimits` uses `strip_ansi=True`, attacker-influenced output can consume the event loop before configured limits are enforced. The [upstream advisory](https://github.com/pydantic/pydantic-ai/security/advisories/GHSA-m4cr-m4qc-9hh3) fixes the condition in pydantic-ai-harness 0.70.0 or later, but Pydantic AI v1 cannot use a harness newer than 0.4.0; that compatibility constraint makes disabling ANSI stripping and bounding output before event-loop processing an important interim control.

## Security Impact

- Threat: shell, file, fetched-page, or MCP output can delay concurrent agent runs through event-loop exhaustion.
- Affected boundary: pydantic-ai-harness `ToolOutputLimits` with `strip_ansi=True` and attacker-influenced tool output.
- Exploit or incident status: public NVD and upstream advisory; no confirmed exploitation or local incident is recorded.
- Mitigation state: use 0.70.0 or later where compatible, otherwise disable ANSI stripping and bound untrusted output before processing.
- Confidence: high for the affected control and fixed harness version; deployments must verify Pydantic AI v1 compatibility.
- Residual risk: output limits applied after expensive normalization do not constrain event-loop work.

## Authoritative Sources

- [November 20 collector source](../../../raw/processed/2026-11-20/ai-security-wiki-topic-news-collector-2026-11-20T003127Z.json)
- [CVE-2026-133161 NVD record](https://nvd.nist.gov/vuln/detail/CVE-2026-133161)
- [Pydantic AI Harness advisory GHSA-m4cr-m4qc-9hh3](https://github.com/pydantic/pydantic-ai/security/advisories/GHSA-m4cr-m4qc-9hh3)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [upstream Pydantic AI framework context](../../../upstream-ai-wiki/agentic-frameworks/pydantic-ai.md)
- [Pydantic AI Harness nested-tool limit bypass](pydantic-ai-harness-nested-tool-limit-bypass.md)

## Open Questions

- Which affected deployments require the Pydantic AI v1 compatibility fallback rather than the fixed harness version?

## Maintenance Notes

- Created on 2026-11-20 from the November 20 collector. Keep the event-loop availability issue separate from nested-tool authorization limits.
