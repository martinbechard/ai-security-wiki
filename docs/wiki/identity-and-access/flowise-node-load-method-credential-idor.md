---
type: "Topic"
title: "Flowise node-load-method credential IDOR"
description: "Security analysis for CVE-2026-90534 cross-workspace credential use through Flowise node-load-method."
tags: ["identity-and-access", "agent-and-tool-security", "data-and-privacy"]
---

# Flowise node-load-method credential IDOR

## Current Understanding

The [September 13 topic collector source](../../../raw/processed/2026-09-13/ai-security-wiki-topic-news-collector-2026-09-13T171540Z.json) records [CVE-2026-90534](https://cveawg.mitre.org/api/cve/CVE-2026-90534) for Flowise up to and including 3.1.3. Broad Flowise agent-builder context belongs upstream; this page owns the local cross-workspace credential authorization boundary.

The CVE, VulnCheck advisory, and GitHub advisory say `POST /api/v1/node-load-method/:name` lacked route-level permission checks and decrypted credentials by raw `Credential.id` without verifying workspace ownership. A low-privilege user or workspace API key in one workspace could supply another workspace's credential ID and make Flowise perform provider calls, including Google Drive, Google Sheets, and AWS DynamoDB metadata calls, using victim credentials. The raw secret was not returned. Flowise 3.1.4 is listed as fixed.

## Security Impact

- Threat: cross-workspace IDOR can turn provider credential identifiers into confused-deputy calls against a victim's connected data sources.
- Affected boundary: Flowise through 3.1.3, `node-load-method`, workspace API keys, credential IDs, and provider metadata/listing calls.
- Exploit or incident status: public CVE, VulnCheck, and GitHub advisory evidence; no local exploitation incident is recorded.
- Mitigation state: upgrade to Flowise 3.1.4 or later, enforce route-level authorization, and bind every credential lookup to workspace ownership before decrypting or using it.
- Confidence: high because the CVE/advisories align on endpoint, affected range, provider examples, and fixed version.
- Residual risk: even without raw secret disclosure, provider-side metadata calls can leak folder names, tables, object metadata, or confirm the existence of sensitive assets.

## Authoritative Sources

- [September 13 topic collector source](../../../raw/processed/2026-09-13/ai-security-wiki-topic-news-collector-2026-09-13T171540Z.json)
- [CVE-2026-90534 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-90534)
- [VulnCheck Flowise credential IDOR advisory](https://www.vulncheck.com/advisories/flowise-before-3.1.4-cross-workspace-credential-idor-via-node-load-method)
- [Flowise GitHub advisory GHSA-hqvm-7539-v83j](https://github.com/FlowiseAI/Flowise/security/advisories/GHSA-hqvm-7539-v83j)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [Flowise chatflow and agentflow deletion authorization](flowise-chatflow-agentflow-deletion-authorization.md)
- [AI provider override trust boundaries](../data-and-privacy/ai-provider-override-trust-boundaries.md)
- [Flowise agent node code execution](../agent-and-tool-security/flowise-agent-node-code-execution.md)

## Open Questions

- Which provider integrations expose sensitive metadata through `node-load-method` calls even when raw credentials are not returned?

## Maintenance Notes

- Created on 2026-09-13 from the [September 13 topic collector](../../../raw/processed/2026-09-13/ai-security-wiki-topic-news-collector-2026-09-13T171540Z.json) as a cross-workspace credential-authorization leaf.
