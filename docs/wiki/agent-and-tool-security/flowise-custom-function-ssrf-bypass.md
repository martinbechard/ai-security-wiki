---
type: "Topic"
title: "Flowise Custom Function SSRF Bypass"
description: "Security analysis for CVE-2026-127214 package-subpath import bypass of Flowise Custom Function SSRF checks."
tags: ["agent-and-tool-security", "infrastructure-and-supply-chain"]
---

# Flowise Custom Function SSRF Bypass

## Current Understanding

The [November 15 collector source](../../../raw/processed/2026-11-15/ai-security-wiki-topic-news-collector-2026-11-15T003503Z.json) records [CVE-2026-127214](https://nvd.nist.gov/vuln/detail/CVE-2026-127214): an authenticated Flowise user with Chatflow or Agentflow create or update permission can import an allowlisted HTTP package subpath, such as `axios/dist/node/axios.cjs`, through `POST /api/v1/node-custom-function`. That bypasses the vm2 mock table and its `checkDenyList` validation. Broad Flowise product context belongs upstream; this leaf owns the permission-to-network containment boundary.

## Security Impact

- Threat: a permitted agent-workflow editor can make arbitrary GET or POST requests to loopback, internal-network, or cloud-metadata addresses.
- Affected boundary: Flowise through 3.1.4, Custom Function package-subpath imports, vm2 mocks, and the SSRF denylist.
- Exploit or incident status: public CVE with reproducible public researcher evidence; no active exploitation or local incident is established.
- Mitigation state: no maintainer-authored fixed release is identified in the collected evidence; restrict custom-function editing, deny private and metadata network egress independently of application checks, and remove affected deployment exposure until remediation is confirmed.
- Confidence: high for the reported condition and affected range; medium for remediation state because the advisory does not cite a maintainer patch.
- Residual risk: an application-level package allowlist is insufficient when package subpaths expose unmocked network clients.

## Authoritative Sources

- [November 15 collector source](../../../raw/processed/2026-11-15/ai-security-wiki-topic-news-collector-2026-11-15T003503Z.json)
- [GitHub advisory GHSA-vqvj-w792-h4m6](https://github.com/advisories/GHSA-vqvj-w792-h4m6)
- [NVD CVE-2026-127214](https://nvd.nist.gov/vuln/detail/CVE-2026-127214)
- [public technical evidence](https://github.com/soovwv/cve/blob/main/research/flowise-ssrf-bypass-via-subpath-import.md)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [Flowise LangChain Allowlist vm2 Sandbox Escape](flowise-langchain-allowlist-vm2-sandbox-escape.md)
- [Flowise HTTP MCP document-loader SSRF](flowise-http-mcp-document-loader-ssrf.md)

## Open Questions

- Which Flowise maintainer release removes the package-subpath SSRF bypass, and does its test coverage include loopback, private, and cloud-metadata destinations?

## Maintenance Notes

- Created on 2026-11-15 as a network-egress boundary distinct from Flowise vm2 command-execution and document-loader SSRF issues.
