---
type: "Topic"
title: "ag-ui HttpAgent Remote Information Disclosure"
description: "Security analysis for CVE-2026-120233 disclosure at the ag-ui TypeScript HttpAgent transport boundary."
tags: ["data-and-privacy", "agent-and-tool-security"]
---

# ag-ui HttpAgent Remote Information Disclosure

## Current Understanding

The [November 2 collector source](../../../raw/processed/2026-11-02/ai-security-wiki-topic-news-collector-2026-11-02T003500Z.json) records [CVE-2026-120233](https://nvd.nist.gov/vuln/detail/CVE-2026-120233): ag-ui through 0.0.58 has a remote information-disclosure flaw in the TypeScript client `HttpAgent` component. General AG-UI protocol and package context belongs upstream; this page owns the local agent-transport disclosure boundary.

## Security Impact

- Threat: a remote unauthenticated vector can disclose data crossing the agent client transport boundary.
- Affected boundary: `sdks/typescript/packages/client/src/agent/http.ts` in ag-ui through 0.0.58.
- Exploit or incident status: NVD reports public exploit material; no local incident or independent in-the-wild exploitation evidence is recorded.
- Mitigation state: a public issue and pull request are captured, but no released fixed version is established; do not treat the proposed patch as shipped remediation.
- Confidence: medium because the affected file and version range are precise but the captured evidence does not explain the disclosure mechanism.
- Residual risk: agent-client transports may carry prompts, tool results, and user data, so deployments need exposure review even where the exact disclosure payload remains unresolved.

## Authoritative Sources

- [November 2 collector source](../../../raw/processed/2026-11-02/ai-security-wiki-topic-news-collector-2026-11-02T003500Z.json)
- [NVD CVE-2026-120233](https://nvd.nist.gov/vuln/detail/CVE-2026-120233)
- [Reported issue 2520](https://github.com/ag-ui-protocol/ag-ui/issues/2520)
- [Proposed pull request 2575](https://github.com/ag-ui-protocol/ag-ui/pull/2575)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [data and privacy](index.md)
- [req_llm OpenAI WebSocket TLS Token Exposure](req-llm-openai-websocket-tls-token-exposure.md)
- [agent and tool security](../agent-and-tool-security/index.md)

## Open Questions

- What data is disclosed by the affected HttpAgent path, and which released version resolves it?

## Maintenance Notes

- Created on 2026-11-02 from the November 2 collector; retain the pending-patch uncertainty until a maintainer release is captured.
