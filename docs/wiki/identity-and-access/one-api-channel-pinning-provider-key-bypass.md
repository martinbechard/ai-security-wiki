---
type: "Topic"
title: "one-api Channel Pinning Provider Key Bypass"
description: "Security analysis for CVE-2026-81027 low-privilege channel selection exposing operator provider credentials."
tags: ["identity-and-access", "data-and-privacy"]
---

# one-api Channel Pinning Provider Key Bypass

## Current Understanding

The [August 26 topic news collector source](../../../raw/processed/2026-08-26/ai-security-wiki-topic-news-collector-2026-08-26T233123Z.json) records CVE-2026-81027 for one-api through 0.6.10. Broad one-api gateway coverage belongs upstream; this page owns the local provider-credential delegation and channel authorization boundary.

The collector records a missing role check on a URL path-parameter branch for channel pinning. Any account with a valid API token could select a provider channel by identifier, causing upstream requests to use an operator-configured provider key the caller was not granted. That bypassed group restrictions and model allowlists. The durable local rule is that AI gateways must authorize model routing, provider-key use, channel pinning, and model allowlists as one decision, not as separate string parameters after token possession has been accepted.

## Security Impact

- Threat: a low-privilege gateway token can borrow provider credentials and model access assigned to another group or operator channel.
- Affected boundary: one-api through 0.6.10; channel pinning; provider API keys; group restrictions; model allowlists.
- Exploit or incident status: public NVD, issue, and VulnCheck evidence; no local incident evidence is recorded.
- Mitigation state: no fixed version is recorded in the raw source; bind channel selection to caller authorization and audit provider-key use by user, group, model, and channel.
- Confidence: high for advisory mechanics from NVD and referenced public issue; medium for remediation state.
- Residual risk: AI gateways can turn one provider key into a shared high-value credential if routing parameters are not authorization-checked.

## Authoritative Sources

- [August 26 topic news collector source](../../../raw/processed/2026-08-26/ai-security-wiki-topic-news-collector-2026-08-26T233123Z.json)
- [NVD CVE-2026-81027](https://nvd.nist.gov/vuln/detail/CVE-2026-81027)
- [one-api issue 2410](https://github.com/songquanpeng/one-api/issues/2410)
- [VulnCheck advisory](https://www.vulncheck.com/advisories/one-api-through-0.6.10-missing-authorization-on-url-parameter-channel-pinning)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [downstream agent authorization context](downstream-agent-authorization-context.md)
- [AI provider override trust boundaries](../data-and-privacy/ai-provider-override-trust-boundaries.md)
- [final query authorization for AI data tools](../agent-and-tool-security/final-query-authorization-for-ai-data-tools.md)

## Open Questions

- Which one-api release first fixes CVE-2026-81027, and does the fix bind channel pinning to group and model authorization on every parameter path?

## Maintenance Notes

- Created on 2026-08-27 from the [August 26 topic collector](../../../raw/processed/2026-08-26/ai-security-wiki-topic-news-collector-2026-08-26T233123Z.json) as an AI gateway provider-key delegation leaf.
