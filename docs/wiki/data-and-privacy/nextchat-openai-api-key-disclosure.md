---
type: "Topic"
title: "NextChat OpenAI API Key Disclosure"
description: "Security analysis for CVE-2026-82639 NextChat proxy URL validation and OpenAI API key forwarding."
tags: ["data-and-privacy", "identity-and-access"]
---

# NextChat OpenAI API Key Disclosure

## Current Understanding

The [August 30 topic collector source](../../../raw/processed/2026-08-30/ai-security-wiki-topic-news-collector-2026-08-30T233055Z.json) records [CVE-2026-82639](https://nvd.nist.gov/vuln/detail/CVE-2026-82639) for NextChat 2.15.8 through 2.16.1. Broad NextChat and [OpenAI](../../../upstream-ai-wiki/companies/openai.md) provider background belongs upstream; this page owns the local proxy-host validation and provider-key disclosure boundary.

NVD and the [VulnCheck advisory](https://www.vulncheck.com/advisories/nextchat-2.15.8-through-2.16.1-openai-api-key-disclosure) say `x-base-url` validation used substring matching rather than hostname parsing. An attacker-controlled URL containing `api.openai.com` could receive the server's OpenAI API key in the `Authorization` header.

## Security Impact

- Threat: provider API keys can be forwarded to attacker-controlled infrastructure through weak proxy URL validation.
- Affected boundary: NextChat 2.15.8 through 2.16.1 according to NVD; the collector notes VulnCheck describes NextChat <= 2.16.1.
- Exploit or incident status: public vulnerability disclosure; no local exploitation incident is recorded.
- Mitigation state: parse and compare canonical hostnames, deny user-controlled provider proxy destinations by default, rotate exposed OpenAI keys, and audit outbound proxy logs.
- Confidence: high for vulnerability identity and affected range; medium for the lower-bound conflict because the two captured sources phrase it differently.
- Residual risk: provider API keys carry model access, spend authority, and data-exfiltration potential when proxy layers forward them outside intended hosts.

## Control Implications

- Validate provider proxy destinations with URL parsing, DNS and redirect handling, and exact hostname allow-lists.
- Treat provider-key forwarding as identity delegation that needs audit evidence.
- Preserve source disagreement about affected lower bounds until maintainer release notes settle it.

## Authoritative Sources

- [August 30 topic collector source](../../../raw/processed/2026-08-30/ai-security-wiki-topic-news-collector-2026-08-30T233055Z.json)
- [NVD CVE-2026-82639](https://nvd.nist.gov/vuln/detail/CVE-2026-82639)
- [VulnCheck advisory](https://www.vulncheck.com/advisories/nextchat-2.15.8-through-2.16.1-openai-api-key-disclosure)
- [NextChat issue 6814](https://github.com/ChatGPTNextWeb/NextChat/issues/6814)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [data and privacy](index.md)
- [identity and access](../identity-and-access/index.md)
- [AI provider override trust boundaries](ai-provider-override-trust-boundaries.md)

## Open Questions

- Does maintainer evidence confirm the exact lower bound for affected NextChat releases?

## Maintenance Notes

- Created on 2026-08-30 from the [August 30 topic collector](../../../raw/processed/2026-08-30/ai-security-wiki-topic-news-collector-2026-08-30T233055Z.json) as a provider-key disclosure leaf.
