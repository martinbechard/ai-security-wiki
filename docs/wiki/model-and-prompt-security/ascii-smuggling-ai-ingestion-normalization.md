---
type: "Topic"
title: "ASCII smuggling AI ingestion normalization"
description: "Security analysis for ASCII smuggling as a prompt-injection and phishing-evasion technique requiring Unicode normalization before AI ingestion."
tags: ["model-and-prompt-security", "threats-and-attacks", "data-and-privacy"]
---

# ASCII smuggling AI ingestion normalization

## Current Understanding

The [September 8 topic collector source](../../../raw/processed/2026-09-08/ai-security-wiki-topic-news-collector-2026-09-08T233200Z.json) records in-window secondary reporting on Microsoft's September 3 research about ASCII smuggling in phishing-filter evasion. The Microsoft primary post predates the collector window; the local September 8 ingest treats this as an in-window reporting update and durable control signal, not as a newly published Microsoft primary disclosure.

ASCII smuggling uses invisible Unicode tag characters such as the Unicode Tags block U+E0000 through U+E007F to split or hide words from one observer while another parser sees the raw embedded text. The source ties the technique to prior AI prompt-injection and XPIA discussions, then records phishing campaigns that used hidden characters to split finance-themed lure words so recipients saw normal text while raw-text keyword detectors saw obfuscated tokens. For AI systems, the durable control is to strip or normalize invisible code points before both traditional filtering and AI-assistant ingestion.

## Security Impact

- Threat: hidden text can make humans, filters, and models disagree about what content says, enabling phishing evasion, prompt injection, XPIA, or misleading assistant summaries.
- Affected boundary: email filtering and AI-assistant ingestion pipelines that process raw text containing Unicode Tags block characters U+E0000 to U+E007F or other invisible code points.
- Exploit or incident status: Microsoft reported high-volume phishing telemetry; the collector uses in-window secondary reports for timing.
- Mitigation state: strip, normalize, or visibly annotate Unicode tag characters and other invisible code points before keyword filtering, embedding, summarization, tool routing, or model prompt assembly.
- Confidence: medium-high for the technique and mitigation from Microsoft-linked reporting; medium for exact campaign volume because the source relies on secondary reporting inside the exact window.
- Residual risk: content pipelines that sanitize rendered display but preserve raw hidden characters can still feed attacker-controlled instructions or lures into downstream AI tools.

## Authoritative Sources

- [September 8 topic collector source](../../../raw/processed/2026-09-08/ai-security-wiki-topic-news-collector-2026-09-08T233200Z.json)
- [Microsoft Security Research post](https://www.microsoft.com/en-us/security/blog/2026/09/03/ascii-smuggling-crosses-over-from-ai-prompt-injection-to-phishing-evasion/)
- [ITPro report](https://www.itpro.com/security/cyber-crime/cyber-criminals-are-adapting-ascii-smuggling-for-mass-phishing-campaigns)
- [TechRadar report](https://www.techradar.com/pro/security/hackers-are-using-invisible-unicode-characters-to-sneak-phishing-lures-into-emails)
- [Indian Express report](https://indianexpress.com/article/technology/tech-news-technology/what-is-ascii-smuggling-spam-ai-email-filters-10865353/)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [model and prompt security](index.md)
- [Context7 MCP custom instructions prompt injection](context7-mcp-custom-instructions-prompt-injection.md)
- [Legal filing prompt injection](legal-filing-prompt-injection.md)
- [threats and attacks](../threats-and-attacks/index.md)
- [data and privacy](../data-and-privacy/index.md)

## Open Questions

- No open wiki questions are recorded for this topic.

## Maintenance Notes

- Created on 2026-09-08 from the September 8 topic collector as a durable text-normalization control leaf; next check whether upstream ai-dev-wiki owns a broader content-ingestion normalization practice page.
