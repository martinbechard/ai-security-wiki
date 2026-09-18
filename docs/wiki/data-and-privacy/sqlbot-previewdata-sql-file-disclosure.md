---
type: "Topic"
title: "SQLBot previewData SQL File Disclosure"
description: "Security analysis for CVE-2026-53556 authenticated SQL injection and PostgreSQL file disclosure in SQLBot previewData."
tags: ["data-and-privacy", "agent-and-tool-security"]
---

# SQLBot previewData SQL File Disclosure

## Current Understanding

The [September 17 topic collector source](../../../raw/processed/2026-09-17/ai-security-wiki-topic-news-collector-2026-09-17T233119Z.json) records CVE-2026-53556 for SQLBot before 1.9.0. Broad SQLBot product context belongs upstream; this page owns the local preview-query and database-file disclosure boundary.

The collector summarizes the issue as authenticated SQL injection in `previewData` allowing arbitrary file read through PostgreSQL functions.

## Security Impact

- Threat: authenticated preview-data requests can inject SQL that invokes PostgreSQL file-read functions.
- Affected boundary: SQLBot before 1.9.0, `previewData`, generated or preview SQL paths, PostgreSQL file-read functions, and database role privileges.
- Exploit or incident status: public CVE record; no local exploitation incident is recorded.
- Mitigation state: upgrade to 1.9.0 or later, parameterize preview paths, and remove file-read privileges from AI app database roles.
- Confidence: high for CVE publication and fixed-version clustering; medium for exact function list until a primary advisory is captured.
- Residual risk: Text-to-SQL preview features need final-query authorization and database-role hardening because "read preview" can become server-file disclosure.

## Authoritative Sources

- [September 17 topic collector source](../../../raw/processed/2026-09-17/ai-security-wiki-topic-news-collector-2026-09-17T233119Z.json)
- [CVE-2026-53556 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-53556)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [data and privacy](index.md)
- [final query authorization for AI data tools](../agent-and-tool-security/final-query-authorization-for-ai-data-tools.md)
- [llmware collection filter SQL injection](llmware-collection-filter-sql-injection.md)

## Open Questions

- Which SQLBot database role privileges allowed PostgreSQL file-read functions through `previewData`?

## Maintenance Notes

- Created on 2026-09-18 from the [September 17 topic collector](../../../raw/processed/2026-09-17/ai-security-wiki-topic-news-collector-2026-09-17T233119Z.json) after verifier correction split the SQLBot CVE cluster into focused leaves.
