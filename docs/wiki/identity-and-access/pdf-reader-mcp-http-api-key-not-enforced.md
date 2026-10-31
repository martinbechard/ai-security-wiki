---
type: "Topic"
title: "PDF Reader MCP HTTP API-Key Not Enforced"
description: "Security analysis for CVE-2026-62264 authentication telemetry without enforcement."
tags: ["identity-and-access", "agent-and-tool-security"]
---

# PDF Reader MCP HTTP API-Key Not Enforced

## Current Understanding

The [October 30 collector](../../../raw/processed/2026-10-30/ai-security-wiki-topic-news-collector-2026-10-30T232632Z.json) records [CVE-2026-62264](https://nvd.nist.gov/vuln/detail/CVE-2026-62264): PDF Reader MCP 2.2.0 through before 3.0.1 reports HTTP API-key authentication as enabled but does not validate `X-API-Key`, leaving the default broad listener able to read host-accessible PDFs.

## Security Impact

- Threat: unauthenticated callers use the tool process's file-read authority.
- Affected boundary: PDF Reader MCP 2.2.0 before 3.0.1, HTTP authentication, and file reads.
- Exploit or incident status: public CVE; no confirmed exploitation incident is recorded locally.
- Mitigation state: upgrade to 3.0.1, bind HTTP narrowly, and rotate exposed keys.
- Confidence and residual risk: high for the disclosed authentication failure; misleading telemetry can delay detection.

## Authoritative Sources

- [October 30 collector](../../../raw/processed/2026-10-30/ai-security-wiki-topic-news-collector-2026-10-30T232632Z.json)
- [NVD CVE-2026-62264](https://nvd.nist.gov/vuln/detail/CVE-2026-62264)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)

## Open Questions

- Does 3.0.1 test missing and malformed API-key rejection on every HTTP route?

## Maintenance Notes

- Created on 2026-10-30 from NVD-backed collector evidence.
