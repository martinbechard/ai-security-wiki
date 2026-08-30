---
type: "Topic"
title: "argocd-mcp unauthenticated HTTP tool control"
description: "Security analysis for CVE-2026-82456 argocd-mcp unauthenticated HTTP transport and delegated Argo CD token authority."
tags: ["agent-and-tool-security", "identity-and-access", "infrastructure-and-supply-chain"]
---

# argocd-mcp unauthenticated HTTP tool control

## Current Understanding

The [August 29 topic collector source](../../../raw/processed/2026-08-29/ai-security-wiki-topic-news-collector-2026-08-29T233233Z.json) records [CVE-2026-82456](https://nvd.nist.gov/vuln/detail/CVE-2026-82456) for argocd-mcp 0.8.0. Broad [argocd-mcp server](../../../upstream-ai-wiki/mcp-servers/argocd-mcp-server.md), Argo CD, MCP server catalog, and deployment-tool context belongs upstream; this page owns the local security boundary where a network-reachable MCP HTTP listener can expose stored Argo CD tool authority without authenticating inbound callers.

The collector treats the NVD publication on 2026-08-29 as the in-window event and the upstream [GitHub security advisory](https://github.com/argoproj-labs/mcp-for-argocd/security/advisories/GHSA-rp45-5x3v-48mr) as supporting evidence. The affected path is specifically delegated credential directionality: `ARGOCD_API_TOKEN` is intended as the server's outbound Argo CD credential, but an unauthenticated inbound MCP session can turn it into deployment-control authority.

## Security Impact

- Threat: a reachable attacker can invoke MCP tools through the unauthenticated HTTP transport and act with the operator's configured Argo CD token.
- Affected boundary: argocd-mcp 0.8.0 HTTP transport, inbound MCP caller authentication, and Argo CD or Kubernetes resources reachable by the stored token.
- Exploit or incident status: public NVD, GitHub advisory, and [VulnCheck evidence](https://www.vulncheck.com/advisories/argocd-mcp-0.8.0-authentication-bypass-via-unauthenticated-http); no local in-the-wild exploitation evidence is recorded.
- Mitigation state: the upstream advisory reports 0.9.0 as patched; operators should upgrade, bind local-only where appropriate, require inbound authentication, and rotate exposed Argo CD tokens.
- Confidence: high for advisory existence, affected version, and stored-token authority boundary; medium for downstream blast radius because it depends on token scope.
- Residual risk: MCP deployment tools remain dangerous when HTTP reachability, auth, and token scope are reviewed separately instead of as one delegated-control path.

## Authoritative Sources

- [August 29 topic collector source](../../../raw/processed/2026-08-29/ai-security-wiki-topic-news-collector-2026-08-29T233233Z.json)
- [NVD CVE-2026-82456](https://nvd.nist.gov/vuln/detail/CVE-2026-82456)
- [GitHub security advisory GHSA-rp45-5x3v-48mr](https://github.com/argoproj-labs/mcp-for-argocd/security/advisories/GHSA-rp45-5x3v-48mr)
- [VulnCheck advisory](https://www.vulncheck.com/advisories/argocd-mcp-0.8.0-authentication-bypass-via-unauthenticated-http)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [MCP router unauthenticated aggregator exposure](mcp-router-unauthenticated-aggregator-exposure.md)
- [Telnyx MCP stored credential auth bypass](../identity-and-access/telnyx-mcp-stored-credential-auth-bypass.md)
- [production agent identity and access controls](../identity-and-access/production-agent-identity-and-access-controls.md)
- Upstream AI wiki owns broad [argocd-mcp server](../../../upstream-ai-wiki/mcp-servers/argocd-mcp-server.md) coverage.

## Open Questions

- Which argocd-mcp deployment modes expose HTTP transport beyond loopback, and which Argo CD token scopes should be treated as unacceptable for MCP use?

## Maintenance Notes

- Created on 2026-08-30 from the [August 29 topic collector](../../../raw/processed/2026-08-29/ai-security-wiki-topic-news-collector-2026-08-29T233233Z.json) after routing broad Argo CD and MCP catalog context upstream.
