---
type: "Topic"
title: "Docker MCP Gateway OCI label argument injection"
description: "Security analysis for CVE-2026-55887 Docker MCP Gateway trusting OCI image labels as container runtime configuration."
tags: ["agent-and-tool-security", "infrastructure-and-supply-chain"]
---

# Docker MCP Gateway OCI label argument injection

## Current Understanding

The [September 15 topic collector source](../../../raw/processed/2026-09-15/ai-security-wiki-topic-news-collector-2026-09-15T233112Z.json) records [CVE-2026-55887](https://cveawg.mitre.org/api/cve/CVE-2026-55887) for Docker MCP Gateway 0.21.0 through versions before 0.42.2. Broad Docker and MCP Gateway product coverage belongs upstream; this page owns the local image-metadata trust and agent-host execution boundary.

The CVE and [GitHub advisory](https://github.com/docker/mcp-gateway/security/advisories/GHSA-r2xf-7jw5-pjg6) say Docker MCP Gateway unmarshalled attacker-controlled OCI image-label YAML into a broad server configuration structure. Runtime fields such as volumes, user, command, extra hosts, allow-hosts, network, environment, remote endpoint, OAuth, secrets, long-lived mode, and policy could reach container launch behavior. A malicious MCP image could therefore reshape `docker run` arguments and cross from tool catalog metadata into host-impacting execution.

The [September 17 leaf update watch source](../../../raw/processed/2026-09-17/ai-security-wiki-leaf-update-watch-20260917T000423Z.json) adds the direct CVE Services publication timestamp and confirms the affected range as 0.21.0 through before 0.42.2, with 0.42.2 identified as patched.

## Security Impact

- Threat: an attacker can publish or supply an MCP image whose labels inject container runtime options such as host filesystem or Docker socket mounts.
- Affected boundary: Docker MCP Gateway 0.21.0 through versions before 0.42.2, OCI image-label parsing, server configuration unmarshalling, and container launch arguments.
- Exploit or incident status: public CVE and GitHub advisory; no local exploitation incident is recorded.
- Mitigation state: upgrade Docker MCP Gateway to 0.42.2 or later, treat image labels as untrusted metadata, and allowlist the exact label fields that can influence runtime behavior.
- Confidence: high for the CVE publication, affected range, and patched release; the GitHub advisory and release are older provenance and patch evidence rather than new September disclosures.
- Residual risk: MCP catalogs and gateways often combine remote package discovery with local tool execution, so image provenance and runtime option mediation must be separate controls.

## Authoritative Sources

- [September 15 topic collector source](../../../raw/processed/2026-09-15/ai-security-wiki-topic-news-collector-2026-09-15T233112Z.json)
- [September 17 leaf update watch source](../../../raw/processed/2026-09-17/ai-security-wiki-leaf-update-watch-20260917T000423Z.json)
- [CVE-2026-55887 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-55887)
- [GitHub advisory GHSA-r2xf-7jw5-pjg6](https://github.com/docker/mcp-gateway/security/advisories/GHSA-r2xf-7jw5-pjg6)
- [Docker MCP Gateway 0.42.2 release](https://github.com/docker/mcp-gateway/releases/tag/v0.42.2)
- [Docker MCP Gateway patch pull request](https://github.com/docker/mcp-gateway/pull/498)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [MCP data movement exposure controls](../data-and-privacy/mcp-data-movement-exposure-controls.md)
- [Agent build and dependency execution boundaries](../infrastructure-and-supply-chain/agent-build-and-dependency-execution-boundaries.md)
- [AI supply-chain provenance credentialing](../infrastructure-and-supply-chain/ai-supply-chain-provenance-credentialing.md)

## Open Questions

- Which Docker MCP Gateway deployment modes accepted registry-supplied image labels without an administrator reviewing the effective runtime arguments?

## Maintenance Notes

- Created on 2026-09-16 from the [September 15 topic collector](../../../raw/processed/2026-09-15/ai-security-wiki-topic-news-collector-2026-09-15T233112Z.json) as an MCP image-metadata trust-boundary leaf.
- Updated on 2026-09-17 from the [September 17 leaf update watch](../../../raw/processed/2026-09-17/ai-security-wiki-leaf-update-watch-20260917T000423Z.json) with direct CVE Services publication metadata and patched-version confirmation.
