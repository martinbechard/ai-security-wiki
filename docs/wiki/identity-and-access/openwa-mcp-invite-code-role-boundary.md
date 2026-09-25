---
type: "Topic"
title: "OpenWA MCP Invite Code Role Boundary"
description: "Security analysis for CVE-2026-91161, where OpenWA allowed VIEWER API keys to retrieve WhatsApp group invite codes through an MCP tool."
tags: ["identity-and-access", "agent-and-tool-security"]
---

# OpenWA MCP Invite Code Role Boundary

## Current Understanding

The [September 24 topic collector source](../../../raw/processed/2026-09-24/ai-security-wiki-topic-news-collector-2026-09-24T233211Z.json) records [CVE-2026-91161](https://cveawg.mitre.org/api/cve/CVE-2026-91161) for OpenWA before 0.23.5. Broad OpenWA product context belongs upstream if needed; this page owns the local MCP tool role-check boundary for transferable collaboration invite codes.

OpenWA allowed a VIEWER-scoped API key to call the `GroupGetInviteCode` MCP tool and retrieve WhatsApp group invite codes because the endpoint or tool lacked an OPERATOR role requirement.

## Security Impact

- Threat: a low-privilege MCP caller can obtain transferable WhatsApp group invite codes.
- Affected boundary: OpenWA before 0.23.5, VIEWER API keys, OPERATOR role checks, and the `GroupGetInviteCode` MCP tool.
- Exploit or incident status: public CVE, NVD, and GitHub Security Advisory evidence; no local in-the-wild exploitation evidence is recorded.
- Mitigation state: upgrade to OpenWA 0.23.5 or later and audit MCP tool role mappings for returned bearer-like or transferable objects.
- Confidence: high for affected version and missing role-check boundary; medium for real-world blast radius because invite-code permissions depend on WhatsApp group administration policy.
- Residual risk: MCP tools need role checks matched to the sensitivity of returned capabilities, not just the read-like shape of the method name.

## Authoritative Sources

- [September 24 topic collector source](../../../raw/processed/2026-09-24/ai-security-wiki-topic-news-collector-2026-09-24T233211Z.json)
- [CVE-2026-91161 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-91161)
- [NVD CVE-2026-91161](https://nvd.nist.gov/vuln/detail/CVE-2026-91161)
- [GHSA-45fh-xj7x-vj2x](https://github.com/rmyndharis/OpenWA/security/advisories/GHSA-45fh-xj7x-vj2x)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [agent and tool security](../agent-and-tool-security/index.md)
- [MCP tool-level IAM authorization](mcp-tool-level-iam-authorization.md)

## Open Questions

- Does OpenWA 0.23.5 add an OPERATOR role check only for `GroupGetInviteCode`, or is there a broader MCP tool sensitivity review?

## Maintenance Notes

- Created on 2026-09-25 from the [September 24 topic collector source](../../../raw/processed/2026-09-24/ai-security-wiki-topic-news-collector-2026-09-24T233211Z.json); maintain as a role-to-capability mapping issue.
