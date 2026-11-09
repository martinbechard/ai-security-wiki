---
type: "Topic"
title: "OpenBMB Internet of Agents Collaboration max_turns Denial of Service"
description: "Security analysis for CVE-2026-123964 unbounded Internet of Agents collaboration-loop turns."
tags: ["agent-and-tool-security"]
---

# OpenBMB Internet of Agents Collaboration max_turns Denial of Service

## Current Understanding

The [November 9 collector source](../../../raw/processed/2026-11-09/ai-security-wiki-topic-news-collector-2026-11-09T003426Z.json) records [CVE-2026-123964](https://nvd.nist.gov/vuln/detail/CVE-2026-123964) affecting OpenBMB Internet of Agents through commit `9d78e88e47160eb42ee1ee8538c05e1c2c47877a`. The collaboration-layer `launch_goal` handling of `max_turns` permits a remote infinite-loop denial of service. Framework background belongs upstream; this page owns the autonomous-loop resource-control boundary.

## Security Impact

- Threat: a remote request can cause an unbounded multi-agent collaboration loop and consume service resources.
- Affected boundary: Internet of Agents collaboration-layer `launch_goal` and `max_turns` handling through the disclosed commit.
- Exploit or incident status: public NVD record linked to an upstream issue; no active exploitation or local incident is established.
- Mitigation state: no unaffected release is established; enforce server-side maximum turns, deadlines, and cancellation controls, and restrict who can start collaboration goals.
- Confidence: medium-high for the disclosed loop boundary and denial-of-service effect; medium for remediation state.
- Residual risk: configured turn limits alone do not bound token, tool, or downstream-service consumption without independent budgets and cancellation.

## Authoritative Sources

- [November 9 collector source](../../../raw/processed/2026-11-09/ai-security-wiki-topic-news-collector-2026-11-09T003426Z.json)
- [NVD CVE-2026-123964](https://nvd.nist.gov/vuln/detail/CVE-2026-123964)
- [OpenBMB issue 22](https://github.com/OpenBMB/IoA/issues/22)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [agentic AI emergency shutdown controls](agentic-ai-emergency-shutdown-controls.md)

## Open Questions

- Has OpenBMB published an unaffected revision or release for CVE-2026-123964?

## Maintenance Notes

- Created on 2026-11-09; the linked issue was unresolved in retained source evidence.
