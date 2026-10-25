---
type: "Topic"
title: "Unitree Go2 Chat Command and TLS Controls"
description: "Security analysis for CVE-2026-115995 and CVE-2026-115996 embodied assistant command and transport failures."
tags: ["agent-and-tool-security", "identity-and-access"]
---

# Unitree Go2 Chat Command and TLS Controls

## Current Understanding

The [October 24 collector](../../../raw/processed/2026-10-24/ai-security-wiki-topic-news-collector-2026-10-24T232700Z.json) records [CVE-2026-115995](https://nvd.nist.gov/vuln/detail/CVE-2026-115995) command injection through `gpt_thread.py` `set_volume` and [CVE-2026-115996](https://nvd.nist.gov/vuln/detail/CVE-2026-115996) improper WebSocket certificate validation in Unitree Go2 `chat_go`. Robotics catalog context belongs upstream; this page retains the coupled remote-command and transport-authentication boundary.

## Security Impact

- Threat: remote inputs execute OS commands or an on-path attacker alters robot-assistant traffic.
- Affected boundary: `chat_go` through 1.1.11.4 for command injection, fixed in 1.1.11.5; TLS fix versions vary by Go2 branch.
- Exploit or incident status: vendor-confirmed internal-ticket references; no local exploitation or incident is recorded.
- Mitigation state: upgrade command handling to 1.1.11.5 and confirm the exact TLS fix for each deployed firmware branch.
- Confidence: medium because branch-specific TLS remediation is not yet reconciled with vendor release notes.
- Residual risk: embodied assistant software bridges remote model or network inputs to physical-control software.

## Authoritative Sources

- [October 24 collector](../../../raw/processed/2026-10-24/ai-security-wiki-topic-news-collector-2026-10-24T232700Z.json)
- [CVE-2026-115995](https://nvd.nist.gov/vuln/detail/CVE-2026-115995)
- [CVE-2026-115996](https://nvd.nist.gov/vuln/detail/CVE-2026-115996)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)

## Open Questions

- Which vendor release notes map the TLS fix to each Go2 firmware branch?

## Maintenance Notes

- Created on 2026-10-24 as an embodied-assistant control family with explicit version uncertainty.
