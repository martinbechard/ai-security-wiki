---
type: "Topic"
title: "IntentKit Narrowed-Tool Authorization Bypass"
description: "Security analysis for CVE-2026-76066 executor validation against a full registry instead of a request-scoped tool allowlist."
tags: ["agent-and-tool-security", "identity-and-access", "model-and-prompt-security"]
---

# IntentKit Narrowed-Tool Authorization Bypass

## Current Understanding

The [October 15 topic collector source](../../../raw/processed/2026-10-15/ai-security-wiki-topic-news-collector-2026-10-15T232644Z.json) records [CVE-2026-76066](https://cveawg.mitre.org/api/cve/CVE-2026-76066): IntentKit through 2.6.3 validates tool execution against its full registry rather than the per-request narrowed advertisement enforced by `ToolBindingMiddleware`. Broad IntentKit context belongs upstream; this page owns execution-edge enforcement of the request-scoped capability boundary.

The CVE states that an unauthenticated or public caller can supply a de-advertised owner-only action through direct or indirect prompt injection, history replay, or checkpoint data. Model-visible tool shaping is therefore not authorization.

## Security Impact

- Threat: a caller invokes de-advertised state-changing tools such as wallet transfer, posting, memory write, or call-agent actions.
- Affected boundary: IntentKit through 2.6.3; `ToolBindingMiddleware` narrowed-tool advertisement versus executor registry validation.
- Exploit or incident status: public CVE; no local exploitation incident is recorded.
- Mitigation state: no fixed release is established by the captured primary record; enforce the exact request allowlist and approval state at dispatch, then regression-test every alternate invocation channel.
- Confidence: high for the described boundary and affected-version ceiling; remediation status remains open.
- Residual risk: replayed history and prompt-injected names can reach any executor path that treats a registry lookup as authorization.

## Control Implications

- Carry an immutable request-scoped capability grant to the executor.
- Resolve a tool name only within that grant, then enforce approval immediately before state change.
- Test web, API, social, checkpoint, and history-replay paths against de-advertised tool names.

## Authoritative Sources

- [October 15 topic collector source](../../../raw/processed/2026-10-15/ai-security-wiki-topic-news-collector-2026-10-15T232644Z.json)
- [CVE-2026-76066 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-76066)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [MCP tool-level IAM authorization](../identity-and-access/mcp-tool-level-iam-authorization.md)
- [Repeat-After-Me tool-call authorization bypass](repeat-after-me-tool-call-authorization-bypass.md)

## Open Questions

- Which IntentKit release, if any, changes executor validation to the per-request capability grant?

## Maintenance Notes

- Created on 2026-10-15 from CVE-2026-76066; broad framework context remains upstream.
