---
type: "Topic"
title: "AiSOC MSSP Tenant Portfolio Authorization Bypass"
description: "Security analysis for CVE-2026-103054 arbitrary tenant assignment in AiSOC MSSP portfolios."
tags: ["identity-and-access", "data-and-privacy"]
---

# AiSOC MSSP Tenant Portfolio Authorization Bypass

## Current Understanding

The [October 1 topic collector source](../../../raw/processed/2026-10-01/ai-security-wiki-topic-news-collector-2026-10-01T233213Z.json) records [CVE-2026-103054](https://cveawg.mitre.org/api/cve/CVE-2026-103054) for AiSOC versions before 12.0.0. This page owns the local tenant-portfolio authorization and cross-tenant security-data exposure boundary.

The CVE record says authenticated users can add arbitrary tenants to portfolios they own through `add_tenants_to_portfolio`. Attackers can submit tenant UUIDs, claim unclaimed tenants, and read their security alerts, incidents, and posture metrics without consent.

## Security Impact

- Threat: authenticated users can claim tenants and access cross-tenant security data.
- Affected boundary: AiSOC before 12.0.0, MSSP module, `add_tenants_to_portfolio`, tenant UUID ownership, portfolio membership, alerts, incidents, and posture metrics.
- Exploit or incident status: public CVE record; no confirmed active exploitation is recorded in the source.
- Mitigation state: update to AiSOC 12.0.0 or later and enforce tenant ownership or consent checks before portfolio membership changes.
- Confidence: high for public CVE identity and behavior; medium for deployment-specific compensating controls until vendor advisory detail is captured.
- Residual risk: tenant portfolio systems need server-side ownership verification because UUID possession is not authorization.

## Authoritative Sources

- [October 1 topic collector source](../../../raw/processed/2026-10-01/ai-security-wiki-topic-news-collector-2026-10-01T233213Z.json)
- [CVE-2026-103054 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-103054)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [data and privacy](../data-and-privacy/index.md)
- [LiteLLM semantic cache tenant isolation bypass](../data-and-privacy/litellm-semantic-cache-tenant-isolation-bypass.md)

## Open Questions

- Which AiSOC advisory or release note documents the exact authorization check added for tenant portfolio membership?

## Maintenance Notes

- Created on 2026-10-02 from the [October 1 topic collector source](../../../raw/processed/2026-10-01/ai-security-wiki-topic-news-collector-2026-10-01T233213Z.json) after splitting the AiSOC CVE cluster into item-level leaves.
