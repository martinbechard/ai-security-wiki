---
type: "Topic"
title: "Legal Filing Prompt Injection"
description: "Security analysis for hidden prompt-injection instructions embedded in legal filings consumed by AI tools."
tags: ["model-and-prompt-security", "governance-and-compliance"]
---

# Legal Filing Prompt Injection

## Current Understanding

The [August 22 topic news collector source](../../../raw/processed/2026-08-22/ai-security-wiki-topic-news-collector-2026-08-22T233049Z.json) and [August 23 topic news collector source](../../../raw/processed/2026-08-23/ai-security-wiki-topic-news-collector-2026-08-23T233302Z.json) record a Connecticut court incident in which hidden white-text instructions were placed in legal filings. Broad legal-technology and court-administration context is not locally owned; this page owns the AI security boundary where adversarial document text targets downstream AI analysis used by litigants, lawyers, or reviewers.

The [CT Insider report](https://www.ctinsider.com/connecticut/article/connecticut-judge-hidden-ai-prompt-injection-court-22387143.php) cited by the collector says a Connecticut Superior Court judge found hidden AI instructions that told AI systems analyzing the documents to favor the filer and reverse a clerk's ruling. The collector also records that the Connecticut court itself reportedly did not use AI to assess the filings, so the incident is best treated as prompt-injection abuse against external AI-assisted document analysis rather than compromise of a court AI system.

## Security Impact

- Threat: hidden document text can manipulate AI summaries, legal analysis, or review workflows when documents are treated as trusted context.
- Affected boundary: court filings and other legal documents consumed by AI tools used by litigants, lawyers, or reviewers.
- Exploit or incident status: reported public sanctions incident; source attribution is a media report rather than a primary court order in this ingest.
- Mitigation state: render hidden text, compare extracted text with visual presentation, label document text as untrusted evidence, and preserve human review for legal conclusions.
- Confidence: medium because the collector captured one press source; a primary court order should be preferred if available.
- Residual risk: legal, procurement, contract, and compliance workflows often ingest adversarial documents, so prompt-injection controls must apply to documents, not only webpages or chat messages.

## Authoritative Sources

- [August 22 topic news collector source](../../../raw/processed/2026-08-22/ai-security-wiki-topic-news-collector-2026-08-22T233049Z.json)
- [August 23 topic news collector source](../../../raw/processed/2026-08-23/ai-security-wiki-topic-news-collector-2026-08-23T233302Z.json)
- [CT Insider report](https://www.ctinsider.com/connecticut/article/connecticut-judge-hidden-ai-prompt-injection-court-22387143.php)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [model and prompt security](index.md)
- [hidden context exposure reconnaissance](hidden-context-exposure-reconnaissance.md)
- [evaluation artifact template execution risk](evaluation-artifact-template-execution-risk.md)

## Open Questions

- Is a primary Connecticut court order available that confirms the exact sanction, filing content, and procedural posture?

## Maintenance Notes

- Created on 2026-08-22 from the [August 22 topic news collector source](../../../raw/processed/2026-08-22/ai-security-wiki-topic-news-collector-2026-08-22T233049Z.json) as a legal-document prompt-injection incident leaf.
- Updated on 2026-08-23 from the [August 23 topic news collector source](../../../raw/processed/2026-08-23/ai-security-wiki-topic-news-collector-2026-08-23T233302Z.json) with CT Insider sanction-reporting provenance while leaving the primary-order question open.
