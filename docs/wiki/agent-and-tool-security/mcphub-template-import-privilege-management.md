---
type: "Topic"
title: "MCPHub template import privilege management"
description: "Security analysis for CVE-2026-94047 privilege-management weakness in MCPHub template import."
tags: ["agent-and-tool-security", "infrastructure-and-supply-chain"]
---

# MCPHub template import privilege management

## Current Understanding

The [September 20 topic collector source](../../../raw/processed/2026-09-20/ai-security-wiki-topic-news-collector-2026-09-20T233226Z.json) records [CVE-2026-94047](https://cveawg.mitre.org/api/cve/CVE-2026-94047) for samanhappy MCPHub 1.0.0 through 1.0.32; Template Import Endpoint; fixed in 1.0.33. Broad MCPHub or MCP ecosystem context belongs upstream; this page owns the local security boundary, exploit status, mitigation state, and residual risk.

The template import endpoint is a control-plane mutation boundary; missing privilege management can let lower-privilege users import or alter MCP hub configuration. The source classifies the evidence as cve services primary record with vuldb technical reference and public issue-tracker reference and records visible publication at 2026-09-20T19:00:13.466Z.

## Security Impact

- Threat: Template import is an agent/tool supply-chain boundary because imported templates can carry executable or privileged tool configuration into an MCP hub.
- Affected boundary: samanhappy MCPHub 1.0.0 through 1.0.32; Template Import Endpoint; fixed in 1.0.33.
- Exploit or incident status: public exploit material is recorded.
- Mitigation state: upgrade to MCPHub 1.0.33 or later, require administrative authorization for template import, and audit imported server, prompt, and resource definitions.
- Confidence: High confidence on version boundary and fixed version from CVE text; ingest should verify whether the VulDB 'RCE' submit label reflects the public issue details.
- Residual risk: agent-exposed tool and model-runtime boundaries remain sensitive when tool inputs, model artifacts, or local daemon channels can cross into host authority.

## Authoritative Sources

- [September 20 topic collector source](../../../raw/processed/2026-09-20/ai-security-wiki-topic-news-collector-2026-09-20T233226Z.json)
- [CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-94047)
- [NVD record](https://nvd.nist.gov/vuln/detail/CVE-2026-94047)
- [VulDB record](https://vuldb.com/vuln/407976)
- [GitHub issue](https://github.com/samanhappy/mcphub/issues/1094)

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

- Does MCPHub 1.0.33 fully cover all template-import side effects, including imported server authority and prompt/resource namespace mutation?

## Maintenance Notes

- Created on 2026-09-20 from the [September 20 topic collector source](../../../raw/processed/2026-09-20/ai-security-wiki-topic-news-collector-2026-09-20T233226Z.json) after upstream routing kept broad entity context in sibling wikis and local ownership on the security boundary.
