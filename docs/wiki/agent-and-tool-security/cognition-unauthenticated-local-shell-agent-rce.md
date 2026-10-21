---
type: "Topic"
title: "Cognition Unauthenticated Local-Shell Agent RCE"
description: "Security analysis for CVE-2026-109437 unauthenticated Cognition agent sessions reaching local shell execution."
tags: ["agent-and-tool-security", "identity-and-access"]
---

# Cognition Unauthenticated Local-Shell Agent RCE

## Current Understanding

[CVE-2026-109437](https://nvd.nist.gov/vuln/detail/CVE-2026-109437) reports that Cognition before 0.13.0 exposes an unauthenticated REST/SSE session API while defaulting its agent sandbox backend to local execution. The [October 19 late collector](../../../raw/processed/2026-10-19/ai-security-wiki-topic-news-collector-2026-10-19T193149-0400.json) records that a remote actor can create a session and direct the [Deep Agents](../../../upstream-ai-wiki/agentic-frameworks/deep-agents.md) ReAct loop to run shell commands as the server process.

## Security Impact

- Threat: unauthenticated callers can use agent sessions to obtain server-process shell execution.
- Affected boundary: Cognition before 0.13.0 REST/SSE session APIs and default local-shell agent backend.
- Exploit or incident status: public CVE and [0.13.0 release](https://github.com/CognicellAI/Cognition/releases/tag/v0.13.0); active exploitation is not identified.
- Mitigation state: upgrade to 0.13.0 or later, require authentication at session ingress, and avoid local execution defaults for exposed services.
- Confidence: high for affected versions and execution boundary.
- Residual risk: authenticated prompt paths can still reach high-risk tools without narrow tool policy and sandboxing.

## Authoritative Sources

- [October 19 late collector source](../../../raw/processed/2026-10-19/ai-security-wiki-topic-news-collector-2026-10-19T193149-0400.json)
- [October 20 leaf watch](../../../raw/processed/2026-10-20/ai-security-wiki-leaf-update-watch-20261021T000613Z.json)
- [CVE-2026-109437](https://nvd.nist.gov/vuln/detail/CVE-2026-109437)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [identity and access](../identity-and-access/index.md)

## Open Questions

- Does 0.13.0 change both authentication and the local backend default?

## Maintenance Notes

- Created on 2026-10-20 from the October 19 late collector.
- Rechecked on 2026-10-20; the affected session and local-shell boundary remains unchanged.
