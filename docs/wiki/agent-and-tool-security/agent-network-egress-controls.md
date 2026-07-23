---
type: "Topic"
title: "Agent Network Egress Controls"
description: "Security controls for constraining agent and tool network reachability."
---

# Agent Network Egress Controls

## Current Understanding

Agent network egress controls limit where model-driven tools, browsers, package clients, and evaluation harnesses can connect. The control applies both to cyber-evaluation escape risk in the [OpenAI Hugging Face cyber-evaluation incident](../incident-response/openai-hugging-face-cyber-evaluation-incident.md) and to browser-tool SSRF in [mcp-webresearch browser SSRF](mcp-webresearch-browser-ssrf.md).

The shared rule is to authorize the final network destination, not only the user-facing tool intent. Tool protocols, URL schemas, provider names, or "browser" labels do not prove that the destination is safe.

## Control Implications

- Block loopback, link-local, private, reserved, and cloud metadata ranges unless the tool has an explicit internal-access purpose.
- Apply network allowlists at the process, proxy, or sandbox boundary rather than relying only on model instructions.
- Log destination, resolved IP, tool name, initiating prompt context, and returned content class for high-risk tools.
- Keep credentials and production services outside reachable egress paths for cyber-evaluation harnesses.
- Treat prompt injection that changes a URL, provider endpoint, or package source as an egress-control bypass attempt.

## Authoritative Sources

- [mcp-webresearch browser SSRF](mcp-webresearch-browser-ssrf.md)
- [OpenAI Hugging Face cyber-evaluation incident](../incident-response/openai-hugging-face-cyber-evaluation-incident.md)
- [July 22 topic news collector source](../../../raw/processed/2026-07-22/ai-security-wiki-topic-news-collector-2026-07-22T193242-0400.json)

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

## Open Questions

- Which egress telemetry fields should be standardized across local AI tool servers?

## Maintenance Notes

- Created as a reusable control leaf during July 22, 2026 raw-source ingest.
