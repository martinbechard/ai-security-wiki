---
type: "Topic"
title: "TREK LLM Base URL SSRF"
description: "Security analysis for CVE-2026-77294, where TREK allowed attacker-controlled llm_base_url values in AI-assisted import flows."
tags: ["agent-and-tool-security", "data-and-privacy"]
---

# TREK LLM Base URL SSRF

## Current Understanding

The [September 24 topic collector source](../../../raw/processed/2026-09-24/ai-security-wiki-topic-news-collector-2026-09-24T233211Z.json) records [CVE-2026-77294](https://cveawg.mitre.org/api/cve/CVE-2026-77294) for TREK before 3.3.0. Broad TREK product context belongs upstream if needed; this page owns the local user-configurable LLM endpoint SSRF boundary.

When `LLM_PARSING` is enabled, an authenticated user with write permission to a trip can store an attacker-controlled `llm_base_url`. The AI-assisted import path consumes that value through OpenAI-compatible, Anthropic-compatible, and Ollama-format clients without applying the SSRF guard, allowing internal service discovery and possible metadata exposure.

## Security Impact

- Threat: a user-controlled LLM endpoint can make TREK server-side AI parsing traffic reach internal services or link-local cloud metadata.
- Affected boundary: TREK before 3.3.0, `LLM_PARSING`, `llm_base_url`, AI-assisted import, OpenAI-compatible client, Anthropic client, and Ollama-format client paths.
- Exploit or incident status: public CVE, NVD, GitHub Security Advisory, and fixed release evidence; no local in-the-wild exploitation evidence is recorded.
- Mitigation state: upgrade to TREK 3.3.0 or later, apply SSRF guards to all LLM endpoint clients, and restrict configurable model endpoints to approved hosts.
- Confidence: high for affected version and endpoint trust boundary; medium for credential-exposure impact because it depends on reachable cloud metadata or internal services.
- Residual risk: user-configurable LLM endpoints are server-side request targets and need the same controls as webhook or connector URLs.

## Authoritative Sources

- [September 24 topic collector source](../../../raw/processed/2026-09-24/ai-security-wiki-topic-news-collector-2026-09-24T233211Z.json)
- [CVE-2026-77294 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-77294)
- [NVD CVE-2026-77294](https://nvd.nist.gov/vuln/detail/CVE-2026-77294)
- [GHSA-fmq9-ggh3-647p](https://github.com/liketrek/TREK/security/advisories/GHSA-fmq9-ggh3-647p)
- [TREK v3.3.0 release](https://github.com/liketrek/TREK/releases/tag/v3.3.0)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [TREK MCP trip summary scope bypass](../identity-and-access/trek-mcp-trip-summary-scope-bypass.md)
- [AI provider override trust boundaries](../data-and-privacy/ai-provider-override-trust-boundaries.md)
- [agent network egress controls](agent-network-egress-controls.md)

## Open Questions

- Does TREK 3.3.0 apply an allowlist, URL parser hardening, or centralized SSRF guard to all LLM client formats?

## Maintenance Notes

- Created on 2026-09-25 from the [September 24 topic collector source](../../../raw/processed/2026-09-24/ai-security-wiki-topic-news-collector-2026-09-24T233211Z.json) after splitting LLM endpoint SSRF from MCP OAuth scope enforcement.
