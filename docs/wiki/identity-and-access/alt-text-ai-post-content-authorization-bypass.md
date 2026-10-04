---
type: "Topic"
title: "Alt Text AI Post Content Authorization Bypass"
description: "Security analysis for CVE-2026-91108 missing authorization in Alt Text AI post-content generation."
tags: ["identity-and-access", "data-and-privacy"]
---

# Alt Text AI Post Content Authorization Bypass

## Current Understanding

The [October 3 topic collector source](../../../raw/processed/2026-10-03/ai-security-wiki-topic-news-collector-2026-10-03T233152Z.json) records [CVE-2026-91108](https://cveawg.mitre.org/api/cve/CVE-2026-91108) for Alt Text AI - Automatically generate image alt text for SEO and accessibility through 1.10.41. Broad AltText.ai product context belongs upstream if needed; this page owns the local AI-generated-content authorization and paid-credit boundary.

The CVE record says subscriber-level users can obtain a nonce from ordinary admin pages and invoke an AJAX action that overwrites the `post_content` of any post or page, including content they do not own. The generated text can be influenced by attacker-controlled keywords, enabling unauthorized content mutation, black-hat SEO manipulation, and consumption of the site owner's paid AltText.ai API credits.

## Security Impact

- Threat: low-privilege users can trigger model-backed content generation against pages outside their ownership boundary.
- Affected boundary: Alt Text AI through 1.10.41; `atai_enrich_post_content` AJAX action; nonce emission on admin pages; post/page ownership checks; paid AltText.ai API credit consumption.
- Exploit or incident status: public CVE, NVD, Wordfence, and WordPress source references; no confirmed exploitation incident is recorded locally.
- Mitigation state: update beyond the affected range when the fixed plugin release is confirmed, restrict AJAX actions by post ownership and capability, and audit unexpected generated-content edits and provider-credit usage.
- Confidence: high for affected version, authorization class, nonce exposure, and model-backed content mutation from CVE Services; medium for first fixed release because the captured evidence references source paths and a changeset but not a release tag.
- Residual risk: AI content-generation plugins need server-side ownership checks because nonce possession and authenticated-user status are not enough authority to mutate arbitrary posts or spend provider credits.

## Authoritative Sources

- [October 3 topic collector source](../../../raw/processed/2026-10-03/ai-security-wiki-topic-news-collector-2026-10-03T233152Z.json)
- [CVE-2026-91108 record](https://cveawg.mitre.org/api/cve/CVE-2026-91108)
- [NVD CVE-2026-91108](https://nvd.nist.gov/vuln/detail/CVE-2026-91108)
- [Wordfence CVE-2026-91108 advisory](https://www.wordfence.com/threat-intel/vulnerabilities/id/216e3087-52f1-4b2e-a31c-0c2ddf41aefb?source=cve)
- [Alt Text AI post source](https://plugins.trac.wordpress.org/browser/alttext-ai/tags/1.10.38/includes/class-atai-post.php#L275)
- [Alt Text AI nonce source](https://plugins.trac.wordpress.org/browser/alttext-ai/tags/1.10.38/includes/class-atai.php#L271)
- [Alt Text AI changeset](https://plugins.trac.wordpress.org/changeset?reponame=&old=3723468%40alttext-ai&new=3723468%40alttext-ai)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [data and privacy](../data-and-privacy/index.md)
- [final query authorization for AI data tools](../agent-and-tool-security/final-query-authorization-for-ai-data-tools.md)
- [WPBot AI provider API-key spend](wpbot-ai-provider-api-key-spend.md)

## Open Questions

- Which Alt Text AI release first fixes CVE-2026-91108, and does the fix remove subscriber nonce exposure or add post-level capability checks?
- What audit evidence can site owners use to identify unauthorized generated-content edits and paid API-credit consumption?

## Maintenance Notes

- Created on 2026-10-04 from the [October 3 topic collector source](../../../raw/processed/2026-10-03/ai-security-wiki-topic-news-collector-2026-10-03T233152Z.json) as an AI-generated-content authorization leaf.
