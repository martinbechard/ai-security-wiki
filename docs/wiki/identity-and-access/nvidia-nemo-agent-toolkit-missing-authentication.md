---
type: "Topic"
title: "NVIDIA NeMo Agent Toolkit Missing Authentication"
description: "Security analysis for CVE-2026-65145 in NeMo Agent Toolkit."
tags: ["identity-and-access", "agent-and-tool-security"]
---

# NVIDIA NeMo Agent Toolkit Missing Authentication

## Current Understanding

The [October 28 collector source](../../../raw/processed/2026-10-28/ai-security-wiki-topic-news-collector-2026-10-28T233111Z.json) records [NVIDIA's PSIRT bulletin](https://github.com/NVIDIA/product-security/blob/main/2026/5912/5912.md) for [CVE-2026-65145](https://cveawg.mitre.org/api/cve/CVE-2026-65145). Broad NVIDIA and NeMo context belongs upstream; this page owns exposed agent-runtime authentication risk.

## Security Impact

- Threat: unauthenticated critical functions can enable code execution, privilege escalation, tampering, denial of service, or disclosure.
- Affected boundary: NeMo Agent Toolkit 1.0-1.8.0; fixed in 1.9.0.
- Exploit or incident status: public vendor bulletin; no confirmed local incident is recorded.
- Mitigation state: patch the deployed line and inventory externally reachable service endpoints.
- Confidence: high; residual risk depends on deployment exposure and custom authentication.

## Control Implications

- Require fail-closed authentication for critical agent-runtime functions.
- Test unauthenticated service endpoints after upgrading.

## Authoritative Sources

- [October 28 collector source](../../../raw/processed/2026-10-28/ai-security-wiki-topic-news-collector-2026-10-28T233111Z.json)
- [NVIDIA PSIRT bulletin](https://github.com/NVIDIA/product-security/blob/main/2026/5912/5912.md)
- [CVE-2026-65145](https://cveawg.mitre.org/api/cve/CVE-2026-65145)

## Related Code

- Not yet identified.
## Related Tests

- Not yet identified.
## Related Backlog Items

- Not yet identified.
## Related Wiki Pages

- [identity and access](index.md)
- [NVIDIA NeMo Agent Toolkit SQL Injection](../infrastructure-and-supply-chain/nvidia-nemo-agent-toolkit-sql-injection.md)
## Open Questions

- Which deployments expose vulnerable NeMo endpoints to untrusted callers?
## Maintenance Notes

- Created on 2026-10-28 from the October 28 collector as a distinct authentication boundary.
