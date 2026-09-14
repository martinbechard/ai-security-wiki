---
type: "Topic"
title: "n8n Instance AI summary prototype pollution"
description: "Security analysis for CVE-2026-86078 prototype pollution in n8n Instance AI workflow summaries."
tags: ["model-and-prompt-security", "agent-and-tool-security"]
---

# n8n Instance AI summary prototype pollution

## Current Understanding

The [September 13 topic collector source](../../../raw/processed/2026-09-13/ai-security-wiki-topic-news-collector-2026-09-13T171540Z.json) records in-window NVD update evidence for [CVE-2026-86078](https://cveawg.mitre.org/api/cve/CVE-2026-86078). Broad n8n product and workflow coverage belongs upstream; this page owns the local workflow-summary parsing and JavaScript object-state boundary.

The CVE describes prototype pollution in Instance AI workflow summaries where submitted workflow node names and connection keys could write to `Object.prototype` and disrupt later requests. The raw source gives the affected range as n8n before 2.37.7 and 2.38.0 before 2.38.2, with release references for both versions.

## Security Impact

- Threat: workflow metadata consumed by an AI summary path can poison shared JavaScript prototypes and affect later requests.
- Affected boundary: n8n Instance AI workflow summaries, submitted node names, connection keys, and JavaScript object construction.
- Exploit or incident status: public NVD/CVE/GitHub advisory evidence; no local exploitation incident is recorded.
- Mitigation state: upgrade to n8n 2.37.7 or 2.38.2 as applicable, reject prototype keys, and construct summary objects with safe maps or null prototypes.
- Confidence: medium-high because current-window qualification relies on visible NVD `lastModified` values while direct CVE publication was outside the window.
- Residual risk: AI summarization paths often receive low-trust metadata and need the same parser hardening as API input paths.

## Authoritative Sources

- [September 13 topic collector source](../../../raw/processed/2026-09-13/ai-security-wiki-topic-news-collector-2026-09-13T171540Z.json)
- [CVE-2026-86078 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-86078)
- [n8n advisory GHSA-679f-58pq-4v2c](https://github.com/n8n-io/n8n/security/advisories/GHSA-679f-58pq-4v2c)
- [n8n 2.37.7 release](https://github.com/n8n-io/n8n/releases/tag/n8n@2.37.7)
- [n8n 2.38.2 release](https://github.com/n8n-io/n8n/releases/tag/n8n@2.38.2)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [model and prompt security](index.md)
- [n8n Instance AI credential-origin confusion](../identity-and-access/n8n-instance-ai-credential-origin-confusion.md)
- [TOON decoder prototype pollution](toon-decoder-prototype-pollution.md)
- Upstream AI wiki owns broad [n8n-MCP](../../../upstream-ai-wiki/mcp-servers/n8n-mcp.md) coverage.

## Open Questions

- Which release line maps exactly to CVE-2026-86078's minimum fixed version?

## Maintenance Notes

- Created on 2026-09-13 from the [September 13 topic collector](../../../raw/processed/2026-09-13/ai-security-wiki-topic-news-collector-2026-09-13T171540Z.json) after verifier correction split prototype pollution from credential-origin confusion.
