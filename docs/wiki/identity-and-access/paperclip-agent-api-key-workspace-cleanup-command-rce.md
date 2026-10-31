---
type: "Topic"
title: "Paperclip Agent API-Key Workspace Cleanup Command RCE"
description: "Security analysis for CVE-2026-119713 delegated lifecycle hook authority."
tags: ["identity-and-access", "agent-and-tool-security"]
---

# Paperclip Agent API-Key Workspace Cleanup Command RCE

## Current Understanding

The [October 30 collector](../../../raw/processed/2026-10-30/ai-security-wiki-topic-news-collector-2026-10-30T232632Z.json) records [CVE-2026-119713](https://nvd.nist.gov/vuln/detail/CVE-2026-119713): Paperclip 2026.403.0 before 2026.416.0 lets agent API-key holders set shell-executed `cleanupCommand` and `teardownCommand` workspace fields.

## Security Impact

- Threat: delegated agent credentials authorize server-host command execution during archive lifecycle processing.
- Affected boundary: Paperclip 2026.403.0 before 2026.416.0, agent API keys, workspace patching, and lifecycle hooks.
- Exploit or incident status: public CVE; no confirmed exploitation incident is recorded locally.
- Mitigation state: upgrade to 2026.416.0 or later and scope or rotate keys that can patch workspaces.
- Confidence and residual risk: high for the boundary; lifecycle command fields should not be client-controlled.

## Authoritative Sources

- [October 30 collector](../../../raw/processed/2026-10-30/ai-security-wiki-topic-news-collector-2026-10-30T232632Z.json)
- [NVD CVE-2026-119713](https://nvd.nist.gov/vuln/detail/CVE-2026-119713)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)

## Open Questions

- Can existing API keys still modify legacy lifecycle command fields after upgrade?

## Maintenance Notes

- Created on 2026-10-30 from NVD-backed collector evidence.
