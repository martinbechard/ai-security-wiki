---
type: "Topic"
title: "Open WebUI rendering and search input risks"
description: "Security analysis for Open WebUI 0.11.0 KaTeX stored XSS and knowledge-search regex denial of service."
tags: ["model-and-prompt-security", "agent-and-tool-security"]
---

# Open WebUI rendering and search input risks

## Current Understanding

The [September 8 topic collector source](../../../raw/processed/2026-09-08/ai-security-wiki-topic-news-collector-2026-09-08T233200Z.json) records NVD in-window updates for Open WebUI rendering and search-input issues fixed in 0.11.0. Broad product context belongs upstream; this page owns the model-and-prompt security boundary where assistant-rendered content and user-controlled search expressions can affect other users or service availability.

The records describe KaTeX stored XSS and regex denial of service in knowledge search. The durable control is to treat math/markdown rendering and search syntax as untrusted input surfaces, even when the content originates in normal assistant or knowledge-base workflows.

## Security Impact

- Threat: stored rendered content can execute script in another user's session, and crafted search expressions can exhaust shared service resources.
- Affected boundary: Open WebUI versions before 0.11.0; KaTeX rendering and knowledge-search regex handling.
- Exploit or incident status: public NVD/CVE/GitHub advisory evidence; no local exploitation incident is recorded.
- Mitigation state: upgrade to Open WebUI 0.11.0 or later; sanitize rendered math/markdown and bound or compile-safe search expressions.
- Confidence: high for NVD update timing and affected boundary; medium for exact exploit prerequisites.
- Residual risk: assistant UIs often trust rich generated or user-supplied content more than ordinary web input, even though it can become script or availability risk.

## Authoritative Sources

- [September 8 topic collector source](../../../raw/processed/2026-09-08/ai-security-wiki-topic-news-collector-2026-09-08T233200Z.json)
- [Open WebUI v0.11.0 release](https://github.com/open-webui/open-webui/releases/tag/v0.11.0)
- [CVE-2026-70486 NVD record](https://nvd.nist.gov/vuln/detail/CVE-2026-70486)
- [CVE-2026-70487 NVD record](https://nvd.nist.gov/vuln/detail/CVE-2026-70487)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [model and prompt security](index.md)
- [data and privacy](../data-and-privacy/index.md)
- [agent and tool security](../agent-and-tool-security/index.md)

## Open Questions

- No open wiki questions are recorded for this topic.

## Maintenance Notes

- Created on 2026-09-08 from the September 8 topic collector after verifier correction split the Open WebUI release wave into focused security-boundary leaves.
