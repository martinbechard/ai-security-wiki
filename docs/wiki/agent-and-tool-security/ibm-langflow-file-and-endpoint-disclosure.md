---
type: "Topic"
title: "IBM Langflow file and endpoint disclosure"
description: "Security analysis for IBM Langflow OSS file, endpoint, API-key, and internal-network disclosure CVEs observed in the September 2026 NVD window."
tags: ["agent-and-tool-security", "data-and-privacy", "identity-and-access"]
---

# IBM Langflow file and endpoint disclosure

## Current Understanding

The [September 13 topic collector source](../../../raw/processed/2026-09-13/ai-security-wiki-topic-news-collector-2026-09-13T171540Z.json) says NVD returned 15 in-window Langflow records and sampled code-execution, session-isolation, scanner-bypass, and MCP subprocess issues. A direct NVD recheck during correction found additional in-window disclosure records, so this page records the disclosure boundary as a routed follow-up rather than claiming a complete reconciled inventory.

Representative in-window NVD records include cross-user File/Read File access, user-controlled API endpoint validation failures, arbitrary-file reads, internal-network URL validation failures, ambiguous CVE-2026-81265 metadata, and stale API-key session execution after user deactivation. Broad Langflow product context belongs upstream; this page owns the local file, endpoint, API-key, and internal-network disclosure boundary.

## Security Impact

- Threat: low-privilege flow execution, file components, API endpoints, URLs, and stale API keys can disclose other users' files or internal network resources.
- Affected boundary: IBM Langflow OSS 1.0.0 through 1.11.5 for the observed disclosure records; some older in-window records report 1.0.0 through 1.11.2 or 1.0.0 through 1.10.2.
- Exploit or incident status: public NVD/IBM PSIRT-sourced records; no local exploitation incident is recorded.
- Mitigation state: follow IBM bulletin remediation, bind file and endpoint access to user and flow ownership, validate user-controlled URLs, expire API keys on user deactivation, and isolate internal-network access from flow execution.
- Confidence: medium because direct NVD recheck broadened the inventory beyond the raw source's sampled records; high for the existence of the representative disclosure themes.
- Residual risk: this page needs direct CVE-level reconciliation before it can be used as a complete operations checklist.

## Authoritative Sources

- [September 13 topic collector source](../../../raw/processed/2026-09-13/ai-security-wiki-topic-news-collector-2026-09-13T171540Z.json)
- [IBM Langflow OSS bulletin](https://www.ibm.com/support/pages/node/7286666)
- [NVD Langflow keyword query](https://services.nvd.nist.gov/rest/json/cves/2.0?keywordSearch=Langflow)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [data and privacy](../data-and-privacy/index.md)
- [IBM Langflow public MCP endpoint RCE](ibm-langflow-public-mcp-endpoint-rce.md)
- [AI development context exclusion controls](../data-and-privacy/ai-development-context-exclusion-controls.md)

## Open Questions

- Which exact Langflow disclosure CVEs from the September 10-13 NVD window are part of IBM support node 7286666?
- Which of those records need separate leaves after direct CVE and fix-version reconciliation?

## Maintenance Notes

- Created on 2026-09-13 during correction after direct NVD recheck showed the raw source's sampled Langflow records were not a complete in-window disclosure inventory.
