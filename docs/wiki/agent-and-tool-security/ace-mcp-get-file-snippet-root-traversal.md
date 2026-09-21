---
type: "Topic"
title: "ACE-MCP get_file_snippet root traversal"
description: "Security analysis for CVE-2026-94046 workspace-root bypass in ACE-MCP get_file_snippet."
tags: ["agent-and-tool-security", "infrastructure-and-supply-chain"]
---

# ACE-MCP get_file_snippet root traversal

## Current Understanding

The [September 20 topic collector source](../../../raw/processed/2026-09-20/ai-security-wiki-topic-news-collector-2026-09-20T233226Z.json) records [CVE-2026-94046](https://cveawg.mitre.org/api/cve/CVE-2026-94046) for 0215AndrewFeng ACE-MCP 4.10.0 through 4.10.8; MCP get_file_snippet tool. Broad ACE-MCP or MCP ecosystem context belongs upstream; this page owns the local security boundary, exploit status, mitigation state, and residual risk.

The `get_file_snippet` tool treats a caller-supplied `projectRootPath` as the trusted root, so an attacker can choose a sensitive directory and make the path-inside-root guard meaningless. The source classifies the evidence as cve services primary record with vuldb technical reference and public issue-tracker reference and records visible publication at 2026-09-20T18:45:09.014Z.

## Security Impact

- Threat: Workspace roots are authority boundaries for coding and analysis agents; accepting caller-chosen roots can expose arbitrary host snippets through a benign-looking file snippet tool.
- Affected boundary: 0215AndrewFeng ACE-MCP 4.10.0 through 4.10.8; MCP get_file_snippet tool.
- Exploit or incident status: public vulnerability disclosure; no local in-the-wild incident is recorded.
- Mitigation state: do not accept workspace roots from untrusted tool callers, bind roots to server-side project configuration, and regression-test arbitrary host-file reads.
- Confidence: High confidence from the CVE text because it includes the bypass mechanism; fixed release is not present in the captured record.
- Residual risk: agent-exposed tool and model-runtime boundaries remain sensitive when tool inputs, model artifacts, or local daemon channels can cross into host authority.

## Authoritative Sources

- [September 20 topic collector source](../../../raw/processed/2026-09-20/ai-security-wiki-topic-news-collector-2026-09-20T233226Z.json)
- [CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-94046)
- [NVD record](https://nvd.nist.gov/vuln/detail/CVE-2026-94046)
- [VulDB record](https://vuldb.com/vuln/407975)
- [GitHub issue](https://github.com/0215AndrewFeng/ACE-MCP/issues/1)

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

- Which ACE-MCP version after 4.10.8 fixes the caller-chosen root flaw?

## Maintenance Notes

- Created on 2026-09-20 from the [September 20 topic collector source](../../../raw/processed/2026-09-20/ai-security-wiki-topic-news-collector-2026-09-20T233226Z.json) after upstream routing kept broad entity context in sibling wikis and local ownership on the security boundary.
