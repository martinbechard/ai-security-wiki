---
type: "Topic"
title: "Jet Admin Cloud Prompt-Injection Secret Exfiltration"
description: "Security analysis for CVE-2026-123965 prompt injection exposing environment configuration and credentials."
tags: ["model-and-prompt-security", "data-and-privacy"]
---

# Jet Admin Cloud Prompt-Injection Secret Exfiltration

## Current Understanding

The [November 13 collector source](../../../raw/processed/2026-11-13/ai-security-wiki-topic-news-collector-2026-11-13T192923-0500.json) records [CVE-2026-123965](https://nvd.nist.gov/vuln/detail/CVE-2026-123965): a free-account attacker could use prompt injection in Jet Admin Cloud Platform to expose `.env` configuration files and exfiltrate credentials. The record states that a sandbox component mitigated the issue around October 29, 2026, without a release version. Broad product context belongs upstream; this leaf owns containment of secret-bearing execution environments.

## Security Impact

- Threat: untrusted instructions cause an AI-enabled environment to expose secrets from its runtime configuration.
- Affected boundary: all versions are stated as affected; the evidence names a sandbox mitigation without a versioned release.
- Exploit or incident status: public CVE disclosure; no active exploitation or local incident is established.
- Mitigation state: verify sandbox coverage with the vendor, rotate potentially exposed credentials, and isolate secrets from model-visible execution contexts.
- Confidence: medium because the official vulnerability record supports disclosure and mitigation timing but lacks vendor version evidence.
- Residual risk: prompt filtering alone cannot protect secrets accessible to a tool or sandbox process.

## Authoritative Sources

- [November 13 collector source](../../../raw/processed/2026-11-13/ai-security-wiki-topic-news-collector-2026-11-13T192923-0500.json)
- [NVD CVE-2026-123965](https://nvd.nist.gov/vuln/detail/CVE-2026-123965)
- [CVE record](https://www.cve.org/CVERecord?id=CVE-2026-123965)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [model and prompt security](index.md)

## Open Questions

- Which Jet Admin deployment versions include the sandbox mitigation, and which secret-bearing resources are outside its boundary?

## Maintenance Notes

- Created on 2026-11-13; mitigation is retained as an unversioned vendor-record claim.
