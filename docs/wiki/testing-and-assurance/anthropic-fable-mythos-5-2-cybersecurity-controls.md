---
type: "Topic"
title: "Anthropic Fable 5.2 and Mythos 5.2 Cybersecurity Controls"
description: "Security-assurance analysis of Anthropic's stated access, monitoring, cyber-request, evaluation, and anti-distillation controls."
tags: ["testing-and-assurance", "model-and-prompt-security", "identity-and-access", "data-and-privacy"]
---

# Anthropic Fable 5.2 and Mythos 5.2 Cybersecurity Controls

## Current Understanding

The [November 9 collector source](../../../raw/processed/2026-11-09/ai-security-wiki-topic-news-collector-2026-11-09T192706-0500.json) records Anthropic's [Fable 5.2 and Mythos 5.2 publication](https://www.anthropic.com/claude-fable-and-mythos-5-2). Broad [Anthropic](../../../upstream-ai-wiki/companies/anthropic.md), [Claude Fable 5 and Mythos 5](../../../upstream-ai-wiki/models/claude-fable-5-and-mythos-5.md), Claude Code, and product availability belong upstream. This page owns the local security-assurance lens for stated cyber-request controls, vetted access, sandbox evaluation, anti-distillation handling, and enterprise monitoring.

Anthropic states that Fable 5.2 blocks high-risk cyber requests with classifiers and uses a fallback model for blocked requests. It limits Mythos 5.2 to vetted dual-use organizations. The reported comparison is a roughly 60% reduction in cyber-classifier blocks versus Fable 5.1 in early testing; it is a vendor-reported measurement, not a general effectiveness guarantee.

The publication separately reports these release-control claims:

- An evaluation of more than 1,800 sandbox-escape scenarios found credential or file use outside the sandbox in 3.1% of scenarios. This is assurance evidence for the evaluated setup, not a universal sandbox-escape rate or proof that sandbox escape is eliminated.
- Anthropic says it expanded preserved thinking to all accounts to resist distillation. Separate local coverage is deferred because the retained source supplies no independently maintainable implementation, retention, or attack-path detail beyond this release claim; a system card or technical specification would warrant a dedicated leaf.
- Anthropic says Enterprise Frontier Safeguards can monitor customer-hosted prompt and response data for zero-data-retention customers. Separate local coverage is deferred because the retained source does not define monitor access, retention, or escalation behavior; those boundaries would warrant a dedicated monitoring-and-privacy leaf.

## Security Impact

- Control area: cyber-request classification and fallback, vetted dual-use access, sandbox-escape evaluation, anti-distillation controls, and enterprise misuse monitoring.
- Affected boundary: Claude Fable 5.2, Claude Mythos 5.2, Claude Code, claude.ai, Cowork, API preserved thinking, and Enterprise Frontier Safeguards private beta.
- Exploit or incident status: vendor release and assurance disclosure; it does not establish a public exploit incident or independent validation of the reported controls.
- Mitigation state: Anthropic reports classifier blocking and fallback, vetted Mythos access, preserved-thinking expansion, monitored enterprise access, and sandbox evaluation. Deployment decisions should still test local tool, data-retention, and escalation boundaries.
- Confidence: high for the vendor-stated controls and measurements; medium for general effectiveness because results are vendor-reported and partly from early testing.
- Residual risk: exact classifier thresholds, fallback behavior, eligible-organization criteria, evaluation corpus, and monitoring coverage are not fully established in the retained source.

## Authoritative Sources

- [November 9 collector source](../../../raw/processed/2026-11-09/ai-security-wiki-topic-news-collector-2026-11-09T192706-0500.json)
- [Anthropic Fable 5.2 and Mythos 5.2 publication](https://www.anthropic.com/claude-fable-and-mythos-5-2)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [testing and assurance](index.md)
- [frontier model critical cyber release gates](frontier-model-critical-cyber-release-gates.md)
- [model and prompt security](../model-and-prompt-security/index.md)
- [identity and access](../identity-and-access/index.md)

## Open Questions

- Which system-card or product documentation defines the classifier, fallback, retention, and organization-eligibility boundaries?
- Which evaluation assumptions bound the reported 3.1% credential-or-file use outside the sandbox result?

## Maintenance Notes

- Created on 2026-11-09 from vendor-stated release controls while routing broad model and product coverage upstream.
