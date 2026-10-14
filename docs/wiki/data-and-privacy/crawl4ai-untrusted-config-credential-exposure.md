---
type: "Topic"
title: "Crawl4AI Untrusted-Config Credential Exposure"
description: "Security analysis for CVE-2026-109237, where Crawl4AI config wrapper laundering can expose LLM provider credentials."
tags: ["data-and-privacy", "identity-and-access"]
---

# Crawl4AI Untrusted-Config Credential Exposure

## Current Understanding

The [October 13 topic collector source](../../../raw/processed/2026-10-13/ai-security-wiki-topic-news-collector-2026-10-13T232603Z.json) records [CVE-2026-109237](https://nvd.nist.gov/vuln/detail/CVE-2026-109237) for Crawl4AI 0.9.0 before 0.9.4. Broad Crawl4AI tool context belongs upstream; this page owns the credential exposure and untrusted configuration gate boundary.

The CVE evidence says non-admin API clients can bypass the untrusted-config gate by wrapping forbidden configuration objects in dict-type wrappers. Attackers can submit a laundered `LLMConfig` with `api_token` set to an environment reference through `/config/dump` to read `SECRET_KEY` and provider keys, enabling administrator JWT forgery.

## Security Impact

- Threat: untrusted configuration input can resolve environment-backed LLM credentials and application signing secrets.
- Affected boundary: Crawl4AI 0.9.0 before 0.9.4, `/config/dump`, `LLMConfig`, environment-reference resolution, and non-admin API access.
- Exploit or incident status: public CVE record; no confirmed exploitation incident is recorded locally.
- Mitigation state: update to 0.9.4 or later and reject wrapped forbidden config objects before secret resolution.
- Confidence: high for affected range and credential-exposure path from NVD/CVE evidence.
- Residual risk: crawling and agent infrastructure often concentrates model provider credentials, so config serialization remains a high-value data boundary.

## Control Implications

- Validate deserialized and wrapped configuration objects by semantic type, not only top-level schema shape.
- Never resolve environment-backed secrets for untrusted config dump or preview endpoints.
- Rotate exposed JWT and provider keys after remediation if exploitation is plausible.

## Authoritative Sources

- [October 13 topic collector source](../../../raw/processed/2026-10-13/ai-security-wiki-topic-news-collector-2026-10-13T232603Z.json)
- [NVD CVE-2026-109237](https://nvd.nist.gov/vuln/detail/CVE-2026-109237)
- [CVE Services CVE-2026-109237](https://cveawg.mitre.org/api/cve/CVE-2026-109237)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [data and privacy](index.md)
- [identity and access](../identity-and-access/index.md)

## Open Questions

- Do Crawl4AI exploitation preconditions require authenticated non-admin API access in every affected deployment mode?

## Maintenance Notes

- Created on 2026-10-14 from the October 13 topic collector as an LLM configuration and credential exposure leaf.
