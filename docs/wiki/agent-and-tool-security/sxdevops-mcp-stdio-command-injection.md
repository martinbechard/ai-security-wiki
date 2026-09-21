---
type: "Topic"
title: "SxDevOps MCP STDIO command injection"
description: "Security analysis for CVE-2026-93965 command injection in SxDevOps MCP STDIO server management."
tags: ["agent-and-tool-security", "infrastructure-and-supply-chain"]
---

# SxDevOps MCP STDIO command injection

## Current Understanding

The [September 20 topic collector source](../../../raw/processed/2026-09-20/ai-security-wiki-topic-news-collector-2026-09-20T233226Z.json) records [CVE-2026-93965](https://cveawg.mitre.org/api/cve/CVE-2026-93965) for aiyiyi121 SxDevOps 1.0 and 1.1; MCP STDIO Server Management command-launch path. Broad SxDevOps or MCP ecosystem context belongs upstream; this page owns the local security boundary, exploit status, mitigation state, and residual risk.

MCP STDIO server management command launch turns configuration and remote request data into host command authority when the endpoint or command string reaches `subprocess.Popen` without safe argument boundaries. The source classifies the evidence as cve services primary record with vuldb technical reference and public issue-tracker reference and records visible publication at 2026-09-20T05:45:10.959Z.

## Security Impact

- Threat: MCP server management is a delegated tool-execution boundary; argument injection into a stdio server launcher can convert tool configuration or remote requests into host command execution.
- Affected boundary: aiyiyi121 SxDevOps 1.0 and 1.1; MCP STDIO Server Management command-launch path.
- Exploit or incident status: public vulnerability disclosure; no local in-the-wild incident is recorded.
- Mitigation state: upgrade to a release containing patch 2b4bf8585c3e731e7a8af30801ea46680bc783f9 when available, avoid remote control of stdio launch strings, and wrap server registration in explicit admin approval and argv validation.
- Confidence: High confidence on CVE publication date and affected boundary; fixed-version semantics should be rechecked during ingest because the CVE names a patch hash rather than a release.
- Residual risk: agent-exposed tool and model-runtime boundaries remain sensitive when tool inputs, model artifacts, or local daemon channels can cross into host authority.

## Authoritative Sources

- [September 20 topic collector source](../../../raw/processed/2026-09-20/ai-security-wiki-topic-news-collector-2026-09-20T233226Z.json)
- [CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-93965)
- [NVD record](https://nvd.nist.gov/vuln/detail/CVE-2026-93965)
- [VulDB record](https://vuldb.com/vuln/407924)
- [GitHub issue](https://github.com/aiyiyi121/sxdevops/issues/16)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [MCP shell command policy bypasses](mcp-shell-command-policy-bypasses.md)
- [Agent tool filesystem path containment](../infrastructure-and-supply-chain/agent-tool-filesystem-path-containment.md)

## Open Questions

- Which SxDevOps release first contains patch 2b4bf8585c3e731e7a8af30801ea46680bc783f9?

## Maintenance Notes

- Created on 2026-09-20 from the [September 20 topic collector source](../../../raw/processed/2026-09-20/ai-security-wiki-topic-news-collector-2026-09-20T233226Z.json) after upstream routing kept broad entity context in sibling wikis and local ownership on the security boundary.
