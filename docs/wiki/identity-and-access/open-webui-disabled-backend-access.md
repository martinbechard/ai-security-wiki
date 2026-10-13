---
type: "Topic"
title: "Open WebUI Disabled Backend Access"
description: "Security analysis for CVE-2026-109296, where explicit backend indexes can reach disabled Open WebUI model-provider backends."
tags: ["identity-and-access", "data-and-privacy"]
---

# Open WebUI Disabled Backend Access

## Current Understanding

The [October 12 topic collector source](../../../raw/processed/2026-10-12/ai-security-wiki-topic-news-collector-2026-10-12T233447Z.json) records [CVE-2026-109296](https://nvd.nist.gov/vuln/detail/CVE-2026-109296) for Open WebUI before 0.11.4. Broad Open WebUI product context belongs upstream; this page owns the local provider-authorization boundary where disabled backends must remain unreachable even when a caller supplies an explicit backend index.

The CVE evidence says authenticated users can reach disabled Ollama and OpenAI-compatible provider backends through listing routes that accept explicit backend indexes. Requests can trigger configured API-key use and expose backend version or connection information.

## Security Impact

- Threat: authenticated users can enumerate or invoke disabled model-provider connections.
- Affected boundary: Open WebUI before 0.11.4, Ollama and OpenAI-compatible listing routes, explicit backend indexes, disabled-provider state, and configured provider API keys.
- Exploit or incident status: public CVE, GitHub advisory, and AI Sec Watch evidence; no exploitation incident is recorded locally.
- Mitigation state: update to 0.11.4 or later and enforce enabled-state authorization before any provider request uses stored credentials.
- Confidence: high for affected range and route class from NVD-backed source evidence.
- Residual risk: provider connection registries need object, capability, and enabled-state checks at every path, not only in UI-visible provider lists.

## Control Implications

- Treat disabled provider state as an authorization decision that must be enforced server-side.
- Avoid backend indexes as authority; resolve provider identity, tenant, and enabled state together before dispatch.
- Log attempts to reach disabled provider indexes because they can indicate credential-probing behavior.

## Authoritative Sources

- [October 12 topic collector source](../../../raw/processed/2026-10-12/ai-security-wiki-topic-news-collector-2026-10-12T233447Z.json)
- [NVD CVE-2026-109296](https://nvd.nist.gov/vuln/detail/CVE-2026-109296)
- [GitHub advisory GHSA-hm62-64q2-6gxw](https://github.com/open-webui/open-webui/security/advisories/GHSA-hm62-64q2-6gxw)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [Open WebUI chat channel authorization](open-webui-chat-channel-authorization.md)
- [Open WebUI OAuth cookie forwarding](../data-and-privacy/open-webui-oauth-cookie-forwarding.md)

## Open Questions

- Which Open WebUI 0.11.4 regression test proves disabled Ollama and OpenAI-compatible provider indexes cannot trigger credentialed backend requests?

## Maintenance Notes

- Created on 2026-10-13 from the October 12 topic collector as a provider enabled-state authorization leaf.
