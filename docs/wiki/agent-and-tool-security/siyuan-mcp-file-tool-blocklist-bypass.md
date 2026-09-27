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

The [September 26 topic collector source](../../../raw/processed/2026-09-26/ai-security-wiki-topic-news-collector-2026-09-26T233301Z.json) and [September 26 leaf update watch source](../../../raw/processed/2026-09-26/ai-security-wiki-leaf-update-watch-20260927T000401Z.json) add CVE-2026-100633 for SiYuan 3.8.0 through 3.8.3. Recursive MCP file operations applied sensitive-path guards to the allowed root but not every resolved descendant, so `file.grep`, `file.copy`, or unzip could expose or overwrite protected descendants such as `conf/conf.json`, TLS keys, snippets, templates, notebook internals, or logs. This remains the same durable containment page because the security control is still complete path guarding for MCP file tools, now extended to recursive descendants and approval evidence.

This page is separate from [agent tool filesystem path containment](../infrastructure-and-supply-chain/agent-tool-filesystem-path-containment.md) because it preserves the SiYuan-specific advisory identifiers, affected version, and workspace-secret exposure evidence while linking to the reusable control.

## Security Impact

- Threat: an MCP file tool can expose or overwrite workspace secrets when path containment relies on incomplete blocklists, case-sensitive protected-file checks, or root-only recursive-operation checks.
- Affected boundary: SiYuan before v3.8.0 for CVE-2026-60083, before v3.8.2 for CVE-2026-85580, and 3.8.0 through 3.8.3 for CVE-2026-100633.
- Exploit or incident status: public CVEs, GitHub advisory, and VulnCheck advisory evidence; no local exploitation evidence is recorded.
- Mitigation state: upgrade to v3.8.4 or later and replace blocklists with canonical root containment, file-class allowlists, case-normalized protected-file checks, descendant-by-descendant recursive validation, and secret-aware deny rules.
- Confidence: high for advisory identity and fix boundaries from NVD, CVE, and linked advisories.
- Residual risk: administrative MCP access still carries data-exfiltration risk when file tools share authority with local note or publishing state.

## Authoritative Sources

- [August 22 topic news collector source](../../../raw/processed/2026-08-22/ai-security-wiki-topic-news-collector-2026-08-22T233049Z.json)
- [August 23 topic news collector source](../../../raw/processed/2026-08-23/ai-security-wiki-topic-news-collector-2026-08-23T233302Z.json)
- [August 23 leaf update watch source](../../../raw/processed/2026-08-23/ai-security-wiki-leaf-update-watch-20260824T000259Z.json)
- [September 4 topic collector source](../../../raw/processed/2026-09-04/ai-security-wiki-topic-news-collector-2026-09-04T233156Z.json)
- [September 26 topic collector source](../../../raw/processed/2026-09-26/ai-security-wiki-topic-news-collector-2026-09-26T233301Z.json)
- [September 26 leaf update watch source](../../../raw/processed/2026-09-26/ai-security-wiki-leaf-update-watch-20260927T000401Z.json)
- [CVE-2026-100633](https://cveawg.mitre.org/api/cve/CVE-2026-100633)
- [NVD CVE-2026-100633](https://nvd.nist.gov/vuln/detail/CVE-2026-100633)
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
- Which SiYuan v3.8.4 changes validate every descendant path for recursive MCP file operations, and do approval cards now reveal descendant-sensitive paths?

## Maintenance Notes

- Created on 2026-08-22 from the [August 22 topic news collector source](../../../raw/processed/2026-08-22/ai-security-wiki-topic-news-collector-2026-08-22T233049Z.json) as the file-tool member of the SiYuan v3.8.0 advisory set.
- Updated on 2026-08-23 from the [August 23 topic news collector source](../../../raw/processed/2026-08-23/ai-security-wiki-topic-news-collector-2026-08-23T233302Z.json) with additional NVD evidence while avoiding a duplicate SiYuan leaf.
- Updated on 2026-09-04 from the [September 4 topic collector source](../../../raw/processed/2026-09-04/ai-security-wiki-topic-news-collector-2026-09-04T233156Z.json) with CVE-2026-85580 case-mismatch publish configuration disclosure.
- Updated on 2026-09-27 from the [September 26 topic collector source](../../../raw/processed/2026-09-26/ai-security-wiki-topic-news-collector-2026-09-26T233301Z.json) and [September 26 leaf update watch source](../../../raw/processed/2026-09-26/ai-security-wiki-leaf-update-watch-20260927T000401Z.json) with CVE-2026-100633 recursive descendant path-guard evidence.
