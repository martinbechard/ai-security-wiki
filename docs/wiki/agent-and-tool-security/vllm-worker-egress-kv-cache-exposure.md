---
type: "Topic"
title: "vLLM Worker Egress and KV-Cache Exposure"
description: "Security analysis for CVE-2026-116176 request-header-controlled worker egress in vLLM."
tags: ["agent-and-tool-security", "data-and-privacy"]
---

# vLLM Worker Egress and KV-Cache Exposure

## Current Understanding

The [October 25 topic collector source](../../../raw/processed/2026-10-25/ai-security-wiki-topic-news-collector-2026-10-25T232906Z.json) records [CVE-2026-116176](https://nvd.nist.gov/vuln/detail/CVE-2026-116176): before 0.24.0, a caller can embed a decode address in `X-Request-Id`, making a `P2pNcclConnector` prefill worker connect to an attacker-controlled host and potentially disclose an NCCL unique ID or KV-cache tensors. This page owns the worker-egress and inference-state boundary.

## Security Impact

- Threat: request metadata controls an outbound worker connection.
- Affected boundary: vLLM 0.9.2 before 0.24.0, `X-Request-Id`, `P2pNcclConnector`, worker ZMQ connections, NCCL, and KV-cache state.
- Exploit or incident status: public CVE disclosure; no local incident is recorded.
- Mitigation state: upgrade to 0.24.0 or later, reject untrusted routing addresses, and constrain worker egress independently of request parsing.
- Confidence: high for the disclosed SSRF and worker-blocking boundary.
- Residual risk: internal routability does not make a caller-controlled endpoint trusted, and cache material may contain co-tenant prompt state.

## Authoritative Sources

- [October 25 topic collector source](../../../raw/processed/2026-10-25/ai-security-wiki-topic-news-collector-2026-10-25T232906Z.json)
- [CVE-2026-116176](https://nvd.nist.gov/vuln/detail/CVE-2026-116176)
- [vLLM GHSA-vfp2-c8pq-v6h6](https://github.com/vllm-project/vllm/security/advisories/GHSA-vfp2-c8pq-v6h6)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [agent network egress controls](agent-network-egress-controls.md)

## Open Questions

- Which vLLM deployment modes enable `P2pNcclConnector`, and can network policy block untrusted worker destinations independently of the patch?

## Maintenance Notes

- Created on 2026-10-25 from CVE-2026-116176 as a separate egress and cross-tenant state-exposure boundary.
