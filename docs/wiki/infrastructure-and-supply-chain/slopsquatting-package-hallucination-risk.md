---
type: "Topic"
title: "Slopsquatting Package Hallucination Risk"
description: "Supply-chain security analysis for hallucinated package names becoming malicious dependency targets in AI-assisted coding workflows."
tags: ["infrastructure-and-supply-chain", "agent-and-tool-security", "testing-and-assurance"]
---

# Slopsquatting Package Hallucination Risk

## Current Understanding

Slopsquatting package hallucination risk is the supply-chain attack pattern where AI coding tools suggest nonexistent package names and attackers register those predictable names with malicious payloads. The [AI code bugs clipping source](../../../raw/processed/ai-code-bugs-changing-old-playbook-wont-save-you.md) attributes the pattern to package hallucination research, proof-of-concept registrations, and incidents involving `huggingface-cli` and `react-codeshift`. Broad package ecosystem, AI coding workflow, and upstream software-delivery practice routes to ai-wiki or ai-dev-wiki; this page owns the local AI security control.

The clipping's date metadata conflicts with its body, so the named statistics and incident counts remain medium confidence until primary sources are ingested. The durable local lesson does not depend on the exact counts: autonomous or semi-autonomous coding agents must not install packages solely because a model suggested a package name.

The risk grows when:

- agents can run install commands without human review;
- package names are repeated across model families;
- generated README or setup instructions propagate the false dependency.

The [August 26 leaf update watch source](../../../raw/processed/2026-08-25/ai-security-wiki-leaf-update-watch-20260826T001230Z.json) adds primary research evidence from [arXiv:2608.22652](https://arxiv.org/abs/2608.22652), an ASE 2026 paper evaluating inference-time defenses against package hallucination across eight models, five families, and four languages. The source reports that RAG helped in 18 of 32 model-language configurations, while adversarial fabricated package names can increase hallucination rates by up to 45 percentage points. This strengthens the page's control claim without importing broad software-engineering benchmark analysis owned by the AI development wiki.

## Security Impact

- Threat: attackers can register hallucinated dependency names on public registries and receive installs from AI-assisted developers or autonomous agents.
- Affected boundary: package managers, generated install commands, setup scripts, README snippets, CI dependency restoration, coding-agent tool calls, npm, PyPI, and similar registries.
- Exploit or incident status: clipping-attributed proof-of-concept and incident claims; primary advisories not yet captured in this wiki.
- Mitigation state: package existence, provenance, maintainer, age, popularity, signature, lockfile, and vulnerability checks should gate dependency acceptance.
- Confidence: medium for older clipping-named incidents because the clipping is secondary and has date conflict; high for the general control need and current defense limitations because the August watcher adds primary package-hallucination research evidence.
- Residual risk: exact package names, model-family recurrence rates, registry takedown status, and autonomous-agent blast radius remain open until primary sources are linked.

## Control Implications

- Verify every model-suggested package name against an approved registry and expected publisher before installation.
- Require human approval for new dependencies proposed by coding agents, especially when the package is absent from existing lockfiles or manifests.
- Prefer pinned versions, lockfiles, trusted registries, package signing, and private allowlists for agent-managed dependency installation.
- Treat generated setup instructions and README dependency commands as untrusted until package provenance is checked.
- Monitor for package names that appear in prompts, generated code, or failed installs before they exist in trusted dependency inventories.

## Authoritative Sources

- [AI code bugs clipping source](../../../raw/processed/ai-code-bugs-changing-old-playbook-wont-save-you.md)
- [August 26 leaf update watch source](../../../raw/processed/2026-08-25/ai-security-wiki-leaf-update-watch-20260826T001230Z.json)
- [Package hallucination defense paper](https://arxiv.org/abs/2608.22652)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [Agent build and dependency execution boundaries](agent-build-and-dependency-execution-boundaries.md)
- [AI guardrail dependency compromise](ai-guardrail-dependency-compromise.md)
- [AI-generated code security assurance](../testing-and-assurance/ai-generated-code-security-assurance.md)
- Upstream AI wiki owns broad [AI supply-chain risk](../../../upstream-ai-wiki/techniques/ai-supply-chain-risk.md) context.
- Upstream AI development wiki owns general [sensitive data and supply-chain controls](../../../upstream-ai-dev-wiki/governance-and-risk/sensitive-data-and-supply-chain-controls.md) practice.

## Open Questions

- Which primary slopsquatting papers, registry reports, and incident disclosures should replace the clipping's secondary claims?
- Which package registries expose reliable signals for hallucinated-name registration and takedown?
- What approval evidence should be mandatory before autonomous agents can add new dependencies?

## Maintenance Notes

- Created on 2026-08-06 from the [AI code bugs clipping](../../../raw/processed/ai-code-bugs-changing-old-playbook-wont-save-you.md) as a supply-chain security leaf with quantitative claims kept medium confidence until primary sources are ingested.
- Updated on 2026-08-26 from the [August 26 leaf watcher](../../../raw/processed/2026-08-25/ai-security-wiki-leaf-update-watch-20260826T001230Z.json) with arXiv:2608.22652 primary defense-evaluation evidence.
