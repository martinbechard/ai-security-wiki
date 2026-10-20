---
type: "Topic"
title: "SGLang Prefill-Decode SSRF and Scheduler DoS"
description: "Security analysis for CVE-2026-112267 client-controlled bootstrap endpoints in SGLang disaggregated serving."
tags: ["agent-and-tool-security", "infrastructure-and-supply-chain"]
---

# SGLang Prefill-Decode SSRF and Scheduler DoS

## Current Understanding

[CVE-2026-112267](https://nvd.nist.gov/vuln/detail/CVE-2026-112267) reports that SGLang through 0.5.22 accepts client-controlled `bootstrap_host` and `bootstrap_port` values in prefill/decode disaggregation mode. The [October 19 late collector](../../../raw/processed/2026-10-19/ai-security-wiki-topic-news-collector-2026-10-19T193149-0400.json) records that unauthenticated callers can force the decode worker to reach internal addresses and block the shared scheduler loop.

## Security Impact

- Threat: a public inference endpoint can become an internal-network fetch pivot and availability target.
- Affected boundary: SGLang through 0.5.22 `/generate` in prefill/decode disaggregation mode.
- Exploit or incident status: public CVE; active exploitation is not identified.
- Mitigation state: fixed version is not confirmed; authenticate the endpoint and restrict bootstrap destinations to configured peers.
- Confidence: high for the SSRF and scheduler-blocking boundary.
- Residual risk: network topology inputs must never be client-selected on shared serving paths.

## Authoritative Sources

- [October 19 late collector source](../../../raw/processed/2026-10-19/ai-security-wiki-topic-news-collector-2026-10-19T193149-0400.json)
- [CVE-2026-112267](https://nvd.nist.gov/vuln/detail/CVE-2026-112267)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [infrastructure and supply chain](../infrastructure-and-supply-chain/index.md)

## Open Questions

- Which SGLang release validates bootstrap endpoints and isolates scheduler work?

## Maintenance Notes

- Created on 2026-10-20 from the October 19 late collector.
