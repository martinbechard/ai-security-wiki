---
type: "Topic"
title: "Kimi Code FetchURL SSRF"
description: "Security analysis for CVE-2026-17534, where a default-approved agent fetch tool could be steered to internal services."
---

# Kimi Code FetchURL SSRF

## Current Understanding

The [July 27 topic news collector source](../../../raw/processed/2026-07-27/ai-security-wiki-topic-news-collector-2026-07-27T193242-0400.json) records [NVD](https://nvd.nist.gov/vuln/detail/CVE-2026-17534) publication of CVE-2026-17534 for MoonshotAI [Kimi Code](../../../upstream-ai-wiki/developer-tools/kimi-code.md) versions before 0.27.0. The affected `FetchURL` tool used a static hostname and IP-literal denylist without resolving DNS or rechecking redirects, so prompt-influenced fetches could reach loopback or internal services despite the intended network boundary.

This page owns the SSRF, prompt-influenced tool-call, and default approval boundary. Broad [MoonshotAI](../../../upstream-ai-wiki/companies/moonshot-ai.md) and [Kimi Code](../../../upstream-ai-wiki/developer-tools/kimi-code.md) product context belongs upstream, while general [human-agent approval boundary](../../../upstream-ai-dev-wiki/adoption-and-operating-model/human-agent-approval-boundaries.md) practice belongs in the upstream AI development wiki.

## Security Impact

- Threat: prompt injection or malicious task content can steer an auto-approved URL-fetching tool across the internal-service isolation boundary.
- Affected boundary: MoonshotAI Kimi Code `@moonshot-ai/kimi-code` versions before 0.27.0; local-fetch-url providers and the default tool approval policy.
- Exploit or incident status: public CVE record; [NVD](https://nvd.nist.gov/vuln/detail/CVE-2026-17534) records CWE-918 and CISA-ADP SSVC metadata from the July 27 receipt.
- Mitigation state:
  - Upgrade to [Kimi Code 0.27.0](https://github.com/MoonshotAI/kimi-code/releases/tag/%40moonshot-ai%2Fkimi-code%400.27.0) or later.
  - Resolve and validate DNS targets before the tool fetches content.
  - Revalidate redirects against the same network boundary.
  - Deny loopback and internal address ranges after resolution.
  - Remove network fetch tools from default approval when untrusted prompts can influence URLs.
- Confidence: high for affected version range and patch boundary from [NVD](https://nvd.nist.gov/vuln/detail/CVE-2026-17534), the [0.27.0 release](https://github.com/MoonshotAI/kimi-code/releases/tag/%40moonshot-ai%2Fkimi-code%400.27.0), and the [vendor patch commit](https://github.com/MoonshotAI/kimi-code/commit/31449728b72df94e22bcb2de350a1e7624895e30) carried by the raw source.
- Residual risk:
  - Static hostname blocks can miss internal-service aliases.
  - IP-literal deny rules can miss DNS rebinding or resolver behavior.
  - Redirect handling can cross the intended boundary after the initial URL check.
  - URL parser differences can make validation and fetch targets diverge.

## Authoritative Sources

- [July 27 topic news collector source](../../../raw/processed/2026-07-27/ai-security-wiki-topic-news-collector-2026-07-27T193242-0400.json)
- NVD: https://nvd.nist.gov/vuln/detail/CVE-2026-17534
- Kimi Code 0.27.0 release: https://github.com/MoonshotAI/kimi-code/releases/tag/%40moonshot-ai%2Fkimi-code%400.27.0
- Vendor patch commit: https://github.com/MoonshotAI/kimi-code/commit/31449728b72df94e22bcb2de350a1e7624895e30

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [agent network egress controls](agent-network-egress-controls.md)
- [model and prompt security](../model-and-prompt-security/index.md)
- Upstream AI wiki owns broad MoonshotAI and [Kimi Code](../../../upstream-ai-wiki/developer-tools/kimi-code.md) context.
- Upstream AI development wiki owns general [human-agent approval boundary](../../../upstream-ai-dev-wiki/adoption-and-operating-model/human-agent-approval-boundaries.md) practice.

## Open Questions

- Are any local dependency inventories or approved agent runtimes using Kimi Code before 0.27.0?

## Maintenance Notes

- Added from the [July 27, 2026 topic collector artifact](../../../raw/processed/2026-07-27/ai-security-wiki-topic-news-collector-2026-07-27T193242-0400.json); keep future updates focused on SSRF mechanics, approval boundaries, and fixed-version evidence.
