---
type: "Topic"
title: "Cheshire Cat AI default identity bypass"
description: "Security analysis for CVE-2026-90579 client-controlled identity in Cheshire Cat AI default authentication."
tags: ["identity-and-access", "data-and-privacy"]
---

# Cheshire Cat AI default identity bypass

## Current Understanding

The [September 13 late topic collector source](../../../raw/processed/2026-09-13/ai-security-wiki-topic-news-collector-2026-09-13T233340Z.json) records [CVE-2026-90579](https://cveawg.mitre.org/api/cve/CVE-2026-90579) for Cheshire Cat AI through 1.9.2. Broad Cheshire Cat AI framework coverage belongs upstream; this page owns the local default-authentication identity boundary.

The CVE and public issue say `core/cat/factory/custom_auth_handler.py` can accept a caller-controlled `user_id` value as identity in the default configuration when API keys are not configured. A remote unauthenticated attacker can read or modify data for the named user and gain full permissions. The public issue reports a proof of concept against v1.9.2 and says the project had not responded.

## Security Impact

- Threat: client-controlled identity in a default auth mode can turn unauthenticated requests into full user impersonation.
- Affected boundary: Cheshire Cat AI through 1.9.2, default authentication configuration, and user-scoped data operations.
- Exploit or incident status: public CVE and issue with proof-of-concept report; no maintainer response was recorded by the source.
- Mitigation state: configure real API keys or authentication, reject client-supplied identity without verified credentials, and monitor for a maintainer fix.
- Confidence: high for the reported missing-authentication/default-identity behavior; medium for remediation because the source says no project response was available.
- Residual risk: assistant frameworks that offer permissive default auth can expose memory, tools, or user data before operators realize production authentication is absent.

## Authoritative Sources

- [September 13 late topic collector source](../../../raw/processed/2026-09-13/ai-security-wiki-topic-news-collector-2026-09-13T233340Z.json)
- [CVE-2026-90579 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-90579)
- [NVD CVE-2026-90579](https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2026-90579)
- [Cheshire Cat AI issue 1137](https://github.com/cheshire-cat-ai/core/issues/1137)
- [VulDB CVE-2026-90579](https://vuldb.com/cve/CVE-2026-90579)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [Cheshire Cat AI memory points disclosure](../data-and-privacy/cheshire-cat-ai-memory-points-disclosure.md)
- [Production agent identity and access controls](production-agent-identity-and-access-controls.md)

## Open Questions

- Which Cheshire Cat AI release fixes CVE-2026-90579, and does it change the default authentication posture?

## Maintenance Notes

- Created on 2026-09-13 from the [September 13 late topic collector](../../../raw/processed/2026-09-13/ai-security-wiki-topic-news-collector-2026-09-13T233340Z.json) as a default-authentication identity-boundary leaf.
