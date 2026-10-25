---
type: "Topic"
title: "PraisonAI Channel and Listener Authentication"
description: "Security analysis for CVE-2026-56835 through CVE-2026-56837 event and listener authentication failures."
tags: ["identity-and-access", "agent-and-tool-security"]
---

# PraisonAI Channel and Listener Authentication

## Current Understanding

The [October 24 collector](../../../raw/processed/2026-10-24/ai-security-wiki-topic-news-collector-2026-10-24T232700Z.json) records [CVE-2026-56835](https://nvd.nist.gov/vuln/detail/CVE-2026-56835), [CVE-2026-56836](https://nvd.nist.gov/vuln/detail/CVE-2026-56836), and [CVE-2026-56837](https://nvd.nist.gov/vuln/detail/CVE-2026-56837): Slack mention allowlists could be bypassed, a deprecated Recipe HTTP listener lacked authentication, and Linear events could be forged without a secret. This page owns the shared agent-invocation authentication boundary.

## Security Impact

- Threat: untrusted chat events or reachable listeners invoke agents with delegated authority.
- Affected boundary: PraisonAI 3.11.0, 4.5.112, or 4.6.56 before 4.6.59, depending on component.
- Exploit or incident status: public disclosures; no local exploitation or incident is recorded.
- Mitigation state: upgrade to 4.6.59; inventory bot routes, webhook secrets, allowlist parity, and public Recipe listeners.
- Confidence: high for the CVE family and fixed version.
- Residual risk: channel integrations are privileged command channels if event authenticity is optional or inconsistent.

## Authoritative Sources

- [October 24 collector](../../../raw/processed/2026-10-24/ai-security-wiki-topic-news-collector-2026-10-24T232700Z.json)
- [CVE-2026-56835](https://nvd.nist.gov/vuln/detail/CVE-2026-56835)
- [CVE-2026-56836](https://nvd.nist.gov/vuln/detail/CVE-2026-56836)
- [CVE-2026-56837](https://nvd.nist.gov/vuln/detail/CVE-2026-56837)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [PraisonAI AgentMail webhook signature bypass](praisonai-agentmail-webhook-signature-bypass.md)

## Open Questions

- Are disabled or deprecated listeners absent from every production deployment?

## Maintenance Notes

- Created on 2026-10-24 as a closely coupled agent-invocation authentication family.
