---
type: "Topic"
title: "OpenClaw Non Owner Plugin Installation"
description: "Security analysis for OpenClaw non-owner computer-use plugin installation."
tags: ["identity-and-access", "agent-and-tool-security"]
---

# OpenClaw Non Owner Plugin Installation

## Current Understanding

The [September 26 topic collector source](../../../raw/processed/2026-09-26/ai-security-wiki-topic-news-collector-2026-09-26T233301Z.json) records an OpenClaw CVE where a non-owner could install a computer-use plugin. Broad OpenClaw plugin and workflow context belongs upstream; this page owns the local owner-only plugin installation boundary.

## Security Impact

- Threat: a non-owner can add high-authority computer-use capability to an OpenClaw environment.
- Affected boundary: OpenClaw versions before the applicable 2026.7.1 or 2026.8.1 fix, plugin installation, computer-use plugins, and owner-only control-plane actions.
- Exploit or incident status: disclosed CVE cluster; no confirmed exploitation is recorded in the collector.
- Mitigation state: update OpenClaw and require owner authorization for plugin install, update, and enable actions.
- Confidence: medium from NVD-backed collector evidence; exact CVE-to-patch mapping needs primary advisory reconciliation.
- Residual risk: plugin installation changes the available action surface and should be audited like credential or tool grant changes.

## Authoritative Sources

- [September 26 topic collector source](../../../raw/processed/2026-09-26/ai-security-wiki-topic-news-collector-2026-09-26T233301Z.json)
- [OpenClaw agent authority and approval cluster](../agent-and-tool-security/openclaw-agent-authority-and-approval-cluster.md)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [production agent identity and access controls](production-agent-identity-and-access-controls.md)

## Open Questions

- Which OpenClaw CVE and fixed release enforce owner-only computer-use plugin installation?

## Maintenance Notes

- Created on 2026-09-27 from the [September 26 topic collector source](../../../raw/processed/2026-09-26/ai-security-wiki-topic-news-collector-2026-09-26T233301Z.json) after verifier correction split the OpenClaw cluster by control boundary.
