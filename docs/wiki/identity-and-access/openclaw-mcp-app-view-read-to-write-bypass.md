---
type: "Topic"
title: "OpenClaw MCP App View Read To Write Bypass"
description: "Security analysis for CVE-2026-102807, where OpenClaw read-scoped operators can obtain write-capable MCP App tickets."
tags: ["identity-and-access", "agent-and-tool-security"]
---

# OpenClaw MCP App View Read To Write Bypass

## Current Understanding

The [September 29 topic collector source](../../../raw/processed/2026-09-29/ai-security-wiki-topic-news-collector-2026-09-29T233133Z.json) records [CVE-2026-102807](https://nvd.nist.gov/vuln/detail/CVE-2026-102807) for [OpenClaw](../../../upstream-ai-wiki/mcp-servers/openclaw.md) before 2026.9.4. Broad OpenClaw product and workflow context belongs upstream; this page owns the local read-to-write authorization boundary.

The source says read-scoped operators can use `mcp.app.view` to obtain and redeem a standalone ticket for MCP App tools that require `operator.write`. The [OpenClaw 2026.9.4 release notes](https://docs.openclaw.ai/releases/2026.9.4), [patch commit](https://github.com/openclaw/openclaw/commit/3bd8ec2b39b5f9e80aef0973f7d17eadc745b8f8), and [VulnCheck advisory](https://www.vulncheck.com/advisories/openclaw-before-2026.9.4-authorization-bypass-via-mcp-app-standalone-ticket) are the captured fix evidence.

## Security Impact

- Threat: a read-only operator can mint or redeem a capability that exercises write-scoped MCP App tools.
- Affected boundary: OpenClaw before 2026.9.4; `mcp.app.view`; standalone MCP App tickets; `operator.write` tool invocation.
- Exploit or incident status: public NVD and VulnCheck advisory with release and patch references; no active exploitation was identified in the collector source.
- Mitigation state: update to OpenClaw 2026.9.4 or later and invalidate or scope-check standalone tickets issued before the fix.
- Confidence: high for the release boundary and authorization class because the collector captured NVD, release, commit, and VulnCheck references.
- Residual risk: standalone capability tokens need binding to subject, scope, target app, expiry, and redemption context so read grants cannot be transformed into write authority.

## Authoritative Sources

- [September 29 topic collector source](../../../raw/processed/2026-09-29/ai-security-wiki-topic-news-collector-2026-09-29T233133Z.json)
- [CVE-2026-102807 NVD entry](https://nvd.nist.gov/vuln/detail/CVE-2026-102807)
- [OpenClaw 2026.9.4 release notes](https://docs.openclaw.ai/releases/2026.9.4)
- [OpenClaw patch commit](https://github.com/openclaw/openclaw/commit/3bd8ec2b39b5f9e80aef0973f7d17eadc745b8f8)
- [VulnCheck advisory](https://www.vulncheck.com/advisories/openclaw-before-2026.9.4-authorization-bypass-via-mcp-app-standalone-ticket)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [OpenClaw non owner plugin installation](openclaw-non-owner-plugin-installation.md)
- [OpenClaw agent authority and approval cluster](../agent-and-tool-security/openclaw-agent-authority-and-approval-cluster.md)
- [agent and tool security](../agent-and-tool-security/index.md)
- Upstream AI wiki owns broad OpenClaw product context.

## Open Questions

- Does OpenClaw 2026.9.4 invalidate standalone tickets issued before the fix, or must deployments rotate them separately?

## Maintenance Notes

- Created on 2026-09-30 from the [September 29 topic collector source](../../../raw/processed/2026-09-29/ai-security-wiki-topic-news-collector-2026-09-29T233133Z.json) after routing general OpenClaw product context upstream.
