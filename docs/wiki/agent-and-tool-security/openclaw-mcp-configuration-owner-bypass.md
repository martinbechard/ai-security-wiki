---
type: "Topic"
title: "OpenClaw MCP Configuration Owner Bypass"
description: "Security analysis for OpenClaw non-owner MCP configuration changes that could persist stdio MCP commands."
tags: ["agent-and-tool-security", "identity-and-access"]
---

# OpenClaw MCP Configuration Owner Bypass

## Current Understanding

The [September 26 topic collector source](../../../raw/processed/2026-09-26/ai-security-wiki-topic-news-collector-2026-09-26T233301Z.json) records an OpenClaw CVE where a non-owner could change `/mcp` configuration and persist stdio MCP commands. Broad MCP setup and OpenClaw workflow context belongs upstream; this page owns the local persisted MCP configuration authority boundary.

## Security Impact

- Threat: a non-owner can persist MCP server commands that later execute under trusted agent configuration.
- Affected boundary: OpenClaw versions before the applicable fixed release, `/mcp` configuration, stdio MCP command persistence, owner checks, and subsequent agent launches.
- Exploit or incident status: disclosed CVE cluster; no confirmed exploitation is recorded in the collector.
- Mitigation state: update OpenClaw, require owner authorization for MCP configuration writes, and review persisted stdio MCP entries.
- Confidence: medium from NVD-backed collector evidence; exact CVE-to-patch mapping needs primary advisory reconciliation.
- Residual risk: persisted MCP commands are effectively startup authority and need ownership, provenance, and review evidence.

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

- [agent and tool security](index.md)
- [development agent credential isolation](../identity-and-access/development-agent-credential-isolation.md)

## Open Questions

- Which OpenClaw CVE and fixed release enforce owner-only `/mcp` configuration writes?

## Maintenance Notes

- Created on 2026-09-27 from the [September 26 topic collector source](../../../raw/processed/2026-09-26/ai-security-wiki-topic-news-collector-2026-09-26T233301Z.json) after verifier correction split the OpenClaw cluster by control boundary.
