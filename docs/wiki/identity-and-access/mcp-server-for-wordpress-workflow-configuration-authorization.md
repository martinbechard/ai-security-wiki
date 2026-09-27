---
type: "Topic"
title: "MCP Server For WordPress Workflow Configuration Authorization"
description: "Security analysis for CVE-2026-96525, where Contributors could change MCP Server for WordPress workflow configuration."
tags: ["identity-and-access", "agent-and-tool-security"]
---

# MCP Server For WordPress Workflow Configuration Authorization

## Current Understanding

The [September 26 topic collector source](../../../raw/processed/2026-09-26/ai-security-wiki-topic-news-collector-2026-09-26T233301Z.json) records CVE-2026-96525 for MCP Server for WordPress before 1.8.2. Broad WordPress workflow context belongs upstream; this page owns the local workflow-configuration authorization boundary.

## Security Impact

- Threat: Contributor users can create, modify, or delete site-wide workflow configuration.
- Affected boundary: MCP Server for WordPress before 1.8.2, workflow configuration routes, Contributor role capabilities, and site-wide MCP workflow control.
- Exploit or incident status: disclosed CVE; no confirmed exploitation is recorded in the collector.
- Mitigation state: upgrade to 1.8.2 or later and restrict workflow configuration writes to explicitly authorized roles.
- Confidence: medium from NVD-backed collector evidence; maintainer or WordPress security-advisory detail should be reconciled.
- Residual risk: workflow configuration can redirect agent actions and should be treated as a control-plane object.

## Authoritative Sources

- [September 26 topic collector source](../../../raw/processed/2026-09-26/ai-security-wiki-topic-news-collector-2026-09-26T233301Z.json)
- [NVD CVE-2026-96525](https://nvd.nist.gov/vuln/detail/CVE-2026-96525)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [MCP tool-level IAM authorization](mcp-tool-level-iam-authorization.md)

## Open Questions

- Which workflow configuration capabilities changed in MCP Server for WordPress 1.8.2?

## Maintenance Notes

- Created on 2026-09-27 from the [September 26 topic collector source](../../../raw/processed/2026-09-26/ai-security-wiki-topic-news-collector-2026-09-26T233301Z.json) after verifier correction split the WordPress MCP advisory family.
