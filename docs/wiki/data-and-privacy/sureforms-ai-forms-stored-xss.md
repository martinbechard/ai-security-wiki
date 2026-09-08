---
type: "Topic"
title: "SureForms AI Forms Stored XSS"
description: "Security analysis for CVE-2026-18406 stored XSS in the SureForms AI Forms WordPress plugin."
tags: ["data-and-privacy", "infrastructure-and-supply-chain"]
---

# SureForms AI Forms Stored XSS

## Current Understanding

The [September 7 topic collector source](../../../raw/processed/2026-09-07/ai-security-wiki-topic-news-collector-2026-09-07T233220Z.json) records an in-window update for [CVE-2026-18406](https://cveawg.mitre.org/api/cve/CVE-2026-18406), a SureForms WordPress plugin stored-XSS issue. The direct CVE describes the affected product as "Contact Form Builder, AI Forms, Payment Form, Survey & Quiz" and says unauthenticated attackers can inject scripts through text-field entity-encoded payloads because of insufficient input sanitization and output escaping.

This page owns the AI-enabled form and data-contamination angle. Broad SureForms, Brainstorm Force, and WordPress plugin catalog coverage belongs upstream; generic WordPress XSS without AI form, prompt, payment, survey, or assistant-data implications should stay out of this local wiki.

## Security Impact

- Threat: unauthenticated stored XSS can execute against users or administrators viewing submitted form content; the AI-security concern applies when SureForms AI Forms submissions are reused in prompts, retrieval, notifications, assistant-visible context, or administrative workflows.
- Affected boundary: SureForms WordPress plugin up to and including 2.12.2; [WordPress Trac references](https://plugins.trac.wordpress.org/changeset?reponame=&new=3636000%40sureforms%2Ftags%2F2.12.3&old=3618798%40sureforms%2Ftags%2F2.12.2) in the CVE point to 2.12.3 changes.
- Exploit or incident status: public [CVE](https://cveawg.mitre.org/api/cve/CVE-2026-18406), [Wordfence reference](https://www.wordfence.com/threat-intel/vulnerabilities/id/8583c1f2-0820-492c-9fa1-d96e0ce2ddf2?source=cve), and [WordPress Trac code-change references](https://plugins.trac.wordpress.org/changeset/3635980/sureforms/trunk/inc/form-submit.php); no active exploitation evidence is recorded by the source.
- Mitigation state: update SureForms to 2.12.3 or later when available from the plugin channel, sanitize stored submissions, and review existing submitted content for script payloads before reusing that content in AI-assisted workflows.
- Confidence: medium-high for the vulnerability and affected versions; AI-specific impact is conditional on the plugin's AI Forms surface or downstream automation reusing submitted content.
- Residual risk: stored form content can become a prompt, retrieval, notification, or administrative-session contamination path if form submissions are reused by assistants or automation.

## Authoritative Sources

- [September 7 topic collector source](../../../raw/processed/2026-09-07/ai-security-wiki-topic-news-collector-2026-09-07T233220Z.json)
- [CVE-2026-18406 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-18406)
- [Wordfence CVE-2026-18406 advisory](https://www.wordfence.com/threat-intel/vulnerabilities/id/8583c1f2-0820-492c-9fa1-d96e0ce2ddf2?source=cve)
- [SureForms 2.12.3 Trac changeset](https://plugins.trac.wordpress.org/changeset?reponame=&new=3636000%40sureforms%2Ftags%2F2.12.3&old=3618798%40sureforms%2Ftags%2F2.12.2)
- [SureForms form-submit.php Trac changeset](https://plugins.trac.wordpress.org/changeset/3635980/sureforms/trunk/inc/form-submit.php)
- [NVD CVE-2026-18406](https://nvd.nist.gov/vuln/detail/CVE-2026-18406)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [data and privacy](index.md)
- [WordPress AI plugin advisory deferrals](../infrastructure-and-supply-chain/wordpress-ai-plugin-advisory-deferrals.md)
- [AI Sidebar extension AI chat theft](ai-sidebar-extension-ai-chat-theft.md)

## Open Questions

- Which SureForms AI Forms workflows pass submitted form content into prompts, retrieval, notifications, or assistant-visible context?

## Maintenance Notes

- Created on 2026-09-07 from the September 7 topic collector after direct CVE evidence confirmed an AI Forms product boundary.
