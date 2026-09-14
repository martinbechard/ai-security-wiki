---
type: "Topic"
title: "OmniRoute ACP custom-agent RCE"
description: "Security analysis for CVE-2026-88062 remote code execution through OmniRoute ACP custom-agent interpreter arguments."
tags: ["agent-and-tool-security", "infrastructure-and-supply-chain"]
---

# OmniRoute ACP custom-agent RCE

## Current Understanding

The [September 13 topic collector source](../../../raw/processed/2026-09-13/ai-security-wiki-topic-news-collector-2026-09-13T171540Z.json) records [CVE-2026-88062](https://cveawg.mitre.org/api/cve/CVE-2026-88062) for OmniRoute 3.8.49 and earlier. Broad OmniRoute product context belongs upstream when it matures; this local page owns the ACP custom-agent execution boundary.

The advisory says `POST /api/acp/agents` accepted attacker-controlled `binary` and `versionCommand` values and reached an `execFileSync` sink after limited filtering and a self-consistency check. Anonymous exploitation was possible when `requireLogin=false` or during a fresh-instance bootstrap window; otherwise exploitation required a management session or management-scoped API key. No fixed version was available in the reviewed advisory evidence.

## Security Impact

- Threat: custom-agent registration can turn management or bootstrap API access into host command execution when interpreter binaries and version probes are caller-controlled.
- Affected boundary: OmniRoute 3.8.49 and earlier ACP custom-agent endpoint, bootstrap configuration, management sessions, and management-scoped API keys.
- Exploit or incident status: public CVE, GitHub advisory, commit, and pull-request evidence; no active exploitation evidence is recorded by the source.
- Mitigation state: no fixed version was available in the reviewed advisory; require authentication before bootstrap mutation, restrict interpreter paths to allow-listed binaries, and avoid executing caller-supplied version commands.
- Confidence: high for the vulnerable endpoint and sink path from CVE/advisory evidence; medium for remediation because a fixed release was not identified.
- Residual risk: ACP-style agent registries need separate controls for bootstrap windows, API-key scope, interpreter selection, and command probes.

## Authoritative Sources

- [September 13 topic collector source](../../../raw/processed/2026-09-13/ai-security-wiki-topic-news-collector-2026-09-13T171540Z.json)
- [CVE-2026-88062 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-88062)
- [OmniRoute GitHub advisory GHSA-hf57-cqmx-p4gr](https://github.com/diegosouzapw/OmniRoute/security/advisories/GHSA-hf57-cqmx-p4gr)
- [OmniRoute commit 60829241fd64d0317aa6a0dd8cd7a445a5287fed](https://github.com/diegosouzapw/OmniRoute/commit/60829241fd64d0317aa6a0dd8cd7a445a5287fed)
- [OmniRoute pull request 11028](https://github.com/diegosouzapw/OmniRoute/pull/11028)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [local agent execution and processing boundaries](local-agent-execution-and-processing-boundaries.md)
- [MCP tool-level IAM authorization](../identity-and-access/mcp-tool-level-iam-authorization.md)

## Open Questions

- Which OmniRoute release, if any, ships a complete fix for CVE-2026-88062?
- What configuration path governs `requireLogin` during fresh-instance bootstrap?

## Maintenance Notes

- Created on 2026-09-13 from the [September 13 topic collector](../../../raw/processed/2026-09-13/ai-security-wiki-topic-news-collector-2026-09-13T171540Z.json) as an ACP custom-agent execution-boundary leaf.
