---
type: "Topic"
title: "MLflow GenAI Third-Party Scorer Deserialization RCE"
description: "Security analysis for CVE-2026-116692 request-selected scorer imports executing artifact-uploaded code."
tags: ["infrastructure-and-supply-chain"]
---

# MLflow GenAI Third-Party Scorer Deserialization RCE

## Current Understanding

The [October 27 collector source](../../../raw/processed/2026-10-27/ai-security-wiki-topic-news-collector-2026-10-27T232925Z.json) records [CVE-2026-116692](https://cveawg.mitre.org/api/cve/CVE-2026-116692) / [GHSA-26p8-2jq9-3vq9](https://github.com/mlflow/mlflow/security/advisories/GHSA-26p8-2jq9-3vq9). MLflow versions 3.12.0rc0 up to, but not including, 3.17.0 allow request-selected descendants beneath third-party scorer allowlisted modules. Where an attacker can upload an artifact under an approved package, scorer invocation can import and instantiate that Python code. Broad MLflow context belongs upstream; this page owns the evaluator plug-in supply-chain and runtime-execution boundary.

## Security Impact

- Threat: artifact-uploaded Python code is imported and instantiated through an evaluation scorer request.
- Affected boundary: MLflow GenAI third-party scorer allowlist, writable artifact packages, and Python import in versions 3.12.0rc0 up to, but not including, 3.17.0.
- Exploit or incident status: public maintainer advisory and CVE; no active exploitation or local incident is identified.
- Mitigation state: upgrade to 3.17.0, restrict experiment and run creation, prevent writable artifact paths from overlapping approved scorer namespaces, and review existing scorer packages.
- Confidence: high because the maintainer advisory, fix, and release are linked by the collected evidence.
- Residual risk: prefix-based allowlists remain unsafe when trusted namespaces are writable by untrusted principals.

## Authoritative Sources

- [October 27 collector source](../../../raw/processed/2026-10-27/ai-security-wiki-topic-news-collector-2026-10-27T232925Z.json)
- [CVE-2026-116692](https://cveawg.mitre.org/api/cve/CVE-2026-116692)
- [GHSA-26p8-2jq9-3vq9](https://github.com/mlflow/mlflow/security/advisories/GHSA-26p8-2jq9-3vq9)
- [MLflow 3.17.0 release](https://github.com/mlflow/mlflow/releases/tag/v3.17.0)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [MLflow DSPy pickle control bypass](mlflow-dspy-pickle-control-bypass.md)

## Open Questions

- Which existing scorer artifacts or package namespaces are writable by principals that can invoke evaluation runs?

## Maintenance Notes

- Created on 2026-10-27 from the collector; this leaf is separate from scorer SSRF because it concerns package trust and code execution.
