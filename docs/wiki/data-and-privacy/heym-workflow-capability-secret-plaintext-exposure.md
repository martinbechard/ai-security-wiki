---
type: "Topic"
title: "Heym Workflow Capability Secret Plaintext Exposure"
description: "Security analysis for CVE-2026-100862 plaintext storage and return of Heym workflow capability secrets."
tags: ["data-and-privacy", "identity-and-access"]
---

# Heym Workflow Capability Secret Plaintext Exposure

## Current Understanding

The [September 27 topic collector source](../../../raw/processed/2026-09-27/ai-security-wiki-topic-news-collector-2026-09-27T233044Z.json) records [CVE-2026-100862](https://nvd.nist.gov/vuln/detail/CVE-2026-100862) for heym before 0.0.91. Broad Heym product coverage belongs upstream; this page owns the local capability-secret storage, response, and replay boundary for workflow automation.

NVD, the [GitHub advisory](https://github.com/heymrun/heym/security/advisories/GHSA-6x65-w7q7-wg93), and [VulnCheck](https://www.vulncheck.com/advisories/heym-before-0.0.91-multiple-secrets-plaintext-storage) describe multiple secrets stored or returned in plaintext: webhook header-auth values, MCP API keys, portal session tokens, workflow execution JWTs, Discord interaction tokens, and global variables. Users with workflow read access, share/team membership, database or backup access, or log access can recover these secrets and replay them as the owner or workflow capability.

Affected boundary: heym before 0.0.91.

Exploit or incident status: public advisory disclosure; local sources do not record confirmed active exploitation.

Mitigation state: upgrade to 0.0.91 or later and rotate exposed workflow, MCP, webhook, portal, Discord, and global-variable secrets.

Confidence: high for affected boundary and secret classes from NVD plus linked advisory evidence.

Residual risk: secrets that appeared in logs, execution history, backups, or query strings remain exposed after patching unless rotated and downstream logs are handled as compromised.

## Authoritative Sources

- [September 27 topic collector source](../../../raw/processed/2026-09-27/ai-security-wiki-topic-news-collector-2026-09-27T233044Z.json)
- [NVD CVE-2026-100862](https://nvd.nist.gov/vuln/detail/CVE-2026-100862)
- [GitHub advisory GHSA-6x65-w7q7-wg93](https://github.com/heymrun/heym/security/advisories/GHSA-6x65-w7q7-wg93)
- [VulnCheck advisory](https://www.vulncheck.com/advisories/heym-before-0.0.91-multiple-secrets-plaintext-storage)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](../identity-and-access/index.md)
- [Heym workflow node SSRF guards](../agent-and-tool-security/heym-workflow-node-ssrf-guards.md)

## Open Questions

- No open wiki questions are recorded for this topic.

## Maintenance Notes

- Created on 2026-09-27 from the September 27 collector and NVD enrichment as a focused workflow capability-secret leaf.
