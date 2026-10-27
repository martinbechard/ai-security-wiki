---
type: "Topic"
title: "vLLM Wildcard CORS Browser Access"
description: "Security analysis for CVE-2026-115917 browser access to unauthenticated vLLM servers through default wildcard CORS."
tags: ["agent-and-tool-security", "identity-and-access"]
---

# vLLM Wildcard CORS Browser Access

## Current Understanding

The October 26 collector records [CVE-2026-115917](https://www.cve.org/CVERecord?id=CVE-2026-115917) in vLLM before 0.32.0. This page owns the browser-to-local or internal model-serving access boundary, distinct from model inference controls.

## Security Impact

- Threat: a malicious webpage can call an unauthenticated vLLM server on localhost, an internal network, or a VPN and read responses or consume GPU capacity.
- Affected boundary: OpenAI-compatible vLLM server default Starlette wildcard CORS before 0.32.0; bearer-authenticated deployments require a usable token to be exposed.
- Exploit or incident status: public advisory; no local exploitation evidence is recorded.
- Mitigation state: upgrade to [0.32.0](https://github.com/vllm-project/vllm/releases/tag/v0.32.0), require bearer authentication, and restrict allowed browser origins and network exposure.
- Confidence: high for the default CORS behavior and scope condition.
- Residual risk: browser-origin policy cannot compensate for exposing unauthenticated inference servers to untrusted browser contexts.

## Authoritative Sources

- [October 26 collector source](../../../raw/processed/2026-10-26/ai-security-wiki-topic-news-collector-2026-10-26T233009Z.json)
- [CVE-2026-115917](https://www.cve.org/CVERecord?id=CVE-2026-115917)
- [vLLM advisory](https://github.com/vllm-project/vllm/security/advisories/GHSA-vvpg-rrww-wpmh)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [vLLM worker egress and KV-cache exposure](vllm-worker-egress-kv-cache-exposure.md)

## Open Questions

- Which local or internal vLLM deployments lack bearer authentication or expose broad CORS origins?

## Maintenance Notes

- Created on 2026-10-26 as a browser-to-inference-server access boundary.
