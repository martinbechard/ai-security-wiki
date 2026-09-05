---
type: "Topic"
title: "SiYuan MCP File Tool Blocklist Bypass"
description: "Security analysis for CVE-2026-60083 SiYuan MCP file-tool path blocklist bypass."
tags: ["agent-and-tool-security", "data-and-privacy", "infrastructure-and-supply-chain"]
---

# SiYuan MCP File Tool Blocklist Bypass

## Current Understanding

The [August 22 topic news collector source](../../../raw/processed/2026-08-22/ai-security-wiki-topic-news-collector-2026-08-22T233049Z.json) and [August 23 topic news collector source](../../../raw/processed/2026-08-23/ai-security-wiki-topic-news-collector-2026-08-23T233302Z.json) record CVE-2026-60083 for SiYuan before v3.8.0. Broad [SiYuan MCP endpoint authorization risk](../../../upstream-ai-wiki/techniques/siyuan-mcp-endpoint-authorization-risk.md) belongs upstream; this page owns the local MCP file-tool containment boundary.

The [NVD record](https://nvd.nist.gov/vuln/detail/CVE-2026-60083), linked [GitHub advisory](https://github.com/siyuan-note/siyuan/security/advisories/GHSA-c8r8-95hg-mp34), and [VulnCheck advisory](https://www.vulncheck.com/advisories/siyuan-before-incomplete-path-blocklist-via-mcp-file-tool) describe an incomplete path blocklist that let authenticated administrators read plaintext publish-mode passwords and other sensitive workspace files. The fix boundary is v3.8.0 in the collector evidence.

The [September 4 topic collector source](../../../raw/processed/2026-09-04/ai-security-wiki-topic-news-collector-2026-09-04T233156Z.json) adds CVE-2026-85580 for SiYuan before v3.8.2: on Linux filesystems, the MCP file-access handler uses case-sensitive matching, so case-variant requests such as `PublishAccess.json` can bypass protected-file guards and disclose publish configuration and metadata. This is the same durable containment boundary as CVE-2026-60083, but with a separate fixed-version question.

This page is separate from [agent tool filesystem path containment](../infrastructure-and-supply-chain/agent-tool-filesystem-path-containment.md) because it preserves the SiYuan-specific advisory identifiers, affected version, and workspace-secret exposure evidence while linking to the reusable control.

## Security Impact

- Threat: an MCP file tool can expose workspace secrets when path containment relies on incomplete blocklists or case-sensitive protected-file checks.
- Affected boundary: SiYuan before v3.8.0 for CVE-2026-60083 and before v3.8.2 for CVE-2026-85580.
- Exploit or incident status: public CVEs, GitHub advisory, and VulnCheck advisory evidence; no local exploitation evidence is recorded.
- Mitigation state: upgrade to v3.8.2 or later and replace blocklists with canonical root containment, file-class allowlists, case-normalized protected-file checks, and secret-aware deny rules.
- Confidence: high for advisory identity and fix boundaries from NVD, CVE, and linked advisories.
- Residual risk: administrative MCP access still carries data-exfiltration risk when file tools share authority with local note or publishing state.

## Authoritative Sources

- [August 22 topic news collector source](../../../raw/processed/2026-08-22/ai-security-wiki-topic-news-collector-2026-08-22T233049Z.json)
- [August 23 topic news collector source](../../../raw/processed/2026-08-23/ai-security-wiki-topic-news-collector-2026-08-23T233302Z.json)
- [August 23 leaf update watch source](../../../raw/processed/2026-08-23/ai-security-wiki-leaf-update-watch-20260824T000259Z.json)
- [September 4 topic collector source](../../../raw/processed/2026-09-04/ai-security-wiki-topic-news-collector-2026-09-04T233156Z.json)
- [CVE-2026-85580](https://cveawg.mitre.org/api/cve/CVE-2026-85580)
- [NVD CVE-2026-85580](https://nvd.nist.gov/vuln/detail/CVE-2026-85580)
- [NVD CVE-2026-60083](https://nvd.nist.gov/vuln/detail/CVE-2026-60083)
- [GitHub advisory GHSA-c8r8-95hg-mp34](https://github.com/siyuan-note/siyuan/security/advisories/GHSA-c8r8-95hg-mp34)
- [VulnCheck advisory](https://www.vulncheck.com/advisories/siyuan-before-incomplete-path-blocklist-via-mcp-file-tool)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [agent tool filesystem path containment](../infrastructure-and-supply-chain/agent-tool-filesystem-path-containment.md)
- [SiYuan MCP debug key and file boundary](siyuan-mcp-debug-key-and-file-boundary.md)
- Upstream AI wiki owns broad [SiYuan MCP endpoint authorization risk](../../../upstream-ai-wiki/techniques/siyuan-mcp-endpoint-authorization-risk.md).

## Open Questions

- Which workspace files are blocked or allowed by SiYuan v3.8.0 after the CVE-2026-60083 fix?
- Which SiYuan v3.8.2 changes enforce case-normalized matching for protected publish configuration files?

## Maintenance Notes

- Created on 2026-08-22 from the [August 22 topic news collector source](../../../raw/processed/2026-08-22/ai-security-wiki-topic-news-collector-2026-08-22T233049Z.json) as the file-tool member of the SiYuan v3.8.0 advisory set.
- Updated on 2026-08-23 from the [August 23 topic news collector source](../../../raw/processed/2026-08-23/ai-security-wiki-topic-news-collector-2026-08-23T233302Z.json) with additional NVD evidence while avoiding a duplicate SiYuan leaf.
- Updated on 2026-09-04 from the [September 4 topic collector source](../../../raw/processed/2026-09-04/ai-security-wiki-topic-news-collector-2026-09-04T233156Z.json) with CVE-2026-85580 case-mismatch publish configuration disclosure.
