---
type: "Topic"
title: "HAVELSAN Sef AI Chatbot Platform Advisory Cluster"
description: "Security analysis for the October 2026 Sef AI Chatbot Platform authorization, TLS, SSRF, and SQL injection CVE cluster."
tags: ["agent-and-tool-security", "identity-and-access", "infrastructure-and-supply-chain"]
---

# HAVELSAN Sef AI Chatbot Platform Advisory Cluster

## Current Understanding

The [October 2 topic collector source](../../../raw/processed/2026-10-02/ai-security-wiki-topic-news-collector-2026-10-02T233227Z.json) records a same-product, same-version CVE cluster for HAVELSAN Inc. Sef - AI Chatbot Platform before 2.1. Broad HAVELSAN and Sef product context belongs upstream if needed; this page owns the local chatbot-platform security boundary.

The cluster covers four same-boundary records:

- [CVE-2026-80337](https://cveawg.mitre.org/api/cve/CVE-2026-80337): missing authorization for functionality not properly constrained by ACLs.
- [CVE-2026-80443](https://cveawg.mitre.org/api/cve/CVE-2026-80443): improper certificate validation that can permit adversary-in-the-middle attack paths.
- [CVE-2026-80464](https://cveawg.mitre.org/api/cve/CVE-2026-80464): server-side request forgery in platform request handling.
- [CVE-2026-80298](https://cveawg.mitre.org/api/cve/CVE-2026-80298): SQL injection in product data-access paths.

The CVE records cite the Turkish National Cyber Incident Response Center advisory. The processed collector also recorded NVD wording that the vendor was contacted and the product is not supported.

## Security Impact

- Threat: one AI chatbot platform boundary exposes multiple independently meaningful failure modes across tool authorization, API-runner transport trust, server-side network reachability, and query construction.
- Affected boundary: HAVELSAN Inc. Sef - AI Chatbot Platform before 2.1, cross-chatbot or API-tool authorization, TLS certificate validation, server-side request dispatch, and SQL execution paths.
- Exploit or incident status: public CVE records and government-resource reference; no confirmed exploitation incident is recorded locally.
- Mitigation state: treat unsupported deployments before 2.1 as high-risk; require replacement, compensating isolation, egress controls, database least privilege, and explicit tool authorization rather than relying on vendor maintenance.
- Confidence: high for affected product and vulnerability classes from CVE Services; medium for remediation detail because the local ingest did not capture more granular vendor patch notes beyond unsupported-product wording.
- Residual risk: unsupported chatbot platforms can retain privileged connector and data-access paths even after the public CVE disclosure, so decommissioning and containment evidence matter more than ordinary patch tracking.

## Authoritative Sources

- [October 2 topic collector source](../../../raw/processed/2026-10-02/ai-security-wiki-topic-news-collector-2026-10-02T233227Z.json)
- [CVE-2026-80337 record](https://cveawg.mitre.org/api/cve/CVE-2026-80337)
- [CVE-2026-80443 record](https://cveawg.mitre.org/api/cve/CVE-2026-80443)
- [CVE-2026-80464 record](https://cveawg.mitre.org/api/cve/CVE-2026-80464)
- [CVE-2026-80298 record](https://cveawg.mitre.org/api/cve/CVE-2026-80298)
- [NVD CVE-2026-80337](https://nvd.nist.gov/vuln/detail/CVE-2026-80337)
- [NVD CVE-2026-80443](https://nvd.nist.gov/vuln/detail/CVE-2026-80443)
- [NVD CVE-2026-80464](https://nvd.nist.gov/vuln/detail/CVE-2026-80464)
- [NVD CVE-2026-80298](https://nvd.nist.gov/vuln/detail/CVE-2026-80298)
- [Turkish National Cyber Incident Response Center TR-26-1241](https://siberguvenlik.gov.tr/guvenlik-bildirimleri/detay/tr-26-1241)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [identity and access](../identity-and-access/index.md)
- [infrastructure and supply chain](../infrastructure-and-supply-chain/index.md)
- Upstream AI wiki owns broad HAVELSAN and Sef product context if durable entity coverage is needed.

## Open Questions

- Does the Turkish National Cyber Incident Response Center advisory identify compensating controls or deployment guidance for unsupported Sef AI Chatbot Platform instances before 2.1?

## Maintenance Notes

- Created on 2026-10-03 from the [October 2 topic collector source](../../../raw/processed/2026-10-02/ai-security-wiki-topic-news-collector-2026-10-02T233227Z.json) as a closely coupled same-product advisory family rather than four unrelated digest-batch entries.
