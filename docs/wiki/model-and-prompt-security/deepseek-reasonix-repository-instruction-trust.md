---
type: "Topic"
title: "DeepSeek-Reasonix Repository Instruction Trust"
description: "Security analysis for CVE-2026-123653 repository-controlled instruction elevation in DeepSeek-Reasonix."
tags: ["model-and-prompt-security", "agent-and-tool-security"]
---

# DeepSeek-Reasonix Repository Instruction Trust

## Current Understanding

The [November 8 collector source](../../../raw/processed/2026-11-08/ai-security-wiki-topic-news-collector-2026-11-08T003537Z.json) records [CVE-2026-123653 / GHSA-7v48-x992-r5w7](https://github.com/esengine/DeepSeek-Reasonix/security/advisories/GHSA-7v48-x992-r5w7). DeepSeek-Reasonix before 2.53.0 automatically elevated repository-controlled `AGENTS.md`, `CLAUDE.md`, and `REASONIX.md` files into trusted durable system-prompt guidance without provenance labeling, workspace trust gating, or user confirmation. The advisory reports controlled shell-tool steering from this content. General coding-agent instruction practice belongs in ai-dev-wiki; this page owns the prompt-provenance and tool-steering vulnerability.

## Security Impact

- Threat: an attacker-controlled repository can cause a coding agent to treat untrusted instruction files as trusted guidance and influence permission-gated tool use.
- Affected boundary: repository and ancestor instruction-file discovery plus system-prompt composition in DeepSeek-Reasonix versions before 2.53.0.
- Exploit or incident status: a public advisory reports controlled demonstration of shell-tool steering; it is not retained evidence of a production compromise or a universal effect across agents and deployments.
- Mitigation state: upgrade to 2.53.0 or later; require explicit workspace trust and provenance labeling for repository instructions; and retain separate approval and least-privilege controls around tools.
- Confidence: high for the vulnerable loading path and patched version; medium for transferability beyond the advisory's tested configuration.
- Residual risk: even a trusted repository can carry risky instructions, so source trust cannot replace bounded tool authority and action review.

## Authoritative Sources

- [November 8 collector source](../../../raw/processed/2026-11-08/ai-security-wiki-topic-news-collector-2026-11-08T003537Z.json)
- [CVE-2026-123653 / GHSA-7v48-x992-r5w7](https://github.com/esengine/DeepSeek-Reasonix/security/advisories/GHSA-7v48-x992-r5w7)
- [DeepSeek-Reasonix patch commit](https://github.com/esengine/DeepSeek-Reasonix/commit/4ca33493a673c2788aa8598fbca2b2f47a69e1b8)
- [DeepSeek-Reasonix 2.53.0 release](https://github.com/esengine/DeepSeek-Reasonix/releases/tag/v2.53.0)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [model and prompt security](index.md)
- [agent and tool security](../agent-and-tool-security/index.md)

## Open Questions

- Does the 2.53.0 change expose a durable policy for ancestor-directory instruction discovery as well as repository-root files?

## Maintenance Notes

- Created on 2026-11-08 from an NVD-timed disclosure. The GitHub advisory predates the collector window and corroborates the vulnerable path and remediation boundary.
