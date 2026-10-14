---
type: "Topic"
title: "goose Approval-Mode Bypass After Smart Approval"
description: "Security analysis for CVE-2026-109561, where stale read-only tool annotations can bypass goose Manual Approval mode."
tags: ["agent-and-tool-security", "identity-and-access"]
---

# goose Approval-Mode Bypass After Smart Approval

## Current Understanding

The [October 13 topic collector source](../../../raw/processed/2026-10-13/ai-security-wiki-topic-news-collector-2026-10-13T232603Z.json) records [CVE-2026-109561](https://nvd.nist.gov/vuln/detail/CVE-2026-109561) for goose 1.28.0 before 1.44.0. General coding-agent approval workflow practice belongs upstream in ai-dev-wiki; this page owns the delegated-authority approval-state transition boundary.

The CVE evidence says read-only annotations persisted from Smart Approval mode are not cleared before Manual Approval mode. Prompt-injected calls to tools annotated `readOnlyHint:true` can execute without prompting after the mode change.

## Security Impact

- Threat: stale approval metadata can silently downgrade a user's selected manual approval policy.
- Affected boundary: goose 1.28.0 before 1.44.0, `PermissionInspector::inspect`, Smart Approval to Manual Approval transitions, and `readOnlyHint:true` tool annotations.
- Exploit or incident status: public CVE record; no confirmed exploitation incident is recorded locally.
- Mitigation state: update to 1.44.0 or later and clear or recompute approval annotations on mode changes.
- Confidence: high for affected range and bypass shape from NVD/CVE evidence.
- Residual risk: read-only labels are policy inputs, not proof that a tool is harmless.

## Control Implications

- Treat approval-mode changes as security state transitions requiring cache invalidation.
- Recompute tool approval requirements from the current mode and final tool request.
- Regression-test prompt-injected tool calls before and after approval-mode changes.

## Authoritative Sources

- [October 13 topic collector source](../../../raw/processed/2026-10-13/ai-security-wiki-topic-news-collector-2026-10-13T232603Z.json)
- [NVD CVE-2026-109561](https://nvd.nist.gov/vuln/detail/CVE-2026-109561)
- [CVE Services CVE-2026-109561](https://cveawg.mitre.org/api/cve/CVE-2026-109561)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [MCP tool-level IAM authorization](../identity-and-access/mcp-tool-level-iam-authorization.md)

## Open Questions

- Were all affected goose bypasses limited to tools annotated read-only, or could stale annotations cover broader tool categories?

## Maintenance Notes

- Created on 2026-10-14 from the October 13 topic collector as an approval-state transition security leaf.
