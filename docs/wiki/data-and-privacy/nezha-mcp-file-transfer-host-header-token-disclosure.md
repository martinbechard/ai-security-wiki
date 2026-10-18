---
type: "Topic"
title: "Nezha MCP File-Transfer Host Header Token Disclosure"
description: "Security analysis for CVE-2026-111385 attacker-controlled MCP transfer URLs exposing one-time download tokens."
tags: ["data-and-privacy", "agent-and-tool-security"]
---

# Nezha MCP File-Transfer Host Header Token Disclosure

## Current Understanding

The [October 17 topic collector source](../../../raw/processed/2026-10-17/ai-security-wiki-topic-news-collector-2026-10-17T193139-0400.json) records [CVE-2026-111385](https://nvd.nist.gov/vuln/detail/CVE-2026-111385): Nezha 2.1.0 through before 2.3.15 builds MCP file-transfer URLs from an unvalidated `Host` header. An attacker can redirect a transfer or capture and replay its one-time download token. General Nezha background belongs upstream; this page owns transfer-URL authority and token confidentiality.

## Security Impact

- Affected boundary: MCP file-transfer URL construction in Nezha 2.1.0 through before 2.3.15.
- Exploit or incident status: public CVE; no exploitation is reported by the source.
- Mitigation state: upgrade to 2.3.15 or later if release evidence confirms that boundary; derive public transfer origins from trusted configuration, not request headers.
- Confidence: high for the reported version boundary; residual risk includes token replay where public-origin validation is incomplete.

## Authoritative Sources

- [October 17 topic collector source](../../../raw/processed/2026-10-17/ai-security-wiki-topic-news-collector-2026-10-17T193139-0400.json)
- [CVE-2026-111385](https://nvd.nist.gov/vuln/detail/CVE-2026-111385)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [data and privacy](index.md)

## Open Questions

- Does 2.3.15 bind every file-transfer origin to trusted deployment configuration?

## Maintenance Notes

- Created on 2026-10-17 from CVE-2026-111385.
