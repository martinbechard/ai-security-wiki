---
type: "Topic"
title: "OpenBMB Internet of Agents Agent-Registration Authentication"
description: "Security analysis for CVE-2026-123963 missing authentication during Internet of Agents registration."
tags: ["identity-and-access", "agent-and-tool-security"]
---

# OpenBMB Internet of Agents Agent-Registration Authentication

## Current Understanding

The [November 9 collector source](../../../raw/processed/2026-11-09/ai-security-wiki-topic-news-collector-2026-11-09T003426Z.json) records [CVE-2026-123963](https://nvd.nist.gov/vuln/detail/CVE-2026-123963) affecting OpenBMB Internet of Agents through commit `9d78e88e47160eb42ee1ee8538c05e1c2c47877a`. Agent registration through `desc` and `name` lacks authentication. Framework background belongs upstream; this page owns the agent-enrollment authentication boundary.

## Security Impact

- Threat: a remote actor can register an agent without the authentication expected for the registry boundary.
- Affected boundary: Internet of Agents agent registration through `desc` and `name` in the disclosed commit scope.
- Exploit or incident status: public NVD record linked to an upstream issue; no active exploitation or local incident is established.
- Mitigation state: no unaffected release is established; prevent public registry exposure and require authenticated, authorized enrollment until a maintainer fix is verified.
- Confidence: medium-high for the registration boundary and missing-authentication finding; medium for remediation state.
- Residual risk: registry enrollment can create a trust anchor for later multi-agent operations, so authentication alone should be paired with identity and capability validation.

## Authoritative Sources

- [November 9 collector source](../../../raw/processed/2026-11-09/ai-security-wiki-topic-news-collector-2026-11-09T003426Z.json)
- [NVD CVE-2026-123963](https://nvd.nist.gov/vuln/detail/CVE-2026-123963)
- [OpenBMB issue 21](https://github.com/OpenBMB/IoA/issues/21)

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

- Has OpenBMB published an unaffected revision or release for CVE-2026-123963?

## Maintenance Notes

- Created on 2026-11-09; the linked issue was unresolved in retained source evidence.
