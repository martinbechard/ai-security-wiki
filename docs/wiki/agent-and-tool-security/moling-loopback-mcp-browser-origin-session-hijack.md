---
type: "Topic"
title: "MoLing Loopback MCP Browser-Origin Session Hijack"
description: "Security analysis for CVE-2026-62863 browser-mediated loopback MCP authority."
tags: ["agent-and-tool-security", "identity-and-access"]
---

# MoLing Loopback MCP Browser-Origin Session Hijack

## Current Understanding

The [October 30 collector](../../../raw/processed/2026-10-30/ai-security-wiki-topic-news-collector-2026-10-30T232632Z.json) records [CVE-2026-62863](https://nvd.nist.gov/vuln/detail/CVE-2026-62863): MoLing before 0.5.0 exposes unauthenticated SSE MCP endpoints with wildcard CORS, letting a malicious page recover a loopback session ID and issue tool calls that may reach files or commands.

## Security Impact

- Threat: a web origin hijacks local agent-tool authority despite loopback binding.
- Affected boundary: MoLing before 0.5.0, SSE MCP, CORS, session bootstrap, and local tools.
- Exploit or incident status: public CVE; no confirmed exploitation incident is recorded locally.
- Mitigation state: upgrade to 0.5.0 and use authentication with restrictive CORS or disable SSE exposure.
- Confidence and residual risk: high for the disclosed browser boundary; local listening is not an origin control.

## Authoritative Sources

- [October 30 collector](../../../raw/processed/2026-10-30/ai-security-wiki-topic-news-collector-2026-10-30T232632Z.json)
- [NVD CVE-2026-62863](https://nvd.nist.gov/vuln/detail/CVE-2026-62863)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)

## Open Questions

- Does the fixed SSE transport validate origin before it discloses session bootstrap information?

## Maintenance Notes

- Created on 2026-10-30 from NVD-backed collector evidence.
