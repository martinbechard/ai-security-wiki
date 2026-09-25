---
type: "Topic"
title: "IBM ContextForge MCP Gateway Log Path Traversal"
description: "Security analysis for CVE-2026-77825, where ContextForge MCP Gateway Admin API log retrieval can read log-like files outside the configured log directory."
tags: ["data-and-privacy", "agent-and-tool-security"]
---

# IBM ContextForge MCP Gateway Log Path Traversal

## Current Understanding

The [September 24 topic collector source](../../../raw/processed/2026-09-24/ai-security-wiki-topic-news-collector-2026-09-24T233211Z.json) records [CVE-2026-77825](https://cveawg.mitre.org/api/cve/CVE-2026-77825) for IBM ContextForge MCP Gateway 1.0.0 through 1.0.8. Broad ContextForge product context belongs upstream; this page owns the local Admin API log-download boundary and the downstream exposure risk for agent/tool traces.

The issue is distinct from [IBM ContextForge default credentials](../identity-and-access/ibm-contextforge-default-credentials.md), [IBM ContextForge jq filter credential disclosure](ibm-contextforge-jq-filter-credential-disclosure.md), and ContextForge DNS rebinding leaves. Here, path confinement used string-prefix comparison instead of boundary-aware validation, allowing an authenticated administrator to read certain log-like files outside the configured log directory.

## Security Impact

- Threat: authenticated admin log retrieval can cross the intended log-directory boundary and disclose adjacent log-like files.
- Affected boundary: IBM ContextForge MCP Gateway 1.0.0 through 1.0.8, Admin API log download, gateway-local filesystem paths, and model/tool trace logs.
- Exploit or incident status: public CVE, NVD, and IBM support evidence; no local in-the-wild exploitation evidence is recorded.
- Mitigation state: apply IBM's fixed update guidance for ContextForge MCP Gateway; harden log retention and avoid writing secrets into request or tool-call logs.
- Confidence: high for the affected range and path-traversal class from primary advisory records; medium for exact file classes accessible beyond configured logs.
- Residual risk: MCP gateways centralize agent traffic, so log-read bugs can expose prompts, tool arguments, request metadata, or accidentally logged credentials.

## Authoritative Sources

- [September 24 topic collector source](../../../raw/processed/2026-09-24/ai-security-wiki-topic-news-collector-2026-09-24T233211Z.json)
- [CVE-2026-77825 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-77825)
- [NVD CVE-2026-77825](https://nvd.nist.gov/vuln/detail/CVE-2026-77825)
- [IBM support advisory](https://www.ibm.com/support/pages/node/7289314)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [data and privacy](index.md)
- [agent and tool security](../agent-and-tool-security/index.md)
- [IBM ContextForge default credentials](../identity-and-access/ibm-contextforge-default-credentials.md)
- [IBM ContextForge jq filter credential disclosure](ibm-contextforge-jq-filter-credential-disclosure.md)

## Open Questions

- Which ContextForge update level first fixes CVE-2026-77825, and which file patterns were reachable outside the configured log directory?

## Maintenance Notes

- Created on 2026-09-25 from the [September 24 topic collector source](../../../raw/processed/2026-09-24/ai-security-wiki-topic-news-collector-2026-09-24T233211Z.json); maintain as a log-data boundary rather than broad ContextForge gateway coverage.
