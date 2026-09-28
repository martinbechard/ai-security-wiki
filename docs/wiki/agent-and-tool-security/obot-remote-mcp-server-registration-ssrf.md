---
type: "Topic"
title: "Obot Remote MCP Server Registration SSRF"
description: "Security analysis for CVE-2026-101064 SSRF through Obot remote MCP server registration."
tags: ["agent-and-tool-security", "infrastructure-and-supply-chain"]
---

# Obot Remote MCP Server Registration SSRF

## Current Understanding

The [September 27 topic collector source](../../../raw/processed/2026-09-27/ai-security-wiki-topic-news-collector-2026-09-27T233044Z.json) records [CVE-2026-101064](https://nvd.nist.gov/vuln/detail/CVE-2026-101064) for Obot before v0.23.0. Broad Obot platform context belongs upstream; this page owns the remote MCP server registration egress and response-disclosure boundary.

NVD, the [GitHub advisory](https://github.com/obot-platform/obot/security/advisories/GHSA-jgh3-fggc-mcpm), and [VulnCheck](https://www.vulncheck.com/advisories/obot-before-0.23.0-server-side-request-forgery-via-mcp) describe privileged users specifying arbitrary URLs during remote MCP server registration without destination validation. Power User or higher roles can coerce Obot to request internal services or cloud metadata endpoints, with responses exposed through error messages.

Affected boundary: Obot before v0.23.0.

Exploit or incident status: public advisory disclosure; local sources do not record confirmed active exploitation.

Mitigation state: upgrade to v0.23.0 or later and review remote MCP registration audit evidence for internal or metadata endpoint probes.

Confidence: high for affected boundary and remediation from NVD plus linked advisory evidence.

Residual risk: role-gated SSRF still matters because MCP registration has delegated infrastructure reach; compromised privileged accounts can turn tool registration into internal-network reconnaissance.

## Authoritative Sources

- [September 27 topic collector source](../../../raw/processed/2026-09-27/ai-security-wiki-topic-news-collector-2026-09-27T233044Z.json)
- [NVD CVE-2026-101064](https://nvd.nist.gov/vuln/detail/CVE-2026-101064)
- [GitHub advisory GHSA-jgh3-fggc-mcpm](https://github.com/obot-platform/obot/security/advisories/GHSA-jgh3-fggc-mcpm)
- [VulnCheck advisory](https://www.vulncheck.com/advisories/obot-before-0.23.0-server-side-request-forgery-via-mcp)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [Obot MCP enterprise roadmap](../../../upstream-ai-wiki/mcp-servers/obot-mcp-enterprise-roadmap.md)
- [agent network egress controls](agent-network-egress-controls.md)
- [Obot MCP quickstart unauthenticated admin exposure](../identity-and-access/obot-mcp-quickstart-unauthenticated-admin-exposure.md)

## Open Questions

- No open wiki questions are recorded for this topic.

## Maintenance Notes

- Created on 2026-09-27 from the September 27 collector and NVD enrichment as a focused MCP-registration SSRF leaf.
