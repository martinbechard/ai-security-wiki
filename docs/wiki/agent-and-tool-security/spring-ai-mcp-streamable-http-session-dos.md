---
type: "Topic"
title: "Spring AI MCP Streamable HTTP Session DoS"
description: "Security analysis for CVE-2026-59279 Spring AI MCP Streamable HTTP unbounded session allocation denial of service."
tags: ["agent-and-tool-security", "infrastructure-and-supply-chain"]
---

# Spring AI MCP Streamable HTTP Session DoS

## Current Understanding

The [August 22 topic news collector source](../../../raw/processed/2026-08-22/ai-security-wiki-topic-news-collector-2026-08-22T233049Z.json) records CVE-2026-59279 as a Spring AI 2.0.0 MCP Streamable HTTP transport vulnerability. Broad [Java AI application framework](../../../upstream-ai-wiki/developer-tools/java-ai-application-frameworks.md), [MCP transport](../../../upstream-ai-wiki/techniques/mcp-transports.md), and Spring release context belongs upstream; this page owns the local AI tool-server availability and authentication-default boundary.

The [NVD record](https://nvd.nist.gov/vuln/detail/CVE-2026-59279) and [Spring advisory](https://spring.io/security/cve-2026-59279/) describe unbounded retained session allocation and no required client authentication by default for the MCP Streamable HTTP server transport. Repeated `initialize` requests can exhaust memory and take down shared tool servers. The collector records Spring AI 2.0.1 OSS and 2.0.0.1 enterprise support as fixed boundaries.

This issue stays separate from [Spring AI tool dispatch authorization bypass](spring-ai-tool-dispatch-authorization-bypass.md), [Spring AI semantic cache cross-context leakage](../data-and-privacy/spring-ai-semantic-cache-cross-context-leakage.md), and [Spring AI Redis chat memory query injection](../data-and-privacy/spring-ai-redis-chat-memory-query-injection.md) because transport session exhaustion, tool authorization, cache isolation, and memory-query injection can change independently.

## Security Impact

- Threat: unauthenticated or weakly authenticated MCP transport endpoints can be exhausted before legitimate agents can reach required tools.
- Affected boundary: Spring AI 2.0.0 MCP Streamable HTTP server transport session retention.
- Exploit or incident status: public vendor advisory and NVD CVE record; no local exploitation evidence is recorded.
- Mitigation state: update to Spring AI 2.0.1 OSS or 2.0.0.1 enterprise support, require client authentication, and enforce session limits/rate limits at the transport boundary.
- Confidence: high for advisory identifiers, affected version, and fix version from primary Spring and NVD evidence.
- Residual risk: MCP servers shared by multiple agents need availability controls independent of model-level authorization because transport exhaustion occurs before tool dispatch.

## Authoritative Sources

- [August 22 topic news collector source](../../../raw/processed/2026-08-22/ai-security-wiki-topic-news-collector-2026-08-22T233049Z.json)
- [August 23 leaf update watch source](../../../raw/processed/2026-08-23/ai-security-wiki-leaf-update-watch-20260824T000259Z.json)
- [NVD CVE-2026-59279](https://nvd.nist.gov/vuln/detail/CVE-2026-59279)
- [Spring advisory CVE-2026-59279](https://spring.io/security/cve-2026-59279/)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [agent network egress controls](agent-network-egress-controls.md)
- [Spring AI tool dispatch authorization bypass](spring-ai-tool-dispatch-authorization-bypass.md)
- Upstream AI wiki owns broad [MCP transports](../../../upstream-ai-wiki/techniques/mcp-transports.md).

## Open Questions

- Which Spring AI deployments expose MCP Streamable HTTP endpoints without an external authentication and rate-limit layer?

## Maintenance Notes

- Created on 2026-08-22 from the [August 22 topic news collector source](../../../raw/processed/2026-08-22/ai-security-wiki-topic-news-collector-2026-08-22T233049Z.json) as the MCP transport availability member of the Spring AI 2.0.1 advisory family.
