---
type: "Topic"
title: "LiteLLM Semantic Cache Tenant Isolation Bypass"
description: "Security analysis for CVE-2026-89032, where LiteLLM semantic cache scoping could disclose cross-tenant responses and tool-call payloads."
tags: ["data-and-privacy", "agent-and-tool-security"]
---

# LiteLLM Semantic Cache Tenant Isolation Bypass

## Current Understanding

The [September 26 topic collector source](../../../raw/processed/2026-09-26/ai-security-wiki-topic-news-collector-2026-09-26T233301Z.json) records [CVE-2026-89032](https://nvd.nist.gov/vuln/detail/CVE-2026-89032) for BerriAI LiteLLM before 1.101.0-rc.1. Broad LiteLLM proxy context belongs upstream; this page owns the local shared semantic-cache confidentiality and cross-principal tool-call replay boundary.

The collector records a tenant-isolation bypass caused by a metadata-key mismatch between tenant-scope calculation and metadata variable naming. Authenticated users with valid virtual keys could send semantically similar prompts and retrieve other tenants' cached responses, including sensitive data. Agentic front ends could also auto-execute cached `function_call` or `tool_calls` payloads under the wrong principal.

## Security Impact

- Threat: shared semantic caches can leak tenant data or replay tool calls across principals when cache scope metadata is inconsistent.
- Affected boundary: LiteLLM before 1.101.0-rc.1, semantic cache lookup, virtual keys, cached responses, and cached function/tool-call payloads.
- Exploit or incident status: disclosed CVE; no confirmed exploitation is recorded in the collector.
- Mitigation state: upgrade to 1.101.0-rc.1 or later, disable shared semantic caching where tenant metadata cannot be proven, and bind cached tool-call payloads to the original principal and tool policy.
- Confidence: medium-high from NVD-backed collector evidence; primary advisory should be reconciled for exact configuration impact.
- Residual risk: semantic similarity can make cache hits non-obvious during audit, so tenant IDs and tool-call authority need to be logged as cache-key material.

## Authoritative Sources

- [September 26 topic collector source](../../../raw/processed/2026-09-26/ai-security-wiki-topic-news-collector-2026-09-26T233301Z.json)
- [NVD CVE-2026-89032](https://nvd.nist.gov/vuln/detail/CVE-2026-89032)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [data and privacy](index.md)
- [LiteLLM](../../../upstream-ai-wiki/developer-tools/litellm.md)
- [LiteLLM provider credential routing leak](litellm-provider-credential-routing-leak.md)
- [Spring AI semantic cache cross-context leakage](spring-ai-semantic-cache-cross-context-leakage.md)

## Open Questions

- Which LiteLLM cache backends and metadata settings are affected by CVE-2026-89032?

## Maintenance Notes

- Created on 2026-09-27 from the [September 26 topic collector source](../../../raw/processed/2026-09-26/ai-security-wiki-topic-news-collector-2026-09-26T233301Z.json) as the semantic-cache tenant-isolation leaf.
