---
type: "Topic"
title: "Ghostjacking Poisoned Operational Log Agent Hijack"
description: "Security analysis for poisoned logs and alerts that hijack agents through trusted operational tools."
tags: ["agent-and-tool-security", "threats-and-attacks", "incident-response"]
---

# Ghostjacking Poisoned Operational Log Agent Hijack

## Current Understanding

Ghostjacking is a demonstrated attack pattern where malicious instructions are planted in logs, alerts, or operational artifacts that an AI agent later reads through trusted tools. The [August 11 topic news collector source](../../../raw/processed/2026-08-11/ai-security-wiki-topic-news-collector-2026-08-11T233115Z.json) records [SecurityWeek reporting](https://www.securityweek.com/ghostjacking-attack-uses-poisoned-logs-to-turn-ai-agents-bad/) on Tenet Security's DEF CON demonstration, including Cloudflare logs, Datadog alerts, and Sentry-to-coding-agent handoffs.

The [August 12 leaf update watch source](../../../raw/processed/2026-08-12/ai-security-wiki-leaf-update-watch-20260813T000229Z.json) reinforces that the demonstrations covered DNS alteration, command execution, credential theft, and cross-agent trust abuse in controlled tests. It preserves the distinction between demonstrated research and confirmed production exploitation.

The [August 13 topic news collector source](../../../raw/processed/2026-08-13/ai-security-wiki-topic-news-collector-2026-08-13T233150Z.json) records [Tenet's August 13 update](https://tenetsecurity.ai/blog/ghostjacking-attacks-agentic-kill-chain/) plus [IANS](https://www.iansresearch.com/resources/all-blogs/post/security-blog/2026/08/13/ghostjacking%27-shows-how-attackers-can-turn-trusted-data-into-ai-commands) and [The Hacker News](https://thehackernews.com/2026/08/threatsday-ghostjacking-ai-attacks.html) corroboration. The updated framing treats poisoned Cloudflare, Datadog, and Sentry telemetry as a full agentic kill chain when agents can both read operational records and write infrastructure, including escalation, exfiltration, persistence, and a Claude Desktop sandbox escape that Tenet reports was remediated before public presentation.

Broad Cloudflare, Datadog, Sentry, [Claude Code](../../../upstream-ai-wiki/developer-tools/claude-code.md), and incident-workflow background belongs upstream. Locally, Ghostjacking matters because blocked or untrusted input can become trusted evidence when faithfully logged, then be consumed by an authorized agent with permission to change DNS, run code, or access cloud and environment secrets. The collected examples are controlled demonstrations, not confirmed production intrusions.

## Security Impact

- Threat: attacker-controlled log or alert content can survive initial blocking and later execute as an agent instruction through operational tools.
- Affected boundary: observability pipelines, SIEM and alert tools, incident handoffs, coding-agent remediation loops, Cloudflare, Datadog, Sentry, build systems, Kubernetes, DNS, and secret stores.
- Exploit or incident status: vendor research demonstration; no confirmed in-the-wild incident in the collected evidence.
- Mitigation state: sanitize untrusted log fields before agent consumption, separate evidence from instructions, require action authorization, and constrain operational tool scopes.
- Confidence: high for the article date and reported demonstration; medium for exact vendor mitigation state until primary Tenet or affected-provider guidance is captured.
- Residual risk: operational tooling often preserves hostile input for forensic fidelity, which conflicts with agent-readable automation unless the boundary is explicit.

## Control Implications

- Mark log, alert, ticket, and trace payloads as untrusted content when passed to agents.
- Strip or escape instruction-like payloads before agents summarize incidents or generate fixes.
- Require separate confirmation for DNS changes, production deployments, code execution, credential reads, and Kubernetes operations triggered from incident context.
- Preserve provenance for each agent-visible observation so responders can distinguish tool output from operator instruction.
- Avoid chaining one AI-generated remediation into another agent's privileged action path without a human or deterministic gate.

## Authoritative Sources

- [August 11 topic news collector source](../../../raw/processed/2026-08-11/ai-security-wiki-topic-news-collector-2026-08-11T233115Z.json)
- [August 12 leaf update watch source](../../../raw/processed/2026-08-12/ai-security-wiki-leaf-update-watch-20260813T000229Z.json)
- [August 13 topic news collector source](../../../raw/processed/2026-08-13/ai-security-wiki-topic-news-collector-2026-08-13T233150Z.json)
- SecurityWeek Ghostjacking report: https://www.securityweek.com/ghostjacking-attack-uses-poisoned-logs-to-turn-ai-agents-bad/
- Tenet Security site: https://tenetsecurity.ai

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [coding agent command approval boundaries](coding-agent-command-approval-boundaries.md)
- [agent network egress controls](agent-network-egress-controls.md)
- [AI coding telemetry redaction controls](../data-and-privacy/ai-coding-telemetry-redaction-controls.md)
- Upstream AI wiki owns broad [Claude Code](../../../upstream-ai-wiki/developer-tools/claude-code.md) context; upstream AI development wiki owns general incident-workflow and coding-agent handoff practice.

## Open Questions

- Which primary Tenet materials or provider advisories define concrete detection and mitigation steps?
- Which operational fields should be sanitized versus preserved but hidden from agent instruction context?

## Maintenance Notes

- Created on 2026-08-11 from the [August 11 topic collector](../../../raw/processed/2026-08-11/ai-security-wiki-topic-news-collector-2026-08-11T233115Z.json) after routing broad observability and coding-agent workflow context upstream.
- Updated on 2026-08-12 from the [August 12 leaf watcher](../../../raw/processed/2026-08-12/ai-security-wiki-leaf-update-watch-20260813T000229Z.json) with additional controlled-demo impact boundaries and exploitation-status caveat.
- Updated on 2026-08-13 from the [August 13 topic collector](../../../raw/processed/2026-08-13/ai-security-wiki-topic-news-collector-2026-08-13T233150Z.json) with poisoned-telemetry kill-chain framing and reported Claude Desktop sandbox-remediation caveat.
