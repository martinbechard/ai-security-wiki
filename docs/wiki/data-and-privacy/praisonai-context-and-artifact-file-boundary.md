---
type: "Topic"
title: "PraisonAI Context and Artifact File Boundary"
description: "Security analysis for CVE-2026-56833 and CVE-2026-56834 path containment failures."
tags: ["data-and-privacy", "agent-and-tool-security"]
---

# PraisonAI Context and Artifact File Boundary

## Current Understanding

The [October 24 collector](../../../raw/processed/2026-10-24/ai-security-wiki-topic-news-collector-2026-10-24T232700Z.json) records [CVE-2026-56833](https://nvd.nist.gov/vuln/detail/CVE-2026-56833) and [CVE-2026-56834](https://nvd.nist.gov/vuln/detail/CVE-2026-56834): Dynamic Context and artifact helpers accepted caller-controlled identifiers or paths and could read outside configured roots. Product catalog context belongs upstream; this page owns the shared host-file authority boundary.

## Security Impact

- Threat: tool-controlled paths disclose readable local files, including credentials.
- Affected boundary: PraisonAI 3.8.1 before 4.6.59.
- Exploit or incident status: public disclosures; no local exploitation or incident is recorded.
- Mitigation state: upgrade to 4.6.59 and verify normalized-path containment for history, context, and artifact helpers.
- Confidence: high for reported scope and remediation.
- Residual risk: any auxiliary context tool that resolves user-controlled paths can reintroduce host-file authority.

## Authoritative Sources

- [October 24 collector](../../../raw/processed/2026-10-24/ai-security-wiki-topic-news-collector-2026-10-24T232700Z.json)
- [CVE-2026-56833](https://nvd.nist.gov/vuln/detail/CVE-2026-56833)
- [CVE-2026-56834](https://nvd.nist.gov/vuln/detail/CVE-2026-56834)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [data and privacy](index.md)
- [PraisonAI file mention path traversal](../infrastructure-and-supply-chain/praisonai-file-mention-path-traversal.md)

## Open Questions

- Which deployed context and artifact roots contain long-lived credentials?

## Maintenance Notes

- Created on 2026-10-24 as a closely coupled context-and-artifact containment family.
