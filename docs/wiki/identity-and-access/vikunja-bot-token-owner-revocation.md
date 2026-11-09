---
type: "Topic"
title: "Vikunja Bot-Token Owner Revocation"
description: "Security analysis for CVE-2026-123493, where disabling a human owner does not revoke its bot API tokens."
tags: ["identity-and-access", "agent-and-tool-security"]
---

# Vikunja Bot-Token Owner Revocation

## Current Understanding

The [November 9 collector source](../../../raw/processed/2026-11-09/ai-security-wiki-topic-news-collector-2026-11-09T003426Z.json) records NVD CVE-2026-123493 alongside [GHSA-5fc2-w2j4-6r8w](https://github.com/go-vikunja/vikunja/security/advisories/GHSA-5fc2-w2j4-6r8w). The advisory itself lists no CVE ID, so this mapping is retained as a source-identifier conflict rather than a confirmed alias. Vikunja 2.4.0 through 2.7.0 validates a bot token against the bot status but not its disabled or locked human owner, so a previously minted token can retain HTTP API, CalDAV, MCP, and feed access. Broad Vikunja product coverage belongs upstream; this page owns the delegated-authority revocation boundary.

## Security Impact

- Threat: a holder of a pre-existing bot token can retain delegated project access after the human principal is disabled or locked.
- Affected boundary: bot-owned API-token validation across Vikunja API, CalDAV, MCP, and feeds in 2.4.0 through 2.7.0.
- Exploit or incident status: public advisory with a reproducible demonstration; no active exploitation or local incident is established.
- Mitigation state: upgrade to 2.7.1; the advisory says owner status is checked at authentication time, so existing bot tokens stop authenticating while the owner is disabled and can work again if the owner is re-enabled. Audit bot-token ownership and rotate tokens after suspected compromise according to local risk policy.
- Confidence: high for the affected range, impact, and fixed version from the maintainer advisory.
- Residual risk: a valid bot token still conveys its granted project authority, so account lifecycle controls must remain coupled to token lifecycle review.

## Authoritative Sources

- [November 9 collector source](../../../raw/processed/2026-11-09/ai-security-wiki-topic-news-collector-2026-11-09T003426Z.json)
- [GHSA-5fc2-w2j4-6r8w](https://github.com/go-vikunja/vikunja/security/advisories/GHSA-5fc2-w2j4-6r8w)
- [NVD CVE-2026-123493](https://nvd.nist.gov/vuln/detail/CVE-2026-123493)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [agent and tool security](../agent-and-tool-security/index.md)

## Open Questions

- Why does NVD associate CVE-2026-123493 with GHSA-5fc2-w2j4-6r8w when the maintainer advisory lists no CVE ID?

## Maintenance Notes

- Created on 2026-11-09 from the NVD-timed collector source; the maintainer advisory confirms the 2.7.1 patch boundary.
