---
type: "Topic"
title: "LangChat Missing Authentication Control Plane"
description: "Security analysis for CVE-2026-111704 missing REST authentication exposing credentials and super-administrator creation."
tags: ["identity-and-access", "data-and-privacy"]
---

# LangChat Missing Authentication Control Plane

## Current Understanding

The [October 17 topic collector source](../../../raw/processed/2026-10-17/ai-security-wiki-topic-news-collector-2026-10-17T193139-0400.json) records [CVE-2026-111704](https://nvd.nist.gov/vuln/detail/CVE-2026-111704): LangChat through commit `2a6285a` lacks a Sa-Token authentication interceptor on REST controllers. Remote callers can access plaintext passwords and LLM provider API keys, create super-admin accounts, and modify or delete data. This page owns the LLM control-plane authentication boundary.

## Security Impact

- Affected boundary: REST controller authentication through commit `2a6285a`.
- Exploit or incident status: public CVE; no exploitation is reported by the source.
- Mitigation state: register and test authentication interception on every controller, rotate exposed secrets, and identify the repairing commit or release.
- Confidence: high for the disclosed missing control; residual risk includes unprotected routes excluded from later interceptor coverage.

## Authoritative Sources

- [October 17 topic collector source](../../../raw/processed/2026-10-17/ai-security-wiki-topic-news-collector-2026-10-17T193139-0400.json)
- [CVE-2026-111704](https://nvd.nist.gov/vuln/detail/CVE-2026-111704)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)

## Open Questions

- What release or commit registers interception for every exposed REST route?

## Maintenance Notes

- Created on 2026-10-17 from CVE-2026-111704.
