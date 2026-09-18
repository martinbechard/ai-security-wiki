---
type: "Topic"
title: "Sentry Seer Telemetry Agent Execution"
description: "Security analysis for CVE-2026-90999 telemetry-to-agent execution risk in Sentry Seer automation."
tags: ["agent-and-tool-security", "incident-response"]
---

# Sentry Seer Telemetry Agent Execution

## Current Understanding

The [September 17 topic collector source](../../../raw/processed/2026-09-17/ai-security-wiki-topic-news-collector-2026-09-17T233119Z.json) records CVE-2026-90999 for Sentry Seer. Broad Sentry product and incident-automation workflow context belongs upstream or to the AI development wiki; this page owns the local trust boundary where unauthenticated telemetry can become code executed by an agent in a privileged automation environment.

The CVE summary describes a multi-stage trust-boundary violation without listing a specific version range in the fetched evidence. The local rule is that incident events, stack traces, attachments, reproduction hints, and telemetry-derived patches must remain untrusted input until parsed, sandboxed, and reviewed.

## Security Impact

- Threat: attacker-controlled telemetry can cross into privileged agent automation and execute code without the attacker having victim Sentry, repository, or infrastructure access.
- Affected boundary: Sentry Seer privileged automation environment, telemetry ingestion, code-generation or repair-agent execution, and repository or infrastructure actions reachable from that agent.
- Exploit or incident status: public CVE record; no local exploitation incident is recorded.
- Mitigation state: treat telemetry as untrusted, isolate repair agents from production credentials, require allowlisted reproduction commands, and capture primary advisory evidence for affected versions.
- Confidence: medium for version and patch detail because the fetched CVE summary is concise; high for the telemetry-to-agent trust-boundary pattern.
- Residual risk: observability-driven automation can invert trust if it lets externally supplied events author code, commands, prompts, or reproduction artifacts for a privileged agent.

## Authoritative Sources

- [September 17 topic collector source](../../../raw/processed/2026-09-17/ai-security-wiki-topic-news-collector-2026-09-17T233119Z.json)
- [CVE-2026-90999 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-90999)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [incident response](../incident-response/index.md)
- [agent runtime security evidence](../testing-and-assurance/agent-runtime-security-evidence.md)

## Open Questions

- Which Sentry advisory or release notes identify affected Seer versions and the exact remediation boundary?

## Maintenance Notes

- Created on 2026-09-18 from the [September 17 topic collector](../../../raw/processed/2026-09-17/ai-security-wiki-topic-news-collector-2026-09-17T233119Z.json) as a telemetry-to-agent execution boundary leaf.
