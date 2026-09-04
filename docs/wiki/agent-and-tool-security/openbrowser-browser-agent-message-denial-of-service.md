---
type: "Topic"
title: "openbrowser Browser Agent Message Denial of Service"
description: "Security analysis for CVE-2026-84833 resource consumption in ntegrals openbrowser browser-agent message construction."
tags: ["agent-and-tool-security", "testing-and-assurance"]
---

# openbrowser Browser Agent Message Denial of Service

## Current Understanding

The [September 3 topic collector source](../../../raw/processed/2026-09-03/ai-security-wiki-topic-news-collector-2026-09-03T233104Z.json) records [CVE-2026-84833](https://nvd.nist.gov/vuln/detail/CVE-2026-84833) for ntegrals openbrowser. Broad browser-agent framework coverage belongs upstream; this page owns the local security boundary where message construction in a browser agent can consume resources before or during autonomous browsing work.

The [direct CVE record](https://cveawg.mitre.org/api/cve/CVE-2026-84833), [VulDB](https://vuldb.com/vuln/398080), and the [public proof-of-concept repository](https://github.com/outlookgp/CVE/tree/main/OpenBrowser_Message_Budget_DoS_Report) describe a remotely triggerable resource-consumption vulnerability in `packages/core/src/agent/agent.ts`. The CVE names commit `067fc45d649baa961750da8e2f4a75d87c5c75c8` as the affected rolling-release boundary and records no clean fixed release during this ingest.

## Security Impact

- Threat: remote or web-derived input can force browser-agent message construction into excessive resource use.
- Affected boundary: ntegrals openbrowser, Browser Agent Message Construction, `packages/core/src/agent/agent.ts`, and browser-agent planning context.
- Exploit or incident status: public CVE, VulDB, and proof-of-concept references; NVD keyword evidence was captured before later rate limiting.
- Mitigation state: no fixed release is identified locally; enforce message-size, context-window, and per-step resource budgets for browser agents.
- Confidence: medium from direct CVE and advisory references; medium for NVD details because the per-CVE fetch later hit HTTP 429 in the collector run.
- Residual risk: autonomous browser agents often ingest untrusted page content, so message-budget failures can become externally triggerable availability failures.

## Control Implications

- Bound message construction input length before combining browser state, task text, and model context.
- Apply resource limits to browser-agent planning steps as well as browser executor actions.
- Track rolling-release agent dependencies by commit when no stable fixed version is available.

## Authoritative Sources

- [September 3 topic collector source](../../../raw/processed/2026-09-03/ai-security-wiki-topic-news-collector-2026-09-03T233104Z.json)
- [NVD CVE-2026-84833](https://nvd.nist.gov/vuln/detail/CVE-2026-84833)
- [CVE-2026-84833 direct CVE record](https://cveawg.mitre.org/api/cve/CVE-2026-84833)
- [VulDB CVE-2026-84833 entry](https://vuldb.com/vuln/398080)
- [openbrowser message budget DoS proof of concept](https://github.com/outlookgp/CVE/tree/main/OpenBrowser_Message_Budget_DoS_Report)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [Agentic browser intent collision](agentic-browser-intent-collision.md)
- [Browser runtime patch cadence under AI bug hunting](../testing-and-assurance/browser-runtime-patch-cadence-under-ai-bug-hunting.md)

## Open Questions

- Which openbrowser release or commit fixes CVE-2026-84833, and how should rolling-release deployments prove remediation?

## Maintenance Notes

- Created on 2026-09-03 from the [September 3 topic collector](../../../raw/processed/2026-09-03/ai-security-wiki-topic-news-collector-2026-09-03T233104Z.json) as a browser-agent message-budget availability leaf.
