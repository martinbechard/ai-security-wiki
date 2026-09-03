---
type: "Topic"
title: "LiteLLM Provider Credential Routing Leak"
description: "Security analysis for CVE-2026-84377 LiteLLM proxy provider credential leakage through user-controlled routing fields."
tags: ["data-and-privacy", "infrastructure-and-supply-chain"]
---

# LiteLLM Provider Credential Routing Leak

## Current Understanding

The [September 2 topic collector source](../../../raw/processed/2026-09-02/ai-security-wiki-topic-news-collector-2026-09-02T233120Z.json) records [CVE-2026-84377](https://nvd.nist.gov/vuln/detail/CVE-2026-84377) for LiteLLM proxy versions before 1.88.6 and 1.96.2. Broad LiteLLM routing and provider-selection practice remains upstream; this page owns the local data boundary where configured provider credentials can be forwarded to an attacker-controlled endpoint.

NVD says any authenticated proxy user can redirect outbound provider calls by controlling routing fields such as `api_base`, `base_url`, `model_list`, `fallbacks`, and `litellm_credential_name`, including nested, path, and bracket-notation form-data variants. The issue is a credential-disclosure flaw because the proxy sends configured provider secrets while following attacker-selected routing.

## Security Impact

- Threat: authenticated proxy users can exfiltrate provider credentials by steering model calls to attacker-controlled destinations.
- Affected boundary: LiteLLM proxy before 1.88.6 and 1.96.2; configured provider credentials; OpenAI-compatible routing fields.
- Exploit or incident status: public NVD vulnerability record; no local exploitation evidence is recorded.
- Mitigation state: upgrade to fixed versions, deny per-request provider base overrides unless explicitly trusted, and audit nested routing fields.
- Confidence: high for NVD publication and affected fields; medium for exact vendor remediation until release/advisory evidence is captured locally.
- Residual risk: model proxies concentrate provider keys, so partial validation of routing fields can create cross-provider credential leakage.

## Control Implications

- Keep provider credentials server-side and bind them to approved provider destinations.
- Validate routing configuration after request parsing, including nested objects, paths, and bracket-notation form data.
- Separate user model-selection authority from provider-endpoint authority.

## Authoritative Sources

- [September 2 topic collector source](../../../raw/processed/2026-09-02/ai-security-wiki-topic-news-collector-2026-09-02T233120Z.json)
- [NVD CVE-2026-84377](https://nvd.nist.gov/vuln/detail/CVE-2026-84377)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [data and privacy](index.md)
- [LiteLLM supply-chain secret exposure](../infrastructure-and-supply-chain/litellm-supply-chain-secret-exposure.md)
- [AI provider override trust boundaries](ai-provider-override-trust-boundaries.md)

## Open Questions

- Which LiteLLM release note or vendor advisory confirms the exact fixed-version split and configuration hardening?

## Maintenance Notes

- Created on 2026-09-02 from the [September 2 topic collector](../../../raw/processed/2026-09-02/ai-security-wiki-topic-news-collector-2026-09-02T233120Z.json) as a credential-routing leaf separate from the earlier LiteLLM PyPI compromise.
