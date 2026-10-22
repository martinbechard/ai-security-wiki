---
type: "Topic"
title: "IBM ContextForge OAuth Registration SSRF"
description: "Security analysis for CVE-2026-8355 OAuth token-endpoint SSRF in IBM ContextForge MCP Gateway registration."
tags: ["agent-and-tool-security", "identity-and-access"]
---

# IBM ContextForge OAuth Registration SSRF

## Current Understanding

The [October 21 topic collector source](../../../raw/processed/2026-10-21/ai-security-wiki-topic-news-collector-2026-10-21T193103-0400.json) records [CVE-2026-8355](https://nvd.nist.gov/vuln/detail/CVE-2026-8355) for IBM ContextForge MCP Gateway 0.1.0 through 1.0.5. Broad ContextForge and MCP background belongs upstream; this leaf owns the OAuth-registration SSRF boundary, distinct from the existing [tool-invocation DNS rebinding](ibm-contextforge-tool-invocation-dns-rebinding.md) finding.

## Security Impact

- Threat: an authenticated gateway creator can submit an OAuth token URL that causes client credentials to be posted to internal, metadata, or localhost services.
- Affected boundary: OAuth-enabled ContextForge gateway registration through 1.0.5; part of an unparsable response can be reflected in an error.
- Exploit or incident status: public CVE and IBM advisory; no local exploitation evidence is recorded.
- Mitigation state: apply IBM advisory guidance, allowlist token endpoints, and block internal and metadata address ranges.
- Confidence: high for the range and mechanism because NVD links IBM's PSIRT advisory.
- Residual risk: validation at registration alone may not protect later redirect or DNS-resolution changes.

## Authoritative Sources

- [October 21 topic collector source](../../../raw/processed/2026-10-21/ai-security-wiki-topic-news-collector-2026-10-21T193103-0400.json)
- [NVD CVE-2026-8355](https://nvd.nist.gov/vuln/detail/CVE-2026-8355)
- [IBM support advisory 7285723](https://www.ibm.com/support/pages/node/7285723)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [agent network egress controls](agent-network-egress-controls.md)
- [IBM ContextForge A2A DNS rebinding](ibm-contextforge-a2a-dns-rebinding.md)

## Open Questions

- Which IBM release remediates CVE-2026-8355, and does the fix revalidate redirects and resolved addresses?

## Maintenance Notes

- Created on 2026-10-21 from the October 21 topic collector; preserve its distinction from invocation-time DNS-rebinding advisories.
