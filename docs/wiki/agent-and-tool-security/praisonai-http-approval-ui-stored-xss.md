---
type: "Topic"
title: "PraisonAI HTTP Approval UI Stored XSS"
description: "Security analysis for CVE-2026-56840 approval-dashboard stored XSS and self-approval."
tags: ["agent-and-tool-security", "data-and-privacy"]
---

# PraisonAI HTTP Approval UI Stored XSS

## Current Understanding

[CVE-2026-56840](https://nvd.nist.gov/vuln/detail/CVE-2026-56840), captured by the [October 24 collector](../../../raw/processed/2026-10-24/ai-security-wiki-topic-news-collector-2026-10-24T232700Z.json), reports stored XSS in the HTTP approval dashboard that could self-approve a dangerous action. This page owns approval-UI integrity.

## Security Impact

- Threat: rendered untrusted content acts as the approving user.
- Affected boundary: PraisonAI 4.5.87 before 4.6.59.
- Exploit or incident status: public disclosure; no local incident is recorded.
- Mitigation state: upgrade to 4.6.59 and render approval metadata as untrusted data.
- Confidence: high for disclosed scope and fixed version.
- Residual risk: administrative approval consoles are high-value XSS targets.

## Authoritative Sources

- [October 24 collector](../../../raw/processed/2026-10-24/ai-security-wiki-topic-news-collector-2026-10-24T232700Z.json)
- [CVE-2026-56840](https://nvd.nist.gov/vuln/detail/CVE-2026-56840)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)

## Open Questions

- Does the fixed UI isolate all action descriptions and tool output from executable DOM contexts?

## Maintenance Notes

- Created on 2026-10-24 after verifier-required split from the original approval family.
