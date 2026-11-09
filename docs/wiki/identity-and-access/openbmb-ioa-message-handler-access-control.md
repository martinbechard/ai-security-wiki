---
type: "Topic"
title: "OpenBMB Internet of Agents Message-Handler Access Control"
description: "Security analysis for CVE-2026-123881 improper access control through an Internet of Agents comm_id."
tags: ["identity-and-access", "agent-and-tool-security"]
---

# OpenBMB Internet of Agents Message-Handler Access Control

## Current Understanding

The [November 9 collector source](../../../raw/processed/2026-11-09/ai-security-wiki-topic-news-collector-2026-11-09T003426Z.json) records [CVE-2026-123881](https://nvd.nist.gov/vuln/detail/CVE-2026-123881) affecting OpenBMB Internet of Agents through commit `9d78e88e47160eb42ee1ee8538c05e1c2c47877a`. The `im_server/app.py` message handler's `comm_id` handling permits remote improper access control. Framework background belongs upstream; this page owns the multi-agent message-record authorization boundary.

## Security Impact

- Threat: a remote actor can improperly access message-handling resources through a communication identifier boundary.
- Affected boundary: Internet of Agents `im_server/app.py` message handling through the disclosed commit.
- Exploit or incident status: public NVD record linked to an upstream issue; no active exploitation or local incident is established.
- Mitigation state: no unaffected release is established; limit network exposure and authenticate and authorize message identifiers until a maintainer fix is verified.
- Confidence: medium-high for the affected component and access-control effect; medium for remediation state.
- Residual risk: agent-message identifiers must not function as authority without server-side principal and tenant checks.

## Authoritative Sources

- [November 9 collector source](../../../raw/processed/2026-11-09/ai-security-wiki-topic-news-collector-2026-11-09T003426Z.json)
- [NVD CVE-2026-123881](https://nvd.nist.gov/vuln/detail/CVE-2026-123881)
- [OpenBMB issue 20](https://github.com/OpenBMB/IoA/issues/20)

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

- Has OpenBMB published an unaffected revision or release for CVE-2026-123881?

## Maintenance Notes

- Created on 2026-11-09; the linked issue was unresolved in retained source evidence.
