---
type: "Topic"
title: "IBM ContextForge default credentials"
description: "Security analysis for CVE-2026-78573 default administrative credentials in IBM ContextForge MCP Gateway."
tags: ["identity-and-access", "agent-and-tool-security"]
---

# IBM ContextForge default credentials

## Current Understanding

The [September 13 topic collector source](../../../raw/processed/2026-09-13/ai-security-wiki-topic-news-collector-2026-09-13T171540Z.json) records [CVE-2026-78573](https://cveawg.mitre.org/api/cve/CVE-2026-78573) for IBM ContextForge MCP Gateway 1.0.0 through 1.0.7. Broad ContextForge product coverage belongs upstream; this page owns the administrative bootstrap-credential boundary.

The CVE and IBM bulletin say default credentials could allow a remote attacker to gain administrative access. NVD reports CVSS v3.1 9.8, and CISA ADP marks the issue automatable with total technical impact.

## Security Impact

- Threat: default administrative credentials can expose an MCP gateway control plane to remote takeover.
- Affected boundary: IBM ContextForge MCP Gateway 1.0.0 through 1.0.7.
- Exploit or incident status: public CVE/NVD and IBM bulletin evidence; CISA ADP marks automatable total technical impact.
- Mitigation state: remove default credentials, rotate any bootstrap secrets, require first-run credential setup, and follow IBM's fixed-version guidance.
- Confidence: high for default-credential administrative access and severity; medium for exact fixed-version detail until the IBM bulletin is reconciled.
- Residual risk: gateways that connect tools, agents, and credentials need startup tests proving no default administrative account remains reachable after deployment.

## Authoritative Sources

- [September 13 topic collector source](../../../raw/processed/2026-09-13/ai-security-wiki-topic-news-collector-2026-09-13T171540Z.json)
- [CVE-2026-78573 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-78573)
- [IBM ContextForge MCP Gateway bulletin](https://www.ibm.com/support/pages/node/7286834)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [MCP tool-level IAM authorization](mcp-tool-level-iam-authorization.md)
- [IBM ContextForge tool invocation DNS rebinding](../agent-and-tool-security/ibm-contextforge-tool-invocation-dns-rebinding.md)
- [IBM ContextForge jq filter credential disclosure](../data-and-privacy/ibm-contextforge-jq-filter-credential-disclosure.md)

## Open Questions

- Which IBM ContextForge MCP Gateway release removes or blocks the default administrative credentials?

## Maintenance Notes

- Created on 2026-09-13 from the [September 13 topic collector](../../../raw/processed/2026-09-13/ai-security-wiki-topic-news-collector-2026-09-13T171540Z.json) as an administrative credential-boundary leaf.
