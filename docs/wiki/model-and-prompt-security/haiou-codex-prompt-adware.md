---
type: "Topic"
title: "Haiou Codex Prompt-Adware Persistent Instruction Manipulation"
description: "Security analysis of persistent third-party agent-instruction modification reported in a Haiou Codex jailbreak bundle."
tags: ["model-and-prompt-security", "infrastructure-and-supply-chain"]
---

# Haiou Codex Prompt-Adware Persistent Instruction Manipulation

## Current Understanding

The [November 4 collector](../../../raw/processed/2026-11-04/ai-security-wiki-topic-news-collector-2026-11-04T002949Z.json) records [Check Point Research's November 3 report](https://blog.checkpoint.com/security/prompt-adware-how-hidden-ai-instructions-could-create-a-new-enterprise-security-risk/) that the Haiou OpenAI Codex jailbreak bundle persistently modifies trusted global agent instructions so routine greetings advertise a third-party AI gateway. Broad Codex, Claude Code, and gateway background belongs upstream; this page owns the persistent-instruction provenance and agent-configuration supply-chain boundary.

The report did not find the named gateway malicious and does not establish corporate-data exfiltration. It demonstrates durable steering of later agent behavior through trusted natural-language configuration rather than a single-turn prompt injection.

## Security Impact

- Threat: an unreviewed Skill, jailbreak bundle, or global configuration can persistently change trusted instructions and steer later actions or destinations.
- Affected boundary: Codex installations that accept Haiou or analogous third-party Skills, prompts, or configuration changes; no affected vendor version or patch is stated.
- Exploit or incident status: reproduced security-research observation, not a disclosed customer compromise or demonstrated data-exfiltration incident.
- Mitigation state: review and provenance-pin third-party instruction artifacts; require explicit approval for global-instruction changes; monitor configuration drift; and limit agent credentials and gateway reachability.
- Confidence and residual risk: high for the reported instruction modification; impact beyond unwanted advertising remains a risk implication requiring deployment-specific evidence.

## Authoritative Sources

- [November 4 collector source](../../../raw/processed/2026-11-04/ai-security-wiki-topic-news-collector-2026-11-04T002949Z.json)
- [Check Point Research report](https://blog.checkpoint.com/security/prompt-adware-how-hidden-ai-instructions-could-create-a-new-enterprise-security-risk/)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [model and prompt security](index.md)
- [third-party cyber-evaluation boundary failures](../incident-response/third-party-cyber-evaluation-boundary-failures.md)

## Open Questions

- Which Codex configuration files, review surfaces, and policy controls can reliably detect equivalent persistent instruction changes?

## Maintenance Notes

- Created on 2026-11-04 from a dated research observation; gateway maliciousness and data-exfiltration claims are intentionally not inferred.
