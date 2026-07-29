---
type: "Topic"
title: "Generative AI Safe-Use Advisory Controls"
description: "Security governance lens for public advisories on sensitive data, third-party GenAI app permissions, and output verification."
---

# Generative AI Safe-Use Advisory Controls

## Current Understanding

The [July 28 topic news collector source](../../../raw/processed/2026-07-28/ai-security-wiki-topic-news-collector-2026-07-28T193213-0400.json) records Singapore Cyber Security Agency and Infocomm Media Development Authority [Advisory AD-2026-008](https://www.csa.gov.sg/alerts-and-advisories/advisories/ad-2026-008/) on safe and secure use of generative AI. The advisory treats these as concrete security practices:

- Sensitive-data entry controls.
- Output verification.
- Third-party GenAI app permission review.
- Secure configuration.
- Organizational controls.

This page owns the security-governance lens. Broad generative AI background belongs upstream; locally, public advisories are useful when they turn usage norms into control expectations for data handling, connector permissions, and human verification.

## Security Impact

- Threat or control area: users can disclose sensitive or personal data, grant excessive third-party GenAI app permissions, or act on unverified outputs in security-relevant workflows.
- Affected boundary: generative AI users, organization-managed GenAI use, third-party GenAI applications, data-entry permissions, and output-dependent decisions.
- Exploit or incident status: official government advisory; no specific exploit or breach is reported in the source.
- Mitigation state:
  - Restrict sensitive-data entry to permitted tools.
  - Review third-party app permissions.
  - Verify AI outputs before action.
  - Require secure organizational configuration and use policies.
- Confidence: high for advisory date and control themes from the primary government source.
- Residual risk: advisory-level controls need mapping to local approved tools, data classes, connector scopes, and review gates before they become enforceable operating policy.

## Authoritative Sources

- [July 28 topic news collector source](../../../raw/processed/2026-07-28/ai-security-wiki-topic-news-collector-2026-07-28T193213-0400.json)
- Singapore CSA/IMDA advisory: https://www.csa.gov.sg/alerts-and-advisories/advisories/ad-2026-008/

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [governance and compliance](index.md)
- [ATO-approved sensitive data use](../data-and-privacy/ato-approved-sensitive-data-use.md)
- [AI agent collaboration DLP controls](../data-and-privacy/ai-agent-collaboration-dlp-controls.md)
- [identity and access](../identity-and-access/index.md)

## Open Questions

- Which local data classes, GenAI tools, and third-party app permission scopes should be mapped to advisory-level safe-use controls?

## Maintenance Notes

- Added from the [July 28 topic news collector source](../../../raw/processed/2026-07-28/ai-security-wiki-topic-news-collector-2026-07-28T193213-0400.json); keep this page focused on security controls rather than general GenAI usage advice.
