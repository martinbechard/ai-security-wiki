---
type: "Topic"
title: "Model Processing Data Residency Controls"
description: "Security and privacy analysis for residency boundaries around AI prompts, model processing, outputs, and telemetry."
---

# Model Processing Data Residency Controls

## Current Understanding

The [July 25 topic news collector source](../../../raw/processed/2026-07-25/ai-security-wiki-topic-news-collector-2026-07-25T193052-0400.json) records a 2026-07-24 [Google Cloud release-note](https://docs.cloud.google.com/release-notes) signal that Gemini Enterprise allowlist customers can use Gemini 3.6 Flash in the US multi-region with data residency at rest and machine learning processing.

Broad [Google AI](../../../upstream-ai-wiki/companies/google-ai.md), [Gemini](../../../upstream-ai-wiki/models/gemini-model-family.md), [Vertex AI](../../../upstream-ai-wiki/developer-tools/vertex-ai.md), and [Gemini Enterprise remote MCP](../../../upstream-ai-wiki/mcp-servers/gemini-enterprise-agent-platform-remote-mcp-server.md) context belongs upstream. The local security issue is the privacy boundary: residency claims must cover prompts, retrieved context, outputs, tool traces, logs, and model-processing locations before regulated data is placed into an AI workflow.

The [July 26 leaf update watch source](../../../raw/processed/2026-07-26/ai-security-wiki-leaf-update-watch-2026-07-26T200447-0400.json) adds a related 2026-07-24 Google Cloud signal for API Hub MCP regional endpoint selection and GA endpoint routing. That evidence belongs here only as endpoint-routing boundary context:

- global MCP endpoints need policy treatment for convenience-oriented routing;
- regional processing endpoints need separate policy treatment for residency-sensitive routing;
- agent-sent API metadata, prompts, and tool outputs need explicit location controls before crossing regions.

The [August 9 leaf update watch source](../../../raw/processed/2026-08-09/ai-security-wiki-leaf-update-watch-20260809T000323Z.json) adds [Cloud Monitoring MCP documentation](https://docs.cloud.google.com/monitoring/docs/use-monitoring-mcp) evidence that [Model Armor](../../../upstream-ai-wiki/products/google-cloud-model-armor.md) routing can differ by MCP server and may affect in-use and in-transit residency when the server jurisdiction and Model Armor support differ.

The local control remains data-path verification. Residency-sensitive workloads should confirm that these paths share the expected region boundary:

- prompt inspection;
- response inspection;
- telemetry;
- MCP tool payloads.

The [August 10 leaf update watch source](../../../raw/processed/2026-08-09/ai-security-wiki-leaf-update-watch-20260810T000240Z.json) adds [Model Armor release notes](https://docs.cloud.google.com/model-armor/release-notes) for data residency support for in-use and in-transit data in `australia-southeast2` and `asia-northeast3`, with limited feature support. This is a Model Armor residency control, not an API Hub MCP feature change. The local residency implication is that Model Armor-backed MCP or agent gateway deployments need region-specific evidence for inspection, logging, and unsupported feature fallback before sensitive data is routed through those controls.

## Security Impact

- Threat: regulated or sensitive data can cross an unacceptable region or processing boundary through model calls, retrieval context, tool outputs, or telemetry.
- Affected boundary: Gemini Enterprise Gemini 3.6 Flash, US multi-region data residency at rest, machine learning processing, API Hub MCP endpoint region selection, Model Armor in-use and in-transit processing in `australia-southeast2` and `asia-northeast3`, and agent-to-Google Cloud service routing.
- Exploit or incident status: [official control release](https://docs.cloud.google.com/release-notes); no incident was reported in the [collector source](../../../raw/processed/2026-07-25/ai-security-wiki-topic-news-collector-2026-07-25T193052-0400.json).
- Mitigation state: require residency evidence before placing regulated data into model-processing paths and verify whether logs, traces, connector payloads, Model Armor routing, MCP prompt and response inspection, limited-support features, and fallback models share the same boundary.
- Confidence: high for release-note facts because the [collector source](../../../raw/processed/2026-07-25/ai-security-wiki-topic-news-collector-2026-07-25T193052-0400.json) cites [official Google Cloud release notes](https://docs.cloud.google.com/release-notes).
- Residual risk: allowlist status, region availability, limited feature support, and tenant configuration determine whether the residency control applies; surrounding telemetry and tool calls can still leave the intended boundary.

## Authoritative Sources

- [July 25 topic news collector source](../../../raw/processed/2026-07-25/ai-security-wiki-topic-news-collector-2026-07-25T193052-0400.json)
- [July 26 leaf update watch source](../../../raw/processed/2026-07-26/ai-security-wiki-leaf-update-watch-2026-07-26T200447-0400.json)
- [August 9 leaf update watch source](../../../raw/processed/2026-08-09/ai-security-wiki-leaf-update-watch-20260809T000323Z.json)
- [August 10 leaf update watch source](../../../raw/processed/2026-08-09/ai-security-wiki-leaf-update-watch-20260810T000240Z.json)
- Google Cloud release notes: https://docs.cloud.google.com/release-notes
- Cloud Monitoring MCP documentation: https://docs.cloud.google.com/monitoring/docs/use-monitoring-mcp

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [data and privacy](index.md)
- [ATO-approved sensitive data use](ato-approved-sensitive-data-use.md)
- [AI coding telemetry redaction controls](ai-coding-telemetry-redaction-controls.md)
- [governance and compliance](../governance-and-compliance/index.md)
- Upstream AI wiki owns broad Google AI, Gemini, Vertex AI, and Gemini Enterprise context.

## Open Questions

- Which logs, traces, connector payloads, and fallback paths are covered by the Gemini Enterprise residency boundary?
- Which API Hub MCP endpoint policies distinguish global endpoint convenience from residency-sensitive regional processing?
- Which MCP servers route Model Armor inspection through regions that differ from the server jurisdiction?

## Maintenance Notes

- Split from the bundled anomaly/residency draft during July 25 verifier correction; enriched from the [July 26 leaf watcher](../../../raw/processed/2026-07-26/ai-security-wiki-leaf-update-watch-2026-07-26T200447-0400.json). Keep this page focused on data residency and model-processing boundaries.
- Updated on 2026-08-09 from the [August 9 watcher](../../../raw/processed/2026-08-09/ai-security-wiki-leaf-update-watch-20260809T000323Z.json) with Cloud Monitoring MCP and Model Armor in-use or in-transit residency caveats.
- Updated on 2026-08-09 from the [August 10 watcher](../../../raw/processed/2026-08-09/ai-security-wiki-leaf-update-watch-20260810T000240Z.json) with `australia-southeast2` and `asia-northeast3` Model Armor residency evidence and limited-support caveats.
