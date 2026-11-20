---
type: "Topic"
title: "agentic-radar untrusted dotenv API-key exposure"
description: "Security analysis for CVE-2026-132122, where scanning an untrusted repository can redirect credential-bearing OpenAI requests."
tags: ["data-and-privacy", "infrastructure-and-supply-chain"]
---

# agentic-radar untrusted dotenv API-key exposure

## Current Understanding

The [November 19 topic collector source](../../../raw/processed/2026-11-19/ai-security-wiki-topic-news-collector-2026-11-19T003503Z.json) records CVE-2026-132122 in agentic-radar 0.7.0 before 0.14.2. Product background belongs upstream and general scanner practice belongs in the development wiki; this leaf owns the untrusted-repository configuration and credential-egress boundary.

The scanner's `load_dotenv()` can load the repository environment file being scanned. Repository-controlled endpoint configuration can then redirect credential-bearing OpenAI requests from affected `openai-agents` or `--harden-prompts` scan paths outside the operator's intended provider boundary. The [upstream remediation commit](https://github.com/splx-ai/agentic-radar/commit/b99bb14fc1d9c4bab0bf2752d4547f79077960fe) and [v0.14.2 release](https://github.com/splx-ai/agentic-radar/releases/tag/v0.14.2) establish the stated remediation boundary.

## Security Impact

- Threat: an attacker-controlled repository can redirect credential-bearing model traffic during a security scan.
- Affected boundary: agentic-radar 0.7.0 before 0.14.2; scans of untrusted repositories when an OpenAI API key and affected OpenAI-backed scan paths are used.
- Exploit or incident status: public NVD/CNA-sourced vulnerability record; no confirmed exploitation or local incident is recorded.
- Mitigation state: upgrade to v0.14.2 or later, prevent scanners from loading repository-controlled environment files, pin provider endpoints outside scan targets, and rotate potentially exposed API keys.
- Confidence: high for the affected range and v0.14.2 remediation boundary from the [upstream commit](https://github.com/splx-ai/agentic-radar/commit/b99bb14fc1d9c4bab0bf2752d4547f79077960fe) and [release](https://github.com/splx-ai/agentic-radar/releases/tag/v0.14.2).
- Residual risk: analysis tools can still cross trust boundaries through project configuration, proxy settings, or inherited credentials unless runtime configuration is isolated.

## Authoritative Sources

- [November 19 topic collector source](../../../raw/processed/2026-11-19/ai-security-wiki-topic-news-collector-2026-11-19T003503Z.json)
- [CVE-2026-132122 NVD record](https://nvd.nist.gov/vuln/detail/CVE-2026-132122)
- [VulnCheck advisory](https://www.vulncheck.com/advisories/agentic-radar-0.7.0-before-0.14.2-openai-api-key-leak-via-untrusted-env-loading)
- [Upstream remediation commit](https://github.com/splx-ai/agentic-radar/commit/b99bb14fc1d9c4bab0bf2752d4547f79077960fe)
- [agentic-radar v0.14.2 release](https://github.com/splx-ai/agentic-radar/releases/tag/v0.14.2)

## Related Code

- [Upstream remediation commit](https://github.com/splx-ai/agentic-radar/commit/b99bb14fc1d9c4bab0bf2752d4547f79077960fe)

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [data and privacy](index.md)
- [untrusted repository configuration](../infrastructure-and-supply-chain/aider-conf-repository-command-execution.md)

## Open Questions

- Does the installed package provenance for any affected scan environment confirm use of v0.14.2 or later?

## Maintenance Notes

- Created on 2026-11-19 from the November 19 topic collector. Treat repository configuration as untrusted input during scanner startup and credential-routing decisions.
