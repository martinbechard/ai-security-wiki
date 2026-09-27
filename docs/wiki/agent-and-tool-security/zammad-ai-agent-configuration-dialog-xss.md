---
type: "Topic"
title: "Zammad AI Agent Configuration Dialog XSS"
description: "Security analysis for CVE-2026-63216, where Zammad AI Agent configuration option labels rendered as raw HTML."
tags: ["agent-and-tool-security", "data-and-privacy"]
---

# Zammad AI Agent Configuration Dialog XSS

## Current Understanding

The [September 26 topic collector source](../../../raw/processed/2026-09-26/ai-security-wiki-topic-news-collector-2026-09-26T233301Z.json) records CVE-2026-63216 for Zammad before 7.1.2. Broad Zammad product context belongs upstream; this page owns the local AI Agent administration UI rendering boundary.

## Security Impact

- Threat: unsanitized option labels can execute script in AI Agent configuration dialogs.
- Affected boundary: Zammad before 7.1.2, AI Agent configuration dialogs, option label rendering, and administrator browser sessions.
- Exploit or incident status: disclosed CVE; no confirmed exploitation is recorded in the collector.
- Mitigation state: upgrade to Zammad 7.1.2 or later and sanitize AI Agent configuration labels before rendering.
- Confidence: medium-high from NVD-backed collector evidence; vendor release notes should be checked for exact affected options.
- Residual risk: admin UI XSS can pivot into AI agent configuration changes and provider credential exposure.

## Authoritative Sources

- [September 26 topic collector source](../../../raw/processed/2026-09-26/ai-security-wiki-topic-news-collector-2026-09-26T233301Z.json)
- [NVD CVE-2026-63216](https://nvd.nist.gov/vuln/detail/CVE-2026-63216)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [data and privacy](../data-and-privacy/index.md)

## Open Questions

- Which AI Agent configuration labels could be attacker-controlled before Zammad 7.1.2?

## Maintenance Notes

- Created on 2026-09-27 from the [September 26 topic collector source](../../../raw/processed/2026-09-26/ai-security-wiki-topic-news-collector-2026-09-26T233301Z.json) after verifier correction split the Zammad release family.
