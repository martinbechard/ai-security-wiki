---
type: "Topic"
title: "Abilityai Trinity Telegram Binding Authorization Bypass"
description: "Security analysis for CVE-2026-108756 Abilityai Trinity MCP API keys performing human-only Telegram binding operations."
tags: ["identity-and-access", "agent-and-tool-security"]
---

# Abilityai Trinity Telegram Binding Authorization Bypass

## Current Understanding

The [October 11 topic collector source](../../../raw/processed/2026-10-11/ai-security-wiki-topic-news-collector-2026-10-11T233138Z.json) records [CVE-2026-108756](https://nvd.nist.gov/vuln/detail/CVE-2026-108756) for Abilityai Trinity through 0.9.5. Broad Abilityai Trinity and Telegram bot workflow context belongs upstream; this page owns the local human-only action and agent-scoped API-key boundary.

The CVE evidence says agent-scoped MCP API keys can perform Telegram binding operations intended for humans. The affected operations include sending through the owner's bot token, replacing the binding, or deleting it.

## Security Impact

- Threat: delegated agent credentials can perform owner-level messaging and binding-management actions.
- Affected boundary: Abilityai Trinity through 0.9.5, Telegram router, MCP API keys, owner bot token, binding replace/delete/send operations, and human-only approval boundaries.
- Exploit or incident status: public NVD and CVE Services records; no confirmed exploitation incident is recorded locally.
- Mitigation state: separate agent-scoped keys from human binding administration, require owner confirmation for binding changes, and audit Telegram sends made through agent keys.
- Confidence: high for affected range and authorization-boundary description from CVE evidence.
- Residual risk: integrations that use one token for both agent execution and human administration can erase approval boundaries.

## Authoritative Sources

- [October 11 topic collector source](../../../raw/processed/2026-10-11/ai-security-wiki-topic-news-collector-2026-10-11T233138Z.json)
- [NVD CVE-2026-108756](https://nvd.nist.gov/vuln/detail/CVE-2026-108756)
- [CVE-2026-108756 record](https://cveawg.mitre.org/api/cve/CVE-2026-108756)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [agent synthetic insider risk](agent-synthetic-insider-risk.md)
- [approval metadata access control](../agent-and-tool-security/approval-metadata-access-control.md)

## Open Questions

- Which Trinity release first prevents MCP API keys from managing Telegram owner bindings?

## Maintenance Notes

- Created on 2026-10-12 from the [October 11 topic collector source](../../../raw/processed/2026-10-11/ai-security-wiki-topic-news-collector-2026-10-11T233138Z.json).
