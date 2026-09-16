---
type: "Topic"
title: "PraisonAI IMAP command injection"
description: "Security analysis for CVE-2026-57130 LLM-controlled PraisonAI email search parameters injected into IMAP SEARCH syntax."
tags: ["agent-and-tool-security", "data-and-privacy"]
---

# PraisonAI IMAP command injection

## Current Understanding

The [September 14 topic collector source](../../../raw/processed/2026-09-14/ai-security-wiki-topic-news-collector-2026-09-14T233124Z.json) records [CVE-2026-57130](https://cveawg.mitre.org/api/cve/CVE-2026-57130) for `praisonaiagents` before 1.6.59. Broad connector workflow context belongs upstream; this page owns the local agent-email command-syntax boundary.

The CVE says `email_tools.py` interpolated LLM-controlled `from_addr`, `subject`, and `query` values directly into quoted IMAP `SEARCH` criteria. Quote, backslash, newline, or null characters could break out of the intended string data and inject IMAP command syntax.

The [September 16 leaf update watch source](../../../raw/processed/2026-09-16/ai-security-wiki-leaf-update-watch-20260916T000740Z.json) adds NVD's September 15 metadata, including Deferred status and CWE-20/CWE-77 classifications. That enriches vulnerability taxonomy without changing the agent-email connector boundary.

## Security Impact

- Threat: prompt-influenced email search parameters can alter IMAP command semantics and expose or manipulate mailbox data outside the intended query.
- Affected boundary: `praisonaiagents` before 1.6.59, email connector search construction, and IMAP `SEARCH` criteria.
- Exploit or incident status: public CVE, GitHub advisory, patch, and release evidence; no local exploitation incident is recorded.
- Mitigation state: upgrade `praisonaiagents` to 1.6.59 or later and construct IMAP commands through data-safe parameter handling rather than string interpolation.
- Confidence: high because the direct CVE and upstream advisory align on fields, injection characters, patch, and release.
- Residual risk: AI email tools frequently receive model-generated search terms; connector APIs need parser-level escaping and least-privilege mailbox scopes.

## Authoritative Sources

- [September 14 topic collector source](../../../raw/processed/2026-09-14/ai-security-wiki-topic-news-collector-2026-09-14T233124Z.json)
- [September 16 leaf update watch source](../../../raw/processed/2026-09-16/ai-security-wiki-leaf-update-watch-20260916T000740Z.json)
- [CVE-2026-57130 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-57130)
- [NVD CVE-2026-57130 record](https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2026-57130)
- [GitHub advisory GHSA-c969-5x3p-vq3v](https://github.com/MervinPraison/PraisonAI/security/advisories/GHSA-c969-5x3p-vq3v)
- [PraisonAI patch commit](https://github.com/MervinPraison/PraisonAI/commit/b4270173d4123fb1ee8910588f0896668ee21b59)
- [PraisonAI 4.6.59 release](https://github.com/MervinPraison/PraisonAI/releases/tag/v4.6.59)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [AI provider override trust boundaries](../data-and-privacy/ai-provider-override-trust-boundaries.md)
- [n8n Workflow Tool credential exfiltration](n8n-workflow-tool-credential-exfiltration.md)

## Open Questions

- Which PraisonAI email connector operations besides search accept model-controlled strings that become protocol syntax?

## Maintenance Notes

- Created on 2026-09-15 from the [September 14 topic collector](../../../raw/processed/2026-09-14/ai-security-wiki-topic-news-collector-2026-09-14T233124Z.json) as an agent-email connector injection leaf.
- Updated on 2026-09-16 with NVD Deferred/CWE metadata from the [September 16 leaf update watch](../../../raw/processed/2026-09-16/ai-security-wiki-leaf-update-watch-20260916T000740Z.json).
