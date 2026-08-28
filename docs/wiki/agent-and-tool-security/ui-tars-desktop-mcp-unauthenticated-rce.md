---
type: "Topic"
title: "UI-TARS desktop MCP unauthenticated RCE"
description: "Security analysis for CVE-2026-81735 ByteDance UI-TARS desktop MCP unauthenticated RCE."
tags: ["agent-and-tool-security", "infrastructure-and-supply-chain"]
---

# UI-TARS desktop MCP unauthenticated RCE

## Current Understanding

The [August 27 topic collector source](../../../raw/processed/2026-08-27/ai-security-wiki-topic-news-collector-2026-08-27T233104Z.json) records [CVE-2026-81735](https://nvd.nist.gov/vuln/detail/CVE-2026-81735) for ByteDance UI-TARS desktop `@agent-infra` MCP HTTP server. Broad [UI-TARS product context](../../../upstream-ai-wiki/topic-index.md) belongs upstream; this page owns the desktop-agent MCP binding, optional-authentication, command, and filesystem boundary.

## Security Impact

- Threat: a bundled MCP HTTP server listening on all interfaces with optional authentication can expose command execution and file tools to reachable clients
- Affected boundary: ByteDance UI-TARS-desktop @agent-infra mcp-http-server before the referenced fix
- Exploit or incident status: public advisory evidence; no local in-the-wild exploitation evidence is recorded.
- Mitigation state: Apply the [referenced upstream fix](https://github.com/bytedance/UI-TARS-desktop/commit/c2ad42e3eb9b27830db41a3e6f51ca7179d9b168); bind desktop MCP surfaces to loopback, require authentication, and disable command/file tools unless explicitly authorized.
- Confidence: high for advisory existence and affected boundary; medium for remediation details when the primary advisory does not name a fixed release.
- Residual risk: model- or browser-reachable helper surfaces can convert ordinary tool arguments into internal data access, credential use, or host execution when final authorization is missing.

## Authoritative Sources

- [August 27 topic collector source](../../../raw/processed/2026-08-27/ai-security-wiki-topic-news-collector-2026-08-27T233104Z.json)
- [NVD record](https://nvd.nist.gov/vuln/detail/CVE-2026-81735)
- [CVE record](https://www.cve.org/CVERecord?id=CVE-2026-81735)
- [GitHub commit](https://github.com/bytedance/UI-TARS-desktop/commit/c2ad42e3eb9b27830db41a3e6f51ca7179d9b168)
- [GitHub pull request](https://github.com/bytedance/UI-TARS-desktop/pull/1918)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](../agent-and-tool-security/index.md)
- [infrastructure and supply chain](../infrastructure-and-supply-chain/index.md)
- [identity and access](../identity-and-access/index.md)

## Open Questions

- No open wiki questions are recorded for this topic.

## Maintenance Notes

- Created on 2026-08-28 from the [August 27 topic collector](../../../raw/processed/2026-08-27/ai-security-wiki-topic-news-collector-2026-08-27T233104Z.json) as a focused desktop MCP optional-authentication RCE leaf after routing broad UI-TARS context upstream; next check fixed-version and secure-default behavior for all-interface bindings.
