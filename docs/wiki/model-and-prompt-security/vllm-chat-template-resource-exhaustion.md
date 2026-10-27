---
type: "Topic"
title: "vLLM Chat-Template Resource Exhaustion"
description: "Security analysis for CVE-2026-115911 and CVE-2026-115918 request or model-supplied vLLM template exhaustion."
tags: ["model-and-prompt-security"]
---

# vLLM Chat-Template Resource Exhaustion

## Current Understanding

The October 26 collector records the closely coupled [CVE-2026-115911](https://www.cve.org/CVERecord?id=CVE-2026-115911) and [CVE-2026-115918](https://www.cve.org/CVERecord?id=CVE-2026-115918) vLLM chat-template boundary. Broad vLLM context belongs upstream; this page owns compilation and rendering of request- or model-supplied Jinja templates without adequate time, iteration, or output limits.

## Security Impact

- Threat: authenticated callers or malicious model repositories can supply a nonterminating or expanding template, blocking template workers or exhausting memory.
- Affected boundary: vLLM 0.19.0 through before 0.32.0 for the main path, and 0.16.0 through before 0.32.0 for `/v1/responses` trust-policy bypass; Harmony models do not use this Jinja path.
- Exploit or incident status: public advisories; no local exploitation evidence is recorded.
- Mitigation state: upgrade to [vLLM 0.32.0](https://github.com/vllm-project/vllm/releases/tag/v0.32.0), set a server template, disable request templates unless explicitly trusted, and enforce render resource limits.
- Confidence: high after maintainer advisory and release reconciliation.
- Residual risk: trusted-template flags do not make model-repository assets trustworthy without provenance review.

## Authoritative Sources

- [October 26 collector source](../../../raw/processed/2026-10-26/ai-security-wiki-topic-news-collector-2026-10-26T233009Z.json)
- [CVE-2026-115911](https://www.cve.org/CVERecord?id=CVE-2026-115911)
- [CVE-2026-115918](https://www.cve.org/CVERecord?id=CVE-2026-115918)
- [vLLM 0.32.0 release](https://github.com/vllm-project/vllm/releases/tag/v0.32.0)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [model and prompt security](index.md)

## Open Questions

- Which deployments expose the request-template path to users or load unreviewed model repositories?

## Maintenance Notes

- Created on 2026-10-26 as one shared template-rendering control boundary.
