---
type: "Topic"
title: "AI Coding Telemetry Redaction Controls"
description: "Security controls for minimizing and redacting sensitive prompt, tool, code, and instruction data in AI coding telemetry."
---

# AI Coding Telemetry Redaction Controls

## Current Understanding

The [July 23 topic news collector source](../../../raw/processed/2026-07-23/ai-security-wiki-topic-news-collector-2026-07-23T193409-0400.json) and [July 24 leaf update watch source](../../../raw/processed/2026-07-24/ai-security-wiki-leaf-update-watch-2026-07-24T200235-0400.json) record [Dash0 AI Coding Insights documentation](https://www.dash0.com/docs/dash0/darkplane/ai-coding/data-privacy) updated on July 23, 2026. The documentation says coding-agent telemetry can include prompt text, code in tool inputs and outputs, secrets pasted into sessions, and system instructions, and it documents source redaction before data leaves the developer machine plus ingestion redaction before storage.

The [August 3 leaf update watch source](../../../raw/processed/2026-08-03/ai-security-wiki-leaf-update-watch-2026-08-03T192131Z.json) records the same Dash0 documentation as updated on 2026-07-29 and adds a narrower error-data boundary: GenAI Attribute Redaction covers conversation content, tool-call arguments and results, and tool-call error messages. Error-message redaction covers span status messages plus exception messages on spans, span events, and logs when telemetry carries a `gen_ai.tool.name` attribute.

The [August 19 leaf update watch source](../../../raw/processed/2026-08-18/ai-security-wiki-leaf-update-watch-20260819T000420Z.json) adds [Dash0 AI Coding Insights overview evidence](https://www.dash0.com/docs/dash0/darkplane/ai-coding) that Claude Code and Cursor telemetry use OpenTelemetry spans, prompts and tool outputs can be source-filtered for privacy, and token counts, model names, durations, and tool names are always captured. The local privacy boundary is therefore split: source filtering can reduce content capture, but operational metadata remains part of the telemetry record.

Broad Dash0 product and developer-observability practice belongs upstream, including general [runtime telemetry](../../../upstream-ai-dev-wiki/application-patterns/user-visible-progress-and-runtime-telemetry.md) patterns. The local control is telemetry minimization for agent and coding-assistant systems: prompt and tool I/O are sensitive by default, and redaction is strongest when sensitive content is removed at source before collection. [AI coding telemetry access controls](ai-coding-telemetry-access-controls.md) owns MCP OAuth, scoped telemetry access, and token-handling guidance for querying observability data.

## Control Implications

- Prefer source-side redaction in the local plugin or agent runtime before telemetry leaves the developer machine.
- Use ingestion-time redaction as a second layer, not the only control for secrets, proprietary code, prompts, or instructions.
- Omit prompt and tool I/O from conversation previews unless collection is explicitly required and governed.
- Treat system instructions and tool outputs as sensitive operational data, not harmless observability metadata.
- Treat tool-call error messages, span status messages, exception messages, span events, and logs as sensitive when they are associated with agent tool execution.
- Record which telemetry fields are never collected, source-redacted, ingestion-redacted, stored, or displayed.

## Authoritative Sources

- [July 23 topic news collector source](../../../raw/processed/2026-07-23/ai-security-wiki-topic-news-collector-2026-07-23T193409-0400.json)
- [July 24 leaf update watch source](../../../raw/processed/2026-07-24/ai-security-wiki-leaf-update-watch-2026-07-24T200235-0400.json)
- [August 3 leaf update watch source](../../../raw/processed/2026-08-03/ai-security-wiki-leaf-update-watch-2026-08-03T192131Z.json)
- [August 19 leaf update watch source](../../../raw/processed/2026-08-18/ai-security-wiki-leaf-update-watch-20260819T000420Z.json)
- Dash0 AI Coding Insights data privacy documentation: https://www.dash0.com/docs/dash0/darkplane/ai-coding/data-privacy

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [data and privacy](index.md)
- [AI coding telemetry access controls](ai-coding-telemetry-access-controls.md)
- [agent and tool security](../agent-and-tool-security/index.md)
- [testing and assurance](../testing-and-assurance/index.md)
- Upstream AI development wiki owns general coding-agent telemetry and observability practice, including [runtime telemetry](../../../upstream-ai-dev-wiki/application-patterns/user-visible-progress-and-runtime-telemetry.md).

## Open Questions

- Which local telemetry sinks collect prompt or tool I/O and need field-level redaction evidence?
- Which local OpenTelemetry spans, events, and logs carry `gen_ai.tool.name` and need explicit error-message redaction tests?

## Maintenance Notes

- Added from the [July 23, 2026 raw collector artifact](../../../raw/processed/2026-07-23/ai-security-wiki-topic-news-collector-2026-07-23T193409-0400.json); enriched from the [July 24 leaf watcher](../../../raw/processed/2026-07-24/ai-security-wiki-leaf-update-watch-2026-07-24T200235-0400.json). Keep the page focused on redaction and minimization controls rather than vendor product positioning.
- Enriched on 2026-08-03 from the [August 3 watcher](../../../raw/processed/2026-08-03/ai-security-wiki-leaf-update-watch-2026-08-03T192131Z.json) with tool-call error-message redaction scope.
- Enriched on 2026-08-19 from the [August 19 watcher](../../../raw/processed/2026-08-18/ai-security-wiki-leaf-update-watch-20260819T000420Z.json) with always-captured AI coding telemetry fields and source-filtering scope.
