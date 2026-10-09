---
type: "Topic"
title: "LatePoint AI Abilities Cross-Agent Authorization"
description: "Security analysis for CVE-2026-105196 cross-agent disclosure and modification through LatePoint AI Abilities API actions."
tags: ["identity-and-access", "data-and-privacy"]
---

# LatePoint AI Abilities Cross-Agent Authorization

## Current Understanding

The [October 8 topic collector source](../../../raw/processed/2026-10-08/ai-security-wiki-topic-news-collector-2026-10-08T233132Z.json) records [CVE-2026-105196](https://cveawg.mitre.org/api/cve/CVE-2026-105196) for the LatePoint Appointment Booking Plugin AI Abilities API. Broad WordPress/plugin ecosystem context belongs upstream; this page owns the local AI-feature API authorization and customer-data boundary.

The source says LatePoint before 5.6.9, when AI Abilities API is enabled, does not enforce per-record authorization for several actions. Authenticated users with LatePoint Agent role or above can read or modify other agents' profiles and read other agents' bookings and customer details.

## Security Impact

- Threat: agent-role users can cross from their own appointment/customer scope into other agents' data through AI Abilities API actions.
- Affected boundary: LatePoint before 5.6.9, AI Abilities API, LatePoint Agent role and above, agent profile records, bookings, and customer details.
- Exploit or incident status: public CVE Services, NVD, and WPScan references; no confirmed exploitation incident is recorded locally.
- Mitigation state: update LatePoint to 5.6.9 or later and enforce per-record ownership checks on every AI Abilities action.
- Confidence: medium-high from CVE/NVD/WPScan references; medium for exact action names until WPScan or patch details are reconciled.
- Residual risk: AI-feature APIs need the same object-level authorization as ordinary admin endpoints because assistant-facing actions can expose or mutate tenant data.

## Authoritative Sources

- [October 8 topic collector source](../../../raw/processed/2026-10-08/ai-security-wiki-topic-news-collector-2026-10-08T233132Z.json)
- [CVE-2026-105196 record](https://cveawg.mitre.org/api/cve/CVE-2026-105196)
- [NVD CVE-2026-105196](https://nvd.nist.gov/vuln/detail/CVE-2026-105196)
- [WPScan CVE-2026-105196 advisory](https://wpscan.com/vulnerability/b7b6c989-b484-4ad6-844c-1dec1c74c34d/)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [Moodle AI editor image generation capability bypass](moodle-ai-editor-image-generation-capability-bypass.md)
- [MCP Server for WordPress workflow configuration authorization](mcp-server-for-wordpress-workflow-configuration-authorization.md)
- Upstream AI wiki owns broad WordPress/plugin ecosystem coverage.

## Open Questions

- Which exact LatePoint AI Abilities API actions were missing object-level authorization before 5.6.9?

## Maintenance Notes

- Created on 2026-10-09 from the [October 8 topic collector source](../../../raw/processed/2026-10-08/ai-security-wiki-topic-news-collector-2026-10-08T233132Z.json) as an AI-feature API authorization leaf.
