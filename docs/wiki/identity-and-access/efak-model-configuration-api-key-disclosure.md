---
type: "Topic"
title: "EFAK Model-Configuration API Key Disclosure"
description: "Security analysis for CVE-2026-111682 ROLE_USER access to unmasked LLM provider credentials."
tags: ["identity-and-access", "data-and-privacy"]
---

# EFAK Model-Configuration API Key Disclosure

## Current Understanding

The [October 17 topic collector source](../../../raw/processed/2026-10-17/ai-security-wiki-topic-news-collector-2026-10-17T193139-0400.json) records [CVE-2026-111682](https://nvd.nist.gov/vuln/detail/CVE-2026-111682): EFAK 5.0.0 through 5.1.0 insufficiently authorizes `/api/model-config` endpoints, allowing any `ROLE_USER` account to retrieve unmasked LLM provider API keys. General EFAK context belongs upstream; this page owns provider-secret access control.

## Security Impact

- Affected boundary: model-configuration REST authorization in versions 5.0.0 through 5.1.0.
- Exploit or incident status: public CVE; no exploitation is reported by the source.
- Mitigation state: restrict secret-bearing fields to administrators, redact by default, rotate exposed keys, and upgrade when a fixed release is confirmed.
- Confidence: high for the documented role and response exposure; residual risk includes provider-account spend and data exposure.

## Authoritative Sources

- [October 17 topic collector source](../../../raw/processed/2026-10-17/ai-security-wiki-topic-news-collector-2026-10-17T193139-0400.json)
- [CVE-2026-111682](https://nvd.nist.gov/vuln/detail/CVE-2026-111682)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)

## Open Questions

- Which release removes unmasked provider credentials from `ROLE_USER` responses?

## Maintenance Notes

- Created on 2026-10-17 from CVE-2026-111682.
