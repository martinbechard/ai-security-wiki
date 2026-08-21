---
type: "Topic"
title: "SiYuan Debug Endpoint AI Key Disclosure"
description: "Security analysis for CVE-2026-74799 unauthenticated debug endpoint exposure of SiYuan AccessAuthCode and AI provider keys."
tags: ["data-and-privacy", "agent-and-tool-security", "identity-and-access"]
---

# SiYuan Debug Endpoint AI Key Disclosure

## Current Understanding

The [August 18 topic news collector source](../../../raw/processed/2026-08-18/ai-security-wiki-topic-news-collector-2026-08-18T233017Z.json) records [CVE-2026-74799](https://nvd.nist.gov/vuln/detail/CVE-2026-74799) for SiYuan before 3.7.4. Broad [SiYuan MCP endpoint authorization risk](../../../upstream-ai-wiki/techniques/siyuan-mcp-endpoint-authorization-risk.md) belongs upstream; this page owns the local debug endpoint and AI-provider credential disclosure boundary.

[SiYuan MCP debug key and file boundary](../agent-and-tool-security/siyuan-mcp-debug-key-and-file-boundary.md) routes the broader SiYuan advisory family. This leaf is narrower: unauthenticated `pprof` debug endpoints are exposed when `--mode` is not exactly `prod`, allowing heap and goroutine dumps that can expose `AccessAuthCode` and AI provider API keys.

The [August 20 leaf update watch source](../../../raw/processed/2026-08-20/ai-security-wiki-leaf-update-watch-20260821T000216Z.json) adds [CVE Program](https://www.cve.org/CVERecord?id=CVE-2026-74799), [NVD](https://nvd.nist.gov/vuln/detail/CVE-2026-74799), and [GitHub advisory](https://github.com/siyuan-note/siyuan/security/advisories/GHSA-9cqq-p2hw-mj3f) evidence and keeps credential rotation as required when debug exposure is suspected.

## Security Impact

- Threat: debug endpoints can disclose access codes and AI provider credentials without authentication.
- Affected boundary: SiYuan before 3.7.4; `pprof` endpoints, `AccessAuthCode`, and AI provider API keys.
- Exploit or incident status: public NVD and GitHub advisory evidence; no local incident evidence is recorded.
- Mitigation state: upgrade to 3.7.4 or later, require exact production mode, authenticate debug endpoints, and rotate exposed provider keys when debug access is suspected.
- Confidence: high for affected version and CVE mechanics from collector evidence.
- Residual risk: configuration spelling or mode drift can re-enable debug exposure even when MCP file operations are patched.

## Authoritative Sources

- [August 18 topic news collector source](../../../raw/processed/2026-08-18/ai-security-wiki-topic-news-collector-2026-08-18T233017Z.json)
- [August 20 leaf update watch source](../../../raw/processed/2026-08-20/ai-security-wiki-leaf-update-watch-20260821T000216Z.json)
- [NVD CVE-2026-74799](https://nvd.nist.gov/vuln/detail/CVE-2026-74799)
- [GitHub advisory GHSA-9cqq-p2hw-mj3f](https://github.com/siyuan-note/siyuan/security/advisories/GHSA-9cqq-p2hw-mj3f)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [data and privacy](index.md)
- [SiYuan MCP debug key and file boundary](../agent-and-tool-security/siyuan-mcp-debug-key-and-file-boundary.md)
- [development agent credential isolation](../identity-and-access/development-agent-credential-isolation.md)

## Open Questions

- Which deployment checks prove SiYuan debug endpoints are not reachable in non-production modes?

## Maintenance Notes

- Created on 2026-08-19 after verifier correction split the SiYuan advisory family.
- Updated on 2026-08-20 from the [August 20 leaf update watch source](../../../raw/processed/2026-08-20/ai-security-wiki-leaf-update-watch-20260821T000216Z.json) with additional advisory evidence for unauthenticated debug-endpoint credential exposure.
