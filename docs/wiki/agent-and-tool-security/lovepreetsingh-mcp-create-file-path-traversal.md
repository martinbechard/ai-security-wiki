---
type: "Topic"
title: "03-lovepreetSingh MCP create_file path traversal"
description: "Security analysis for CVE-2026-94044 path traversal in the 03-lovepreetSingh MCP create_file route."
tags: ["agent-and-tool-security", "infrastructure-and-supply-chain"]
---

# 03-lovepreetSingh MCP create_file path traversal

## Current Understanding

The [September 20 topic collector source](../../../raw/processed/2026-09-20/ai-security-wiki-topic-news-collector-2026-09-20T233226Z.json) records [CVE-2026-94044](https://cveawg.mitre.org/api/cve/CVE-2026-94044) for 03-lovepreetSingh MCP through commit f95d035c5317fad81af9828286631053ccb23546; create_file API route. Broad 03-lovepreetSingh MCP or MCP ecosystem context belongs upstream; this page owns the local security boundary, exploit status, mitigation state, and residual risk.

The `create_file` API route is a host-integrity boundary because file path and content manipulation can write outside the intended workspace. The source classifies the evidence as cve services primary record with vuldb technical reference and public issue-tracker reference and records visible publication at 2026-09-20T18:15:11.404Z.

## Security Impact

- Threat: Agent-exposed file creation is a host-integrity boundary; path traversal can let an MCP caller write outside the intended workspace.
- Affected boundary: 03-lovepreetSingh MCP through commit f95d035c5317fad81af9828286631053ccb23546; create_file API route.
- Exploit or incident status: public exploit material is recorded.
- Mitigation state: avoid affected commits, bind file creation to a canonical workspace root, reject traversal and symlink escapes, and require explicit authorization for file-writing tools.
- Confidence: High confidence from CVE Services; no versioning means the fixed boundary is unavailable.
- Residual risk: agent-exposed tool and model-runtime boundaries remain sensitive when tool inputs, model artifacts, or local daemon channels can cross into host authority.

## Authoritative Sources

- [September 20 topic collector source](../../../raw/processed/2026-09-20/ai-security-wiki-topic-news-collector-2026-09-20T233226Z.json)
- [CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-94044)
- [NVD record](https://nvd.nist.gov/vuln/detail/CVE-2026-94044)
- [VulDB record](https://vuldb.com/vuln/407973)
- [GitHub issue](https://github.com/03-lovepreetSingh/MCP/issues/3)

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

- Did the repository publish a remediation commit after f95d035c5317fad81af9828286631053ccb23546?

## Maintenance Notes

- Created on 2026-09-20 from the [September 20 topic collector source](../../../raw/processed/2026-09-20/ai-security-wiki-topic-news-collector-2026-09-20T233226Z.json) after upstream routing kept broad entity context in sibling wikis and local ownership on the security boundary.
