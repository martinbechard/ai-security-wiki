---
type: "Topic"
title: "WordPress AI Plugin Advisory Deferrals"
description: "Evidence-preserving deferrals for weakly AI-specific WordPress plugin advisories from August 25 collection."
tags: ["infrastructure-and-supply-chain", "data-and-privacy"]
---

# WordPress AI Plugin Advisory Deferrals

## Current Understanding

MagicAI [CVE-2026-32560](https://nvd.nist.gov/vuln/detail/CVE-2026-32560), SiteLeads [CVE-2026-78268](https://nvd.nist.gov/vuln/detail/CVE-2026-78268), and Kubio AI Website Builder [CVE-2026-83492](https://nvd.nist.gov/vuln/detail/CVE-2026-83492) remain AI-branded WordPress plugin deferrals rather than standalone local AI-security leaves. The visible records are weakly AI-specific: MagicAI is a terse WordPress local file inclusion, SiteLeads is generic unauthenticated sensitive data exposure without visible assistant, model, prompt, or agent boundary detail, and Kubio is recorded by NVD and Tenable as improper input validation before 2.9.1 without enough captured AI-boundary detail. The [August 25 topic news collector source](../../../raw/processed/2026-08-25/ai-security-wiki-topic-news-collector-2026-08-25T183709Z.json), [August 25 late topic news collector source](../../../raw/processed/2026-08-25/ai-security-wiki-topic-news-collector-2026-08-25T233059Z.json), [August 27 leaf update watch source](../../../raw/processed/2026-08-27/ai-security-wiki-leaf-update-watch-20260828T000238Z.json), and [August 31 topic collector source](../../../raw/processed/2026-08-31/ai-security-wiki-topic-news-collector-2026-08-31T233224Z.json) provide the current evidence.

Broad WordPress plugin and AI product catalog context belongs upstream. This local deferral exists so future agents do not silently lose the evidence or create overclaimed AI-security pages from product-name-only matches.

## Deferred Advisory Notes

- MagicAI for WordPress [CVE-2026-32560](https://nvd.nist.gov/vuln/detail/CVE-2026-32560): NVD published the record on 2026-08-24 and records subscriber local file inclusion through version 1.4 with CVSS 3.1 HIGH 8.8. Defer a standalone local leaf until another source confirms an AI-specific data, prompt, model, credential, or agent boundary.
- SiteLeads AI Chatbot [CVE-2026-78268](https://nvd.nist.gov/vuln/detail/CVE-2026-78268): NVD published the record on 2026-08-24 and records unauthenticated sensitive data exposure through version 1.2.0. Defer a standalone local leaf until source detail confirms exposed chat/contact data or another AI assistant privacy boundary.
- Kubio AI Website Builder [CVE-2026-83492](https://nvd.nist.gov/vuln/detail/CVE-2026-83492): NVD published the record on 2026-08-31 and records improper input validation before 2.9.1 with [Tenable TRA-2026-58](https://www.tenable.com/security/research/tra-2026-58) as the research reference. Defer a standalone local leaf until source detail identifies whether the vulnerable input crosses AI prompt, generated-site, credential, or assistant-data boundaries.

Current primary CVE-record evidence corroborates the same deferral boundary: MagicAI remains a subscriber local file-inclusion record, and SiteLeads remains an unauthenticated sensitive-data exposure record, without enough additional prompt, model, credential, or assistant-data detail to justify separate local leaves.

## Security Impact

- Threat: AI-branded CMS plugins can expose ordinary application filesystem or sensitive data boundaries, but product branding alone is not enough for local AI-security synthesis.
- Affected boundary: WordPress plugin deployments for MagicAI through 1.4, SiteLeads through 1.2.0, and Kubio AI Website Builder before 2.9.1.
- Exploit or incident status: public NVD-referenced advisories; no local exploitation evidence is recorded.
- Mitigation state: plugin owners should follow the relevant vendor or vulnerability-database guidance and update or remove affected plugins; local AI-specific controls remain deferred pending stronger evidence.
- Confidence: high for NVD advisory existence; low to medium for AI-specific relevance based on visible collector evidence.
- Residual risk: later advisory detail may show chat transcript, prompt, provider-key, or generated-content exposure that justifies a granular local leaf.

## Authoritative Sources

- [August 27 leaf update watch source](../../../raw/processed/2026-08-27/ai-security-wiki-leaf-update-watch-20260828T000238Z.json)
- [August 31 topic collector source](../../../raw/processed/2026-08-31/ai-security-wiki-topic-news-collector-2026-08-31T233224Z.json)
- [CVE-2026-32560 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-32560)
- [CVE-2026-78268 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-78268)
- [NVD CVE-2026-83492](https://nvd.nist.gov/vuln/detail/CVE-2026-83492)
- [Tenable TRA-2026-58](https://www.tenable.com/security/research/tra-2026-58)
- [August 25 topic news collector source](../../../raw/processed/2026-08-25/ai-security-wiki-topic-news-collector-2026-08-25T183709Z.json)
- [August 25 late topic news collector source](../../../raw/processed/2026-08-25/ai-security-wiki-topic-news-collector-2026-08-25T233059Z.json)
- [NVD CVE-2026-32560](https://nvd.nist.gov/vuln/detail/CVE-2026-32560)
- [NVD CVE-2026-78268](https://nvd.nist.gov/vuln/detail/CVE-2026-78268)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [data and privacy](../data-and-privacy/index.md)
- [AI Sidebar extension AI chat theft](../data-and-privacy/ai-sidebar-extension-ai-chat-theft.md)

## Open Questions

- Do detailed advisory sources for MagicAI CVE-2026-32560 identify AI provider keys, prompts, generated files, or model outputs as exposed assets?
- Do detailed advisory sources for SiteLeads CVE-2026-78268 identify chat transcripts, contact data, or assistant configuration as exposed data?
- Does Tenable TRA-2026-58 identify an AI prompt, generated-site, provider-key, or assistant-data boundary for Kubio AI Website Builder CVE-2026-83492?

## Maintenance Notes

- Updated on 2026-08-28 with August 27 leaf-update evidence for CVE-2026-32560, CVE-2026-78268.
- Updated on 2026-08-31 with Kubio AI Website Builder CVE-2026-83492 as a sparse-source deferral rather than a standalone local AI-security leaf.
- Created on 2026-08-26 to record explicit source-based deferrals for MagicAI and SiteLeads after the late collector classified them as weakly AI-specific.
