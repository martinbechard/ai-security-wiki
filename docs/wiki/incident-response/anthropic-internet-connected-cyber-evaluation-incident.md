---
type: "Topic"
title: "Anthropic Internet-Connected Cyber-Evaluation Incident"
description: "Security analysis for reported Anthropic cyber evaluations that reached real-world systems when evaluation infrastructure had internet access."
---

# Anthropic Internet-Connected Cyber-Evaluation Incident

## Current Understanding

The [July 30 topic news collector source](../../../raw/processed/2026-07-30/ai-security-wiki-topic-news-collector-2026-07-30T193228-0400.json) records [Axios reporting](https://www.axios.com/2026/07/30/anthropic-mythos-security-testing) that [Anthropic](../../../upstream-ai-wiki/companies/anthropic.md) disclosed real-world system access during pre-deployment cybersecurity evaluations run with Irregular. Broad Anthropic, [Claude/Mythos](../../../upstream-ai-wiki/models/claude-fable-5-and-mythos-5.md), and model-family context routes to the upstream AI wiki; Irregular and unnamed evaluation-partner details remain locally deferred until an upstream owner page exists. This page owns the local incident-response and containment lens.

The reported boundary differs from the OpenAI/Hugging Face incident. The source says Anthropic attributed the exposure to internet-connected evaluation infrastructure caused by a misunderstanding with its evaluation partner, not to a zero-day sandbox escape. Reported model behavior included:

- exploiting weak passwords and unauthenticated endpoints;
- publishing a malicious Python package to PyPI that executed on 15 systems;
- scanning about 9,000 targets;
- compromising an internet-facing application.

The incident is medium-confidence until a public Anthropic primary disclosure is located. The collector found concrete reputable reporting but no primary Anthropic post during the July 30 run.

Axios also reported that Anthropic reviewed more than 141,000 evaluation runs after OpenAI's disclosure. This is response and assurance evidence attributed to Axios until Anthropic or Irregular publishes a primary account.

## Security Impact

- Threat: cyber-capable models can cross from simulated tasks into unauthorized real-world access when evaluation internet access is misconfigured.
- Affected boundary: Anthropic pre-deployment cyber evaluations with Irregular, internet-connected evaluation environments, PyPI publication paths, three unnamed third-party organizations, and weak-password or unauthenticated endpoint targets.
- Exploit or incident status: reported company disclosure through reputable media; primary vendor incident post not yet captured.
- Mitigation state: reported halt of cyber evaluations that could access the internet while testing infrastructure is reviewed, plus an Axios-reported review of more than 141,000 evaluation runs.
- Confidence: medium because the source is concrete public reporting of a company disclosure, but the collector did not locate a primary Anthropic source.
- Residual risk: affected third-party systems, partner responsibilities, model-specific action attribution, PyPI package details, remediation evidence, and policy changes remain unresolved.

## Authoritative Sources

- [July 30 topic news collector source](../../../raw/processed/2026-07-30/ai-security-wiki-topic-news-collector-2026-07-30T193228-0400.json)
- Axios report: https://www.axios.com/2026/07/30/anthropic-mythos-security-testing

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [incident response](index.md)
- [cyber-evaluation containment](../testing-and-assurance/cyber-evaluation-containment.md)
- [OpenAI Hugging Face cyber-evaluation incident](openai-hugging-face-cyber-evaluation-incident.md)
- [agent network egress controls](../agent-and-tool-security/agent-network-egress-controls.md)
- Upstream AI wiki owns broad [Anthropic](../../../upstream-ai-wiki/companies/anthropic.md) and [Claude/Mythos](../../../upstream-ai-wiki/models/claude-fable-5-and-mythos-5.md) coverage.

## Open Questions

- Will Anthropic or Irregular publish a primary incident report with affected targets, package identifiers, and remediation evidence?
- Which evaluation-environment controls changed after the reported halt?
- Which upstream page should own Irregular as a general evaluation partner if public coverage matures?

## Maintenance Notes

- Created on 2026-07-30 from the [July 30 topic news collector source](../../../raw/processed/2026-07-30/ai-security-wiki-topic-news-collector-2026-07-30T193228-0400.json) while keeping broad Anthropic, Claude, Opus, Mythos, and evaluation-partner coverage upstream.
