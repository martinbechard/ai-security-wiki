---
type: "Topic"
title: "Microsoft Agent Framework PyPI Package Compromise"
description: "Incident-response analysis for agent-framework PyPI versions 1.26.1 and 1.26.2 removed after a public credential-stealer report."
tags: ["infrastructure-and-supply-chain", "data-and-privacy", "identity-and-access"]
---

# Microsoft Agent Framework PyPI Package Compromise

## Current Understanding

The [November 18 topic collector source](../../../raw/processed/2026-11-18/ai-security-wiki-topic-news-collector-2026-11-18T003403Z.json) records a [public report in the upstream Microsoft Agent Framework repository](https://github.com/microsoft/agent-framework/issues/10411) that PyPI versions 1.26.1 and 1.26.2 installed Python `.pth` startup hooks that collected environment and credential material and sent it to a webhook. An upstream project member confirmed both releases were pulled from PyPI and that the project was investigating. [Broad Microsoft Agent Framework context](../../../upstream-ai-wiki/agentic-frameworks/microsoft-agent-framework.md) belongs upstream; this page owns the supply-chain incident and credential-boundary analysis.

The source names 1.26.0 as the known-good version at the time of the report. The reported cause, complete exposure scope, and final vendor remediation guidance remain under investigation, so the payload description remains attributed to the public report rather than stated as a completed root-cause finding.

## Security Impact

- Threat: a dependency startup hook can execute in every Python process and exfiltrate credentials reachable from developer, CI, and cloud environments.
- Affected boundary: PyPI `agent-framework` 1.26.1 and 1.26.2, Python startup, CI images, Azure identity, GitHub Actions, package caches, and build secrets.
- Exploit or incident status: public reproducible report with upstream confirmation that both releases were pulled; root cause and full impact are unresolved.
- Mitigation state: remove hooks before invoking `pip`, purge caches and mirrors, rebuild affected images, investigate logs, and rotate potentially exposed credentials.
- Confidence: medium-high for removal status and affected versions; medium for payload and exposure details pending final vendor findings.
- Residual risk: mirrors, caches, derived images, and credentials used while an affected installation was present may retain exposure after the registry releases are removed.

## Authoritative Sources

- [November 18 topic collector source](../../../raw/processed/2026-11-18/ai-security-wiki-topic-news-collector-2026-11-18T003403Z.json)
- [Microsoft Agent Framework issue 10411](https://github.com/microsoft/agent-framework/issues/10411)
- [PyPI `agent-framework` JSON metadata](https://pypi.org/pypi/agent-framework/json)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [AI guardrail dependency compromise](ai-guardrail-dependency-compromise.md)
- [AI supply-chain provenance credentialing](ai-supply-chain-provenance-credentialing.md)

## Open Questions

- What was the confirmed package-compromise path and complete exposure scope after the upstream investigation?
- Does the final upstream guidance change the known-good version or incident-response steps recorded here?

## Maintenance Notes

- Created on 2026-11-18 from the November 18 collector; revisit when Microsoft publishes its investigation or final remediation guidance.
