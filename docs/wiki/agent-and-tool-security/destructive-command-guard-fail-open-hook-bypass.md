---
type: "Topic"
title: "destructive_command_guard Fail-Open Hook Bypass"
description: "Security analysis for CVE-2026-77474 command-substitution input exhausting an AI-agent destructive-command guard."
tags: ["agent-and-tool-security"]
---

# destructive_command_guard Fail-Open Hook Bypass

## Current Understanding

The [October 17 topic collector source](../../../raw/processed/2026-10-17/ai-security-wiki-topic-news-collector-2026-10-17T193139-0400.json) records [CVE-2026-77474](https://nvd.nist.gov/vuln/detail/CVE-2026-77474): `destructive_command_guard` before 0.6.6 repeatedly rescans nested or unclosed shell substitutions. An attacker-controlled command can hang the `PreToolUse` hook and cause its destructive-command release gate to fail open. General tool context belongs upstream; this page owns guard availability as an authorization property.

The [October 19 leaf update watch](../../../raw/processed/2026-10-19/ai-security-wiki-leaf-update-watch-20261019T180144Z.json) adds CISA ADP SSVC enrichment, not a changed remedy: exploitation is assessed as none, automatable as no, and technical impact as partial. Treat that as a time-bounded prioritization signal; it does not weaken the fail-closed timeout requirement.

## Security Impact

- Affected boundary: `PreToolUse` destructive-command validation before 0.6.6.
- Exploit or incident status: public CVE; no exploitation is reported by the source.
- Mitigation state: upgrade to 0.6.6 or later if confirmed; enforce bounded parsing and fail closed on timeout or hook error.
- Confidence: high for the disclosed fail-open sequence; residual risk remains in policy hooks whose errors are treated as approval.

## Authoritative Sources

- [October 17 topic collector source](../../../raw/processed/2026-10-17/ai-security-wiki-topic-news-collector-2026-10-17T193139-0400.json)
- [CVE-2026-77474](https://nvd.nist.gov/vuln/detail/CVE-2026-77474)
- [October 19 leaf update watch](../../../raw/processed/2026-10-19/ai-security-wiki-leaf-update-watch-20261019T180144Z.json)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)

## Open Questions

- Does 0.6.6 make all timeout, parser-error, and hook-crash paths fail closed?

## Maintenance Notes

- Created on 2026-10-17 from CVE-2026-77474.
- Updated on 2026-10-19 with CISA SSVC enrichment; recheck the assessment if exploitation status changes.
