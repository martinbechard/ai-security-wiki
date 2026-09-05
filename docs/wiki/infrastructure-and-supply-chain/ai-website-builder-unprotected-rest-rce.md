---
type: "Topic"
title: "AI Website Builder Unprotected REST RCE"
description: "Security analysis for CVE-2026-82923 unauthenticated WordPress REST routes in AI Website Builder."
tags: ["infrastructure-and-supply-chain", "identity-and-access"]
---

# AI Website Builder Unprotected REST RCE

## Current Understanding

The [September 4 topic collector source](../../../raw/processed/2026-09-04/ai-security-wiki-topic-news-collector-2026-09-04T233156Z.json) records CVE-2026-82923 for the AI Website Builder WordPress plugin GitHub build 1.0.0. Broad WordPress plugin ecosystem context belongs upstream; this page owns AI-builder delegated authority, REST authorization, file-write, and RCE implications.

[CVE-2026-82923](https://cveawg.mitre.org/api/cve/CVE-2026-82923), [NVD](https://nvd.nist.gov/vuln/detail/CVE-2026-82923), and [WPScan](https://wpscan.com/vulnerability/663e7004-1cca-4c0f-8d54-7298d40fe179/) describe REST API routes without authorization and nonce checks. Unauthenticated attackers can install and activate plugins and themes, import attacker-controlled URL content, write chosen files into uploads, and delete site content; if PHP is served from uploads, the file write becomes RCE.

## Security Impact

- Threat: unauthenticated REST routes turn an AI website-builder plugin into site-administration and file-write authority.
- Affected boundary: AI Website Builder GitHub build 1.0.0.
- Exploit or incident status: public CVE and WPScan advisory; no local exploitation evidence is recorded.
- Mitigation state: remove affected GitHub build, require capability and nonce checks on REST routes, and block executable uploads.
- Confidence: high for unauthenticated route behavior from CVE and WPScan evidence.
- Residual risk: AI-assisted builder plugins often bridge content import, plugin installation, and file writes, so a single missing authorization check can compose into RCE.

## Authoritative Sources

- [September 4 topic collector source](../../../raw/processed/2026-09-04/ai-security-wiki-topic-news-collector-2026-09-04T233156Z.json)
- [CVE-2026-82923](https://cveawg.mitre.org/api/cve/CVE-2026-82923)
- [NVD CVE-2026-82923](https://nvd.nist.gov/vuln/detail/CVE-2026-82923)
- [WPScan advisory](https://wpscan.com/vulnerability/663e7004-1cca-4c0f-8d54-7298d40fe179/)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [WordPress AI plugin advisory deferrals](wordpress-ai-plugin-advisory-deferrals.md)

## Open Questions

- Is there a packaged AI Website Builder release with a fixed REST authorization boundary, or is the GitHub build unsupported?

## Maintenance Notes

- Created on 2026-09-04 from the [September 4 topic collector source](../../../raw/processed/2026-09-04/ai-security-wiki-topic-news-collector-2026-09-04T233156Z.json).
