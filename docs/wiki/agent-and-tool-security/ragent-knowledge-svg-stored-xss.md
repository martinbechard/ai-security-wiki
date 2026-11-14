---
type: "Topic"
title: "ragent Knowledge-SVG Stored XSS"
description: "Security analysis for CVE-2026-129158 inline SVG rendering from ragent knowledge-base uploads."
tags: ["agent-and-tool-security", "data-and-privacy"]
---

# ragent Knowledge-SVG Stored XSS

## Current Understanding

The [November 13 collector source](../../../raw/processed/2026-11-13/ai-security-wiki-topic-news-collector-2026-11-13T192923-0500.json) records [CVE-2026-129158](https://nvd.nist.gov/vuln/detail/CVE-2026-129158): ragent 1.1.0 served uploaded SVG knowledge-base documents inline, allowing authenticated stored cross-site scripting and possible account takeover. Broad ragent and RAG context belongs upstream; this leaf owns active-content handling at the knowledge-document boundary.

## Security Impact

- Threat: an uploaded knowledge document executes script in another authenticated user's browser.
- Affected boundary: ragent 1.1.0 knowledge-base upload and inline SVG rendering.
- Exploit or incident status: public CVE disclosure; no active exploitation or local incident is established.
- Mitigation state: treat SVG as active content, force safe download or sanitize before rendering, and verify a maintainer fixed release.
- Confidence: medium-high because NVD includes code and issue references while a project fix is not established.
- Residual risk: content types that appear document-like can retain active browser behavior.

## Authoritative Sources

- [November 13 collector source](../../../raw/processed/2026-11-13/ai-security-wiki-topic-news-collector-2026-11-13T192923-0500.json)
- [NVD CVE-2026-129158](https://nvd.nist.gov/vuln/detail/CVE-2026-129158)
- [ragent issue 187](https://github.com/nageoffer/ragent/issues/187)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [ragent RAG trace authorization](../data-and-privacy/ragent-rag-trace-authorization.md)

## Open Questions

- Which ragent release changes SVG delivery or sanitization, and are other active upload types handled consistently?

## Maintenance Notes

- Created on 2026-11-13 as a browser-session boundary separate from RAG trace authorization.
