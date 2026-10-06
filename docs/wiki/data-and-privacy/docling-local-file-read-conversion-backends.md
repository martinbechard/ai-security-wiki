---
type: "Topic"
title: "Docling Local File Read Conversion Backends"
description: "Security analysis for CVE-2026-105748, CVE-2026-105750, and CVE-2026-105751 local file reads in Docling conversion backends."
tags: ["data-and-privacy", "agent-and-tool-security"]
---

# Docling Local File Read Conversion Backends

## Current Understanding

The [October 5 topic collector source](../../../raw/processed/2026-10-05/ai-security-wiki-topic-news-collector-2026-10-05T233142Z.json) records [CVE-2026-105748](https://nvd.nist.gov/vuln/detail/CVE-2026-105748), [CVE-2026-105750](https://nvd.nist.gov/vuln/detail/CVE-2026-105750), and [CVE-2026-105751](https://nvd.nist.gov/vuln/detail/CVE-2026-105751) as local file-read paths in Docling conversion backends. Broad Docling context belongs upstream; this page owns local file disclosure during document conversion.

CVE-2026-105748 covers serialized DoclingDocument picture references that can contain local paths or file URIs and embed readable images into Markdown or HTML output. CVE-2026-105750 covers `HTMLBackendOptions(render_page=True)` permitting file URLs in path-backed HTML inputs. CVE-2026-105751 covers OpenDocument image `xlink:href` values being used as filesystem paths when the referenced archive part is absent.

## Security Impact

- Threat: crafted document references can cause conversion workers to read local files and embed them into generated output, or reveal path existence through decode behavior.
- Affected boundary: Docling 2.16.0 until 2.131.0 for serialized DoclingDocument picture refs; 2.82.0 until 2.118.1 for rendered HTML file URLs; 2.107.0 until 2.120.3 for OpenDocument image path fallback.
- Exploit or incident status: public NVD and GitHub advisory evidence; no local exploitation incident is recorded.
- Mitigation state: update to the relevant fixed releases, disable local fetch for untrusted input, and confine conversion workers to empty or low-sensitivity filesystems.
- Confidence: high for affected versions and fixes from NVD; medium on final vendor operational guidance until direct project advisories are captured.
- Residual risk: conversion workers can hold repository, prompt, cache, or credential files that should never be reachable from user-supplied document references.

## Authoritative Sources

- [October 5 topic collector source](../../../raw/processed/2026-10-05/ai-security-wiki-topic-news-collector-2026-10-05T233142Z.json)
- [NVD CVE-2026-105748](https://nvd.nist.gov/vuln/detail/CVE-2026-105748)
- [NVD CVE-2026-105750](https://nvd.nist.gov/vuln/detail/CVE-2026-105750)
- [NVD CVE-2026-105751](https://nvd.nist.gov/vuln/detail/CVE-2026-105751)
- [GitHub advisory GHSA-4xhp-xg4w-8ppm](https://github.com/advisories/GHSA-4xhp-xg4w-8ppm)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [data and privacy](index.md)
- [agent and tool security](../agent-and-tool-security/index.md)
- [agent tool filesystem path containment](../infrastructure-and-supply-chain/agent-tool-filesystem-path-containment.md)

## Open Questions

- Which fixed Docling version should be the minimum baseline when deployments need to cover all three local-file read paths at once?

## Maintenance Notes

- Created on 2026-10-06 from the [October 5 topic collector source](../../../raw/processed/2026-10-05/ai-security-wiki-topic-news-collector-2026-10-05T233142Z.json) after verifier correction split the Docling cluster by independent boundary.
