---
type: "Topic"
title: "Open WebUI chat channel authorization"
description: "Security analysis for Open WebUI 0.11.0 chat task cancellation, image-generation permission, tool-source disclosure, and channel authorship authorization flaws."
tags: ["identity-and-access", "agent-and-tool-security", "data-and-privacy"]
---

# Open WebUI chat channel authorization

## Current Understanding

The [September 8 topic collector source](../../../raw/processed/2026-09-08/ai-security-wiki-topic-news-collector-2026-09-08T233200Z.json) records NVD in-window updates for Open WebUI chat and channel authorization issues fixed in 0.11.0. Broad Open WebUI collaboration context belongs upstream; this page owns the local identity and delegated-action boundary where chat tasks, channels, image generation, and tool metadata must remain bound to the authorized actor.

The advisory family covers chat task cancellation before authorization, image-generation permission bypass, standard-channel message authorship failures, and tool-source disclosure to non-admins. The common boundary is that collaborative assistant actions need object-level, actor-level, and capability-level checks at the execution edge.

## Security Impact

- Threat: users can cancel or impersonate chat actions, bypass image-generation permissions, or read tool source beyond their role.
- Affected boundary: Open WebUI versions before 0.11.0; chat tasks, channels, image generation, and tool-source metadata.
- Exploit or incident status: public NVD/CVE/GitHub advisory evidence; no local exploitation incident is recorded.
- Mitigation state: upgrade to Open WebUI 0.11.0 or later and enforce actor, object, role, and capability checks on every chat or tool action.
- Confidence: high for NVD update timing and fixed-version signal; medium for exact exploit prerequisites.
- Residual risk: shared assistant workspaces can leak authority when UI collaboration state is not rechecked by the backend action path.

## Authoritative Sources

- [September 8 topic collector source](../../../raw/processed/2026-09-08/ai-security-wiki-topic-news-collector-2026-09-08T233200Z.json)
- [Open WebUI v0.11.0 release](https://github.com/open-webui/open-webui/releases/tag/v0.11.0)
- [CVE-2026-70485 NVD record](https://nvd.nist.gov/vuln/detail/CVE-2026-70485)
- [CVE-2026-70489 NVD record](https://nvd.nist.gov/vuln/detail/CVE-2026-70489)
- [CVE-2026-70490 NVD record](https://nvd.nist.gov/vuln/detail/CVE-2026-70490)
- [CVE-2026-70491 NVD record](https://nvd.nist.gov/vuln/detail/CVE-2026-70491)
- [CVE-2026-70492 NVD record](https://nvd.nist.gov/vuln/detail/CVE-2026-70492)
- [CVE-2026-70493 NVD record](https://nvd.nist.gov/vuln/detail/CVE-2026-70493)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [agent and tool security](../agent-and-tool-security/index.md)
- [approval metadata access control](../agent-and-tool-security/approval-metadata-access-control.md)
- [MCP tool-level IAM authorization](mcp-tool-level-iam-authorization.md)

## Open Questions

- No open wiki questions are recorded for this topic.

## Maintenance Notes

- Created on 2026-09-08 from the September 8 topic collector after verifier correction split the Open WebUI release wave into focused security-boundary leaves.
