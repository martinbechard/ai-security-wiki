---
type: "Topic"
title: "RedAmon Sandbox Terminal Authentication"
description: "Security analysis for CVE-2026-129855 unauthenticated WebSocket terminal access to RedAmon's Kali sandbox."
tags: ["agent-and-tool-security", "identity-and-access"]
---

# RedAmon Sandbox Terminal Authentication

## Current Understanding

The [November 16 collector source](../../../raw/processed/2026-11-16/ai-security-wiki-topic-news-collector-2026-11-17T002817Z.json) records [CVE-2026-129855](https://nvd.nist.gov/vuln/detail/CVE-2026-129855) / [GHSA-3cjg-8cp8-j269](https://github.com/samugit83/redamon/security/advisories/GHSA-3cjg-8cp8-j269): RedAmon's terminal WebSocket listener accepted reachable clients without authentication and started an interactive root shell in the Kali sandbox. Broad RedAmon product context belongs upstream; this page owns the privileged agent-tool-container listener boundary.

## Security Impact

- Threat: a client that can reach the terminal listener can obtain an interactive shell and use its authority inside the Kali sandbox.
- Affected boundary: RedAmon through 7.7.2, the standalone terminal PTY WebSocket listener on port 8016, container and host reachability, and the root user in the shipped Kali sandbox.
- Exploit or incident status: public disclosed vulnerability; no confirmed exploitation or local incident is recorded. Reachability is deployment-dependent and does not establish public internet exposure.
- Mitigation state: upgrade to RedAmon 7.8.0, restrict access to port 8016, and verify that the terminal listener has authenticated, fail-closed access controls separate from MCP tool-server middleware.
- Confidence: high for the affected range and patch because the maintainer advisory identifies both; medium for external reachability because it depends on host, bridge, and port-publication configuration.
- Residual risk: network filtering reduces exposure but does not replace authentication or least privilege for a terminal that runs in a privileged tool container.

## Authoritative Sources

- [November 16 collector source](../../../raw/processed/2026-11-16/ai-security-wiki-topic-news-collector-2026-11-17T002817Z.json)
- [CVE-2026-129855](https://nvd.nist.gov/vuln/detail/CVE-2026-129855)
- [GHSA-3cjg-8cp8-j269](https://github.com/samugit83/redamon/security/advisories/GHSA-3cjg-8cp8-j269)
- [RedAmon v7.8.0 release](https://github.com/samugit83/redamon/releases/tag/v7.8.0)

## Related Code

- [Terminal listener implementation cited by the maintainer advisory](https://github.com/samugit83/redamon/security/advisories/GHSA-3cjg-8cp8-j269)

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [RedAmon agent-session tenant authorization](../identity-and-access/redamon-agent-session-tenant-authorization.md)
- [DeepSeek Harness local control-plane authentication](deepseek-harness-local-control-plane-authentication.md)

## Open Questions

- Which supported deployments expose port 8016 beyond the local host or Docker bridge?
- Does v7.8.0 enforce the same authentication policy on the terminal listener and MCP tool servers?

## Maintenance Notes

- Created on 2026-11-16 as a terminal-authentication and container-containment boundary separate from RedAmon cross-tenant session authorization.
