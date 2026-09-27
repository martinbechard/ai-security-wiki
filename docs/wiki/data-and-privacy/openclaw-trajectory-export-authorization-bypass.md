---
type: "Topic"
title: "OpenClaw Trajectory Export Authorization Bypass"
description: "Security analysis for OpenClaw trajectory export authorization bypass."
tags: ["data-and-privacy", "identity-and-access"]
---

# OpenClaw Trajectory Export Authorization Bypass

## Current Understanding

The [September 26 topic collector source](../../../raw/processed/2026-09-26/ai-security-wiki-topic-news-collector-2026-09-26T233301Z.json) records an OpenClaw CVE where trajectory export authorization could be bypassed. Broad OpenClaw workflow context belongs upstream; this page owns the local trajectory-export confidentiality boundary.

## Security Impact

- Threat: a caller can export agent trajectories without the expected owner or resource authorization.
- Affected boundary: OpenClaw versions before the applicable fixed release, trajectory export, session transcripts, tool-call histories, prompts, and model outputs.
- Exploit or incident status: disclosed CVE cluster; no confirmed exploitation is recorded in the collector.
- Mitigation state: update OpenClaw, enforce owner checks on export routes, and audit exported trajectory artifacts.
- Confidence: medium from NVD-backed collector evidence; exact CVE-to-patch mapping needs primary advisory reconciliation.
- Residual risk: trajectories can include prompts, tool outputs, credentials, and task context, so export routes need the same controls as chat-history and log export.

## Authoritative Sources

- [September 26 topic collector source](../../../raw/processed/2026-09-26/ai-security-wiki-topic-news-collector-2026-09-26T233301Z.json)
- [OpenClaw agent authority and approval cluster](../agent-and-tool-security/openclaw-agent-authority-and-approval-cluster.md)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [data and privacy](index.md)
- [AI coding telemetry access controls](ai-coding-telemetry-access-controls.md)

## Open Questions

- Which OpenClaw CVE and fixed release enforce trajectory export authorization?

## Maintenance Notes

- Created on 2026-09-27 from the [September 26 topic collector source](../../../raw/processed/2026-09-26/ai-security-wiki-topic-news-collector-2026-09-26T233301Z.json) after verifier correction split the OpenClaw cluster by control boundary.
