---
type: "Topic"
title: "Bifrost MCP stdio registration RCE"
description: "Security analysis for CVE-2026-90898 unauthenticated Bifrost MCP stdio client registration remote code execution."
tags: ["agent-and-tool-security", "infrastructure-and-supply-chain", "identity-and-access"]
---

# Bifrost MCP stdio registration RCE

## Current Understanding

The [September 14 topic collector source](../../../raw/processed/2026-09-14/ai-security-wiki-topic-news-collector-2026-09-14T233124Z.json) records [CVE-2026-90898](https://cveawg.mitre.org/api/cve/CVE-2026-90898) for Bifrost transports before 2.1.0 on Linux and macOS. Broad Bifrost product coverage belongs upstream; this page owns the local MCP gateway registration and command-execution boundary.

The CVE says Bifrost starts a stdio MCP client command as soon as it is registered through the management API. When `governance.auth_config.is_enabled` keeps its default disabled state, an unauthenticated caller can submit `POST /api/mcp/client` and run a program as the Bifrost process user. Transports 2.1.0 refuses unauthenticated stdio registration with HTTP 403; transports 2.0.0 still allows it.

## Security Impact

- Threat: MCP client registration becomes gateway-process command execution when management authentication is disabled.
- Affected boundary: Bifrost transports before 2.1.0, `transports/bifrost-http/handlers/mcp.go`, `transports/bifrost-http/handlers/middlewares.go`, stdio MCP clients, and management API authentication.
- Exploit or incident status: public CVE with upstream pull request, patch commit, and release reference; no local exploitation incident is recorded.
- Mitigation state: upgrade Bifrost transports to 2.1.0 or later, enable governance authentication, and reject unauthenticated stdio registration.
- Confidence: high because the direct CVE record names the affected modules, vulnerable behavior, patch, and first fixed release.
- Residual risk: any AI gateway that lets remote callers register local subprocess transports needs both endpoint authentication and command policy, because the MCP handshake is not the execution gate.

## Authoritative Sources

- [September 14 topic collector source](../../../raw/processed/2026-09-14/ai-security-wiki-topic-news-collector-2026-09-14T233124Z.json)
- [CVE-2026-90898 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-90898)
- [Bifrost PR 6757](https://github.com/maximhq/bifrost/pull/6757)
- [Bifrost patch commit](https://github.com/maximhq/bifrost/commit/12e170352bd25eab1ae9ba16611f1797d1fd8fdc)
- [Bifrost transports v2.1.0 release](https://github.com/maximhq/bifrost/releases/tag/transports/v2.1.0)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [Bifrost HTTP Custom Plugin RCE](../infrastructure-and-supply-chain/bifrost-http-custom-plugin-rce.md)
- [Bifrost AI Gateway multimodal SSRF](../infrastructure-and-supply-chain/bifrost-ai-gateway-multimodal-ssrf.md)
- [MCP tool-level IAM authorization](../identity-and-access/mcp-tool-level-iam-authorization.md)

## Open Questions

- Which Bifrost deployment profiles expose the management API beyond localhost while relying on default-disabled governance authentication?

## Maintenance Notes

- Created on 2026-09-15 from the [September 14 topic collector](../../../raw/processed/2026-09-14/ai-security-wiki-topic-news-collector-2026-09-14T233124Z.json) as a focused MCP stdio registration control-plane leaf.
