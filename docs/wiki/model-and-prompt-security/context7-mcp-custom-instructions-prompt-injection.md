---
type: "Topic"
title: "Context7 MCP Custom Instructions Prompt Injection"
description: "Security analysis for CVE-2026-75130 prompt injection through Context7 MCP custom AI instructions."
tags: ["model-and-prompt-security", "agent-and-tool-security", "data-and-privacy"]
---

# Context7 MCP Custom Instructions Prompt Injection

## Current Understanding

The [August 18 topic news collector source](../../../raw/processed/2026-08-18/ai-security-wiki-topic-news-collector-2026-08-18T233017Z.json) records CVE-2026-75130 / GHSA-97r6-3rgm-v39r for Context7 through 2.1.2. Broad [Context7 MCP](../../../upstream-ai-wiki/mcp-servers/context7.md) background belongs upstream; this page owns the local prompt-injection-to-agent-action boundary.

The advisory says unsanitized Custom AI Instructions served through the MCP server can inject malicious instructions into connected AI coding agents. Reported impacts include credential exfiltration from environment files to an attacker-controlled service and destructive file operations when the agent makes routine library documentation requests.

## Security Impact

- Threat: documentation retrieval can become an instruction-delivery path that drives credential theft or destructive actions.
- Affected boundary: Context7 through 2.1.2; Custom AI Instructions and connected coding-agent tool authority.
- Exploit or incident status: public GitHub advisory and NVD record with security-research reference.
- Mitigation state: fixed-version detail needs direct confirmation; clients should treat MCP-provided documentation and instructions as untrusted content.
- Confidence: high for vulnerability class and affected version from GHSA/NVD evidence.
- Residual risk: trusted-looking documentation MCP responses can carry action instructions unless clients separate retrieved content from developer or user instructions.

## Control Implications

- Render MCP documentation as data, not as executable instruction.
- Strip or quarantine custom instruction fields from third-party documentation sources.
- Require explicit user confirmation before environment-file reads, network exfiltration, or destructive file actions suggested by retrieved content.
- Log the retrieved content that influenced tool actions for post-incident traceability.

## Authoritative Sources

- [August 18 topic news collector source](../../../raw/processed/2026-08-18/ai-security-wiki-topic-news-collector-2026-08-18T233017Z.json)
- [GitHub advisory GHSA-97r6-3rgm-v39r](https://github.com/advisories/GHSA-97r6-3rgm-v39r)
- [NVD CVE-2026-75130](https://nvd.nist.gov/vuln/detail/CVE-2026-75130)
- [Noma Security ContextCrush research](https://noma.security/blog/contextcrush-context7-the-mcp-server-vulnerability)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [model and prompt security](index.md)
- [GhostSplice MCP split instruction exfiltration](../agent-and-tool-security/ghostsplice-mcp-split-instruction-exfiltration.md)
- [MCP data movement exposure controls](../data-and-privacy/mcp-data-movement-exposure-controls.md)
- Upstream AI wiki owns broad [Context7 MCP](../../../upstream-ai-wiki/mcp-servers/context7.md).

## Open Questions

- Which Context7 release first removes or constrains Custom AI Instructions in MCP responses?

## Maintenance Notes

- Created on 2026-08-19 from the [August 18 topic collector](../../../raw/processed/2026-08-18/ai-security-wiki-topic-news-collector-2026-08-18T233017Z.json) as a prompt-injection leaf rather than a general Context7 product page.
