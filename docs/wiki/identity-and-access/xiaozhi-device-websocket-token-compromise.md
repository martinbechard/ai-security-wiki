---
type: "Topic"
title: "Xiaozhi Device WebSocket Token Compromise"
description: "Security analysis for CVE-2026-111623 unauthenticated device token retrieval exposing AI runtime data and credentials."
tags: ["identity-and-access", "data-and-privacy"]
---

# Xiaozhi Device WebSocket Token Compromise

## Current Understanding

The [October 17 topic collector source](../../../raw/processed/2026-10-17/ai-security-wiki-topic-news-collector-2026-10-17T193139-0400.json) records [CVE-2026-111623](https://nvd.nist.gov/vuln/detail/CVE-2026-111623): Xiaozhi-esp32-server-java through 6.1.0 allows unauthenticated callers to obtain device WebSocket tokens through `/api/device/ota`. The token then permits access to private role prompts, conversation history, LLM/STT/TTS credentials, and device metadata changes. This page owns the device-token trust boundary.

## Security Impact

- Affected boundary: unauthenticated device-token issuance and device WebSocket access through version 6.1.0.
- Exploit or incident status: public CVE; no exploitation is reported by the source.
- Mitigation state: authenticate token issuance, bind tokens to device identity and audience, rotate compromised credentials, and upgrade when a fixed release is confirmed.
- Confidence: high for the disclosed consequences; residual risk includes bearer-token replay across device or tenant boundaries.

## Authoritative Sources

- [October 17 topic collector source](../../../raw/processed/2026-10-17/ai-security-wiki-topic-news-collector-2026-10-17T193139-0400.json)
- [CVE-2026-111623](https://nvd.nist.gov/vuln/detail/CVE-2026-111623)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)

## Open Questions

- Which release authenticates `/api/device/ota` and invalidates preexisting WebSocket tokens?

## Maintenance Notes

- Created on 2026-10-17 from CVE-2026-111623.
