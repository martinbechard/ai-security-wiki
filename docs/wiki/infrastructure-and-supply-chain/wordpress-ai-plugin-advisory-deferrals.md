---
type: "Topic"
title: "WordPress AI Plugin Advisory Deferrals"
description: "Evidence-preserving deferrals for weakly AI-specific WordPress plugin advisories from August 25 collection."
tags: ["infrastructure-and-supply-chain", "data-and-privacy"]
---

# WordPress AI Plugin Advisory Deferrals

## Current Understanding

The [August 25 topic news collector source](../../../raw/processed/2026-08-25/ai-security-wiki-topic-news-collector-2026-08-25T183709Z.json) initially captured MagicAI [CVE-2026-32560](https://nvd.nist.gov/vuln/detail/CVE-2026-32560) and SiteLeads [CVE-2026-78268](https://nvd.nist.gov/vuln/detail/CVE-2026-78268) as AI-branded WordPress plugin advisories. The [August 25 late topic news collector source](../../../raw/processed/2026-08-25/ai-security-wiki-topic-news-collector-2026-08-25T233059Z.json) then excluded both from durable ingest because the visible records were weakly AI-specific: MagicAI was a terse WordPress local file inclusion, and SiteLeads was generic unauthenticated sensitive data exposure without visible assistant, model, prompt, or agent boundary detail.

Broad WordPress plugin and AI product catalog context belongs upstream. This local deferral exists so future agents do not silently lose the evidence or create overclaimed AI-security pages from product-name-only matches.

## Deferred Advisory Notes

- MagicAI for WordPress [CVE-2026-32560](https://nvd.nist.gov/vuln/detail/CVE-2026-32560): NVD published the record on 2026-08-24 and records subscriber local file inclusion through version 1.4 with CVSS 3.1 HIGH 8.8. Defer a standalone local leaf until another source confirms an AI-specific data, prompt, model, credential, or agent boundary.
- SiteLeads AI Chatbot [CVE-2026-78268](https://nvd.nist.gov/vuln/detail/CVE-2026-78268): NVD published the record on 2026-08-24 and records unauthenticated sensitive data exposure through version 1.2.0. Defer a standalone local leaf until source detail confirms exposed chat/contact data or another AI assistant privacy boundary.

## Security Impact

- Threat: AI-branded CMS plugins can expose ordinary application filesystem or sensitive data boundaries, but product branding alone is not enough for local AI-security synthesis.
- Affected boundary: WordPress plugin deployments for MagicAI through 1.4 and SiteLeads through 1.2.0.
- Exploit or incident status: public NVD-referenced advisories; no local exploitation evidence is recorded.
- Mitigation state: plugin owners should follow the relevant vendor or vulnerability-database guidance and update or remove affected plugins; local AI-specific controls remain deferred pending stronger evidence.
- Confidence: high for NVD advisory existence; low to medium for AI-specific relevance based on visible collector evidence.
- Residual risk: later advisory detail may show chat transcript, prompt, provider-key, or generated-content exposure that justifies a granular local leaf.

## Authoritative Sources

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

## Maintenance Notes

- Created on 2026-08-26 to record explicit source-based deferrals for MagicAI and SiteLeads after the late collector classified them as weakly AI-specific.
