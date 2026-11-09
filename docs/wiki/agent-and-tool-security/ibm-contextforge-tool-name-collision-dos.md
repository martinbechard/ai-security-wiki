---
type: "Topic"
title: "IBM ContextForge Tool-Name Collision Denial of Service"
description: "Security analysis for CVE-2026-18484 slug-normalization collisions in IBM ContextForge MCP Gateway."
tags: ["agent-and-tool-security"]
---

# IBM ContextForge Tool-Name Collision Denial of Service

## Current Understanding

The [November 9 collector source](../../../raw/processed/2026-11-09/ai-security-wiki-topic-news-collector-2026-11-09T003426Z.json) records [CVE-2026-18484](https://nvd.nist.gov/vuln/detail/CVE-2026-18484) for IBM ContextForge MCP Gateway 1.0.0 through 1.0.11. Improper slug normalization can produce tool-name collisions that permit an authenticated remote attacker to cause denial of service. Broad ContextForge product coverage belongs upstream; this page owns the MCP capability-routing availability boundary.

## Security Impact

- Threat: a remote authenticated caller can exploit normalized tool-name collisions to disrupt gateway availability.
- Affected boundary: ContextForge MCP Gateway tool-name normalization in 1.0.0 through 1.0.11.
- Exploit or incident status: public NVD disclosure and linked IBM support advisory; no active exploitation or local incident is established.
- Mitigation state: remediation version is not independently confirmed here; restrict gateway access to intended authenticated principals, monitor tool-registration failures, and follow IBM maintenance guidance.
- Confidence: high for product, affected range, attack precondition, and availability impact from NVD-derived evidence.
- Residual risk: tool naming is part of agent capability routing, so collision handling can remain operationally significant after access controls are applied.

## Authoritative Sources

- [November 9 collector source](../../../raw/processed/2026-11-09/ai-security-wiki-topic-news-collector-2026-11-09T003426Z.json)
- [NVD CVE-2026-18484](https://nvd.nist.gov/vuln/detail/CVE-2026-18484)
- [IBM support advisory 7294233](https://www.ibm.com/support/pages/node/7294233)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [IBM ContextForge tool invocation DNS rebinding](ibm-contextforge-tool-invocation-dns-rebinding.md)

## Open Questions

- Which IBM ContextForge MCP Gateway release remediates CVE-2026-18484, and what collision-rejection behavior does it implement?

## Maintenance Notes

- Created on 2026-11-09 from NVD-timed public disclosure; the IBM advisory was not independently retrievable during synthesis.
