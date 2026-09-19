---
type: "Topic"
title: "LightLLM PD Master Registration Auth Bypass"
description: "Security analysis for CVE-2026-93839 unauthenticated LightLLM PD Master node registration."
tags: ["infrastructure-and-supply-chain", "agent-and-tool-security", "data-and-privacy"]
---

# LightLLM PD Master Registration Auth Bypass

## Current Understanding

The [September 18 topic collector source](../../../raw/processed/2026-09-18/ai-security-wiki-topic-news-collector-2026-09-18T233135Z.json) records [CVE-2026-93839](https://cveawg.mitre.org/api/cve/CVE-2026-93839) for LightLLM through 1.2.0. Broad LightLLM runtime background belongs upstream; this page owns the local PD Master registration, prompt-routing, and model-serving control-plane boundary.

The CVE and [VulnCheck advisory](https://www.vulncheck.com/advisories/lightllm-through-1.2.0-missing-authentication-in-pd-master-pd-register-websocket-endpoint) say the PD Master `/pd_register` WebSocket endpoint accepts unauthenticated node registration. An attacker who reaches the endpoint can register arbitrary nodes, receive prompts routed to the attacker's socket, replace legitimate nodes for denial of service, and induce internal requests.

## Security Impact

- Threat: unauthenticated worker registration can redirect prompt traffic, disrupt serving, or create internal-request paths in the model-serving control plane.
- Affected boundary: ModelTC LightLLM through 1.2.0, PD Master `/pd_register` WebSocket endpoint, and peer node registration trust.
- Exploit or incident status: public CVE and advisory; no local exploitation incident is recorded.
- Mitigation state: block public access to PD Master, authenticate worker registration, bind registrations to expected node identity, and monitor unexpected worker endpoints.
- Confidence: high for affected version and endpoint because direct CVE Services metadata is in-window and the advisory names the control-plane behavior.
- Residual risk: model-serving control planes often carry prompts and routing authority, so unauthenticated registration remains data-exposure risk even when no code execution is present.

## Authoritative Sources

- [September 18 topic collector source](../../../raw/processed/2026-09-18/ai-security-wiki-topic-news-collector-2026-09-18T233135Z.json)
- [CVE-2026-93839 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-93839)
- [LightLLM issue 1576](https://github.com/ModelTC/LightLLM/issues/1576)
- [VulnCheck LightLLM PD Master advisory](https://www.vulncheck.com/advisories/lightllm-through-1.2.0-missing-authentication-in-pd-master-pd-register-websocket-endpoint)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [LightLLM Config Server pickle RCE](lightllm-config-server-pickle-rce.md)
- [FastChat worker registration SSRF and model spoofing](../agent-and-tool-security/fastchat-worker-registration-ssrf-model-spoofing.md)

## Open Questions

- Which LightLLM release authenticates PD Master node registration or changes the `/pd_register` exposure model?

## Maintenance Notes

- Created on 2026-09-19 from the [September 18 topic collector source](../../../raw/processed/2026-09-18/ai-security-wiki-topic-news-collector-2026-09-18T233135Z.json).
