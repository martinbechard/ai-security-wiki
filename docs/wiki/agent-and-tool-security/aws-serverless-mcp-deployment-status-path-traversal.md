---
type: Topic
title: AWS Serverless MCP Deployment-Status Path Traversal
description: An AI-influenced project name can cross AWS Serverless MCP deployment-status file boundaries.
tags: [agent-and-tool-security]
---

# AWS Serverless MCP Deployment-Status Path Traversal

## Current Understanding

[CVE-2026-116635](https://nvd.nist.gov/vuln/detail/CVE-2026-116635) affects `awslabs.aws-serverless-mcp-server` before 0.2.1. A project name supplied through an MCP agent can contain traversal or absolute paths, enabling reads outside the status directory and, where write access is enabled, file creation or overwrite. Tool authorization does not replace resolved-path containment or separate write authority.

No exploitation is reported. Confidence is high: NVD, AWS, and GitHub evidence agree on version 0.2.1 as the fix.

- Mitigation state: upgrade to 0.2.1 and constrain project names to resolved status-directory paths with separately authorized writes.
- Residual risk: agent-influenced project input can still reach sensitive deployment files where legacy versions retain write access.

## Authoritative Sources

- [November 3 collector source](../../../raw/processed/2026-11-03/ai-security-wiki-topic-news-collector-2026-11-03T002828Z.json)
- [NVD CVE-2026-116635](https://nvd.nist.gov/vuln/detail/CVE-2026-116635)
- [AWS security bulletin 2026-164](https://aws.amazon.com/security/security-bulletins/2026-164-aws/)
- [GitHub advisory GHSA-r6mm-377j-qg8m](https://github.com/awslabs/mcp/security/advisories/GHSA-r6mm-377j-qg8m)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [Agent tool filesystem path containment](../infrastructure-and-supply-chain/agent-tool-filesystem-path-containment.md)

## Open Questions

- Does application-level MCP tool authorization independently prevent attacker-controlled project names from reaching this code path?

## Maintenance Notes

- Created on 2026-11-03. AWS and serverless-MCP catalog context remains upstream-owned.
