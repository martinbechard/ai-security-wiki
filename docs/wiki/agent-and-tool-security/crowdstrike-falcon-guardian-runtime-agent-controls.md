---
type: "Topic"
title: "CrowdStrike Falcon Guardian Runtime Agent Controls"
description: "Vendor-attributed runtime, prompt, and Skill or MCP supply-chain controls announced for Falcon Guardian."
tags: ["agent-and-tool-security", "testing-and-assurance"]
---

# CrowdStrike Falcon Guardian Runtime Agent Controls

## Current Understanding

The [November 4 collector](../../../raw/processed/2026-11-04/ai-security-wiki-topic-news-collector-2026-11-04T002949Z.json) records CrowdStrike's [November 3 Falcon Guardian announcement](https://ir.crowdstrike.com/node/17961/pdf). The vendor attributes the following controls and availability boundaries to Falcon Guardian:

- **AI Kill Switch:** terminate an unauthorized agent at the gateway and prevent it from running again.
- **Agent hooks:** inspect prompts and block activity the vendor classifies as malicious.
- **AI supply-chain protection:** discover malicious Skills and MCP servers.
- **Endpoint network inspection:** generally available for Windows; early access for Mac.

These are vendor capability claims, not independent evidence of deployment effectiveness, coverage, or assurance. Broad CrowdStrike catalog context remains upstream-owned; this page retains the security-control delta and its availability boundaries.

## Security Impact

- Threat/control boundary: agent actions, prompt inspection, runtime termination, agent identity, model/tool traffic, and third-party Skill or MCP intake.
- Affected boundary or version: Falcon Guardian gateway, agent hooks, AI Gateway, and stated platform availability; no independent affected-product advisory is claimed.
- Exploit or incident status: product-control announcement, not a vulnerability disclosure or incident report.
- Mitigation state: prospective vendor controls; confirm deployment coverage, enforcement mode, bypass resistance, logging, and platform availability before relying on them.
- Confidence and residual risk: high for the dated announcement and availability labels; effectiveness and roadmap coverage remain vendor assertions.

## Authoritative Sources

- [November 4 collector source](../../../raw/processed/2026-11-04/ai-security-wiki-topic-news-collector-2026-11-04T002949Z.json)
- [CrowdStrike announcement PDF](https://ir.crowdstrike.com/node/17961/pdf)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [testing and assurance](../testing-and-assurance/index.md)

## Open Questions

- What independent assurance evidence verifies coverage, termination semantics, and bypass resistance across supported operating systems?

## Maintenance Notes

- Created on 2026-11-04 with vendor claims clearly attributed and platform availability retained.
- The controls are retained as one closely coupled vendor-announcement family because the current evidence gives them a shared product, release date, and assurance boundary. Split them into independently maintained leaves if later evidence changes their coverage, availability, enforcement behavior, or assurance separately.
