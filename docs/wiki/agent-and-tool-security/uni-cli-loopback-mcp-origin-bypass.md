---
type: "Topic"
title: "Uni-CLI Loopback MCP Origin Bypass"
description: "Security analysis for CVE-2026-58497 browser-to-localhost authority bypass in legacy MCP transport."
tags: ["agent-and-tool-security"]
---

# Uni-CLI Loopback MCP Origin Bypass

## Current Understanding

[CVE-2026-58497](https://nvd.nist.gov/vuln/detail/CVE-2026-58497), captured by the [October 24 collector](../../../raw/processed/2026-10-24/ai-security-wiki-topic-news-collector-2026-10-24T232700Z.json), reports that Uni-CLI legacy loopback JSON-RPC-over-HTTP accepted CORS-simple POSTs without Origin validation, while Streamable HTTP enforced that boundary. This page owns browser-to-local tool authority, not the upstream product catalog.

## Security Impact

- Threat: a malicious web page drives local `tools/call` requests.
- Affected boundary: Uni-CLI before 0.225.2 legacy JSON-RPC MCP transport.
- Exploit or incident status: public disclosure; no local exploitation or incident is recorded.
- Mitigation state: upgrade to 0.225.2, disable legacy listeners where possible, and independently test Origin enforcement.
- Confidence: high for the transport distinction and fixed version.
- Residual risk: one transport's browser protection does not protect an alternate listener.

## Authoritative Sources

- [October 24 collector](../../../raw/processed/2026-10-24/ai-security-wiki-topic-news-collector-2026-10-24T232700Z.json)
- [CVE-2026-58497](https://nvd.nist.gov/vuln/detail/CVE-2026-58497)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [Pydantic AI local web chat origin bypass](pydantic-ai-local-web-chat-origin-bypass.md)

## Open Questions

- Which legacy loopback listeners remain enabled in deployed developer environments?

## Maintenance Notes

- Created on 2026-10-24 from a dated NVD record.
