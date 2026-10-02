---
type: "Topic"
title: "AiSOC CrowdStrike RTR Command Injection"
description: "Security analysis for CVE-2026-103056 command injection in AiSOC CrowdStrike Real Time Response action construction."
tags: ["agent-and-tool-security", "infrastructure-and-supply-chain"]
---

# AiSOC CrowdStrike RTR Command Injection

## Current Understanding

The [October 1 topic collector source](../../../raw/processed/2026-10-01/ai-security-wiki-topic-news-collector-2026-10-01T233213Z.json) records [CVE-2026-103056](https://cveawg.mitre.org/api/cve/CVE-2026-103056) for AiSOC versions 7.2.0 before 12.0.0. This page owns the local CrowdStrike Real Time Response command-construction boundary.

The CVE record says the actions service builds CrowdStrike RTR command strings by interpolating unescaped action parameters in `crowdstrike_rtr.py` and `endpoint.py`. Authenticated users can inject single quotes into `file_path`, `path`, `script_name`, or `script_args` to break out of quoted arguments and execute arbitrary commands on managed endpoints with SYSTEM or root privileges.

## Security Impact

- Threat: authenticated users can turn response-action parameters into arbitrary endpoint commands.
- Affected boundary: AiSOC 7.2.0 before 12.0.0, actions service, CrowdStrike RTR command construction, `file_path`, `path`, `script_name`, and `script_args`.
- Exploit or incident status: public CVE record; no confirmed active exploitation is recorded in the source.
- Mitigation state: update to AiSOC 12.0.0 or later and construct RTR commands with structured arguments or strict allowlists rather than string interpolation.
- Confidence: high for public CVE identity and behavior; medium for patch mechanism until vendor code or release notes are captured.
- Residual risk: AI-assisted response tools need command builders that preserve argument boundaries because response integrations often execute with endpoint-administrator authority.

## Authoritative Sources

- [October 1 topic collector source](../../../raw/processed/2026-10-01/ai-security-wiki-topic-news-collector-2026-10-01T233213Z.json)
- [CVE-2026-103056 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-103056)

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

## Open Questions

- Which AiSOC patch or release note documents how RTR command arguments are escaped or structured after 12.0.0?

## Maintenance Notes

- Created on 2026-10-02 from the [October 1 topic collector source](../../../raw/processed/2026-10-01/ai-security-wiki-topic-news-collector-2026-10-01T233213Z.json) after splitting the AiSOC CVE cluster into item-level leaves.
