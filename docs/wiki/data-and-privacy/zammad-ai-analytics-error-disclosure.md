---
type: "Topic"
title: "Zammad AI Analytics Error Disclosure"
description: "Security analysis for CVE-2026-63204, where Zammad AI analytics run identifiers could disclose provider error messages."
tags: ["data-and-privacy", "identity-and-access"]
---

# Zammad AI Analytics Error Disclosure

## Current Understanding

The [September 26 topic collector source](../../../raw/processed/2026-09-26/ai-security-wiki-topic-news-collector-2026-09-26T233301Z.json) records CVE-2026-63204 for Zammad before 7.1.2. Broad Zammad product context belongs upstream; this page owns the local AI analytics run ownership and provider-error disclosure boundary.

## Security Impact

- Threat: callers can use AI analytics run identifiers to view provider error messages outside their intended authorization.
- Affected boundary: Zammad before 7.1.2, AI analytics run identifiers, provider error messages, and authorization checks.
- Exploit or incident status: disclosed CVE; no confirmed exploitation is recorded in the collector.
- Mitigation state: upgrade to Zammad 7.1.2 or later and enforce run ownership before showing provider errors.
- Confidence: medium-high from NVD-backed collector evidence; vendor release notes should be checked for exact endpoint details.
- Residual risk: provider errors can expose prompts, model configuration, tenant identifiers, or credential hints.

## Authoritative Sources

- [September 26 topic collector source](../../../raw/processed/2026-09-26/ai-security-wiki-topic-news-collector-2026-09-26T233301Z.json)
- [NVD CVE-2026-63204](https://nvd.nist.gov/vuln/detail/CVE-2026-63204)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [data and privacy](index.md)
- [identity and access](../identity-and-access/index.md)

## Open Questions

- Which Zammad AI analytics endpoint exposed provider error messages before 7.1.2?

## Maintenance Notes

- Created on 2026-09-27 from the [September 26 topic collector source](../../../raw/processed/2026-09-26/ai-security-wiki-topic-news-collector-2026-09-26T233301Z.json) after verifier correction split the Zammad release family.
