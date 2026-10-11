---
type: "Topic"
title: "Argo CD MCP Delete Tool Path Traversal"
description: "Security analysis for CVE-2026-108585 endpoint traversal through argocd-mcp delete_application."
tags: ["agent-and-tool-security"]
---

# Argo CD MCP Delete Tool Path Traversal

## Current Understanding

The [October 10 topic collector source](../../../raw/processed/2026-10-10/ai-security-wiki-topic-news-collector-2026-10-10T232615Z.json) records [CVE-2026-108585](https://cveawg.mitre.org/api/cve/CVE-2026-108585) for argocd-mcp through 0.9.0. Broad Argo CD and MCP server catalog context belongs upstream; this page owns deployment-tool argument traversal and RBAC blast-radius implications.

MCP clients or prompt-injected models can place dot segments such as `../repositories/` in `applicationName`. The tool then sends authenticated DELETE requests to unintended Argo CD API endpoints within the configured token RBAC scope, so the risk follows both path normalization and token privilege.

## Security Impact

- Threat: an application-delete tool can target unintended deployment API endpoints.
- Affected boundary: argocd-mcp through 0.9.0, `delete_application`, application-name path construction, Argo CD API DELETE requests, and token RBAC scope.
- Exploit or incident status: public CVE Services and NVD evidence; no confirmed exploitation incident is recorded locally.
- Mitigation state: canonicalize application names before URL construction, reject dot segments, reduce API tokens to intended verbs/resources, and audit delete operations.
- Confidence: high for advisory identity and affected boundary; medium for blast radius because RBAC determines reachable endpoints.
- Residual risk: deployment MCP tools need both argument validation and least-privilege tokens because prompt injection can steer destructive verbs.

## Authoritative Sources

- [October 10 topic collector source](../../../raw/processed/2026-10-10/ai-security-wiki-topic-news-collector-2026-10-10T232615Z.json)
- [CVE-2026-108585 record](https://cveawg.mitre.org/api/cve/CVE-2026-108585)
- [NVD CVE-2026-108585](https://nvd.nist.gov/vuln/detail/CVE-2026-108585)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [Office PowerPoint MCP Server path traversal](office-powerpoint-mcp-server-path-traversal.md)
- [agent tool filesystem path containment](../infrastructure-and-supply-chain/agent-tool-filesystem-path-containment.md)

## Open Questions

- No open wiki questions are recorded for this topic.

## Maintenance Notes

- Created on 2026-10-11 from the [October 10 topic collector source](../../../raw/processed/2026-10-10/ai-security-wiki-topic-news-collector-2026-10-10T232615Z.json) after upstream index routing kept broad product and framework context outside the local security wiki.
