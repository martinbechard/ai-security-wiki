---
type: "Topic"
title: "SQLBot parseExcel File Write RCE"
description: "Security analysis for CVE-2026-53554 file-write-to-code-execution risk in SQLBot parseExcel."
tags: ["infrastructure-and-supply-chain", "data-and-privacy"]
---

# SQLBot parseExcel File Write RCE

## Current Understanding

The [September 20 leaf update watch source](../../../raw/processed/2026-09-20/ai-security-wiki-leaf-update-watch-20260921T000220Z.json) adds disclosed vulnerability evidence dated 2026-09-18T13:16:54.601Z: CVE Services published and updated a SQLBot pre-1.9.0 parseExcel upload path issue where attacker-controlled multipart filenames can cause file write and code execution.

The [September 17 topic collector source](../../../raw/processed/2026-09-17/ai-security-wiki-topic-news-collector-2026-09-17T233119Z.json) records CVE-2026-53554 for SQLBot before 1.9.0. Broad SQLBot product context belongs upstream; this page owns the local file-write-to-code-execution boundary in datasource upload handling.

The collector summarizes the issue as arbitrary file write through `parseExcel` that can reach Alembic import code execution.

## Security Impact

- Threat: uploaded datasource content can write files into paths later imported or executed by the application.
- Affected boundary: SQLBot before 1.9.0, `parseExcel`, Excel datasource upload, file-write paths, and Alembic import execution.
- Exploit or incident status: public CVE record; no local exploitation incident is recorded.
- Mitigation state: upgrade to 1.9.0 or later and isolate uploaded datasource extraction from importable application paths.
- Confidence: high for CVE publication and fixed-version clustering; medium for exact path details until a primary advisory is captured.
- Residual risk: RAG/Text-to-SQL upload paths can become code execution when ingestion writes into runtime import locations.

## Authoritative Sources

- [September 20 leaf update watch source](../../../raw/processed/2026-09-20/ai-security-wiki-leaf-update-watch-20260921T000220Z.json)
- [September 17 topic collector source](../../../raw/processed/2026-09-17/ai-security-wiki-topic-news-collector-2026-09-17T233119Z.json)
- [CVE-2026-53554 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-53554)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [data and privacy](../data-and-privacy/index.md)

## Open Questions

- Which SQLBot file-write paths are reachable from Excel datasource parsing before the 1.9.0 fix?

## Maintenance Notes

- Updated on 2026-09-20 from the [September 20 leaf update watch source](../../../raw/processed/2026-09-20/ai-security-wiki-leaf-update-watch-20260921T000220Z.json) with in-window disclosed vulnerability evidence while preserving local security-boundary scope.
- Created on 2026-09-18 from the [September 17 topic collector](../../../raw/processed/2026-09-17/ai-security-wiki-topic-news-collector-2026-09-17T233119Z.json) after verifier correction split the SQLBot CVE cluster into focused leaves.
