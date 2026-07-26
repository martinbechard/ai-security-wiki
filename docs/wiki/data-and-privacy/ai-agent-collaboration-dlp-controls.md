---
type: "Topic"
title: "AI Agent Collaboration DLP Controls"
description: "Security analysis for sensitive-data and risky-content controls in email and collaboration workflows used by AI agents."
---

# AI Agent Collaboration DLP Controls

## Current Understanding

The [July 25 topic news collector source](../../../raw/processed/2026-07-25/ai-security-wiki-topic-news-collector-2026-07-25T193052-0400.json) records [Darktrace](https://www.darktrace.com/blog/when-guardrails-break-why-securing-ai-requires-behavioral-detection-and-autonomous-containment) describing Darktrace / EMAIL capability expansion for email and collaboration workflows used by humans and AI agents. The concrete controls named in the source are:

- inbox analysis for risky content;
- just-in-time training banners;
- custom sensitive-data detection for DLP workflows;
- risk posture dashboards spanning Email, Microsoft Teams, Slack, and Zoom.

Broad Darktrace product positioning belongs upstream or outside this local wiki. The local security issue is the data and delegated-authority boundary around collaboration systems: agent-facing email, chat, and meeting tools often carry prompts, approvals, credentials, instructions, and sensitive business data.

## Security Impact

- Threat: phishing, prompt injection, risky approvals, or sensitive-data movement through collaboration channels can influence AI agents or leak AI-workflow context.
- Affected boundary: Darktrace / EMAIL, Adaptive Human Defense, email, Microsoft Teams, Slack, Zoom, custom sensitive-data detection, and workflow risk posture dashboards.
- Exploit or incident status: product control release and product-positioned security research; no incident was reported in the [collector source](../../../raw/processed/2026-07-25/ai-security-wiki-topic-news-collector-2026-07-25T193052-0400.json).
- Mitigation state: use collaboration DLP and risky-content controls as defense-in-depth around agent-facing prompts, approvals, credentials, and tool outputs.
- Confidence: medium-high for concrete control deltas; keep broader efficacy claims source-attributed because the evidence is product-positioned.
- Residual risk: DLP controls can miss context-dependent secrets, tool outputs, or prompt-injection payloads unless tuned for agent workflows.

## Authoritative Sources

- [July 25 topic news collector source](../../../raw/processed/2026-07-25/ai-security-wiki-topic-news-collector-2026-07-25T193052-0400.json)
- Darktrace blog: https://www.darktrace.com/blog/when-guardrails-break-why-securing-ai-requires-behavioral-detection-and-autonomous-containment

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [data and privacy](index.md)
- [AI coding telemetry redaction controls](ai-coding-telemetry-redaction-controls.md)
- [agent and tool security](../agent-and-tool-security/index.md)
- [identity and access](../identity-and-access/index.md)
- Upstream AI development wiki owns general collaboration workflow practice.

## Open Questions

- Which sensitive-data detectors should be tuned specifically for AI prompts, tool outputs, connector approvals, and agent instructions?

## Maintenance Notes

- Added from the [July 25 topic news collector source](../../../raw/processed/2026-07-25/ai-security-wiki-topic-news-collector-2026-07-25T193052-0400.json); keep claims limited to concrete controls named by the source.
