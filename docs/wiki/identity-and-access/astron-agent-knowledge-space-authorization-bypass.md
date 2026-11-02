---
type: "Topic"
title: "astron-agent Knowledge-Space Authorization Bypass"
description: "Security analysis for CVE-2026-116340 knowledge-space ownership validation failure in iFlytek astron-agent."
tags: ["identity-and-access", "data-and-privacy", "agent-and-tool-security"]
---

# astron-agent Knowledge-Space Authorization Bypass

## Current Understanding

The [November 2 collector source](../../../raw/processed/2026-11-02/ai-security-wiki-topic-news-collector-2026-11-02T003500Z.json) records [CVE-2026-116340](https://nvd.nist.gov/vuln/detail/CVE-2026-116340): astron-agent through 1.1.2 accepts a manipulated knowledge-list `space-id` argument in `FileInfoV2Service.listKnowledgeByPage`. Broad astron-agent product context belongs upstream; this page owns the local knowledge-store authorization boundary.

The defect is distinct from the existing [workflow ownership bypass](astron-agent-workflow-ownership-bypass.md): it concerns access to knowledge spaces, not copy or overwrite authorization for workflow definitions.

## Security Impact

- Threat: an authenticated remote caller can select another knowledge space and bypass intended authorization.
- Affected boundary: Console Knowledge-List endpoint and `FileInfoV2Service.listKnowledgeByPage` in astron-agent through 1.1.2.
- Exploit or incident status: NVD records public proof-of-concept material; no local evidence establishes in-the-wild exploitation.
- Mitigation state: no vendor-fixed release is established in the captured evidence; enforce authenticated subject-to-space ownership checks server-side.
- Confidence: medium for the component and version boundary; remediation remains unconfirmed.
- Residual risk: knowledge spaces can contain retrieval content exposed to agent workflows, so cross-space reads can disclose data outside the caller's delegated authority.

## Authoritative Sources

- [November 2 collector source](../../../raw/processed/2026-11-02/ai-security-wiki-topic-news-collector-2026-11-02T003500Z.json)
- [NVD CVE-2026-116340](https://nvd.nist.gov/vuln/detail/CVE-2026-116340)
- [Referenced public proof of concept](https://github.com/Rinne666/poc/tree/main/astron-agent-poc)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [astron-agent workflow ownership bypass](astron-agent-workflow-ownership-bypass.md)
- [downstream agent authorization context](downstream-agent-authorization-context.md)

## Open Questions

- Which astron-agent release, if any, first binds knowledge-list requests to the authenticated space owner?

## Maintenance Notes

- Created on 2026-11-02 from the November 2 collector; retain the knowledge-space boundary separately from astron-agent workflow authorization.
