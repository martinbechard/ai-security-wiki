---
type: "Topic"
title: "Agent Network Egress Controls"
description: "Security controls for constraining agent and tool network reachability."
---

# Agent Network Egress Controls

## Current Understanding

Agent network egress controls limit where model-driven tools, browsers, package clients, and evaluation harnesses can connect. The control applies both to cyber-evaluation escape risk in the [OpenAI Hugging Face cyber-evaluation incident](../incident-response/openai-hugging-face-cyber-evaluation-incident.md) and to browser-tool SSRF in [mcp-webresearch browser SSRF](mcp-webresearch-browser-ssrf.md).

The shared rule is to authorize the final network destination, not only the user-facing tool intent. Tool protocols, URL schemas, provider names, or "browser" labels do not prove that the destination is safe.

The [Codex security guide](../../../guides/agent-security/Codex-Development-Security-Guide.md) and [Junie profile in the JetBrains AI Development Security Guide](../../../guides/agent-security/JetBrains-AI-Development-Security-Guide.md) apply this rule to local development: dependency traffic is restricted to an approved artifact proxy, development services bind to loopback, and remote Git, public web commands, and external-system CLIs remain blocked or approval-gated. The Codex profile also makes an important residual boundary explicit: allowing loopback hostnames permits connections to every listening local port because its host policy is not port-specific. The Junie profile narrows command authority further by allowing only an exact health-check URL.

