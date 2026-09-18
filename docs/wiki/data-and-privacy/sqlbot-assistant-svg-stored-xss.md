---
type: "Topic"
title: "SQLBot Assistant SVG Stored XSS"
description: "Security analysis for CVE-2026-53555 stored XSS through uploaded SQLBot assistant UI SVG content."
tags: ["data-and-privacy", "model-and-prompt-security"]
---

# SQLBot Assistant SVG Stored XSS

## Current Understanding

The [September 17 topic collector source](../../../raw/processed/2026-09-17/ai-security-wiki-topic-news-collector-2026-09-17T233119Z.json) records CVE-2026-53555 for SQLBot before 1.9.0. Broad SQLBot product context belongs upstream; this page owns the local assistant UI content boundary.

The collector summarizes the issue as stored XSS through uploaded assistant UI SVG content. In an AI data application, stored script execution can expose prompts, query context, datasource metadata, and user session state.

## Security Impact

- Threat: uploaded assistant branding or UI assets can execute stored script in users' browsers.
- Affected boundary: SQLBot before 1.9.0, assistant UI SVG upload, browser rendering, and session-visible AI app context.
- Exploit or incident status: public CVE record; no local exploitation incident is recorded.
- Mitigation state: upgrade to 1.9.0 or later and sanitize or rasterize uploaded SVG assets before serving them in authenticated assistant UI.
- Confidence: high for CVE publication and fixed-version clustering; medium for exact sanitizer bypass details until a primary advisory is captured.
- Residual risk: AI application UI assets can expose sensitive prompts and datasource context when rendered inside authenticated workspaces.

## Authoritative Sources

- [September 17 topic collector source](../../../raw/processed/2026-09-17/ai-security-wiki-topic-news-collector-2026-09-17T233119Z.json)
- [CVE-2026-53555 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-53555)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [data and privacy](index.md)
- [model and prompt security](../model-and-prompt-security/index.md)

## Open Questions

- Which SQLBot assistant asset fields render user-uploaded SVG in authenticated sessions?

## Maintenance Notes

- Created on 2026-09-18 from the [September 17 topic collector](../../../raw/processed/2026-09-17/ai-security-wiki-topic-news-collector-2026-09-17T233119Z.json) after verifier correction split the SQLBot CVE cluster into focused leaves.
