---
type: "Topic"
title: "RAGFlow Seafile Connector SSRF"
description: "Security analysis for CVE-2026-121927 SSRF through RAGFlow's Seafile connector endpoint."
tags: ["agent-and-tool-security", "data-and-privacy"]
---

# RAGFlow Seafile Connector SSRF

## Current Understanding

The [November 5 collector source](../../../raw/processed/2026-11-05/ai-security-wiki-topic-news-collector-2026-11-05T003237Z.json) records [CVE-2026-121927](https://github.com/advisories/GHSA-6c99-p4pm-w7p6) for InfiniFlow RAGFlow through 0.27.3. General RAGFlow product and retrieval practice context remain upstream; this page owns the Seafile connector's network-egress boundary.

The GitHub advisory says manipulation of `seafile_url` in the Seafile connector's `_account_get` function can cause server-side request forgery. It reports public disclosure and no vendor response at publication; it does not name a fixed release or maintainer patch, so no remediation or active-exploitation claim is inferred.

## Security Impact

- Threat: a controllable retrieval connector endpoint can direct RAGFlow server requests to attacker-selected network destinations.
- Affected boundary: RAGFlow through 0.27.3; Seafile Connector `seafile_url` handling and outbound request policy.
- Exploit or incident status: public advisory reports public disclosure and possible use; no independently confirmed active exploitation incident is recorded locally.
- Mitigation state: no maintainer fix is identified; restrict connector endpoints, validate resolved destinations, block internal and metadata ranges, and monitor vendor remediation.
- Confidence: medium because the public advisory lacks a maintainer advisory, patch, or fixed-release reference.
- Residual risk: retrieval connectors can bypass network segmentation when endpoint configuration is user-controlled and egress rules are not destination-aware.

## Authoritative Sources

- [November 5 collector source](../../../raw/processed/2026-11-05/ai-security-wiki-topic-news-collector-2026-11-05T003237Z.json)
- [GitHub advisory GHSA-6c99-p4pm-w7p6](https://github.com/advisories/GHSA-6c99-p4pm-w7p6)
- [NVD CVE-2026-121927](https://nvd.nist.gov/vuln/detail/CVE-2026-121927)

## Related Code

- `common/data_source/seafile_connector.py` `_account_get`, as named by the advisory.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [RAGFlow agent workflow Invoke SSRF](ragflow-agent-workflow-invoke-ssrf.md)
- [agent network egress controls](agent-network-egress-controls.md)

## Open Questions

- Has InfiniFlow published a maintainer advisory, issue, or fixed release for CVE-2026-121927?

## Maintenance Notes

- Created on 2026-11-05 from the November 5 collector; kept separate from RAGFlow's Invoke-component SSRF because the connector boundary and remediation state differ.
