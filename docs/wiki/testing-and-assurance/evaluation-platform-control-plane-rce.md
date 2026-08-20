---
type: "Topic"
title: "Evaluation Platform Control Plane RCE"
description: "Security analysis for remote-code-execution and static-key risks in AI evaluation platform control planes."
tags: ["testing-and-assurance", "infrastructure-and-supply-chain", "identity-and-access"]
---

# Evaluation Platform Control Plane RCE

## Current Understanding

The [August 18 topic news collector source](../../../raw/processed/2026-08-18/ai-security-wiki-topic-news-collector-2026-08-18T233017Z.json) records an UpTrain vulnerability cluster affecting a generative-AI evaluation platform. Broad UpTrain product background belongs upstream if it becomes durable; this page owns the local assurance-tool control-plane risk.

The cluster combines weak dashboard authentication, open CORS, a default static API key or user issue, and remote-code-execution primitives in `create_project`, `add_prompts`, and `new_run` parameters. [GitHub Security Lab's advisory](https://securitylab.github.com/advisories/GHSL-2024-198_GHSL-2024-199_Uptrain/) describes a zero-click path when an authenticated user visits a crafted website, while NVD published multiple CVEs for UpTrain 0.7.1 and prior inside the collection window.

## Security Impact

- Threat: an evaluation platform can become a code-execution and data-exposure path when browser-origin requests, static credentials, and parameterized evaluation checks share one control plane.
- Affected boundary: UpTrain 0.7.1 and prior; dashboard authentication, CORS, project creation, prompt addition, and run creation APIs.
- Exploit or incident status: public security research and vulnerability database records; no local exploitation evidence is recorded.
- Mitigation state: exact fixed version still needs direct confirmation before writing upgrade-only guidance.
- Confidence: high for advisory existence and affected-version boundary; medium for patched-state detail until maintainer release evidence is captured.
- Residual risk: assurance systems often process prompts, datasets, model outputs, and evaluator code, so compromise can contaminate both execution hosts and audit evidence.

## Control Implications

- Treat AI evaluation platforms as privileged control planes, not passive dashboards.
- Disable static default credentials and require authenticated, same-origin state-changing calls.
- Isolate evaluator execution from prompt and dataset storage.
- Audit evaluation runs created by unexpected users or browser-origin flows.

## Authoritative Sources

- [August 18 topic news collector source](../../../raw/processed/2026-08-18/ai-security-wiki-topic-news-collector-2026-08-18T233017Z.json)
- [GitHub Security Lab UpTrain advisory](https://securitylab.github.com/advisories/GHSL-2024-198_GHSL-2024-199_Uptrain/)
- [NVD CVE-2025-27621](https://nvd.nist.gov/vuln/detail/CVE-2025-27621)
- [NVD CVE-2025-27770](https://nvd.nist.gov/vuln/detail/CVE-2025-27770)
- [NVD CVE-2025-27771](https://nvd.nist.gov/vuln/detail/CVE-2025-27771)
- [NVD CVE-2025-27772](https://nvd.nist.gov/vuln/detail/CVE-2025-27772)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [testing and assurance](index.md)
- [AI-generated code security assurance](ai-generated-code-security-assurance.md)
- [AI supply chain provenance credentialing](../infrastructure-and-supply-chain/ai-supply-chain-provenance-credentialing.md)

## Open Questions

- Which UpTrain release or deployment guidance first removes the zero-click RCE chain and default-key exposure?

## Maintenance Notes

- Created on 2026-08-19 from the [August 18 topic collector](../../../raw/processed/2026-08-18/ai-security-wiki-topic-news-collector-2026-08-18T233017Z.json) after routing broad product context upstream.
