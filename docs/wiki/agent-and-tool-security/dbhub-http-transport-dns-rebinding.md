---
type: "Topic"
title: "DBHub HTTP Transport DNS Rebinding"
description: "Security analysis for CVE-2026-61742, where DBHub HTTP MCP transport Origin and Host checks did not stop DNS rebinding."
tags: ["agent-and-tool-security"]
---

# DBHub HTTP Transport DNS Rebinding

## Current Understanding

The [September 24 topic collector source](../../../raw/processed/2026-09-24/ai-security-wiki-topic-news-collector-2026-09-24T233211Z.json) records [CVE-2026-61742](https://cveawg.mitre.org/api/cve/CVE-2026-61742) for DBHub before 0.22.5. Broad [DBHub](../../../upstream-ai-wiki/mcp-servers/dbhub.md) MCP server cataloging and general database-agent workflow belongs upstream; this page owns the local HTTP transport exposure boundary.

DBHub's HTTP transport checked whether the `Origin` hostname equaled the `Host` hostname and reflected the validated origin into CORS. That did not stop DNS rebinding because both headers can carry the attacker-controlled hostname after it resolves to a victim-accessible DBHub server.

## Security Impact

- Threat: a malicious website can invoke DBHub MCP tools from a victim browser without prompt injection or model involvement.
- Affected boundary: DBHub before 0.22.5, documented HTTP transport mode, CORS Origin/Host checks, and browser-reachable MCP tool dispatch.
- Exploit or incident status: public CVE, NVD, and GitHub Security Advisory evidence; no local in-the-wild exploitation evidence is recorded.
- Mitigation state: upgrade to 0.22.5 or later, bind HTTP transport defensively, and block private-network browser rebinding to local MCP listeners.
- Confidence: high for affected version and DNS-rebinding mechanism; medium for deployment prevalence.
- Residual risk: HTTP MCP transports need browser-origin defenses beyond equal Host/Origin string checks.

## Authoritative Sources

- [September 24 topic collector source](../../../raw/processed/2026-09-24/ai-security-wiki-topic-news-collector-2026-09-24T233211Z.json)
- [CVE-2026-61742 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-61742)
- [NVD CVE-2026-61742](https://nvd.nist.gov/vuln/detail/CVE-2026-61742)
- [GHSA-fm8p-53ww-hf6w](https://github.com/bytebase/dbhub/security/advisories/GHSA-fm8p-53ww-hf6w)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [DBHub read-only database enforcement failure](dbhub-readonly-database-enforcement-failure.md)
- [agent network egress controls](agent-network-egress-controls.md)

## Open Questions

- Which DBHub deployments expose HTTP transport beyond loopback or trusted internal networks?

## Maintenance Notes

- Created on 2026-09-25 from the [September 24 topic collector source](../../../raw/processed/2026-09-24/ai-security-wiki-topic-news-collector-2026-09-24T233211Z.json) after splitting DBHub transport exposure from read-only enforcement.
