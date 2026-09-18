---
type: "Topic"
title: "Gemini Enterprise Agent SDK Bucket Squatting RCE"
description: "Security analysis for CVE-2026-19407 bucket-squatting RCE and tenant-token theft in the Gemini Enterprise Agent Platform SDK for Python."
tags: ["infrastructure-and-supply-chain", "identity-and-access"]
---

# Gemini Enterprise Agent SDK Bucket Squatting RCE

## Current Understanding

The [September 17 topic collector source](../../../raw/processed/2026-09-17/ai-security-wiki-topic-news-collector-2026-09-17T233119Z.json) records CVE-2026-19407 for Google Cloud Gemini Enterprise Agent Platform SDK for Python before 1.166.1. Broad Google Cloud, Gemini, and agent-platform context belongs upstream; this page owns the local agent SDK supply-chain boundary where bucket resolution can become remote code execution and tenant-project token theft.

The CVE summary is concise, so the exact exploit preconditions and remediation details remain open until a Google Cloud advisory or release note is captured. The local control implication is still clear: agent platform SDKs that resolve storage buckets, artifacts, or generated resources need namespace ownership checks before code or credentials are loaded into a tenant project.

## Security Impact

- Threat: bucket squatting can cross from artifact or storage resolution into code execution and cloud-token compromise.
- Affected boundary: Google Cloud Gemini Enterprise Agent Platform SDK for Python before 1.166.1, tenant projects, SDK-managed storage resolution, and token access.
- Exploit or incident status: public CVE record; no local exploitation incident is recorded.
- Mitigation state: update to 1.166.1 or later and verify bucket ownership, artifact provenance, and token scope before running SDK-resolved resources.
- Confidence: medium for exact exploit path because the CVE summary is concise; high for affected package and fixed-version direction from CVE Services.
- Residual risk: agent SDKs often combine artifact lookup, code execution, and cloud credentials, so storage namespace mistakes can have larger blast radius than ordinary dependency confusion.

## Authoritative Sources

- [September 17 topic collector source](../../../raw/processed/2026-09-17/ai-security-wiki-topic-news-collector-2026-09-17T233119Z.json)
- [CVE-2026-19407 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-19407)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [AI supply chain provenance credentialing](ai-supply-chain-provenance-credentialing.md)
- [production agent identity and access controls](../identity-and-access/production-agent-identity-and-access-controls.md)

## Open Questions

- Which Google Cloud advisory or release note clarifies the vulnerable bucket-resolution path and tenant-token theft preconditions?

## Maintenance Notes

- Created on 2026-09-18 from the [September 17 topic collector](../../../raw/processed/2026-09-17/ai-security-wiki-topic-news-collector-2026-09-17T233119Z.json) as an agent SDK supply-chain and tenant-token boundary leaf.
