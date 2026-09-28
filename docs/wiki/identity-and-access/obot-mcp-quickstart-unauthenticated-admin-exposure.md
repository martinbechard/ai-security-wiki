---
type: "Topic"
title: "Obot MCP Quickstart Unauthenticated Admin Exposure"
description: "Security analysis for CVE-2026-101065 Obot Docker quickstart unauthenticated administrative exposure."
tags: ["identity-and-access", "infrastructure-and-supply-chain"]
---

# Obot MCP Quickstart Unauthenticated Admin Exposure

## Current Understanding

The [September 27 topic collector source](../../../raw/processed/2026-09-27/ai-security-wiki-topic-news-collector-2026-09-27T233044Z.json) records [CVE-2026-101065](https://nvd.nist.gov/vuln/detail/CVE-2026-101065) for Obot Docker quickstart guidance through commit `d7e6970`. Broad Obot deployment practice belongs upstream or to ai-dev-wiki; this page owns the local unauthenticated admin, MCP runtime, and Docker socket authority boundary.

NVD, the [GitHub advisory](https://github.com/obot-platform/obot/security/advisories/GHSA-jj4w-pfgv-4mrm), and [VulnCheck](https://www.vulncheck.com/advisories/obot-quickstart-docker-deployment-unauthenticated-admin-access) describe README quickstart instructions that started Obot on `0.0.0.0:8080` with authentication disabled by default. In that mode, requests map to a synthetic `nobody` user with Owner and Admin roles, and the quickstart also mounts `/var/run/docker.sock` into the container, so reachable unauthenticated users can administer Obot, register attacker-controlled MCP servers, and potentially reach the host Docker control surface through the MCP runtime backend.

Affected boundary: Obot quickstart documentation through commit `d7e6970`; NVD describes the fix as documentation-only.

Exploit or incident status: public advisory disclosure; local sources do not record confirmed active exploitation.

Mitigation state: set `OBOT_SERVER_ENABLE_AUTHENTICATION=true` before exposing the host to an untrusted network, update quickstart usage, and review host exposure if the old quickstart was run.

Confidence: high for the quickstart boundary and mitigation wording from NVD plus linked advisory evidence.

Residual risk: operators who followed the old quickstart need incident-style review because the exposed container combined unauthenticated owner/admin access with a mounted Docker socket.

## Authoritative Sources

- [September 27 topic collector source](../../../raw/processed/2026-09-27/ai-security-wiki-topic-news-collector-2026-09-27T233044Z.json)
- [NVD CVE-2026-101065](https://nvd.nist.gov/vuln/detail/CVE-2026-101065)
- [GitHub advisory GHSA-jj4w-pfgv-4mrm](https://github.com/obot-platform/obot/security/advisories/GHSA-jj4w-pfgv-4mrm)
- [VulnCheck advisory](https://www.vulncheck.com/advisories/obot-quickstart-docker-deployment-unauthenticated-admin-access)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [Obot MCP enterprise roadmap](../../../upstream-ai-wiki/mcp-servers/obot-mcp-enterprise-roadmap.md)
- [agent and tool security](../agent-and-tool-security/index.md)
- [Obot remote MCP server registration SSRF](../agent-and-tool-security/obot-remote-mcp-server-registration-ssrf.md)

## Open Questions

- No open wiki questions are recorded for this topic.

## Maintenance Notes

- Created on 2026-09-27 from the September 27 collector and NVD enrichment as a focused quickstart authentication and host-control leaf.
