---
type: "Topic"
title: "Cheshire Cat AI Memory Points Disclosure"
description: "Security analysis for CVE-2026-85093 cross-user episodic-memory disclosure in Cheshire Cat AI."
tags: ["data-and-privacy", "identity-and-access"]
---

# Cheshire Cat AI Memory Points Disclosure

## Current Understanding

The [September 4 topic collector source](../../../raw/processed/2026-09-04/ai-security-wiki-topic-news-collector-2026-09-04T233156Z.json) records CVE-2026-85093 for Cheshire Cat AI core 1.9.2. Broad Cheshire Cat AI framework coverage belongs upstream; this page owns the local assistant-memory isolation boundary.

[CVE-2026-85093](https://cveawg.mitre.org/api/cve/CVE-2026-85093), [NVD](https://nvd.nist.gov/vuln/detail/CVE-2026-85093), and the linked [VulnCheck advisory](https://www.vulncheck.com/advisories/cheshire-cat-ai-memory-collection-endpoint-information-disclosure) describe an authenticated `MEMORY:READ` path where `GET /memory/collections/{collection_id}/points` does not filter episodic memory by user. A caller can paginate through the collection and retrieve other users' stored conversation messages and personal data.

## Security Impact

- Threat: cross-user assistant-memory disclosure through an authenticated memory-read endpoint.
- Affected boundary: Cheshire Cat AI core 1.9.2 episodic-memory collections; affected and fixed ranges need confirmation from upstream release evidence.
- Exploit or incident status: public CVE and advisory evidence; no local exploitation report is recorded.
- Mitigation state: require per-user filtering on memory collections and restrict memory-read permission to the smallest user or tenant scope.
- Confidence: high for the disclosed vulnerability and endpoint behavior from CVE, NVD, public issue, and advisory evidence.
- Residual risk: assistant memory may contain prompts, personal data, tool outputs, or operational context that outlive the session where they were created.

## Authoritative Sources

- [September 4 topic collector source](../../../raw/processed/2026-09-04/ai-security-wiki-topic-news-collector-2026-09-04T233156Z.json)
- [CVE-2026-85093](https://cveawg.mitre.org/api/cve/CVE-2026-85093)
- [NVD CVE-2026-85093](https://nvd.nist.gov/vuln/detail/CVE-2026-85093)
- [VulnCheck advisory](https://www.vulncheck.com/advisories/cheshire-cat-ai-memory-collection-endpoint-information-disclosure)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [data and privacy](index.md)
- [MCP data movement exposure controls](mcp-data-movement-exposure-controls.md)

## Open Questions

- Which Cheshire Cat AI release fixes CVE-2026-85093 and how does it bind memory points to the requesting principal?

## Maintenance Notes

- Created on 2026-09-04 from the [September 4 topic collector source](../../../raw/processed/2026-09-04/ai-security-wiki-topic-news-collector-2026-09-04T233156Z.json).
