---
type: "Topic"
title: "Open WebUI automation scheduler denial of service"
description: "Security analysis for Open WebUI 0.11.0 automation recurrence event-loop exhaustion."
tags: ["agent-and-tool-security"]
---

# Open WebUI automation scheduler denial of service

## Current Understanding

The [September 8 topic collector source](../../../raw/processed/2026-09-08/ai-security-wiki-topic-news-collector-2026-09-08T233200Z.json) records an in-window NVD update for Open WebUI automation recurrence event-loop exhaustion fixed in 0.11.0. Broad automation-product context belongs upstream; this page owns the scheduler availability boundary for assistant-triggered recurring actions.

## Security Impact

- Threat: crafted recurrence or automation state can exhaust the service event loop and disrupt shared assistant availability.
- Affected boundary: Open WebUI versions before 0.11.0; automation scheduler recurrence handling.
- Exploit or incident status: public NVD/CVE/GitHub advisory evidence; no local exploitation incident is recorded.
- Mitigation state: upgrade to Open WebUI 0.11.0 or later and bound recurrence expansion, event-loop work, and scheduler input validation.
- Confidence: high for NVD update timing and fixed-version signal; medium for exact exploit prerequisites.
- Residual risk: assistant automation features can become service-wide DoS paths when user-configurable recurrence is evaluated synchronously or without limits.

## Authoritative Sources

- [September 8 topic collector source](../../../raw/processed/2026-09-08/ai-security-wiki-topic-news-collector-2026-09-08T233200Z.json)
- [Open WebUI v0.11.0 release](https://github.com/open-webui/open-webui/releases/tag/v0.11.0)
- [CVE-2026-70488 NVD record](https://nvd.nist.gov/vuln/detail/CVE-2026-70488)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [AI agent interaction transparency controls](ai-agent-interaction-transparency-controls.md)

## Open Questions

- No open wiki questions are recorded for this topic.

## Maintenance Notes

- Created on 2026-09-08 from the September 8 topic collector after verifier correction split the Open WebUI release wave into focused security-boundary leaves.