The [July 25 leaf update watch source](../../../raw/processed/2026-07-25/ai-security-wiki-leaf-update-watch-2026-07-25T200210-0400.json) adds [Stride operational guidance](https://www.stride.build/blog/network-egress-control-ai-agents) for these egress controls:

- default-deny outbound access;
- task-specific allowlists;
- metadata endpoint blocking;
- dependency inventory.

Treat these as control guidance rather than incident evidence.

The [July 30 topic news collector source](../../../raw/processed/2026-07-30/ai-security-wiki-topic-news-collector-2026-07-30T193228-0400.json) adds two evaluation-egress failure modes:

- [OpenAI](https://openai.com/index/hugging-face-model-evaluation-security-incident/) says a previously unknown Artifactory vulnerability let an evaluation model reach the internet even though the environment had no direct internet access.
- [Axios](https://www.axios.com/2026/07/28/openai-hugging-face-modal-labs-hack) reports an unauthenticated Modal customer endpoint became reachable during the same incident.

These are evidence that package proxies, customer sandboxes, and benchmark-adjacent endpoints must be modeled as outbound paths, not only as internal dependencies.

The [August 11 leaf update watch source](../../../raw/processed/2026-08-11/ai-security-wiki-leaf-update-watch-20260812T000238Z.json) adds [Axios Black Hat coverage](https://www.axios.com/2026/08/11/ai-agent-sandbox-cybersecurity-testing) as practitioner evidence that agents can exceed intended test environments and that limiting permissions plus logging every network move are deployment controls. Treat it as control corroboration rather than proof of a new product vulnerability.

The [August 16 topic news collector source](../../../raw/processed/2026-08-16/ai-security-wiki-topic-news-collector-2026-08-16T233129Z.json) adds [GoMarble Facebook Ads MCP SSRF](gomarble-facebook-ads-mcp-ssrf.md) as a provider-pagination example. The shared egress rule is that continuation URLs, redirect targets, and provider-supplied fetch URLs need final-destination allowlisting; validating only the visible tool name or intended API family is not enough.

## Control Implications

- Block loopback, link-local, private, reserved, and cloud metadata ranges unless the tool has an explicit internal-access purpose.
- Apply network allowlists at the process, proxy, or sandbox boundary rather than relying only on model instructions.
- Log destination, resolved IP, tool name, initiating prompt context, and returned content class for high-risk tools.
- Keep credentials and production services outside reachable egress paths for cyber-evaluation harnesses.
- Treat prompt injection that changes a URL, provider endpoint, or package source as an egress-control bypass attempt.
- Inventory dependencies and package sources that agent tools can reach because dependency fetches can become hidden egress paths.
- Bind development servers and databases to loopback, but inventory other local listeners because host-level loopback permission may not be port-specific.
- Separate product web search from local-command network access; authorizing one must not silently authorize the other.
- Keep remote repository operations and external-system CLIs approval-gated even when local Git commands are permitted.
- Treat package proxies, sandbox APIs, and benchmark services as egress destinations with their own deny rules and monitoring, even when direct public internet access is blocked.
- Record every agent network move during testing and production rollout, especially when reduced safeguards, cyber tooling, or privileged connectors are enabled.
- Revalidate continuation and redirect destinations after URL parsing, DNS resolution, and redirect handling, especially for provider-specific MCP servers.

## Authoritative Sources

- [mcp-webresearch browser SSRF](mcp-webresearch-browser-ssrf.md)
- [OpenAI Hugging Face cyber-evaluation incident](../incident-response/openai-hugging-face-cyber-evaluation-incident.md)
- [July 22 topic news collector source](../../../raw/processed/2026-07-22/ai-security-wiki-topic-news-collector-2026-07-22T193242-0400.json)
- [July 25 leaf update watch source](../../../raw/processed/2026-07-25/ai-security-wiki-leaf-update-watch-2026-07-25T200210-0400.json)
- [July 30 topic news collector source](../../../raw/processed/2026-07-30/ai-security-wiki-topic-news-collector-2026-07-30T193228-0400.json)
- [August 11 leaf update watch source](../../../raw/processed/2026-08-11/ai-security-wiki-leaf-update-watch-20260812T000238Z.json)
- [August 16 topic news collector source](../../../raw/processed/2026-08-16/ai-security-wiki-topic-news-collector-2026-08-16T233129Z.json)
- Stride guidance: https://www.stride.build/blog/network-egress-control-ai-agents
- [Codex Development Security Guide](../../../guides/agent-security/Codex-Development-Security-Guide.md)
- [JetBrains AI Development Security Guide - Junie profile](../../../guides/agent-security/JetBrains-AI-Development-Security-Guide.md)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [data and privacy](../data-and-privacy/index.md)
- [cyber-evaluation containment](../testing-and-assurance/cyber-evaluation-containment.md)
- [GoMarble Facebook Ads MCP SSRF](gomarble-facebook-ads-mcp-ssrf.md)

## Open Questions

- Which egress telemetry fields should be standardized across local AI tool servers and cyber-evaluation harnesses?

## Maintenance Notes

- Created as a reusable control leaf during July 22, 2026 raw-source ingest; enriched from the [July 25 leaf update watch source](../../../raw/processed/2026-07-25/ai-security-wiki-leaf-update-watch-2026-07-25T200210-0400.json) with default-deny, allowlist, metadata-blocking, and dependency-inventory guidance, extended on 2026-07-30 with local development service, artifact, Git, and web-search boundaries from the [Codex](../../../guides/agent-security/Codex-Development-Security-Guide.md) and [Junie CLI](../../../guides/agent-security/JetBrains-AI-Development-Security-Guide.md) security guides, updated from the [July 30 topic collector](../../../raw/processed/2026-07-30/ai-security-wiki-topic-news-collector-2026-07-30T193228-0400.json) with package-proxy and sandbox-endpoint egress evidence, and enriched on 2026-08-11 from the [August 11 watcher](../../../raw/processed/2026-08-11/ai-security-wiki-leaf-update-watch-20260812T000238Z.json) with Black Hat practitioner logging and permission-limit evidence.
- Updated on 2026-08-16 from the [August 16 topic collector](../../../raw/processed/2026-08-16/ai-security-wiki-topic-news-collector-2026-08-16T233129Z.json) with provider-pagination SSRF allowlisting evidence from the GoMarble Facebook Ads MCP advisory.
