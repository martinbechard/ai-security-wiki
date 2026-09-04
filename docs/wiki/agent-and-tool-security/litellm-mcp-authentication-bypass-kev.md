---
type: "Topic"
title: "LiteLLM MCP Authentication Bypass KEV"
description: "Security analysis for CVE-2026-59822 LiteLLM MCP Streamable HTTP authentication bypass and CISA KEV exploitation status."
tags: ["agent-and-tool-security", "identity-and-access"]
---

# LiteLLM MCP Authentication Bypass KEV

## Current Understanding

The [September 2 topic collector source](../../../raw/processed/2026-09-02/ai-security-wiki-topic-news-collector-2026-09-02T233120Z.json) records [CVE-2026-59822](https://nvd.nist.gov/vuln/detail/CVE-2026-59822) for LiteLLM before 1.84.0. Broad LiteLLM model-gateway coverage stays upstream; this page owns the local security boundary where the MCP Streamable HTTP endpoint can be reached without a valid LiteLLM key.

[NVD](https://nvd.nist.gov/vuln/detail/CVE-2026-59822) and the linked [GitHub advisory GHSA-7488-6r32-c95q](https://github.com/BerriAI/litellm/security/advisories/GHSA-7488-6r32-c95q) describe a fabricated `Authorization` header that triggers OAuth2 passthrough fallback, replaces failed LiteLLM key validation with an empty `UserAPIKeyAuth` object, and permits access to MCP tools. [CISA KEV](https://www.cisa.gov/known-exploited-vulnerabilities-catalog?field_cve=CVE-2026-59822) added the vulnerability on 2026-09-02, so this page treats exploitation as active rather than only theoretically disclosed.

The [September 3 leaf update watch source](../../../raw/processed/2026-09-03/ai-security-wiki-leaf-update-watch-20260904T000442Z.json) records a [direct CVE update](https://cveawg.mitre.org/api/cve/CVE-2026-59822) on 2026-09-03 and preserves the CISA KEV due date of 2026-09-16. The same evidence adds fix references for the vendor advisory, pull request, commit, and v1.84.0 release, making the mitigation state concrete enough for upgrade-tracking and exposed-endpoint audit work.

## Security Impact

- Threat: unauthenticated requests can reach MCP tools through a model-gateway endpoint.
- Affected boundary: LiteLLM before 1.84.0; MCP Streamable HTTP endpoint; OAuth2 passthrough and `UserAPIKeyAuth` fallback.
- Exploit or incident status: active exploitation according to CISA KEV on 2026-09-02.
- Mitigation state: upgrade to 1.84.0 or later and audit exposed MCP Streamable HTTP endpoints for unauthenticated access.
- Confidence: high from NVD, CISA KEV, and vendor advisory references.
- Residual risk: MCP endpoints exposed through model gateways need direct authentication tests because gateway auth fallbacks can silently create tool access.

## Control Implications

- Test MCP transport endpoints with missing, malformed, and cross-scheme authorization headers.
- Treat OAuth passthrough as a privileged delegation path that must fail closed.
- Prioritize KEV-listed AI gateway issues for internet-facing and internally exposed model infrastructure.

## Authoritative Sources

- [September 2 topic collector source](../../../raw/processed/2026-09-02/ai-security-wiki-topic-news-collector-2026-09-02T233120Z.json)
- [September 3 leaf update watch source](../../../raw/processed/2026-09-03/ai-security-wiki-leaf-update-watch-20260904T000442Z.json)
- [NVD CVE-2026-59822](https://nvd.nist.gov/vuln/detail/CVE-2026-59822)
- [CISA KEV CVE-2026-59822](https://www.cisa.gov/known-exploited-vulnerabilities-catalog?field_cve=CVE-2026-59822)
- [GitHub advisory GHSA-7488-6r32-c95q](https://github.com/BerriAI/litellm/security/advisories/GHSA-7488-6r32-c95q)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [MCP tool-level IAM authorization](../identity-and-access/mcp-tool-level-iam-authorization.md)
- [MCP SDK transport header handling](../infrastructure-and-supply-chain/mcp-sdk-transport-header-handling.md)

## Open Questions

- Which deployed LiteLLM MCP endpoints were exploited before the 1.84.0 mitigation?

## Maintenance Notes

- Created on 2026-09-02 from the [September 2 topic collector](../../../raw/processed/2026-09-02/ai-security-wiki-topic-news-collector-2026-09-02T233120Z.json) after routing broad LiteLLM and model-gateway context upstream.
- Updated on 2026-09-03 from the [September 3 leaf update watch](../../../raw/processed/2026-09-03/ai-security-wiki-leaf-update-watch-20260904T000442Z.json) with CVE update evidence, CISA KEV remediation due date, and concrete v1.84.0 fix references.
