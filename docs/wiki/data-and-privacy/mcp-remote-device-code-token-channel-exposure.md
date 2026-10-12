---
type: "Topic"
title: "mcp-remote Device-Code Token Channel Exposure"
description: "Security analysis for CVE-2026-108716 mcp-remote device-code authorization over non-loopback HTTP endpoints."
tags: ["data-and-privacy", "identity-and-access"]
---

# mcp-remote Device-Code Token Channel Exposure

## Current Understanding

The [October 11 topic collector source](../../../raw/processed/2026-10-11/ai-security-wiki-topic-news-collector-2026-10-11T233138Z.json) records [CVE-2026-108716](https://nvd.nist.gov/vuln/detail/CVE-2026-108716) for mcp-remote 0.8.0 through 0.14.3. Broad mcp-remote package context belongs upstream; this page owns the local confidentiality boundary for OAuth device-code flows used by MCP clients.

The CVE evidence says mcp-remote sends client secrets and receives tokens over non-loopback HTTP endpoints during device-code authorization. That converts an MCP authorization bootstrap path into a token exposure channel when the endpoint is reachable by network observers or untrusted intermediaries.

## Security Impact

- Threat: MCP authorization tokens and client secrets can cross a cleartext or non-local channel during device-code setup.
- Affected boundary: mcp-remote 0.8.0 through 0.14.3, device-code authorization, client secrets, tokens, non-loopback HTTP endpoints, and remote MCP credentials.
- Exploit or incident status: public NVD and CVE Services records; no confirmed exploitation incident is recorded locally.
- Mitigation state: require loopback or HTTPS-protected token exchange, bind callbacks to expected origins, and rotate exposed MCP credentials when affected flows were used.
- Confidence: high for affected range and token-channel description from CVE evidence.
- Residual risk: authorization setup paths often run before normal tool policy is visible, so token-channel controls need explicit tests.

## Authoritative Sources

- [October 11 topic collector source](../../../raw/processed/2026-10-11/ai-security-wiki-topic-news-collector-2026-10-11T233138Z.json)
- [NVD CVE-2026-108716](https://nvd.nist.gov/vuln/detail/CVE-2026-108716)
- [CVE-2026-108716 record](https://cveawg.mitre.org/api/cve/CVE-2026-108716)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [data and privacy](index.md)
- [MCP remote SSE token origin disclosure](mcp-remote-sse-token-origin-disclosure.md)
- [MCP remote authorization server metadata disclosure](mcp-remote-authorization-server-metadata-disclosure.md)
- [MCP TypeScript SDK OAuth credential confusion](../identity-and-access/mcp-typescript-sdk-oauth-credential-confusion.md)
- Upstream AI wiki owns broad MCP authorization and mcp-remote package context.

## Open Questions

- Which mcp-remote release first requires a protected device-code token channel for this flow?

## Maintenance Notes

- Created on 2026-10-12 from the [October 11 topic collector source](../../../raw/processed/2026-10-11/ai-security-wiki-topic-news-collector-2026-10-11T233138Z.json).
