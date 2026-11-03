---
type: Topic
title: LaraDashboard MCP Send-Email Authorization Bypass
description: A read-only LaraDashboard permission can be amplified into arbitrary MCP email sending.
tags: [identity-and-access]
---

# LaraDashboard MCP Send-Email Authorization Bypass

## Current Understanding

[CVE-2026-120450](https://nvd.nist.gov/vuln/detail/CVE-2026-120450) concerns LaraDashboard's MCP `SendEmailTool`: a user with only `email_template.view` can mint an MCP token and send arbitrary HTML email to arbitrary recipients. Tool tokens must bind individually granted capabilities to each high-impact action rather than treating broad MCP access as sufficient authorization.

No exploitation is reported. Confidence is medium because NVD identifies 1.4.0-before-1.4.9 while the linked GitHub advisory names 1.4.2 and no patched release; the version discrepancy is unresolved.

- Mitigation state: deny email-send capability unless explicitly granted and verify the effective fixed release before relying on an upgrade.
- Residual risk: read-only users can become phishing relays wherever token issuance remains broader than action authorization.

## Authoritative Sources

- [November 3 collector source](../../../raw/processed/2026-11-03/ai-security-wiki-topic-news-collector-2026-11-03T002828Z.json)
- [NVD CVE-2026-120450](https://nvd.nist.gov/vuln/detail/CVE-2026-120450)
- [GitHub advisory GHSA-gjfv-h634-pxpv](https://github.com/laradashboard/laradashboard/security/advisories/GHSA-gjfv-h634-pxpv)
- [LaraDashboard 1.4.9 release](https://github.com/laradashboard/laradashboard/releases/tag/v1.4.9)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [LaraDashboard AI provider key settings API exposure](../data-and-privacy/laradashboard-ai-provider-key-settings-api-exposure.md)

## Open Questions

- Which release first fixes the permission-to-action binding, and why do NVD and GitHub report different version framing?

## Maintenance Notes

- Created on 2026-11-03. Product background remains upstream-owned; this page owns the local least-privilege and phishing-relay implication.
