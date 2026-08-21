---
type: "Topic"
title: "SiYuan MCP Debug Key And File Boundary"
description: "Security analysis for SiYuan MCP path traversal and debug endpoint credential disclosure advisories."
tags: ["agent-and-tool-security", "data-and-privacy", "infrastructure-and-supply-chain"]
---

# SiYuan MCP Debug Key And File Boundary

## Current Understanding

The [August 18 topic news collector source](../../../raw/processed/2026-08-18/ai-security-wiki-topic-news-collector-2026-08-18T233017Z.json) records CVE-2026-74798 and CVE-2026-74799 for SiYuan before 3.7.4. Broad [SiYuan MCP endpoint authorization risk](../../../upstream-ai-wiki/techniques/siyuan-mcp-endpoint-authorization-risk.md) belongs upstream; this page owns the local key-disclosure and MCP filesystem authority boundary.

The family is split into focused leaves because the issues have different access prerequisites and mitigations:

- [SiYuan MCP database clean path traversal](siyuan-mcp-database-clean-path-traversal.md) owns CVE-2026-74798, where an authenticated MCP client can abuse `database_clean` path traversal to copy arbitrary readable files into history and delete originals.
- [SiYuan debug endpoint AI key disclosure](../data-and-privacy/siyuan-debug-endpoint-ai-key-disclosure.md) owns CVE-2026-74799, where unauthenticated `pprof` debug endpoints can expose `AccessAuthCode` and AI provider API keys when `--mode` is not exactly `prod`.

The [August 20 leaf update watch source](../../../raw/processed/2026-08-20/ai-security-wiki-leaf-update-watch-20260821T000216Z.json) confirms the family split with [CVE-2026-74798](https://www.cve.org/CVERecord?id=CVE-2026-74798) as authenticated MCP file movement/deletion and [CVE-2026-74799](https://www.cve.org/CVERecord?id=CVE-2026-74799) as unauthenticated debug-endpoint key disclosure.

## Security Impact

- Threat: local knowledge-base tooling can expose files and AI provider keys when MCP tools and debug endpoints are not independently constrained; linked leaves own issue-specific details.
- Affected boundary: SiYuan before 3.7.4; `database_clean`, history storage, debug endpoints, `AccessAuthCode`, and AI-provider credentials.
- Exploit or incident status: public vulnerability database records and GitHub security advisories.
- Mitigation state: upgrade to 3.7.4 or later, require exact production mode, authenticate debug endpoints, and contain MCP file operations.
- Confidence: high for affected version, CVE identifiers, and advisory mechanics from the collector evidence.
- Residual risk: local note systems often hold prompt material, documents, and provider keys, so a file-boundary bug can become both data exposure and credential compromise.

## Authoritative Sources

- [August 18 topic news collector source](../../../raw/processed/2026-08-18/ai-security-wiki-topic-news-collector-2026-08-18T233017Z.json)
- [August 20 leaf update watch source](../../../raw/processed/2026-08-20/ai-security-wiki-leaf-update-watch-20260821T000216Z.json)
- [NVD CVE-2026-74798](https://nvd.nist.gov/vuln/detail/CVE-2026-74798)
- [NVD CVE-2026-74799](https://nvd.nist.gov/vuln/detail/CVE-2026-74799)
- [GitHub advisory GHSA-43jx-gxq4-jpjc](https://github.com/siyuan-note/siyuan/security/advisories/GHSA-43jx-gxq4-jpjc)
- [GitHub advisory GHSA-9cqq-p2hw-mj3f](https://github.com/siyuan-note/siyuan/security/advisories/GHSA-9cqq-p2hw-mj3f)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [agent tool filesystem path containment](../infrastructure-and-supply-chain/agent-tool-filesystem-path-containment.md)
- [development agent credential isolation](../identity-and-access/development-agent-credential-isolation.md)
- [SiYuan MCP database clean path traversal](siyuan-mcp-database-clean-path-traversal.md)
- [SiYuan debug endpoint AI key disclosure](../data-and-privacy/siyuan-debug-endpoint-ai-key-disclosure.md)
- Upstream AI wiki owns broad [SiYuan MCP endpoint authorization risk](../../../upstream-ai-wiki/techniques/siyuan-mcp-endpoint-authorization-risk.md).

## Open Questions

- Which SiYuan deployment checks can prove debug endpoints are not reachable in non-production modes?

## Maintenance Notes

- Created on 2026-08-19 from the [August 18 topic collector](../../../raw/processed/2026-08-18/ai-security-wiki-topic-news-collector-2026-08-18T233017Z.json) as a SiYuan MCP and debug-endpoint advisory router.
- Split on 2026-08-19 after verifier correction into separate MCP path-traversal and debug-endpoint credential-disclosure leaves.
- Updated on 2026-08-20 from the [August 20 leaf update watch source](../../../raw/processed/2026-08-20/ai-security-wiki-leaf-update-watch-20260821T000216Z.json) with additional advisory evidence preserving the access-prerequisite split.
