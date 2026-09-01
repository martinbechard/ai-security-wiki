---
type: "Topic"
title: "Microsoft Edge iOS LLM Prompt Spoofing"
description: "Security analysis for CVE-2026-70331 Microsoft Edge for iOS input neutralization in LLM prompting."
tags: ["model-and-prompt-security", "agent-and-tool-security", "identity-and-access"]
---

# Microsoft Edge iOS LLM Prompt Spoofing

## Current Understanding

The [August 31 topic collector source](../../../raw/processed/2026-08-31/ai-security-wiki-topic-news-collector-2026-08-31T233224Z.json) records an in-window NVD update for [CVE-2026-70331](https://nvd.nist.gov/vuln/detail/CVE-2026-70331). Microsoft Edge product coverage belongs upstream; this page owns the local browser-integrated LLM prompt-neutralization boundary.

NVD records improper neutralization of input used for LLM prompting in Microsoft Edge for iOS, allowing an unauthorized network attacker to perform spoofing. The [Microsoft MSRC record](https://msrc.microsoft.com/update-guide/vulnerability/CVE-2026-70331) is the vendor source, but the raw collector notes that detailed MSRC fields were JavaScript-gated during collection.

## Security Impact

- Threat: network-supplied content can influence an LLM prompt path in a way that creates spoofed output or user trust decisions.
- Affected boundary: Microsoft Edge for iOS / Chromium-based Edge before 150.0.4078.50 according to NVD affected data captured by the collector.
- Exploit or incident status: public CVE update; no local incident is recorded.
- Mitigation state: upgrade to the fixed Edge build and treat browser-integrated prompt construction as a content-neutralization boundary.
- Confidence: medium because NVD update timing and affected data are captured, while MSRC detail still needs reconciliation.
- Residual risk: browser LLM features can blur web content, prompt construction, and user-visible assistant output unless provenance and escaping are explicit.

## Control Implications

- Separate network content from system/developer prompt fragments before browser-integrated LLM calls.
- Preserve source attribution and user-visible provenance for prompt-derived browser assistance.
- Test spoofing inputs that include prompt delimiters, hidden markup, redirections, and origin-mimicking text.

## Authoritative Sources

- [August 31 topic collector source](../../../raw/processed/2026-08-31/ai-security-wiki-topic-news-collector-2026-08-31T233224Z.json)
- [NVD CVE-2026-70331](https://nvd.nist.gov/vuln/detail/CVE-2026-70331)
- [Microsoft MSRC CVE-2026-70331](https://msrc.microsoft.com/update-guide/vulnerability/CVE-2026-70331)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [model and prompt security](index.md)
- [agentic browser intent collision](../agent-and-tool-security/agentic-browser-intent-collision.md)
- [AI agent interaction transparency controls](../agent-and-tool-security/ai-agent-interaction-transparency-controls.md)

## Open Questions

- What exact MSRC severity, affected-platform, and fixed-build details apply to CVE-2026-70331?

## Maintenance Notes

- Created on 2026-08-31 from the [August 31 topic collector](../../../raw/processed/2026-08-31/ai-security-wiki-topic-news-collector-2026-08-31T233224Z.json) as a browser-integrated LLM prompt-spoofing leaf.
