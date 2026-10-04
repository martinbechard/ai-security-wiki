---
type: "Topic"
title: "SupportCandy AI Customer Support Stored XSS"
description: "Security analysis for CVE-2026-94378 stored XSS in the SupportCandy AI customer-support WordPress plugin."
tags: ["data-and-privacy", "identity-and-access"]
---

# SupportCandy AI Customer Support Stored XSS

## Current Understanding

The [October 3 topic collector source](../../../raw/processed/2026-10-03/ai-security-wiki-topic-news-collector-2026-10-03T233152Z.json) records [CVE-2026-94378](https://cveawg.mitre.org/api/cve/CVE-2026-94378) for SupportCandy - AI Customer Support Ticket System & Live Chatbot Agent. Broad WordPress plugin catalog context belongs upstream if needed; this page owns the local AI helpdesk stored-content and agent-facing UI contamination risk.

The CVE record says SupportCandy through 3.5.3 is vulnerable to authenticated stored cross-site scripting through the `name` parameter because of insufficient input sanitization and output escaping. The issue requires subscriber-level access or above and the default-disabled "Register user if not exists" setting state described in the CVE record.

## Security Impact

- Threat: lower-privilege users can inject scripts into support pages that execute when another user views the affected page.
- Affected boundary: SupportCandy AI Customer Support Ticket System & Live Chatbot Agent through 3.5.3; customer and agent display-name fields; support UI rendering; WordPress subscriber-level access.
- Exploit or incident status: public CVE, NVD, Wordfence, and WordPress plugin changeset references; no confirmed exploitation incident is recorded locally.
- Mitigation state: update beyond the affected range when a fixed plugin release is confirmed, sanitize user-controlled ticket/customer names, escape support UI output, and review support users for suspicious stored content.
- Confidence: high for affected range and stored-XSS class from CVE Services and Wordfence; medium for first fixed release because the captured evidence references a changeset but not a release tag.
- Residual risk: AI support plugins surface user-provided customer context to support agents, so stored XSS can compromise agent sessions or contaminate agent-facing workflows even when the entry point looks like ordinary profile metadata.

## Authoritative Sources

- [October 3 topic collector source](../../../raw/processed/2026-10-03/ai-security-wiki-topic-news-collector-2026-10-03T233152Z.json)
- [CVE-2026-94378 record](https://cveawg.mitre.org/api/cve/CVE-2026-94378)
- [NVD CVE-2026-94378](https://nvd.nist.gov/vuln/detail/CVE-2026-94378)
- [Wordfence CVE-2026-94378 advisory](https://www.wordfence.com/threat-intel/vulnerabilities/id/9703fa76-fd73-4cd8-aa41-8adcb55190be?source=cve)
- [SupportCandy customer-field changeset](https://plugins.trac.wordpress.org/changeset/3718257/supportcandy/trunk/includes/custom-field-types/class-wpsc-df-customer.php)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [data and privacy](index.md)
- [identity and access](../identity-and-access/index.md)
- [SupportCandy AI Customer Support SQL injection](supportcandy-ai-customer-support-sql-injection.md)
- [Support Genix AI Chatbot admin takeover](../identity-and-access/support-genix-ai-chatbot-admin-takeover.md)

## Open Questions

- Which SupportCandy release first includes the CVE-2026-94378 fix, and does it change all support UI render paths for customer and agent names?

## Maintenance Notes

- Created on 2026-10-04 from the [October 3 topic collector source](../../../raw/processed/2026-10-03/ai-security-wiki-topic-news-collector-2026-10-03T233152Z.json) after verifier correction split the stored-XSS boundary from the SupportCandy SQL-injection boundary.
