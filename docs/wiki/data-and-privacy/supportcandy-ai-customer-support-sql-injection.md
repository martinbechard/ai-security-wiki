---
type: "Topic"
title: "SupportCandy AI Customer Support SQL Injection"
description: "Security analysis for CVE-2026-94539 time-based SQL injection in the SupportCandy AI customer-support WordPress plugin."
tags: ["data-and-privacy", "identity-and-access"]
---

# SupportCandy AI Customer Support SQL Injection

## Current Understanding

The [October 3 topic collector source](../../../raw/processed/2026-10-03/ai-security-wiki-topic-news-collector-2026-10-03T233152Z.json) records [CVE-2026-94539](https://cveawg.mitre.org/api/cve/CVE-2026-94539) for SupportCandy - AI Customer Support Ticket System & Live Chatbot Agent. Broad WordPress plugin catalog context belongs upstream if needed; this page owns the local AI helpdesk database-query and ticket-list sorting boundary.

The CVE record says SupportCandy through 3.5.3 is vulnerable to authenticated time-based SQL injection through the `sort_by` parameter because user-supplied input was insufficiently escaped and the existing SQL query was not sufficiently prepared. Exploitation requires both a WordPress subscriber-level role or higher and a SupportCandy Agent account with Assign Agents permission.

The [October 4 leaf update watch source](../../../raw/processed/2026-10-04/ai-security-wiki-leaf-update-watch-20261005T000246Z.json) adds direct CVE Services publication/update evidence and records Wordfence fixed-version evidence for 3.5.4. That corroborates the existing leaf; it does not create a separate digest item.

## Security Impact

- Threat: an attacker with limited site and SupportCandy agent authority can append SQL into existing ticket-list queries and extract sensitive database information.
- Affected boundary: SupportCandy AI Customer Support Ticket System & Live Chatbot Agent through 3.5.3; ticket list sorting; `sort_by`; SupportCandy Agent Assign Agents permission; WordPress database records reachable through the vulnerable query.
- Exploit or incident status: public CVE, NVD, Wordfence, and WordPress plugin changeset references; no confirmed exploitation incident is recorded locally.
- Mitigation state: update to SupportCandy 3.5.4 or later, prepare and allow-list ticket sorting parameters, and restrict Assign Agents permission to trusted support operators.
- Confidence: high for affected range, attacker prerequisites, SQL-injection class, and fixed-version evidence from CVE Services and Wordfence.
- Residual risk: AI customer-support systems usually retain private customer conversations and support metadata, so query-construction flaws in agent views can become broad support-data confidentiality issues.

## Authoritative Sources

- [October 3 topic collector source](../../../raw/processed/2026-10-03/ai-security-wiki-topic-news-collector-2026-10-03T233152Z.json)
- [October 4 leaf update watch source](../../../raw/processed/2026-10-04/ai-security-wiki-leaf-update-watch-20261005T000246Z.json)
- [CVE-2026-94539 record](https://cveawg.mitre.org/api/cve/CVE-2026-94539)
- [NVD CVE-2026-94539](https://nvd.nist.gov/vuln/detail/CVE-2026-94539)
- [Wordfence CVE-2026-94539 advisory](https://www.wordfence.com/threat-intel/vulnerabilities/id/9c105a36-452e-4fa7-9c8b-f142e1eb27aa?source=cve)
- [SupportCandy agent-model changeset](https://plugins.trac.wordpress.org/changeset/3718257/supportcandy/trunk/includes/models/class-wpsc-agent.php)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [data and privacy](index.md)
- [identity and access](../identity-and-access/index.md)
- [SupportCandy AI Customer Support stored XSS](supportcandy-ai-customer-support-stored-xss.md)
- [Better Messages AI Chatbot authorization cluster](../identity-and-access/better-messages-ai-chatbot-authorization-cluster.md)

## Open Questions

- Does the CVE-2026-94539 fix restrict `sort_by` to a server-owned allow-list across all ticket-list routes?

## Maintenance Notes

- Created on 2026-10-04 from the [October 3 topic collector source](../../../raw/processed/2026-10-03/ai-security-wiki-topic-news-collector-2026-10-03T233152Z.json) after verifier correction split the SQL-injection boundary from the SupportCandy stored-XSS boundary.
- Updated on 2026-10-05 from the [October 4 leaf update watch source](../../../raw/processed/2026-10-04/ai-security-wiki-leaf-update-watch-20261005T000246Z.json) with CVE Services publication/update evidence and Wordfence fixed-version provenance; no duplicate digest item was needed.
