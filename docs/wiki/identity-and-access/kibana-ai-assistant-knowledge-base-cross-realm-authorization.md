---
type: "Topic"
title: "Kibana AI Assistant Knowledge Base Cross-Realm Authorization"
description: "Security analysis for CVE-2026-78606 cross-realm username collision in Elastic AI Assistant Knowledge Base entries."
tags: ["identity-and-access", "data-and-privacy"]
---

# Kibana AI Assistant Knowledge Base Cross-Realm Authorization

## Current Understanding

The [September 1 topic collector source](../../../raw/processed/2026-09-01/ai-security-wiki-topic-news-collector-2026-09-01T233307Z.json) records [CVE-2026-78606](https://nvd.nist.gov/vuln/detail/CVE-2026-78606) for Kibana Elastic AI Assistant Knowledge Base authorization. Broad Elastic product coverage belongs upstream; this page owns the local assistant-memory ownership and principal-binding boundary.

NVD says two authenticated principals from different authentication realms with the same username can read, modify, and delete each other's private Elastic AI Assistant Knowledge Base entries. This is distinct from conversation IDOR: the affected object is the assistant knowledge base, and the failed authority key is username-only matching across realms.

## Security Impact

- Threat: assistant knowledge and memory entries can cross users when identity matching ignores realm or issuer.
- Affected boundary: Kibana Elastic AI Assistant Knowledge Base in multi-realm authentication configurations with duplicate usernames.
- Exploit or incident status: public NVD vulnerability record; no local exploitation evidence is recorded.
- Mitigation state: fixed-version details need Elastic advisory reconciliation; bind assistant knowledge entries to stable principal identifiers that include realm or issuer.
- Confidence: high for CVE identity and affected boundary from NVD; medium for remediation until Elastic advisory evidence is captured.
- Residual risk: assistant memory stores often contain investigation context, prompts, sensitive system notes, and operational data.

## Control Implications

- Authorize assistant memory and knowledge entries by stable subject identifiers, not display names or usernames alone.
- Include realm, issuer, tenant, and space in private assistant-memory ACL checks.
- Regression-test same-username principals across identity realms.

## Authoritative Sources

- [September 1 topic collector source](../../../raw/processed/2026-09-01/ai-security-wiki-topic-news-collector-2026-09-01T233307Z.json)
- [NVD CVE-2026-78606](https://nvd.nist.gov/vuln/detail/CVE-2026-78606)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [Kibana AI Assistant conversation ownership bypass](kibana-ai-assistant-conversation-ownership-bypass.md)
- [Agent synthetic insider risk](agent-synthetic-insider-risk.md)

## Open Questions

- Which Elastic advisory maps CVE-2026-78606 to affected and fixed Kibana versions?

## Maintenance Notes

- Created on 2026-09-01 from the [September 1 topic collector](../../../raw/processed/2026-09-01/ai-security-wiki-topic-news-collector-2026-09-01T233307Z.json) as an assistant knowledge-base authorization leaf.
