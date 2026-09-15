---
type: "Topic"
title: "IBM Langflow flow component SSRF"
description: "Security analysis for CVE-2026-12765 unauthenticated IBM Langflow flow component SSRF."
tags: ["agent-and-tool-security", "infrastructure-and-supply-chain"]
---

# IBM Langflow flow component SSRF

## Current Understanding

The [September 14 topic collector source](../../../raw/processed/2026-09-14/ai-security-wiki-topic-news-collector-2026-09-14T233124Z.json) records [CVE-2026-12765](https://cveawg.mitre.org/api/cve/CVE-2026-12765) for IBM Langflow OSS 1.0.0 through 1.10.2. Broad Langflow low-code workflow context belongs upstream; this page owns the local flow-component egress and private-network boundary.

The CVE says flow components lacked URL validation, allowing unauthenticated SSRF and unauthorized requests from the Langflow system. That can support internal network enumeration or access to internal-only services from a trusted runtime.

## Security Impact

- Threat: unauthenticated users can make Langflow issue server-side requests into internal networks or protected service surfaces.
- Affected boundary: IBM Langflow OSS 1.0.0 through 1.10.2, flow component URL handling, server-side egress, and private-address validation.
- Exploit or incident status: public CVE and IBM advisory reference; no local exploitation incident is recorded.
- Mitigation state: apply the IBM Langflow fix when available and enforce URL allowlists, DNS rebinding protections, redirect handling, and private-address blocking for flow components.
- Confidence: high for the SSRF boundary and affected versions; medium for fixed-release detail until IBM remediation wording is reconciled locally.
- Residual risk: low-code AI workflow components often blend user-controlled URLs, server credentials, and internal network placement, so egress controls must be central rather than component-specific.

## Authoritative Sources

- [September 14 topic collector source](../../../raw/processed/2026-09-14/ai-security-wiki-topic-news-collector-2026-09-14T233124Z.json)
- [CVE-2026-12765 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-12765)
- [IBM support advisory](https://www.ibm.com/support/pages/node/7285644)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [IBM Langflow file and endpoint disclosure](ibm-langflow-file-and-endpoint-disclosure.md)
- [Flowise HTTP MCP document-loader SSRF](flowise-http-mcp-document-loader-ssrf.md)
- [Agent network egress controls](agent-network-egress-controls.md)

## Open Questions

- Which Langflow flow components accepted URLs for CVE-2026-12765, and does the fix apply shared egress policy or per-component validation?

## Maintenance Notes

- Created on 2026-09-15 from the [September 14 topic collector](../../../raw/processed/2026-09-14/ai-security-wiki-topic-news-collector-2026-09-14T233124Z.json) as a flow-component egress-control leaf.
