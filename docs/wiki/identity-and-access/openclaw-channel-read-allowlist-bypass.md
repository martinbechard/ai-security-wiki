---
type: "Topic"
title: "OpenClaw Channel Read Allowlist Bypass"
description: "Security analysis for GHSA-g7fw-3gjp-g5hf channel read action allowlist bypasses in OpenClaw communication plugins."
tags: ["identity-and-access", "agent-and-tool-security", "data-and-privacy"]
---

# OpenClaw Channel Read Allowlist Bypass

## Current Understanding

The [October 5 topic collector source](../../../raw/processed/2026-10-05/ai-security-wiki-topic-news-collector-2026-10-05T233142Z.json) records [GHSA-g7fw-3gjp-g5hf](https://github.com/openclaw/openclaw/security/advisories/GHSA-g7fw-3gjp-g5hf) for OpenClaw channel read actions. Broad OpenClaw product and workflow context belongs upstream; this page owns the delegated read-action allowlist boundary.

The advisory says Microsoft Teams, Feishu, Matrix, and Google Chat plugins could accept caller-supplied explicit targets and read channels or rooms outside configured read policy. The first stable patched version is recorded as 2026.8.1.

## Security Impact

- Threat: an agent or lower-trust sender with channel read action access can retrieve content or metadata outside the operator-approved communication boundary.
- Affected boundary: `@openclaw/msteams`, `@openclaw/feishu`, `@openclaw/matrix`, and `@openclaw/googlechat` before 2026.8.1.
- Exploit or incident status: reviewed GitHub advisory evidence; no local exploitation incident is recorded.
- Mitigation state: update OpenClaw communication plugins to 2026.8.1 or later and bind read operations to configured allowlists after target normalization.
- Confidence: high for affected packages, read-boundary shape, and fixed release.
- Residual risk: communication plugins can make an agent's read scope broader than the human thinks, especially when explicit room or channel targets override policy.

## Authoritative Sources

- [October 5 topic collector source](../../../raw/processed/2026-10-05/ai-security-wiki-topic-news-collector-2026-10-05T233142Z.json)
- [OpenClaw advisory GHSA-g7fw-3gjp-g5hf](https://github.com/openclaw/openclaw/security/advisories/GHSA-g7fw-3gjp-g5hf)
- [GitHub advisory GHSA-g7fw-3gjp-g5hf](https://github.com/advisories/GHSA-g7fw-3gjp-g5hf)
- [OpenClaw 2026.8.1 release](https://github.com/openclaw/openclaw/releases/tag/v2026.8.1)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [agent and tool security](../agent-and-tool-security/index.md)
- [OpenClaw agent authority and approval cluster](../agent-and-tool-security/openclaw-agent-authority-and-approval-cluster.md)
- Upstream AI wiki owns broad [OpenClaw](../../../upstream-ai-wiki/mcp-servers/openclaw.md) product context.

## Open Questions

- Does OpenClaw 2026.8.1 invalidate or re-check previously configured communication plugin targets, or must operators audit existing action policies?

## Maintenance Notes

- Created on 2026-10-06 from the [October 5 topic collector source](../../../raw/processed/2026-10-05/ai-security-wiki-topic-news-collector-2026-10-05T233142Z.json) after routing broad OpenClaw product context upstream.
