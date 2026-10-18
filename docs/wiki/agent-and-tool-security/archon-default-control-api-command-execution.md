---
type: "Topic"
title: "Archon Default Control API Command Execution"
description: "Security analysis for CVE-2026-111322 unauthenticated network access to Archon's bypass-permissions agent control API."
tags: ["agent-and-tool-security"]
---

# Archon Default Control API Command Execution

## Current Understanding

The [October 17 topic collector source](../../../raw/processed/2026-10-17/ai-security-wiki-topic-news-collector-2026-10-17T193139-0400.json) records [CVE-2026-111322](https://nvd.nist.gov/vuln/detail/CVE-2026-111322): Archon 0.2.13 through 0.11.1 binds `/api/*` to `0.0.0.0` without authentication by default. A network attacker can send work to its bypass-permissions coding agent and execute commands as the host user. Broad Archon product context belongs upstream; this page owns the exposed agent control-plane boundary.

## Security Impact

- Affected boundary: default network-bound control API and host-user command authority in versions 0.2.13 through 0.11.1.
- Exploit or incident status: public CVE; no exploitation is reported by the source.
- Mitigation state: restrict the API to an authenticated local or protected network boundary; a vendor-fixed release is not established by the source.
- Confidence: high for the disclosed affected range and default binding; residual risk remains wherever agent-control APIs trust network reachability alone.

## Authoritative Sources

- [October 17 topic collector source](../../../raw/processed/2026-10-17/ai-security-wiki-topic-news-collector-2026-10-17T193139-0400.json)
- [CVE-2026-111322](https://nvd.nist.gov/vuln/detail/CVE-2026-111322)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)

## Open Questions

- Which release, if any, changes the default API binding or requires authentication?

## Maintenance Notes

- Created on 2026-10-17 from CVE-2026-111322; recheck vendor remediation before asserting a fixed version.
