---
type: "Topic"
title: "swagger-testcase-mcp Swagger Parser SSRF"
description: "Security analysis for CVE-2026-19765 untrusted Swagger input handling in swagger-testcase-mcp."
tags: ["agent-and-tool-security", "model-and-prompt-security", "infrastructure-and-supply-chain"]
---

# swagger-testcase-mcp Swagger Parser SSRF

## Current Understanding

The [August 15 topic news collector source](../../../raw/processed/2026-08-15/ai-security-wiki-topic-news-collector-2026-08-15T233140Z.json) records CVE-2026-19765 for swagger-testcase-mcp, a Python MCP server package that consumes Swagger or OpenAPI descriptions. The collector describes code injection through a crafted Swagger file and calls for verification of authoritative CVE fields. A [CVE Program search result](https://www.cve.org/CVERecord?id=CVE-2026-19765) and a [VulDB CVE page](https://vuldb.com/cve/CVE-2026-19765) instead describe server-side request forgery in the `loadSource` function of `src/utils/swagger-parser.ts` in the `fetch_swagger` component.

Broad API-test generation workflow guidance belongs upstream in the AI development wiki, and broad MCP package catalog context belongs upstream in the AI wiki. This local page owns the untrusted API-spec ingestion boundary: agent-visible OpenAPI documents are data inputs, but MCP servers that fetch or parse them can expose network access, code paths, credentials, or internal metadata if validation is weak.

## Security Impact

- Threat: a crafted Swagger or OpenAPI source can steer MCP-side fetch or parser behavior toward SSRF and possibly execution-adjacent behavior depending on implementation.
- Affected boundary: swagger-testcase-mcp package deployments before the fixed release identified by downstream vulnerability databases, especially agents that accept external API descriptions.
- Exploit or incident status: disclosed vulnerability database record; [VulDB](https://vuldb.com/cve/CVE-2026-19765) claims remote exploitability and exploit availability, but primary CVE details need confirmation.
- Mitigation state: update to the fixed package release once confirmed, restrict outbound network reachability, block metadata and internal service ranges, and parse API descriptions in an isolated runtime.
- Confidence: high that CVE-2026-19765 is an MCP package vulnerability around Swagger source ingestion; medium for exact weakness class because the collector, CVE Program search-result text, and VulDB page differ between code-injection and SSRF wording.
- Residual risk: agent workflows often treat API descriptions as benign documentation even when the MCP server fetches, dereferences, or executes parser logic against attacker-controlled URLs.

## Control Implications

- Classify external Swagger, OpenAPI, Postman, and API catalog documents as untrusted content when agent tools parse or fetch them.
- Enforce egress policy and deny internal address ranges for MCP fetch utilities.
- Keep parsing sandboxes separate from credentials used to generate tests or call target APIs.
- Preserve CVE, affected commit or version, parser component, exploit status, and fixed-version evidence in dependency risk records.

## Authoritative Sources

- [August 15 topic news collector source](../../../raw/processed/2026-08-15/ai-security-wiki-topic-news-collector-2026-08-15T233140Z.json)
- CVE Program record: https://www.cve.org/CVERecord?id=CVE-2026-19765
- Snyk advisory: https://security.snyk.io/vuln/SNYK-PYTHON-SWAGGERTESTCASEMCP-13016954
- VulDB CVE page: https://vuldb.com/cve/CVE-2026-19765

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [mcp-webresearch browser SSRF](mcp-webresearch-browser-ssrf.md)
- [agent network egress controls](agent-network-egress-controls.md)
- [agent build and dependency execution boundaries](../infrastructure-and-supply-chain/agent-build-and-dependency-execution-boundaries.md)
- Upstream AI development wiki owns general API-test generation workflow practice.

## Open Questions

- Does the authoritative CVE record classify CVE-2026-19765 as SSRF, code injection, or both?
- Which package version first fixes the vulnerable `loadSource` behavior?

## Maintenance Notes

- Created on 2026-08-15 from the [August 15 topic collector](../../../raw/processed/2026-08-15/ai-security-wiki-topic-news-collector-2026-08-15T233140Z.json) after preserving the source conflict between code-injection and SSRF classification.
