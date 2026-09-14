---
type: "Topic"
title: "n8n Instance AI credential-origin confusion"
description: "Security analysis for CVE-2026-86074 n8n Instance AI credential setup accepting mismatched verification origins."
tags: ["identity-and-access", "agent-and-tool-security"]
---

# n8n Instance AI credential-origin confusion

## Current Understanding

The [September 13 topic collector source](../../../raw/processed/2026-09-13/ai-security-wiki-topic-news-collector-2026-09-13T171540Z.json) records in-window NVD update evidence for [CVE-2026-86074](https://cveawg.mitre.org/api/cve/CVE-2026-86074). Broad n8n product and workflow coverage belongs upstream; this page owns the local Instance AI credential-verification origin boundary.

The CVE describes a credential setup flow that accepted a fetched credential test or verification URL without ensuring it matched the workflow node origin. Attacker-controlled content could influence authenticated requests, redirects, or probes to another origin. The raw source gives the affected range as n8n before 2.37.7 and 2.38.0 before 2.38.2, with release references for both versions.

## Security Impact

- Threat: AI-assisted credential setup can send authenticated verification traffic to attacker-influenced origins when verification URLs are not bound to the originating node.
- Affected boundary: n8n Instance AI credential setup, workflow node origin, fetched verification URLs, and authenticated provider test requests.
- Exploit or incident status: public NVD/CVE/GitHub advisory evidence; no local exploitation incident is recorded.
- Mitigation state: upgrade to n8n 2.37.7 or 2.38.2 as applicable and enforce same-origin or explicit allow-list binding for credential verification URLs.
- Confidence: medium-high because current-window qualification relies on visible NVD `lastModified` values while direct CVE publication was outside the window.
- Residual risk: credential setup assistants need origin binding before following redirects or rendering provider-supplied verification content.

## Authoritative Sources

- [September 13 topic collector source](../../../raw/processed/2026-09-13/ai-security-wiki-topic-news-collector-2026-09-13T171540Z.json)
- [CVE-2026-86074 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-86074)
- [n8n advisory GHSA-q5wm-mgqx-fv2f](https://github.com/n8n-io/n8n/security/advisories/GHSA-q5wm-mgqx-fv2f)
- [n8n 2.37.7 release](https://github.com/n8n-io/n8n/releases/tag/n8n@2.37.7)
- [n8n 2.38.2 release](https://github.com/n8n-io/n8n/releases/tag/n8n@2.38.2)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [n8n Instance AI summary prototype pollution](../model-and-prompt-security/n8n-instance-ai-summary-prototype-pollution.md)
- [n8n Workflow Tool credential exfiltration](../agent-and-tool-security/n8n-workflow-tool-credential-exfiltration.md)
- Upstream AI wiki owns broad [n8n-MCP](../../../upstream-ai-wiki/mcp-servers/n8n-mcp.md) coverage.

## Open Questions

- Which release line maps exactly to CVE-2026-86074's minimum fixed version?

## Maintenance Notes

- Created on 2026-09-13 from the [September 13 topic collector](../../../raw/processed/2026-09-13/ai-security-wiki-topic-news-collector-2026-09-13T171540Z.json) after verifier correction split credential-origin confusion from prototype pollution.
