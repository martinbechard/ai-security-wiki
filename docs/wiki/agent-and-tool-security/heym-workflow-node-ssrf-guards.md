---
type: "Topic"
title: "Heym Workflow Node SSRF Guards"
description: "Security analysis for CVE-2026-100858 SSRF guard gaps in Heym Slack, Discord, and Crawler workflow nodes."
tags: ["agent-and-tool-security", "infrastructure-and-supply-chain"]
---

# Heym Workflow Node SSRF Guards

## Current Understanding

The [September 27 topic collector source](../../../raw/processed/2026-09-27/ai-security-wiki-topic-news-collector-2026-09-27T233044Z.json) records [CVE-2026-100858](https://nvd.nist.gov/vuln/detail/CVE-2026-100858) for heym before 0.0.109. Broad Heym workflow-product context belongs upstream; this page owns the local egress-guard and workflow-node URL boundary for Slack, Discord, and Crawler nodes.

NVD, the [GitHub advisory](https://github.com/heymrun/heym/security/advisories/GHSA-39j3-6x3x-8rcr), and [VulnCheck](https://www.vulncheck.com/advisories/heym-before-0.0.109-server-side-request-forgery-via-workflow-nodes) describe Slack, Discord, and Crawler workflow nodes issuing HTTP requests from user-created credential URLs with an unguarded client. The affected nodes bypassed the SSRF guard used by HTTP, WebSocket, and MCP nodes, allowing registered users to create credentials that cause backend requests to loopback, private, link-local, or cloud-metadata destinations and return full response bodies in node output.

Affected boundary: heym before 0.0.109 for Slack, Discord, and Crawler workflow-node SSRF.

Exploit or incident status: public advisory disclosure; local sources do not record confirmed active exploitation.

Mitigation state: upgrade to 0.0.109 or later.

Confidence: high for affected versions and fix boundaries from NVD plus GitHub/VulnCheck advisories.

Residual risk: workflow authors can mix credential-controlled URLs and MCP nodes; egress controls need consistency across every node class, not only obvious HTTP tools.

## Authoritative Sources

- [September 27 topic collector source](../../../raw/processed/2026-09-27/ai-security-wiki-topic-news-collector-2026-09-27T233044Z.json)
- [NVD CVE-2026-100858](https://nvd.nist.gov/vuln/detail/CVE-2026-100858)
- [GitHub advisory GHSA-39j3-6x3x-8rcr](https://github.com/heymrun/heym/security/advisories/GHSA-39j3-6x3x-8rcr)
- [VulnCheck CVE-2026-100858 advisory](https://www.vulncheck.com/advisories/heym-before-0.0.109-server-side-request-forgery-via-workflow-nodes)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent network egress controls](agent-network-egress-controls.md)
- [Heym LLM image fetch SSRF](heym-llm-image-fetch-ssrf.md)
- [Heym workflow capability secret plaintext exposure](../data-and-privacy/heym-workflow-capability-secret-plaintext-exposure.md)

## Open Questions

- No open wiki questions are recorded for this topic.

## Maintenance Notes

- Created on 2026-09-27 from the September 27 collector and NVD enrichment as a focused workflow-node SSRF guard leaf.
