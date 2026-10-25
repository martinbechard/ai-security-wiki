---
type: "Topic"
title: "AWS Multi Model Server Archive Traversal"
description: "Security analysis for CVE-2026-115812 model archive extraction code execution."
tags: ["infrastructure-and-supply-chain"]
---

# AWS Multi Model Server Archive Traversal

## Current Understanding

The [October 23 collector](../../../raw/processed/2026-10-23/ai-security-wiki-topic-news-collector-2026-10-23T233200Z.json) records [CVE-2026-115812](https://cveawg.mitre.org/api/cve/CVE-2026-115812) / [GHSA-3v4f-xjg3-3j32](https://github.com/advisories/GHSA-3v4f-xjg3-3j32): AWS Multi Model Server 1.1.11 and earlier extracts crafted model archives through relative path traversal into code execution. Broad AWS context belongs upstream; this page owns the artifact-extraction boundary.

## Security Impact

- Threat: a crafted model archive escapes extraction paths and executes code.
- Affected boundary: AWS Multi Model Server 1.1.11 and earlier, model archive extraction, runtime filesystem, and process authority.
- Exploit or incident status: public GitHub advisory; no local incident is recorded.
- Mitigation state: end of life with no fixed release; discontinue use and migrate.
- Confidence: high for mechanism, version, and no-fix state.
- Residual risk: model packages remain executable supply-chain inputs in replacements.

## Authoritative Sources

- [October 23 collector](../../../raw/processed/2026-10-23/ai-security-wiki-topic-news-collector-2026-10-23T233200Z.json)
- [October 24 leaf watch](../../../raw/processed/2026-10-24/ai-security-wiki-leaf-update-watch-20261025T000016Z.json)
- [GHSA-3v4f-xjg3-3j32](https://github.com/advisories/GHSA-3v4f-xjg3-3j32)
- [AWS bulletin](https://aws.amazon.com/security/security-bulletins/2026-148-aws)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [AWS Multi Model Server model URL SSRF](../agent-and-tool-security/aws-multi-model-server-model-url-ssrf.md)

## Open Questions

- Which deployed services still use this runtime?

## Maintenance Notes

- Updated on 2026-10-24 from the [October 24 leaf watch](../../../raw/processed/2026-10-24/ai-security-wiki-leaf-update-watch-20261025T000016Z.json), which corroborated the existing boundary without changing current understanding or adding a duplicate digest item.
- Created on 2026-10-23 as the archive-extraction member of a two-boundary family.
