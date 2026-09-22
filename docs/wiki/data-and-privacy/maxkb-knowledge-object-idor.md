---
type: "Topic"
title: "MaxKB Knowledge Object IDOR"
description: "Security analysis for CVE-2026-77517 knowledge document and paragraph authorization bypass in MaxKB."
tags: ["data-and-privacy", "identity-and-access"]
---

# MaxKB Knowledge Object IDOR

## Current Understanding

The [September 21 topic collector source](../../../raw/processed/2026-09-21/ai-security-wiki-topic-news-collector-2026-09-21T233156Z.json) records [CVE-2026-77517](https://cveawg.mitre.org/api/cve/CVE-2026-77517) for MaxKB 2.0.0 through 2.10.2-lts. Broad MaxKB product context belongs upstream; this page owns knowledge document and paragraph ownership checks.

Document and paragraph operation routes authorize only `knowledge_id` in the request path, then query the target document or paragraph by global ID without confirming that the object belongs to that knowledge base. A normal workspace user with a known victim document or paragraph UUID can use an attacker-owned knowledge-base path to read or modify another user's knowledge content. No fixed version was available in the captured record.

## Security Impact

- Threat: known document or paragraph IDs can cross knowledge-base ownership boundaries.
- Affected boundary: MaxKB 2.0.0 through 2.10.2-lts; document and paragraph operation routes.
- Exploit or incident status: public GitHub advisory; no local exploitation evidence is recorded.
- Mitigation state: no fixed version identified; bind every document and paragraph lookup to the authorized knowledge base and audit cross-knowledge modifications.
- Confidence: high for advisory existence and affected range; fixed-version confidence is unavailable.
- Residual risk: knowledge-base content often contains source documents, retrieval chunks, and internal assistant context.

## Authoritative Sources

- [September 21 topic collector source](../../../raw/processed/2026-09-21/ai-security-wiki-topic-news-collector-2026-09-21T233156Z.json)
- [CVE-2026-77517 JSON](https://cveawg.mitre.org/api/cve/CVE-2026-77517)
- [GitHub advisory GHSA-58cm-c5jq-96vf](https://github.com/1Panel-dev/MaxKB/security/advisories/GHSA-58cm-c5jq-96vf)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [data and privacy](index.md)
- [identity and access](../identity-and-access/index.md)

## Open Questions

- Which MaxKB release fixes CVE-2026-77517?

## Maintenance Notes

- Created on 2026-09-21 from the [September 21 topic collector source](../../../raw/processed/2026-09-21/ai-security-wiki-topic-news-collector-2026-09-21T233156Z.json).
