---
type: "Topic"
title: "runZero Platform MCP Authorization Bypass"
description: "Security analysis for CVE-2026-81846 user-controlled-key authorization bypass in runZero Platform MCP service."
tags: ["agent-and-tool-security", "identity-and-access"]
---

# runZero Platform MCP Authorization Bypass

## Current Understanding

The [September 1 topic collector source](../../../raw/processed/2026-09-01/ai-security-wiki-topic-news-collector-2026-09-01T233307Z.json) records [CVE-2026-81846](https://nvd.nist.gov/vuln/detail/CVE-2026-81846) for the runZero Platform MCP service. Broad runZero product context belongs upstream if cataloged; this page owns the local MCP authorization and asset-operation boundary.

NVD says runZero fixed an authorization bypass through user-controlled key in Platform MCP service version 5.1.260826.0. The source records low CVSS 3.5 with changed scope, so the local concern is not only severity score but the MCP service's ability to expose security-operations authority through key-bound decisions.

## Security Impact

- Threat: user-controlled identifiers can steer authorization inside an MCP service that may expose asset or security operations.
- Affected boundary: runZero Platform MCP service before 5.1.260826.0; fixed in 5.1.260826.0.
- Exploit or incident status: public NVD vulnerability record; no local exploitation evidence is recorded.
- Mitigation state: upgrade to 5.1.260826.0 or later and verify key-bound authorization checks.
- Confidence: high for affected and fixed version from NVD.
- Residual risk: MCP services need object-level authorization and audit evidence even for low-scored flaws.

## Control Implications

- Bind MCP service authorization to authenticated subject, tenant, and server-side object ownership.
- Treat user-controlled keys as lookup hints only after authorization has already selected the allowed object set.
- Log MCP authorization bypass attempts with subject, key, object, and decision.

## Authoritative Sources

- [September 2 leaf update watch source](../../../raw/processed/2026-09-02/ai-security-wiki-leaf-update-watch-20260903T000347Z.json)
- [September 1 topic collector source](../../../raw/processed/2026-09-01/ai-security-wiki-topic-news-collector-2026-09-01T233307Z.json)
- [NVD CVE-2026-81846](https://nvd.nist.gov/vuln/detail/CVE-2026-81846)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [MCP tool-level IAM authorization](../identity-and-access/mcp-tool-level-iam-authorization.md)
- [MCP data movement exposure controls](../data-and-privacy/mcp-data-movement-exposure-controls.md)

## Open Questions

- Which runZero MCP operations were reachable through the user-controlled key bypass?

## Maintenance Notes

- Updated on 2026-09-02 from the [September 2 leaf update watch source](../../../raw/processed/2026-09-02/ai-security-wiki-leaf-update-watch-20260903T000347Z.json) with direct in-window provenance while preserving the existing security boundary.
- Created on 2026-09-01 from the [September 1 topic collector](../../../raw/processed/2026-09-01/ai-security-wiki-topic-news-collector-2026-09-01T233307Z.json) as a Platform MCP authorization leaf.
