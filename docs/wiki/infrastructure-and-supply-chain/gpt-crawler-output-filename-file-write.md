---
type: "Topic"
title: "gpt-crawler outputFileName file write"
description: "Security analysis for CVE-2026-82286 gpt-crawler arbitrary file write through outputFileName handling."
tags: ["infrastructure-and-supply-chain", "data-and-privacy"]
---

# gpt-crawler outputFileName file write

## Current Understanding

The [August 28 topic collector source](../../../raw/processed/2026-08-28/ai-security-wiki-topic-news-collector-2026-08-28T233139Z.json) records [CVE-2026-82286](https://nvd.nist.gov/vuln/detail/CVE-2026-82286) for gpt-crawler through 1.5.1. Broad crawler and RAG ingestion practice belongs upstream; this page owns the local ingestion-artifact file-write boundary.

## Security Impact

- Threat: unauthenticated callers can submit absolute paths or parent-directory segments in `outputFileName` to `POST /crawl`, causing writes with content fetched from attacker-controlled URLs.
- Affected boundary: gpt-crawler through 1.5.1 output artifact path handling.
- Exploit or incident status: GitHub Advisory Database and NVD evidence; no local in-the-wild exploitation evidence is recorded.
- Mitigation state: restrict output paths to an intended workspace, normalize before authorization, reject traversal and absolute paths, and verify maintainer patch status.
- Confidence: medium-high for advisory existence and file-write mechanics; medium for patch boundary because the advisory was unreviewed and fixed version was unknown in the source.
- Residual risk: crawler output can poison retrieval corpora, overwrite configuration, or stage later execution when ingestion workers run near application credentials.

## Authoritative Sources

- [August 28 topic collector source](../../../raw/processed/2026-08-28/ai-security-wiki-topic-news-collector-2026-08-28T233139Z.json)
- [GitHub advisory GHSA-98j5-x6wm-v8hp](https://github.com/advisories/GHSA-98j5-x6wm-v8hp)
- [NVD CVE-2026-82286](https://nvd.nist.gov/vuln/detail/CVE-2026-82286)
- [gpt-crawler issue 418](https://github.com/BuilderIO/gpt-crawler/issues/418)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [agent tool filesystem path containment](agent-tool-filesystem-path-containment.md)
- [slopsquatting package hallucination risk](slopsquatting-package-hallucination-risk.md)

## Open Questions

- Which gpt-crawler release constrains `outputFileName` to a safe artifact root?

## Maintenance Notes

- Created on 2026-08-29 from the [August 28 topic collector](../../../raw/processed/2026-08-28/ai-security-wiki-topic-news-collector-2026-08-28T233139Z.json) as an AI data-ingestion file-write leaf.
