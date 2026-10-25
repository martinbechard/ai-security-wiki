---
type: "Topic"
title: "LangGraph CLI Deployment Token Logging"
description: "Security analysis for CVE-2026-115885 temporary registry token disclosure in verbose CLI output."
tags: ["data-and-privacy", "infrastructure-and-supply-chain"]
---

# LangGraph CLI Deployment Token Logging

## Current Understanding

[CVE-2026-115885](https://nvd.nist.gov/vuln/detail/CVE-2026-115885), captured by the [October 24 collector](../../../raw/processed/2026-10-24/ai-security-wiki-topic-news-collector-2026-10-24T232700Z.json), reports that LangGraph CLI `--verbose` could print a temporary container-registry push token to logs or terminal recordings. The source reports `0.4.15` through `0.4.32` while also identifying `0.4.32` as fixed; this version boundary remains unresolved. Broad LangGraph and deployment workflow context belongs upstream; this page owns deployment credential handling.

## Security Impact

- Threat: build logs or terminal capture disclose a registry token.
- Affected boundary: LangGraph CLI 0.4.15 through 0.4.32 is reported, while the same evidence identifies 0.4.32 as fixed; exact inclusive/exclusive range is unresolved.
- Exploit or incident status: public disclosure; no local token exposure or incident is recorded.
- Mitigation state: use the maintainer advisory to confirm the fixed release, search retained CI and terminal logs, and rotate potentially exposed tokens.
- Confidence: medium because the NVD-first record has an unresolved version-boundary contradiction.
- Residual risk: temporary credentials remain sensitive wherever deployment diagnostics are retained or shared.

## Authoritative Sources

- [October 24 collector](../../../raw/processed/2026-10-24/ai-security-wiki-topic-news-collector-2026-10-24T232700Z.json)
- [CVE-2026-115885](https://nvd.nist.gov/vuln/detail/CVE-2026-115885)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [data and privacy](index.md)
- [LangGraph upstream context](../../../upstream-ai-wiki/agentic-frameworks/langgraph.md)
- [LangGraph Namespace Tenant Isolation](../identity-and-access/langgraph-namespace-tenant-isolation.md)

## Open Questions

- Which maintainer advisory resolves whether 0.4.32 is affected or fixed?
- Which CI logs or terminal recordings retained CLI verbose output?

## Maintenance Notes

- Created on 2026-10-24 as a deployment-token boundary separate from persistent-state isolation; version-boundary ambiguity is preserved pending primary evidence.
