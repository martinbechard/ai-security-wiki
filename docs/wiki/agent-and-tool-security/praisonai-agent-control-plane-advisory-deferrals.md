---
type: "Topic"
title: "PraisonAI Agent Control Plane Advisory Deferrals"
description: "Evidence-preserving deferrals for PraisonAI August 25 advisories that need focused follow-up before durable local leaves."
tags: ["agent-and-tool-security", "identity-and-access", "data-and-privacy"]
---

# PraisonAI Agent Control Plane Advisory Deferrals

## Current Understanding

The [August 25 topic news collector source](../../../raw/processed/2026-08-25/ai-security-wiki-topic-news-collector-2026-08-25T183709Z.json) records a broader PraisonAI advisory cluster than the local MCP origin and session leaves cover. Broad PraisonAI product and framework context belongs upstream in the AI wiki; this page preserves local evidence-based deferrals until the next ingest can split or enrich focused leaves without flattening separate root causes.

Deferred items:

- CVE-2026-55525: [NVD query evidence](https://services.nvd.nist.gov/rest/json/cves/2.0/?keywordSearch=agent&pubStartDate=2026-08-23T18:37:09.000&pubEndDate=2026-08-25T18:37:09.000) records redirect-following SSRF in `web_crawl`; candidate leaf under agent-and-tool-security or infrastructure-and-supply-chain after exact affected package and fixed version are verified.
- CVE-2026-55528 and CVE-2026-55530: [NVD query evidence](https://services.nvd.nist.gov/rest/json/cves/2.0/?keywordSearch=agent&pubStartDate=2026-08-23T18:37:09.000&pubEndDate=2026-08-25T18:37:09.000) records missing authentication in AgentServer and served agent endpoints even when token or API-key configuration exists; candidate identity-and-access leaves after endpoint and deployment boundaries are verified.
- CVE-2026-55541: [NVD query evidence](https://services.nvd.nist.gov/rest/json/cves/2.0/?keywordSearch=agent&pubStartDate=2026-08-23T18:37:09.000&pubEndDate=2026-08-25T18:37:09.000) records an agent-controlled file rewrite path missing a required approval decorator; candidate agent-and-tool-security leaf after the file target, approval decorator, and fixed release are verified.

The [August 25 late topic news collector source](../../../raw/processed/2026-08-25/ai-security-wiki-topic-news-collector-2026-08-25T233059Z.json) separately breaks out CVE-2026-55529, CVE-2026-55531, and CVE-2026-55532, which are already mapped to focused local leaves.

The [August 25 topic news collector source](../../../raw/processed/2026-08-25/ai-security-wiki-topic-news-collector-2026-08-25T183709Z.json) supplies the following PraisonAI GHSA set as unresolved advisory evidence. Do not claim a CVE-to-GHSA mapping until each advisory is read directly: [GHSA-5r34-2g38-6569](https://github.com/MervinPraison/PraisonAI/security/advisories/GHSA-5r34-2g38-6569), [GHSA-7g3p-92qq-8wvh](https://github.com/MervinPraison/PraisonAI/security/advisories/GHSA-7g3p-92qq-8wvh), [GHSA-cfxv-8fw8-rwpv](https://github.com/MervinPraison/PraisonAI/security/advisories/GHSA-cfxv-8fw8-rwpv), [GHSA-pvph-5j39-v8qc](https://github.com/MervinPraison/PraisonAI/security/advisories/GHSA-pvph-5j39-v8qc), and [GHSA-pvxx-r596-f5qj](https://github.com/MervinPraison/PraisonAI/security/advisories/GHSA-pvxx-r596-f5qj).

## Security Impact

- Threat: PraisonAI agent control-plane components can expose SSRF, missing authentication, and mutation-tool approval failures.
- Affected boundary: PraisonAI and praisonaiagents before fixed releases named by the collector, including praisonaiagents 1.6.58 and PraisonAI 4.6.58 where applicable.
- Exploit or incident status: public NVD/GitHub advisory cluster; no local exploitation incident is recorded.
- Mitigation state: upgrade to the relevant fixed releases where confirmed and require SSRF controls, endpoint authentication, and approval guards for file mutation tools.
- Confidence: high that the collector found in-window NVD records; medium for per-CVE fixed-version mapping until each advisory is read directly.
- Residual risk: leaving the deferrals unresolved can under-document non-MCP PraisonAI control-plane risk.

## Authoritative Sources

- [August 25 topic news collector source](../../../raw/processed/2026-08-25/ai-security-wiki-topic-news-collector-2026-08-25T183709Z.json)
- [PraisonAI 4.6.58 release](https://github.com/MervinPraison/PraisonAI/releases/tag/v4.6.58)
- [PraisonAI GitHub security advisories](https://github.com/MervinPraison/PraisonAI/security/advisories)
- [GHSA-5r34-2g38-6569](https://github.com/MervinPraison/PraisonAI/security/advisories/GHSA-5r34-2g38-6569)
- [GHSA-7g3p-92qq-8wvh](https://github.com/MervinPraison/PraisonAI/security/advisories/GHSA-7g3p-92qq-8wvh)
- [GHSA-cfxv-8fw8-rwpv](https://github.com/MervinPraison/PraisonAI/security/advisories/GHSA-cfxv-8fw8-rwpv)
- [GHSA-pvph-5j39-v8qc](https://github.com/MervinPraison/PraisonAI/security/advisories/GHSA-pvph-5j39-v8qc)
- [GHSA-pvxx-r596-f5qj](https://github.com/MervinPraison/PraisonAI/security/advisories/GHSA-pvxx-r596-f5qj)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [PraisonAI MCP origin and CSRF instruction persistence](praisonai-mcp-origin-and-csrf-instruction-persistence.md)
- [PraisonAI MCP session exhaustion](praisonai-mcp-session-exhaustion.md)
- [agent network egress controls](agent-network-egress-controls.md)
- [approval metadata access control](approval-metadata-access-control.md)

## Open Questions

- Which exact GHSA pages and fixed versions map to CVE-2026-55525, CVE-2026-55528, CVE-2026-55530, and CVE-2026-55541?
- Should the missing-authentication advisories remain one closely coupled PraisonAI identity leaf or split by endpoint type?

## Maintenance Notes

- Created on 2026-08-26 as an explicit verifier-requested deferral page for PraisonAI advisories present in the early August 25 collector but not yet independently synthesized.
