---
type: "Topic"
title: "CreditNirvana Agentic AI Call Centre Client-Key Disclosure"
description: "Security analysis for CVE-2026-110474 static API-key exposure enabling access to call transcripts and recordings."
tags: ["data-and-privacy", "identity-and-access"]
---

# CreditNirvana Agentic AI Call Centre Client-Key Disclosure

## Current Understanding

The [October 27 collector source](../../../raw/processed/2026-10-27/ai-security-wiki-topic-news-collector-2026-10-27T232925Z.json) records [CVE-2026-110474](https://cveawg.mitre.org/api/cve/CVE-2026-110474): CreditNirvana Agentic AI Call Centre versions before 2.0.0 expose a static API key in a client-side JavaScript bundle. An unauthenticated remote actor can extract that key and call application APIs to retrieve call transcripts and recordings. Broad product context belongs upstream; this page owns the browser-distributed credential and conversation-data boundary.

## Security Impact

- Threat: a reusable client-side credential authorizes retrieval of sensitive voice-agent conversation data.
- Affected boundary: client JavaScript bundle to application API in Agentic AI Call Centre versions before 2.0.0.
- Exploit or incident status: public CVE disclosure; no active exploitation or local incident is identified.
- Mitigation state: remove reusable credentials from browser bundles, rotate exposed keys, enforce user- and tenant-scoped authorization on transcript and recording APIs, and inspect public assets and access logs.
- Confidence: high for the exposed-key, data-retrieval, and affected-version finding; remediation details beyond the 2.0.0 boundary remain unverified.
- Residual risk: credential rotation alone cannot protect historical recordings if APIs lack object-level authorization.

## Authoritative Sources

- [October 27 collector source](../../../raw/processed/2026-10-27/ai-security-wiki-topic-news-collector-2026-10-27T232925Z.json)
- [CVE-2026-110474](https://cveawg.mitre.org/api/cve/CVE-2026-110474)
- [CERT-In CIVN-2026-0523](https://www.cert-in.org.in/s2cMainServlet?pageid=PUBVLNOTES01&VLCODE=CIVN-2026-0523)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [data and privacy](index.md)
- [identity and access](../identity-and-access/index.md)

## Open Questions

- Which key rotation and API authorization guidance does CERT-In provide for deployments upgraded to 2.0.0 or later?
- Does the exposed key permit access across tenants or only to the caller's expected records?

## Maintenance Notes

- Created on 2026-10-27 from the collector; retain product catalog context upstream and recheck the national advisory for remediation detail.
