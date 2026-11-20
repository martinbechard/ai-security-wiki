---
type: "Topic"
title: "AI Puffer comment-reply stored XSS"
description: "Security analysis for CVE-2026-130121, where an AI-generated WordPress comment reply can become stored XSS."
tags: ["model-and-prompt-security", "agent-and-tool-security"]
---

# AI Puffer comment-reply stored XSS

## Current Understanding

The [November 19 topic collector source](../../../raw/processed/2026-11-19/ai-security-wiki-topic-news-collector-2026-11-19T003503Z.json) records CVE-2026-130121 in AI Puffer / GPT AI Power through 2.5.28. Product catalog context belongs upstream; this leaf owns the model-output-to-browser trust boundary.

The disclosed finding states that an AI-generated auto-reply can persist unsanitized active content. An unauthenticated attacker can submit content that is reproduced in an automated reply and executes when a user views the page, but exploitation also requires an administrator-configured Comment Auto-Reply task set to Approve and approval of the attacker's comment. The [WordPress remediation changeset](https://plugins.trac.wordpress.org/changeset/3807151/gpt3-ai-content-generator) is available as remediation evidence, while the exact fixed plugin release remains unverified.

## Security Impact

- Threat: adversarial comment input can be transformed by an automated model reply into active browser content.
- Affected boundary: AI Puffer / GPT AI Power through 2.5.28; approved Comment Auto-Reply automation and visitors' browser rendering.
- Exploit or incident status: public NVD/Wordfence vulnerability record; no confirmed exploitation or local incident is recorded.
- Mitigation state: disable or constrain auto-approval, sanitize model-generated comment output before persistence, apply the linked remediation, and confirm the corresponding fixed plugin release.
- Confidence: high for the preconditions and remediation changeset; medium for the release-level remediation boundary.
- Residual risk: moderation automation may cause untrusted input to be republished under a trusted site workflow even after content generation is restricted.

## Authoritative Sources

- [November 19 topic collector source](../../../raw/processed/2026-11-19/ai-security-wiki-topic-news-collector-2026-11-19T003503Z.json)
- [CVE-2026-130121 NVD record](https://nvd.nist.gov/vuln/detail/CVE-2026-130121)
- [Wordfence record](https://www.wordfence.com/threat-intel/vulnerabilities/id/d164f090-83ee-499a-85e3-d642713467b9?source=cve)
- [WordPress remediation changeset](https://plugins.trac.wordpress.org/changeset/3807151/gpt3-ai-content-generator)

## Related Code

- [WordPress remediation changeset 3807151](https://plugins.trac.wordpress.org/changeset/3807151/gpt3-ai-content-generator)

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [model and prompt security](index.md)
- [agent and tool security](../agent-and-tool-security/index.md)

## Open Questions

- Which released AI Puffer / GPT AI Power version contains the WordPress changeset remediation?

## Maintenance Notes

- Created on 2026-11-19 from the November 19 topic collector. Keep the approval precondition distinct from a claim of automatic exploitation.
