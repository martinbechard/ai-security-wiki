---
type: "Topic"
title: "ash_ai MCP Origin Validation DNS Rebinding"
description: "Security analysis for CVE-2026-81315 ash_ai MCP origin validation bypass through trusted headers."
tags: ["agent-and-tool-security", "identity-and-access"]
---

# ash_ai MCP Origin Validation DNS Rebinding

## Current Understanding

The [August 31 topic collector source](../../../raw/processed/2026-08-31/ai-security-wiki-topic-news-collector-2026-08-31T233224Z.json) records [CVE-2026-81315](https://nvd.nist.gov/vuln/detail/CVE-2026-81315) for ash_ai from 0.8.0 before 1.0.0. Broad ash_ai and MCP entity coverage belongs upstream; this page owns the browser-origin to MCP transport security boundary.

NVD and the linked [GitHub Security Advisory](https://github.com/ash-project/ash_ai/security/advisories/GHSA-c92r-f3rr-q49h) describe default MCP origin validation that could be bypassed through DNS rebinding because `Host` and `x-forwarded-proto` were trusted in the decision path.

The [September 1 leaf update watch source](../../../raw/processed/2026-09-01/ai-security-wiki-leaf-update-watch-20260902T000316Z.json) adds CVEAWG publication and update evidence plus the project [fix commit](https://github.com/ash-project/ash_ai/commit/28af68d73134df0b8fb3aa6ab03e8fd795b07c21). It does not change the local affected range or mitigation state, so this page treats the watcher as corroboration.

## Security Impact

- Threat: a browser-controlled origin can drive a local MCP endpoint when host validation accepts attacker-influenced request headers.
- Affected boundary: ash_ai 0.8.0 through before 1.0.0.
- Exploit or incident status: public CVE and GitHub advisory; no local incident is recorded.
- Mitigation state: upgrade to ash_ai 1.0.0 or later and validate origin, scheme, and host against trusted server-side configuration rather than forwarded request headers.
- Confidence: high for advisory identity and affected range from NVD and the project advisory reference.
- Residual risk: local MCP transports remain exposed to browser-origin confusion whenever origin checks share trust with proxy headers.

## Control Implications

- Enable explicit Host allow-lists on MCP HTTP transports.
- Treat `x-forwarded-*` headers as trusted only behind a configured proxy boundary.
- Regression-test DNS rebinding, alternate Host values, and scheme spoofing for local agent servers.

## Authoritative Sources

- [August 31 topic collector source](../../../raw/processed/2026-08-31/ai-security-wiki-topic-news-collector-2026-08-31T233224Z.json)
- [September 1 leaf update watch source](../../../raw/processed/2026-09-01/ai-security-wiki-leaf-update-watch-20260902T000316Z.json)
- [NVD CVE-2026-81315](https://nvd.nist.gov/vuln/detail/CVE-2026-81315)
- [GitHub Security Advisory GHSA-c92r-f3rr-q49h](https://github.com/ash-project/ash_ai/security/advisories/GHSA-c92r-f3rr-q49h)
- [ash_ai fix commit](https://github.com/ash-project/ash_ai/commit/28af68d73134df0b8fb3aa6ab03e8fd795b07c21)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [MCP SDK transport header handling](../infrastructure-and-supply-chain/mcp-sdk-transport-header-handling.md)
- [mcp-go DNS rebinding host validation](mcp-go-dns-rebinding-host-validation.md)

## Open Questions

- Which ash_ai deployment shapes legitimately require forwarded scheme or host headers for MCP origin decisions?

## Maintenance Notes

- Created on 2026-08-31 from the [August 31 topic collector](../../../raw/processed/2026-08-31/ai-security-wiki-topic-news-collector-2026-08-31T233224Z.json) as an MCP origin-validation leaf.
- Updated on 2026-09-01 from the [September 1 leaf watcher](../../../raw/processed/2026-09-01/ai-security-wiki-leaf-update-watch-20260902T000316Z.json) with CVEAWG and fix-commit corroboration.
