---
type: "Topic"
title: "NVIDIA NeMo Agent Toolkit SQL Injection"
description: "Security analysis for CVE-2026-65151 in NeMo Agent Toolkit."
tags: ["infrastructure-and-supply-chain", "agent-and-tool-security"]
---

# NVIDIA NeMo Agent Toolkit SQL Injection

## Current Understanding

The [October 28 collector source](../../../raw/processed/2026-10-28/ai-security-wiki-topic-news-collector-2026-10-28T233111Z.json) records [NVIDIA's PSIRT bulletin](https://github.com/NVIDIA/product-security/blob/main/2026/5912/5912.md) for [CVE-2026-65151](https://cveawg.mitre.org/api/cve/CVE-2026-65151). Broad NVIDIA and NeMo context belongs upstream; this page owns the distinct query-construction and data-access boundary.

## Security Impact

- Threat: attacker-controlled input can alter database queries.
- Affected boundary: NeMo Agent Toolkit 1.4-1.6; fixed in 1.7.0.
- Exploit or incident status: public vendor bulletin; no confirmed local incident is recorded.
- Mitigation state: upgrade to 1.7.0 or later and validate query parameterization.
- Confidence: high; residual risk depends on exposure and database privileges.

## Control Implications

- Use parameterized queries and a least-privilege database identity.
- Regression-test malicious input at agent-to-data boundaries after upgrading.

## Authoritative Sources

- [October 28 collector source](../../../raw/processed/2026-10-28/ai-security-wiki-topic-news-collector-2026-10-28T233111Z.json)
- [NVIDIA PSIRT bulletin](https://github.com/NVIDIA/product-security/blob/main/2026/5912/5912.md)
- [CVE-2026-65151](https://cveawg.mitre.org/api/cve/CVE-2026-65151)

## Related Code

- Not yet identified.
## Related Tests

- Not yet identified.
## Related Backlog Items

- Not yet identified.
## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [NVIDIA NeMo Agent Toolkit Missing Authentication](../identity-and-access/nvidia-nemo-agent-toolkit-missing-authentication.md)
## Open Questions

- Which exposed NeMo deployments connect to privileged databases?
## Maintenance Notes

- Created on 2026-10-28 from the October 28 collector as a distinct query boundary.
