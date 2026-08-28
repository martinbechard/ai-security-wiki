---
type: "Topic"
title: "one-api Channel Pinning Provider Key Bypass"
description: "Security analysis for CVE-2026-81027 low-privilege channel selection exposing operator provider credentials."
tags: ["identity-and-access", "data-and-privacy"]
---

# one-api Channel Pinning Provider Key Bypass

## Current Understanding

CVE-2026-81027 covers one-api through 0.6.10, where token-authenticated callers can select provider channels without the same authorization check on every channel-pinning path. Broad one-api gateway coverage belongs upstream; this page owns the local provider-credential delegation and channel authorization boundary, with provenance from the [August 26 topic news collector source](../../../raw/processed/2026-08-26/ai-security-wiki-topic-news-collector-2026-08-26T233123Z.json) and [August 27 leaf update watch source](../../../raw/processed/2026-08-27/ai-security-wiki-leaf-update-watch-20260828T000238Z.json).

The vulnerable branch is a URL path-parameter channel selector that does not enforce the role check used by the API-key suffix channel selector:

- [`middleware/auth.go`](https://github.com/songquanpeng/one-api/blob/main/middleware/auth.go) permits channel selection through either an API-key suffix or a URL path parameter.
- The suffix path requires `model.IsAdmin`, while the path-parameter branch sets the selected channel from `c.Param("channelid")` without a role check.
- Token-authenticated low-privilege callers can increment channel identifiers; the distributor loads the channel without scoping it to the caller's user or group.
- The outbound request then uses the selected channel's stored `Authorization` header and base URL, bypassing group restrictions and model allowlists.

The durable local rule is that AI gateways must authorize model routing, provider-key use, channel pinning, and model allowlists as one decision, not as separate string parameters after token possession has been accepted.

## Security Impact

- Threat: a low-privilege gateway token can borrow provider credentials and model access assigned to another group or operator channel.
- Affected boundary: one-api through 0.6.10; channel pinning; provider API keys; group restrictions; model allowlists.
- Exploit or incident status: public NVD, issue, and VulnCheck evidence; no local incident evidence is recorded.
- Mitigation state: no fixed version is recorded in the raw source; bind channel selection to caller authorization and audit provider-key use by user, group, model, and channel.
- Confidence: high for advisory mechanics from NVD and referenced public issue; medium for remediation state.
- Residual risk: AI gateways can turn one provider key into a shared high-value credential if routing parameters are not authorization-checked.

## Authoritative Sources

- [August 27 leaf update watch source](../../../raw/processed/2026-08-27/ai-security-wiki-leaf-update-watch-20260828T000238Z.json)
- [CVE-2026-81027 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-81027)
- [August 26 topic news collector source](../../../raw/processed/2026-08-26/ai-security-wiki-topic-news-collector-2026-08-26T233123Z.json)
- [NVD CVE-2026-81027](https://nvd.nist.gov/vuln/detail/CVE-2026-81027)
- [one-api issue 2410](https://github.com/songquanpeng/one-api/issues/2410)
- [VulnCheck advisory](https://www.vulncheck.com/advisories/one-api-through-0.6.10-missing-authorization-on-url-parameter-channel-pinning)

## Related Code

- [one-api `middleware/auth.go`](https://github.com/songquanpeng/one-api/blob/main/middleware/auth.go)

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

- Updated on 2026-08-28 with August 27 leaf-update evidence for CVE-2026-81027.
- Created on 2026-08-27 from the [August 26 topic collector](../../../raw/processed/2026-08-26/ai-security-wiki-topic-news-collector-2026-08-26T233123Z.json) as an AI gateway provider-key delegation leaf.
