---
type: "Topic"
title: "OpenClaw MCP Policy And Bridge Owner Check Bypasses"
description: "Security analysis for OpenClaw denied MCP tool invocation and Claude Code bridge owner-check failures."
tags: ["agent-and-tool-security", "identity-and-access"]
---

# OpenClaw MCP Policy And Bridge Owner Check Bypasses

## Current Understanding

The [September 26 topic collector source](../../../raw/processed/2026-09-26/ai-security-wiki-topic-news-collector-2026-09-26T233301Z.json) records OpenClaw CVEs where sandboxed sessions could invoke denied MCP tools and Claude Code permission prompts over the MCP bridge had owner-check failures. Broad Claude Code and OpenClaw workflow context belongs upstream; this page owns the local MCP policy and bridge ownership boundary.

## Security Impact

- Threat: an agent can cross a denied-tool policy or owner-only bridge prompt and act under authority the user did not delegate.
- Affected boundary: OpenClaw versions before the applicable fixed releases, sandboxed sessions, MCP tool-deny policy, Claude Code bridge prompts, and owner checks.
- Exploit or incident status: disclosed CVE cluster; no confirmed exploitation is recorded in the collector.
- Mitigation state: update OpenClaw, enforce policy at final MCP dispatch, and bind bridge prompts to the resource owner and initiating session.
- Confidence: medium from NVD-backed collector evidence; exact CVE-to-patch mapping needs primary advisory reconciliation.
- Residual risk: bridge prompts need server-side policy checks because UI prompts and local sandbox state can drift from final MCP execution authority.

## Authoritative Sources

- [September 26 topic collector source](../../../raw/processed/2026-09-26/ai-security-wiki-topic-news-collector-2026-09-26T233301Z.json)
- [OpenClaw agent authority and approval cluster](openclaw-agent-authority-and-approval-cluster.md)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [MCP tool-level IAM authorization](../identity-and-access/mcp-tool-level-iam-authorization.md)
- [agent action runtime hooks](agent-action-runtime-hooks.md)

## Open Questions

- Which OpenClaw CVEs map to denied MCP tool invocation and Claude Code bridge owner-check failures?

## Maintenance Notes

- Created on 2026-09-27 from the [September 26 topic collector source](../../../raw/processed/2026-09-26/ai-security-wiki-topic-news-collector-2026-09-26T233301Z.json) after verifier correction split the OpenClaw cluster by control boundary.
