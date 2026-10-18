---
type: "Topic"
title: "SparkyFitness AI Service SSRF and Prompt Disclosure"
description: "Security analysis for CVE-2026-102923 arbitrary AI-service URLs reaching internal services and exposing prompts."
tags: ["data-and-privacy", "agent-and-tool-security"]
---

# SparkyFitness AI Service SSRF and Prompt Disclosure

## Current Understanding

The [October 17 topic collector source](../../../raw/processed/2026-10-17/ai-security-wiki-topic-news-collector-2026-10-17T193139-0400.json) records [CVE-2026-102923](https://nvd.nist.gov/vuln/detail/CVE-2026-102923): SparkyFitness before 1.6.0 accepts arbitrary custom AI-service URLs in chat and label-scan flows. An authenticated user can cause server-side POST requests, probe internal services, transmit a bearer value, and disclose the AI system prompt. Product coverage belongs upstream; this page owns provider-destination authorization and prompt confidentiality.

## Security Impact

- Affected boundary: custom AI-service settings in versions before 1.6.0.
- Exploit or incident status: public CVE; no exploitation is reported by the source.
- Mitigation state: upgrade to 1.6.0 or later if release evidence confirms the fix; enforce outbound destination allowlists and do not forward credentials to user-selected origins.
- Confidence: high for the disclosed boundary; residual risk includes DNS rebinding or redirect paths that bypass simple hostname checks.

## Authoritative Sources

- [October 17 topic collector source](../../../raw/processed/2026-10-17/ai-security-wiki-topic-news-collector-2026-10-17T193139-0400.json)
- [CVE-2026-102923](https://nvd.nist.gov/vuln/detail/CVE-2026-102923)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [data and privacy](index.md)

## Open Questions

- Does 1.6.0 validate redirects and resolved IP destinations as well as configured hostnames?

## Maintenance Notes

- Created on 2026-10-17 from CVE-2026-102923.
