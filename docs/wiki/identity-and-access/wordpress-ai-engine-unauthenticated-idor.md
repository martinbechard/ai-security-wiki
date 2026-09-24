---
type: "Topic"
title: "WordPress AI Engine Unauthenticated IDOR"
description: "Security analysis for CVE-2026-93623, an unauthenticated object authorization flaw in the WordPress AI Engine plugin."
tags: ["identity-and-access", "data-and-privacy"]
---

# WordPress AI Engine Unauthenticated IDOR

## Current Understanding

The [September 23 topic collector source](../../../raw/processed/2026-09-23/ai-security-wiki-topic-news-collector-2026-09-23T233151Z.json) records [CVE-2026-93623](https://cveawg.mitre.org/api/cve/CVE-2026-93623) for the WordPress AI Engine plugin through 3.7.8. Patchstack and CVE metadata describe an unauthenticated insecure direct object reference and mark 3.7.9 as unaffected, but the public metadata available during collection does not identify the exact object class.

The issue is distinct from the older [WordPress AI Engine plugin file read and query execution](../infrastructure-and-supply-chain/wordpress-ai-engine-plugin-file-read-and-query-execution.md) leaf, which covers pre-3.7.2 file-read and provider-query execution issues. This page owns the newer unauthenticated object authorization boundary.

## Security Impact

- Threat: unauthenticated object access in an AI-enabled WordPress plugin.
- Affected boundary: WordPress AI Engine plugin through 3.7.8; fixed in 3.7.9.
- Exploit or incident status: public CVE, NVD, and Patchstack advisory; exact object type and read/write impact are not identified in the collector metadata.
- Mitigation state: upgrade to 3.7.9 or later and inspect unauthenticated AI Engine endpoints for object-owner checks.
- Confidence: moderate because publication and fixed version are clear, but operational impact is sparse.
- Residual risk: AI application plugins can hold chatbot, content, provider, and workflow state, so object identifiers must be authenticated and owner-scoped.

## Authoritative Sources

- [September 23 topic collector source](../../../raw/processed/2026-09-23/ai-security-wiki-topic-news-collector-2026-09-23T233151Z.json)
- [CVE-2026-93623 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-93623)
- [NVD CVE-2026-93623](https://nvd.nist.gov/vuln/detail/CVE-2026-93623)
- [Patchstack advisory](https://patchstack.com/database/wordpress/plugin/ai-engine/vulnerability/wordpress-ai-engine-plugin-3-7-8-insecure-direct-object-references-idor-vulnerability?_s_id=cve)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [data and privacy](../data-and-privacy/index.md)
- [WordPress AI Engine plugin file read and query execution](../infrastructure-and-supply-chain/wordpress-ai-engine-plugin-file-read-and-query-execution.md)

## Open Questions

- Which AI Engine object class is exposed by CVE-2026-93623, and is the issue read-only or mutable?

## Maintenance Notes

- Created on 2026-09-24 from the [September 23 topic collector source](../../../raw/processed/2026-09-23/ai-security-wiki-topic-news-collector-2026-09-23T233151Z.json); keep impact wording conservative until the object type is public.
