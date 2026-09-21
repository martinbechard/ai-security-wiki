---
type: "Topic"
title: "nexus-mcp nexus_reauth command injection"
description: "Security analysis for CVE-2026-94031 command injection in the nexus-mcp nexus_reauth tool."
tags: ["agent-and-tool-security", "infrastructure-and-supply-chain"]
---

# nexus-mcp nexus_reauth command injection

## Current Understanding

The [September 20 topic collector source](../../../raw/processed/2026-09-20/ai-security-wiki-topic-news-collector-2026-09-20T233226Z.json) records [CVE-2026-94031](https://cveawg.mitre.org/api/cve/CVE-2026-94031) for nexus-mcp rolling release at commit aed0026e7ac1f23dc940e46e9fd3a2da6904f914; nexus_reauth MCP tool. Broad nexus-mcp or MCP ecosystem context belongs upstream; this page owns the local security boundary, exploit status, mitigation state, and residual risk.

The `nexus_reauth` authentication helper becomes a command-execution surface because URL input reaches `child_process.exec` in a browser reauthentication path. The source classifies the evidence as cve services primary record with vuldb technical reference and public issue-tracker reference and records visible publication at 2026-09-20T14:00:10.406Z.

## Security Impact

- Threat: Authentication helper tools inside MCP servers can become command-execution surfaces if they shell out with untrusted URL input.
- Affected boundary: nexus-mcp rolling release at commit aed0026e7ac1f23dc940e46e9fd3a2da6904f914; nexus_reauth MCP tool.
- Exploit or incident status: public exploit material is recorded.
- Mitigation state: avoid exposing the vulnerable rolling-release commit, replace shell execution with structured browser launch APIs, and treat authentication helper tools as privileged host actions.
- Confidence: High confidence for the disclosure record; release remediation is unknown because the project uses rolling releases and the CVE says no response yet.
- Residual risk: agent-exposed tool and model-runtime boundaries remain sensitive when tool inputs, model artifacts, or local daemon channels can cross into host authority.

## Authoritative Sources

- [September 20 topic collector source](../../../raw/processed/2026-09-20/ai-security-wiki-topic-news-collector-2026-09-20T233226Z.json)
- [CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-94031)
- [NVD record](https://nvd.nist.gov/vuln/detail/CVE-2026-94031)
- [VulDB record](https://vuldb.com/vuln/407959)
- [GitHub issue](https://github.com/0-Gaurav-0/nexus-mcp/issues/1)

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

- Has nexus-mcp published a fixed commit or release after the public exploit disclosure?

## Maintenance Notes

- Created on 2026-09-20 from the [September 20 topic collector source](../../../raw/processed/2026-09-20/ai-security-wiki-topic-news-collector-2026-09-20T233226Z.json) after upstream routing kept broad entity context in sibling wikis and local ownership on the security boundary.
