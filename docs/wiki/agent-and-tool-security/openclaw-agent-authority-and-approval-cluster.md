---
type: "Topic"
title: "OpenClaw Agent Authority And Approval Cluster"
description: "Security analysis for the September 2026 OpenClaw CVE cluster spanning ACP file reads, command approvals, MCP policy, owner checks, and persisted tool authority."
tags: ["agent-and-tool-security", "identity-and-access"]
---

# OpenClaw Agent Authority And Approval Cluster

## Current Understanding

The [September 26 topic collector source](../../../raw/processed/2026-09-26/ai-security-wiki-topic-news-collector-2026-09-26T233301Z.json) records nine OpenClaw CVEs published on 2026-09-26. Broad OpenClaw product and coding-agent workflow context belongs upstream in ai-dev-wiki; this page owns the local security-control family where agent approval, file containment, MCP policy, and owner-only actions failed around the same delegated-authority surface.

The cluster is a router for six independently changing OpenClaw security-control leaves:

- [OpenClaw ACP file URL workdir read bypass](openclaw-acp-file-url-workdir-read-bypass.md)
- [OpenClaw command approval bypasses](openclaw-command-approval-bypasses.md)
- [OpenClaw MCP policy and bridge owner check bypasses](openclaw-mcp-policy-and-bridge-owner-check-bypasses.md)
- [OpenClaw non owner plugin installation](../identity-and-access/openclaw-non-owner-plugin-installation.md)
- [OpenClaw trajectory export authorization bypass](../data-and-privacy/openclaw-trajectory-export-authorization-bypass.md)
- [OpenClaw MCP configuration owner bypass](openclaw-mcp-configuration-owner-bypass.md)

## Security Impact

- Threat: a lower-privilege or sandboxed agent session can cross file, command, MCP, owner, data-export, or persisted-configuration boundaries that users expect approval prompts to enforce.
- Affected boundary: OpenClaw npm package and runtime versions before 2026.7.1 or 2026.8.1 depending on CVE; ACP file access, command approvals, MCP tool policy, Claude Code bridge prompts, plugin installation, trajectory export, and MCP configuration.
- Exploit or incident status: disclosed CVE cluster; no confirmed in-the-wild exploitation is recorded in the collector.
- Mitigation state: update to the relevant fixed OpenClaw release, invalidate over-broad Allow Always grants, review persisted MCP configuration, and require owner/resource checks at each bridge and control-plane endpoint.
- Confidence: medium from NVD-backed collector evidence; exact fixed-version mapping should be reconciled against OpenClaw primary advisories.
- Residual risk: one prompt or wrapper decision is not enough for coding-agent authority; checks need to bind subject, owner, path, command, tool, and persisted configuration at the final enforcement point.

## Authoritative Sources

- [September 26 topic collector source](../../../raw/processed/2026-09-26/ai-security-wiki-topic-news-collector-2026-09-26T233301Z.json)
- [NVD CVE-2026-100547](https://nvd.nist.gov/vuln/detail/CVE-2026-100547)
- [NVD CVE-2026-100559](https://nvd.nist.gov/vuln/detail/CVE-2026-100559)
- [NVD CVE-2026-100560](https://nvd.nist.gov/vuln/detail/CVE-2026-100560)
- [NVD CVE-2026-100561](https://nvd.nist.gov/vuln/detail/CVE-2026-100561)
- [NVD CVE-2026-100573](https://nvd.nist.gov/vuln/detail/CVE-2026-100573)
- [NVD CVE-2026-100585](https://nvd.nist.gov/vuln/detail/CVE-2026-100585)
- [NVD CVE-2026-100587](https://nvd.nist.gov/vuln/detail/CVE-2026-100587)
- [NVD CVE-2026-100594](https://nvd.nist.gov/vuln/detail/CVE-2026-100594)
- [NVD CVE-2026-100596](https://nvd.nist.gov/vuln/detail/CVE-2026-100596)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [coding agent command approval boundaries](coding-agent-command-approval-boundaries.md)
- [approval metadata access control](approval-metadata-access-control.md)
- [agent action runtime hooks](agent-action-runtime-hooks.md)

## Open Questions

- Which OpenClaw primary advisories map each CVE to the exact fixed release and patch?
- Which exact CVE maps to each focused OpenClaw child leaf, and which release note or patch provides the primary evidence?

## Maintenance Notes

- Created on 2026-09-27 from the [September 26 topic collector source](../../../raw/processed/2026-09-26/ai-security-wiki-topic-news-collector-2026-09-26T233301Z.json) as a grouped control-family router after verifier correction split the durable details into child leaves.
