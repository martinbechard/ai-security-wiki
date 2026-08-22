---
type: "Topic"
title: "Private Safety Processing ZDR"
description: "Security and privacy analysis for ZDR-compatible safety monitoring of frontier-model deployments."
tags: ["data-and-privacy", "testing-and-assurance", "governance-and-compliance"]
---

# Private Safety Processing ZDR

## Current Understanding

The [August 21 topic news collector source](../../../raw/processed/2026-08-21/ai-security-wiki-topic-news-collector-2026-08-21T233219Z.json) records [OpenAI's Private Safety Processing preview](https://openai.com/index/offering-zero-data-retention-for-frontier-models/) for eligible Zero Data Retention deployments. Broad [OpenAI](../../../upstream-ai-wiki/companies/openai.md) API platform context belongs upstream; this page owns the local security and privacy tension between misuse monitoring and customer content confidentiality.

Private Safety Processing is described as a design for analyzing related interactions for misuse patterns while keeping customer prompts and responses unavailable to OpenAI personnel. The source identifies customer-controlled infrastructure, future customer-controlled encryption keys, and limited safety signals returned to OpenAI as the core boundary. The collector treats the OpenAI page as primary product-security evidence but uses the [Help Net Security report](https://www.helpnetsecurity.com/2026/08/20/openai-private-safety-processing-zdr/) for the visible August 20, 2026 in-window date because the primary page exposed only a year.

## Security Impact

- Threat: enterprise ZDR deployments still need misuse detection, but sending raw prompts and responses to a provider can violate confidentiality, privacy, or regulatory commitments.
- Affected boundary: eligible OpenAI API frontier-model deployments using Zero Data Retention and future Private Safety Processing rollout paths.
- Exploit or incident status: control preview, not an incident or vulnerability.
- Mitigation state: early customer testing is reported; a technical white paper and broader rollout were planned for September 2026.
- Confidence: medium for timing because the primary page lacks a precise visible date; high for the control framing captured from the primary page.
- Residual risk: auditability depends on what limited safety signals are returned, how customer-controlled keys are implemented, and whether independent evidence can prove raw content remains inaccessible.

## Authoritative Sources

- [August 21 topic news collector source](../../../raw/processed/2026-08-21/ai-security-wiki-topic-news-collector-2026-08-21T233219Z.json)
- OpenAI Private Safety Processing page: https://openai.com/index/offering-zero-data-retention-for-frontier-models/
- Help Net Security report: https://www.helpnetsecurity.com/2026/08/20/openai-private-safety-processing-zdr/

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [data and privacy](index.md)
- [frontier model critical cyber release gates](../testing-and-assurance/frontier-model-critical-cyber-release-gates.md)
- [AI coding telemetry access controls](ai-coding-telemetry-access-controls.md)
- Upstream AI wiki owns broad [OpenAI](../../../upstream-ai-wiki/companies/openai.md) platform context.

## Open Questions

- What technical details will the planned September 2026 white paper provide about key control, signal minimization, and audit evidence?

## Maintenance Notes

- Created on 2026-08-21 from the [August 21 topic collector](../../../raw/processed/2026-08-21/ai-security-wiki-topic-news-collector-2026-08-21T233219Z.json) as a privacy-preserving safety-monitoring control leaf.
