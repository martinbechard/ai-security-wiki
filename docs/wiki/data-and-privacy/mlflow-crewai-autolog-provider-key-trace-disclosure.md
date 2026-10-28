---
type: "Topic"
title: "MLflow CrewAI Autolog Provider-Key Trace Disclosure"
description: "Security analysis for CVE-2026-116691 plaintext provider-key export through MLflow CrewAI autologging."
tags: ["data-and-privacy"]
---

# MLflow CrewAI Autolog Provider-Key Trace Disclosure

## Current Understanding

The [October 27 collector source](../../../raw/processed/2026-10-27/ai-security-wiki-topic-news-collector-2026-10-27T232925Z.json) records [CVE-2026-116691](https://cveawg.mitre.org/api/cve/CVE-2026-116691) / [GHSA-j7qq-vr8c-xvw3](https://github.com/mlflow/mlflow/security/advisories/GHSA-j7qq-vr8c-xvw3). MLflow [CrewAI](../../../upstream-ai-wiki/agentic-frameworks/crewai.md) autologging from 2.19.0 up to, but not including, 3.17.0 can stringify nested agent values containing provider API keys and send them in plaintext to the MLflow trace backend or an OTLP destination. Broad MLflow and CrewAI context belongs upstream; this page owns the sensitive-agent-state to observability boundary.

## Security Impact

- Threat: provider API keys persist in trace stores or traverse OTLP export paths where more readers or systems can access them.
- Affected boundary: MLflow CrewAI autologging to MLflow traces or OTLP destinations in versions 2.19.0 up to, but not including, 3.17.0.
- Exploit or incident status: public maintainer advisory and CVE; no active exploitation or local trace disclosure is identified.
- Mitigation state: upgrade to 3.17.0, rotate potentially exported provider keys, redact nested agent values before serialization, and restrict trace-reader and collector access.
- Confidence: high because the maintainer advisory, fix, and release are linked by the collected evidence.
- Residual risk: trace data may remain sensitive even after direct key fields are redacted, including prompts, tool arguments, and model responses.

## Authoritative Sources

- [October 27 collector source](../../../raw/processed/2026-10-27/ai-security-wiki-topic-news-collector-2026-10-27T232925Z.json)
- [CVE-2026-116691](https://cveawg.mitre.org/api/cve/CVE-2026-116691)
- [GHSA-j7qq-vr8c-xvw3](https://github.com/mlflow/mlflow/security/advisories/GHSA-j7qq-vr8c-xvw3)
- [MLflow 3.17.0 release](https://github.com/mlflow/mlflow/releases/tag/v3.17.0)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [data and privacy](index.md)
- [CrewAI upstream context](../../../upstream-ai-wiki/agentic-frameworks/crewai.md)

## Open Questions

- Which trace retention locations and OTLP destinations should be searched before provider-key rotation is considered complete?

## Maintenance Notes

- Created on 2026-10-27 from the collector; retain broad observability product coverage upstream.
