---
type: "Topic"
title: "AWS Security Agent MCP Server Diff Scan Argument Injection"
description: "Security analysis for CVE-2026-97662 argument injection in the AWS Labs security-agent-mcp-server diff scan operation."
tags: ["agent-and-tool-security", "infrastructure-and-supply-chain"]
---

# AWS Security Agent MCP Server Diff Scan Argument Injection

## Current Understanding

The [October 2 topic collector source](../../../raw/processed/2026-10-02/ai-security-wiki-topic-news-collector-2026-10-02T233227Z.json) records [GHSA-8g28-rj54-p5p2](https://github.com/awslabs/mcp/security/advisories/GHSA-8g28-rj54-p5p2) / [CVE-2026-97662](https://cveawg.mitre.org/api/cve/CVE-2026-97662) for AWS Labs `awslabs.security-agent-mcp-server`. Broad AWS Labs and MCP server catalog context belongs upstream; this page owns the local security-scanner workspace and command-argument boundary.

The CVE record says `security-agent-mcp-server` before 0.2.0 has an argument-injection issue in the diff scan operation. A crafted reference value can be interpreted as a Git argument and may let context-dependent attackers create, overwrite, or truncate files outside the intended workspace. The CVE record and AWS advisory identify 0.2.0 as the remediation release.

## Security Impact

- Threat: a repository or caller-controlled diff reference can turn a security scan into host file writes under the MCP server process authority.
- Affected boundary: AWS `security-agent-mcp-server` versions from 0.1.1 before 0.2.0, diff scan reference handling, Git invocation arguments, and workspace confinement.
- Exploit or incident status: public GitHub advisory and CVE record; no confirmed exploitation incident is recorded locally.
- Mitigation state: upgrade to 0.2.0 or later, terminate option parsing before user-controlled revisions, validate revision syntax, and run scanner processes with least-privilege filesystem access.
- Confidence: high for affected range, fixed version, and vulnerability class from maintainer and CVE evidence.
- Residual risk: security-scanner MCP servers inspect untrusted repositories, so command construction and workspace-root enforcement need to remain fail-closed even when the scan is read-oriented.

## Authoritative Sources

- [October 2 topic collector source](../../../raw/processed/2026-10-02/ai-security-wiki-topic-news-collector-2026-10-02T233227Z.json)
- [GitHub advisory GHSA-8g28-rj54-p5p2](https://github.com/awslabs/mcp/security/advisories/GHSA-8g28-rj54-p5p2)
- [CVE-2026-97662 record](https://cveawg.mitre.org/api/cve/CVE-2026-97662)
- [AWS security bulletin 2026-121](https://aws.amazon.com/security/security-bulletins/2026-121-aws/)
- [PyPI 0.2.0 release](https://pypi.org/project/awslabs.security-agent-mcp-server/0.2.0/)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [infrastructure and supply chain](../infrastructure-and-supply-chain/index.md)
- [coding agent command approval boundaries](coding-agent-command-approval-boundaries.md)
- Upstream AI wiki owns broad AWS Labs and MCP server catalog context.

## Open Questions

- No open wiki questions are recorded for this topic.

## Maintenance Notes

- Created on 2026-10-03 from the [October 2 topic collector source](../../../raw/processed/2026-10-02/ai-security-wiki-topic-news-collector-2026-10-02T233227Z.json) after routing broad AWS Labs and MCP catalog context upstream.
