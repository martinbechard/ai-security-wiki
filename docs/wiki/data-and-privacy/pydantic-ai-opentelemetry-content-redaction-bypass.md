---
type: "Topic"
title: "Pydantic AI OpenTelemetry Content Redaction Bypass"
description: "Security analysis for Pydantic AI OpenTelemetry instrumentation leaking content despite include_content=false."
tags: ["data-and-privacy", "agent-and-tool-security"]
---

# Pydantic AI OpenTelemetry Content Redaction Bypass

## Current Understanding

The [October 8 topic collector source](../../../raw/processed/2026-10-08/ai-security-wiki-topic-news-collector-2026-10-08T233132Z.json) records Pydantic AI OpenTelemetry redaction flaws where content can appear in telemetry despite `include_content=False`. Broad Pydantic AI observability context belongs upstream; this page owns the local telemetry confidentiality boundary.

[CVE-2026-107291](https://cveawg.mitre.org/api/cve/CVE-2026-107291) covers exception events on tool and agent-run spans including content when content capture is disabled. [CVE-2026-107293](https://cveawg.mitre.org/api/cve/CVE-2026-107293) covers retry prompt content not being redacted. The CVE records cite fixed releases 1.107.6/2.44.0 for exception-event content and 1.107.4/2.27.1 for retry prompt content.

## Security Impact

- Threat: prompts, tool inputs, retry content, or agent-run data can reach telemetry backends even when operators configure content redaction.
- Affected boundary: Pydantic AI and `pydantic-ai-slim`, OpenTelemetry instrumentation, `include_content=False`, tool spans, agent run spans, exception events, and retry prompts.
- Exploit or incident status: public CVE Services records and GitHub advisories; no confirmed incident is recorded locally.
- Mitigation state: upgrade to fixed Pydantic AI releases and treat telemetry exports as sensitive until redaction is verified with failure-path and retry-path tests.
- Confidence: high for affected versions and fixed releases from CVE Services; medium for data classes leaked in specific applications until local span schemas are inspected.
- Residual risk: redaction controls must cover error and retry paths, not only successful model and tool calls.

## Authoritative Sources

- [October 8 topic collector source](../../../raw/processed/2026-10-08/ai-security-wiki-topic-news-collector-2026-10-08T233132Z.json)
- [CVE-2026-107291 record](https://cveawg.mitre.org/api/cve/CVE-2026-107291)
- [GHSA-4x9p-g9wm-8q7f](https://github.com/pydantic/pydantic-ai/security/advisories/GHSA-4x9p-g9wm-8q7f)
- [CVE-2026-107293 record](https://cveawg.mitre.org/api/cve/CVE-2026-107293)
- [GHSA-3gh4-cghq-f8v4](https://github.com/pydantic/pydantic-ai/security/advisories/GHSA-3gh4-cghq-f8v4)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [data and privacy](index.md)
- [AI coding telemetry redaction controls](ai-coding-telemetry-redaction-controls.md)
- [AI coding telemetry access controls](ai-coding-telemetry-access-controls.md)
- Upstream AI wiki owns broad [Pydantic AI framework coverage](../../../upstream-ai-wiki/agentic-frameworks/pydantic-ai.md).

## Open Questions

- Which span attributes and event fields are safe to export after the fixed Pydantic AI releases, and do downstream collectors preserve redaction?

## Maintenance Notes

- Created on 2026-10-09 from the [October 8 topic collector source](../../../raw/processed/2026-10-08/ai-security-wiki-topic-news-collector-2026-10-08T233132Z.json) as a telemetry-confidentiality leaf.
