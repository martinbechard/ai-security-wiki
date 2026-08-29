---
type: "Topic"
title: "FastGPT WeChat outLink auth bypass"
description: "Security analysis for CVE-2026-68929 FastGPT WeChat outLink unauthenticated cross-tenant bot credential mutation."
tags: ["identity-and-access", "agent-and-tool-security"]
---

# FastGPT WeChat outLink auth bypass

## Current Understanding

The [August 28 topic collector source](../../../raw/processed/2026-08-28/ai-security-wiki-topic-news-collector-2026-08-28T233139Z.json) records [CVE-2026-68929](https://nvd.nist.gov/vuln/detail/CVE-2026-68929) for FastGPT before v4.15.2. Broad FastGPT product and channel-integration practice belongs upstream; this page owns the local tenant authorization and bot-credential integrity boundary.

## Security Impact

- Threat: unauthenticated callers can use public shareId values against WeChat iLink share-channel endpoints to wipe a victim team's bot token or bind the victim outLink to an attacker-controlled WeChat bot.
- Affected boundary: FastGPT before v4.15.2 WeChat outLink bot credential mutation paths.
- Exploit or incident status: public NVD and GitHub advisory evidence; no local in-the-wild exploitation evidence is recorded.
- Mitigation state: update to v4.15.2 or later, require tenant-scoped authorization before channel binding or bot-token writes, and treat public share identifiers as routing hints rather than write authority.
- Confidence: high for advisory existence, affected boundary, and fixed version.
- Residual risk: AI application channel integrations can silently redirect user conversations or workflows when bot credential writes are authorized by share links rather than tenant identity.

## Authoritative Sources

- [August 28 topic collector source](../../../raw/processed/2026-08-28/ai-security-wiki-topic-news-collector-2026-08-28T233139Z.json)
- [NVD CVE-2026-68929](https://nvd.nist.gov/vuln/detail/CVE-2026-68929)
- [GitHub security advisory](https://github.com/labring/FastGPT/security/advisories/GHSA-q4pr-3qpg-9q5v)
- [GitHub commit](https://github.com/labring/FastGPT/commit/81d391995b1f9989455267448872ff88bb1f42c9)

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

- Which FastGPT audit events show attempted or successful WeChat outLink bot-token mutation?

## Maintenance Notes

- Created on 2026-08-29 from the [August 28 topic collector](../../../raw/processed/2026-08-28/ai-security-wiki-topic-news-collector-2026-08-28T233139Z.json) as a tenant-scoped AI channel integration authorization leaf.
