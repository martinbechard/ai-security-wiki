---
type: "Topic"
title: "Model Processing Data Residency Controls"
description: "Security and privacy analysis for residency boundaries around AI prompts, model processing, outputs, and telemetry."
---

# Model Processing Data Residency Controls

## Current Understanding

The [July 25 topic news collector source](../../../raw/processed/2026-07-25/ai-security-wiki-topic-news-collector-2026-07-25T193052-0400.json) records a 2026-07-24 [Google Cloud release-note](https://docs.cloud.google.com/release-notes) signal that Gemini Enterprise allowlist customers can use Gemini 3.6 Flash in the US multi-region with data residency at rest and machine learning processing.

Broad [Google AI](../../../upstream-ai-wiki/companies/google-ai.md), [Gemini](../../../upstream-ai-wiki/models/gemini-model-family.md), [Vertex AI](../../../upstream-ai-wiki/developer-tools/vertex-ai.md), and [Gemini Enterprise remote MCP](../../../upstream-ai-wiki/mcp-servers/gemini-enterprise-agent-platform-remote-mcp-server.md) context belongs upstream. The local security issue is the privacy boundary: residency claims must cover prompts, retrieved context, outputs, tool traces, logs, and model-processing locations before regulated data is placed into an AI workflow.

## Security Impact

- Threat: regulated or sensitive data can cross an unacceptable region or processing boundary through model calls, retrieval context, tool outputs, or telemetry.
- Affected boundary: Gemini Enterprise Gemini 3.6 Flash, US multi-region data residency at rest, and machine learning processing.
- Exploit or incident status: [official control release](https://docs.cloud.google.com/release-notes); no incident was reported in the [collector source](../../../raw/processed/2026-07-25/ai-security-wiki-topic-news-collector-2026-07-25T193052-0400.json).
- Mitigation state: require residency evidence before placing regulated data into model-processing paths and verify whether logs, traces, connector payloads, and fallback models share the same boundary.
- Confidence: high for release-note facts because the [collector source](../../../raw/processed/2026-07-25/ai-security-wiki-topic-news-collector-2026-07-25T193052-0400.json) cites [official Google Cloud release notes](https://docs.cloud.google.com/release-notes).
- Residual risk: allowlist status and tenant configuration determine whether the residency control applies; surrounding telemetry and tool calls can still leave the intended boundary.

## Authoritative Sources

- [July 25 topic news collector source](../../../raw/processed/2026-07-25/ai-security-wiki-topic-news-collector-2026-07-25T193052-0400.json)
- Google Cloud release notes: https://docs.cloud.google.com/release-notes

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

## Maintenance Notes

- Split from the bundled anomaly/residency draft during July 25 verifier correction; keep this page focused on data residency and model-processing boundaries.
