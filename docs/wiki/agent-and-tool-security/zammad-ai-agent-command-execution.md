---
type: "Topic"
title: "Zammad AI Agent Command Execution"
description: "Security analysis for CVE-2026-84462, where Zammad AI Agent configuration could lead to server command execution."
tags: ["agent-and-tool-security", "infrastructure-and-supply-chain"]
---

# Zammad AI Agent Command Execution

## Current Understanding

The [September 26 topic collector source](../../../raw/processed/2026-09-26/ai-security-wiki-topic-news-collector-2026-09-26T233301Z.json) records CVE-2026-84462 for Zammad before 7.1.2. Broad Zammad support-product context belongs upstream; this page owns the local AI Agent configuration-to-command-execution boundary.

Administrators creating or editing AI Agents could bypass configuration filtering and cause arbitrary server commands to run when the affected agent next processed a ticket. Admin-only setup does not remove the risk because the execution happens later inside an automated ticket workflow.

## Security Impact

- Threat: AI Agent configuration can become delayed server-side command execution.
- Affected boundary: Zammad before 7.1.2, AI Agent configuration filters, server command execution, and ticket-processing automation.
- Exploit or incident status: disclosed CVE; no confirmed exploitation is recorded in the collector.
- Mitigation state: upgrade to Zammad 7.1.2 or later and sandbox or remove command-capable configuration fields.
- Confidence: medium-high from NVD-backed collector evidence; vendor release notes should be checked for exact fields.
- Residual risk: ticket content can later activate unsafe configuration, so configuration validation and runtime execution policy both matter.

## Authoritative Sources

- [September 26 topic collector source](../../../raw/processed/2026-09-26/ai-security-wiki-topic-news-collector-2026-09-26T233301Z.json)
- [NVD CVE-2026-84462](https://nvd.nist.gov/vuln/detail/CVE-2026-84462)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)

## Open Questions

- Which AI Agent configuration fields were command-capable before Zammad 7.1.2?

## Maintenance Notes

- Created on 2026-09-27 from the [September 26 topic collector source](../../../raw/processed/2026-09-26/ai-security-wiki-topic-news-collector-2026-09-26T233301Z.json) after verifier correction split the Zammad release family.
