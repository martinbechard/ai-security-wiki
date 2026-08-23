---
type: "Topic"
title: "Infracost Terraform Token Forwarding Leak"
description: "Security analysis for CVE-2026-71494 Infracost leaking Terraform Cloud or registry tokens to attacker-controlled hosts."
tags: ["infrastructure-and-supply-chain", "identity-and-access"]
---

# Infracost Terraform Token Forwarding Leak

## Current Understanding

The [August 22 topic news collector source](../../../raw/processed/2026-08-22/ai-security-wiki-topic-news-collector-2026-08-22T233049Z.json) records CVE-2026-71494 for Infracost before 0.10.45. This page owns the local CI and agent credential-boundary issue where untrusted Terraform input can influence token-bearing destinations.

The [NVD record](https://nvd.nist.gov/vuln/detail/CVE-2026-71494) describes configured Terraform Cloud or registry tokens being attached to destination hostnames derived from untrusted Terraform input. In CI runs that scan attacker-controlled Terraform with secrets available, tokens can be exposed to attacker-controlled hosts.

## Security Impact

- Threat: repository-controlled Terraform can redirect token-bearing Infracost requests to attacker-controlled infrastructure.
- Affected boundary: Infracost before 0.10.45 Terraform Cloud and registry token handling during untrusted Terraform scans.
- Exploit or incident status: public NVD record; no local exploitation evidence is recorded.
- Mitigation state: update to 0.10.45 or later, bind credentials to verified hosts, and run untrusted infrastructure scans in secret-free contexts.
- Confidence: medium-high because the collector cites NVD; primary vendor advisory links were not captured.
- Residual risk: cost-estimation and coding-agent workflows often run on pull requests where untrusted repository content and CI secrets must remain separated.

## Authoritative Sources

- [August 22 topic news collector source](../../../raw/processed/2026-08-22/ai-security-wiki-topic-news-collector-2026-08-22T233049Z.json)
- [NVD CVE-2026-71494](https://nvd.nist.gov/vuln/detail/CVE-2026-71494)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [development agent credential isolation](../identity-and-access/development-agent-credential-isolation.md)
- [production agent identity and access controls](../identity-and-access/production-agent-identity-and-access-controls.md)

## Open Questions

- Which primary Infracost advisory or release note confirms the exact host-binding fix for CVE-2026-71494?

## Maintenance Notes

- Created on 2026-08-22 from the [August 22 topic news collector source](../../../raw/processed/2026-08-22/ai-security-wiki-topic-news-collector-2026-08-22T233049Z.json) as the credential-forwarding member of the Infracost 0.10.45 advisory set.
