---
type: "Topic"
title: "LiteLLM Supply-Chain Secret Exposure"
description: "Security analysis for reconstructed AI infrastructure exposure from the LiteLLM PyPI compromise."
tags: ["infrastructure-and-supply-chain", "identity-and-access", "data-and-privacy"]
---

# LiteLLM Supply-Chain Secret Exposure

## Current Understanding

The LiteLLM PyPI compromise is an AI gateway supply-chain exposure case. The [August 12 topic news collector source](../../../raw/processed/2026-08-12/ai-security-wiki-topic-news-collector-2026-08-12T233146Z.json) records [CloudSEK research](https://www.cloudsek.com/blog/ai-supply-chain-breach-2500-companies-434000-cicd-pipelines), [SecurityWeek coverage](https://www.securityweek.com/over-2500-organizations-impacted-by-litellm-supply-chain-attack/), and [The Hacker News coverage](https://thehackernews.com/2026/08/malicious-litellm-releases-tied-to.html) about malicious LiteLLM releases 1.82.7 and 1.82.8 and a reconstructed exposure set across more than 2,500 organizations and about 434,000 CI/CD pipelines.

The [August 13 topic news collector source](../../../raw/processed/2026-08-13/ai-security-wiki-topic-news-collector-2026-08-13T233150Z.json) and [August 13 leaf update watch source](../../../raw/processed/2026-08-13/ai-security-wiki-leaf-update-watch-20260814T000301Z.json) add in-window impact updates. [SecurityWeek](https://www.securityweek.com/over-2500-organizations-impacted-by-litellm-supply-chain-attack/) reports [CloudSEK's](https://www.cloudsek.com/blog/ai-supply-chain-breach-2500-companies-434000-cicd-pipelines) assessment of more than 2,500 potentially exposed organizations and more than 430,000 CI/CD pipelines, while [The Hacker News](https://thehackernews.com/2026/08/malicious-litellm-releases-tied-to.html) frames the same malicious releases as tied to Trivy/TeamPCP compromise activity. [LiteLLM's project advisory](https://docs.litellm.ai/blog/security-update-march-2026) remains the affected-version and mitigation source: versions 1.82.7 and 1.82.8 were compromised, the package was live for about 40 minutes on March 24, 2026, and installs through 16:00 UTC that day should be treated as suspect.

Broad LiteLLM, PyPI, Trivy, CloudSEK, cloud-provider catalog facts, and general [AI supply-chain risk](../../../upstream-ai-wiki/techniques/ai-supply-chain-risk.md) belong upstream. General development-practice controls for secrets and package installs belong in the upstream AI development wiki's [sensitive data and supply-chain controls](../../../upstream-ai-dev-wiki/governance-and-risk/sensitive-data-and-supply-chain-controls.md). Locally, this page owns the security boundary where an AI gateway dependency can expose model-provider API keys, cloud credentials, CI/CD secrets, Kubernetes tokens, `.env` files, SSH keys, and gateway configuration reachable from compromised runners. The exposure dataset is not proof that every named organization was compromised.

## Security Impact

- Threat: a malicious AI gateway package can run inside build and deployment contexts that hold model, cloud, and CI/CD credentials.
- Affected boundary: LiteLLM PyPI releases 1.82.7 and 1.82.8, CI/CD runners, AI gateway configuration, model-provider secrets, cloud credentials, Kubernetes tokens, and build logs or artifacts.
- Exploit or incident status: confirmed malicious-package compromise with reconstructed exposure analysis; organization-level exposure counts remain possible exposure, not confirmed compromise.
- Mitigation state: remove affected package versions, rotate model-provider and cloud credentials exposed during the March 2026 window, inspect CI/CD runner logs and artifacts, and verify pinned dependency provenance.
- Confidence: high for CloudSEK's primary claims and in-window corroborating coverage; medium for any individual affected organization until primary incident evidence is available.
- Residual risk: AI gateway dependencies bridge application, model-provider, cloud, and build-system trust, so one compromised package can create multi-environment credential blast radius.

## Control Implications

- Treat AI gateway and model-router packages as privileged supply-chain components.
- Rotate LLM provider keys, CI/CD secrets, SSH keys, cloud keys, and Kubernetes tokens after a malicious AI gateway package is installed in build contexts.
- Pin and verify AI infrastructure package artifacts instead of relying only on package names and version ranges.
- Keep model gateway configuration out of broadly readable CI logs and artifacts.
- Preserve exposure analysis separately from confirmed compromise evidence so incident scope does not overstate victim impact.

## Authoritative Sources

- [August 12 topic news collector source](../../../raw/processed/2026-08-12/ai-security-wiki-topic-news-collector-2026-08-12T233146Z.json)
- [August 13 topic news collector source](../../../raw/processed/2026-08-13/ai-security-wiki-topic-news-collector-2026-08-13T233150Z.json)
- [August 13 leaf update watch source](../../../raw/processed/2026-08-13/ai-security-wiki-leaf-update-watch-20260814T000301Z.json)
- CloudSEK LiteLLM exposure research: https://www.cloudsek.com/blog/ai-supply-chain-breach-2500-companies-434000-cicd-pipelines
- SecurityWeek LiteLLM coverage: https://www.securityweek.com/over-2500-organizations-impacted-by-litellm-supply-chain-attack/
- The Hacker News LiteLLM coverage: https://thehackernews.com/2026/08/malicious-litellm-releases-tied-to.html

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [AI guardrail dependency compromise](ai-guardrail-dependency-compromise.md)
- [slopsquatting package hallucination risk](slopsquatting-package-hallucination-risk.md)
- [development agent credential isolation](../identity-and-access/development-agent-credential-isolation.md)
- Upstream AI wiki owns broad [AI supply-chain risk](../../../upstream-ai-wiki/techniques/ai-supply-chain-risk.md), LiteLLM, PyPI, and provider background.
- Upstream AI development wiki owns general CI/CD dependency-governance practice through [sensitive data and supply-chain controls](../../../upstream-ai-dev-wiki/governance-and-risk/sensitive-data-and-supply-chain-controls.md).

## Open Questions

- Which LiteLLM, PyPI, or law-enforcement primary updates refine the root cause, package timeline, or victim impact?
- Which affected organizations have independently confirmed credential use or compromise rather than possible exposure?

## Maintenance Notes

- Created on 2026-08-12 from the [August 12 topic collector](../../../raw/processed/2026-08-12/ai-security-wiki-topic-news-collector-2026-08-12T233146Z.json) after routing broad package, provider, and CI/CD practice context upstream.
- Updated on 2026-08-13 from the [August 13 topic collector](../../../raw/processed/2026-08-13/ai-security-wiki-topic-news-collector-2026-08-13T233150Z.json) and [August 13 watcher](../../../raw/processed/2026-08-13/ai-security-wiki-leaf-update-watch-20260814T000301Z.json) with in-window exposure-scale corroboration while preserving possible-exposure caveats.
