---
type: "Topic"
title: "req_llm OpenAI WebSocket TLS Token Exposure"
description: "Security analysis for CVE-2026-107685 certificate-validation failure on AI WebSocket sessions."
tags: ["data-and-privacy", "identity-and-access"]
---

# req_llm OpenAI WebSocket TLS Token Exposure

## Current Understanding

[CVE-2026-107685](https://nvd.nist.gov/vuln/detail/CVE-2026-107685), captured by the [October 24 collector](../../../raw/processed/2026-10-24/ai-security-wiki-topic-news-collector-2026-10-24T232700Z.json), reports that `req_llm` WebSocket streaming disabled certificate verification and discarded caller TLS options. Framework and API catalog context belongs upstream; this page owns the bearer-token transport boundary.

## Security Impact

- Threat: an on-path attacker reads or alters streamed model interactions and bearer tokens.
- Affected boundary: `req_llm` 1.9.0 before 1.29.0 on OpenAI Responses, Realtime, or Codex WebSocket paths.
- Exploit or incident status: public disclosure; no local exploitation or incident is recorded.
- Mitigation state: upgrade to 1.29.0 and inventory WebSocket, rather than HTTP-streaming, deployments.
- Confidence: high for the reported release range; primary-maintainer remediation still needs confirmation.
- Residual risk: caller TLS policy cannot protect a client that silently replaces it.

## Authoritative Sources

- [October 24 collector](../../../raw/processed/2026-10-24/ai-security-wiki-topic-news-collector-2026-10-24T232700Z.json)
- [CVE-2026-107685](https://nvd.nist.gov/vuln/detail/CVE-2026-107685)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [data and privacy](index.md)

## Open Questions

- Which deployments use the affected WebSocket client path?

## Maintenance Notes

- Created on 2026-10-24 from a dated NVD record; retain the TLS and token-channel lens locally.
