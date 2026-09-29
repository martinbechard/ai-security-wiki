---
type: "Topic"
title: "OpenClaw Non Owner Plugin Installation"
description: "Security analysis for OpenClaw non-owner computer-use plugin installation."
tags: ["identity-and-access", "agent-and-tool-security"]
---

# OpenClaw Non Owner Plugin Installation

## Current Understanding

The [September 26 topic collector source](../../../raw/processed/2026-09-26/ai-security-wiki-topic-news-collector-2026-09-26T233301Z.json) records an OpenClaw CVE where a non-owner could install a computer-use plugin. The [September 29 leaf update watch source](../../../raw/processed/2026-09-29/ai-security-wiki-leaf-update-watch-20260929T000436Z.json) maps that child leaf to [CVE-2026-100587](https://cveawg.mitre.org/api/cve/CVE-2026-100587), matching GHSA-pjjr-5qhr-5w6r and the VulnCheck description of non-owner Codex computer-use installation. Broad OpenClaw plugin and workflow context belongs upstream; this page owns the local owner-only plugin installation boundary.

## Security Impact

- Threat: a non-owner can add high-authority computer-use capability to an OpenClaw environment.
- Affected boundary: OpenClaw before 2026.7.1; Codex computer-use installation command owner authorization and plugin/MCP process execution.
- Exploit or incident status: disclosed CVE cluster; no confirmed exploitation is recorded in the collector.
- Mitigation state: update OpenClaw to 2026.7.1 or later and require owner authorization for plugin install, update, and enable actions.
- Confidence: high that CVE-2026-100587 maps to this leaf; medium on any adjacent OpenClaw plugin-install variants not covered by that CVE.
- Residual risk: plugin installation changes the available action surface and should be audited like credential or tool grant changes.

## Authoritative Sources

- [September 26 topic collector source](../../../raw/processed/2026-09-26/ai-security-wiki-topic-news-collector-2026-09-26T233301Z.json)
- [September 29 leaf update watch source](../../../raw/processed/2026-09-29/ai-security-wiki-leaf-update-watch-20260929T000436Z.json)
- [CVE-2026-100587 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-100587)
- [NVD CVE-2026-100587](https://nvd.nist.gov/vuln/detail/CVE-2026-100587)
- [OpenClaw advisory GHSA-pjjr-5qhr-5w6r](https://github.com/openclaw/openclaw/security/advisories/GHSA-pjjr-5qhr-5w6r)
- [VulnCheck OpenClaw advisory](https://www.vulncheck.com/advisories/openclaw-before-2026.7.1-authorization-bypass-via-codex-install)
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

- Are there additional non-owner plugin-installation paths after CVE-2026-100587, or is this leaf fully represented by the Codex computer-use installation advisory?

## Maintenance Notes

- Created on 2026-09-27 from the [September 26 topic collector source](../../../raw/processed/2026-09-26/ai-security-wiki-topic-news-collector-2026-09-26T233301Z.json) after verifier correction split the OpenClaw cluster by control boundary.
- Updated on 2026-09-29 from the [September 29 leaf update watch source](../../../raw/processed/2026-09-29/ai-security-wiki-leaf-update-watch-20260929T000436Z.json) to resolve the CVE mapping to CVE-2026-100587.
