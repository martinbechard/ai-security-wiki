---
type: "Topic"
title: "Nextcloud MCP Webhook Vector Index Auth"
description: "Security analysis for CVE-2026-55640 unauthenticated Nextcloud MCP vector-index webhook operations."
tags: ["agent-and-tool-security", "data-and-privacy", "identity-and-access"]
---

# Nextcloud MCP Webhook Vector Index Auth

## Current Understanding

The [August 25 topic news collector source](../../../raw/processed/2026-08-25/ai-security-wiki-topic-news-collector-2026-08-25T183709Z.json) and [August 25 late topic news collector source](../../../raw/processed/2026-08-25/ai-security-wiki-topic-news-collector-2026-08-25T233059Z.json) record [CVE-2026-55640](https://nvd.nist.gov/vuln/detail/CVE-2026-55640) for Nextcloud MCP Server before 0.117.2. Broad Nextcloud and MCP server catalog context belongs upstream; this page owns the local AI connector webhook, vector-index integrity, and owner-binding boundary.

The [GitHub advisory](https://github.com/cbcoutinho/nextcloud-mcp-server/security/advisories/GHSA-8vh3-g2qg-2h2c) evidence says `POST /webhooks/nextcloud` accepted requests without authentication when `WEBHOOK_SECRET` was unset. Attackers could spoof `user.uid` values in webhook payloads and delete or re-index Qdrant vector embeddings for any user, making this both an authorization and retrieval-data integrity issue.

## Security Impact

- Threat: unauthenticated webhook calls can corrupt or delete vector embeddings used by an AI assistant connector.
- Affected boundary: Nextcloud MCP Server before 0.117.2; vector sync webhook and Qdrant embedding store; NVD records CVSS 3.1 CRITICAL 9.1 and CWE-306.
- Exploit or incident status: public vulnerability advisory; no local in-the-wild exploitation evidence is recorded.
- Mitigation state: upgrade to 0.117.2 or later, require webhook secrets at startup, and bind webhook events to authenticated source identities and owner checks.
- Confidence: high for advisory identity, affected range, and fixed version from NVD/GitHub evidence.
- Residual risk: retrieval indexes can be silently poisoned or erased when connector event provenance is not authenticated.

## Control Implications

- Fail startup when required webhook secrets are missing for AI data synchronization endpoints.
- Bind vector-index mutations to source-system event identity, target user, tenant, and document scope.
- Audit destructive embedding operations separately from ordinary retrieval queries.

## Authoritative Sources

- [August 25 topic news collector source](../../../raw/processed/2026-08-25/ai-security-wiki-topic-news-collector-2026-08-25T183709Z.json)
- [August 25 late topic news collector source](../../../raw/processed/2026-08-25/ai-security-wiki-topic-news-collector-2026-08-25T233059Z.json)
- [NVD CVE-2026-55640](https://nvd.nist.gov/vuln/detail/CVE-2026-55640)
- [GitHub advisory GHSA-8vh3-g2qg-2h2c](https://github.com/cbcoutinho/nextcloud-mcp-server/security/advisories/GHSA-8vh3-g2qg-2h2c)
- [nextcloud-mcp-server v0.117.2 tree](https://github.com/cbcoutinho/nextcloud-mcp-server/tree/v0.117.2)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [data and privacy](../data-and-privacy/index.md)
- [MCP data movement exposure controls](../data-and-privacy/mcp-data-movement-exposure-controls.md)
- [Headroom LLM memory owner header bypass](../identity-and-access/headroom-llm-memory-owner-header-bypass.md)

## Open Questions

- Does the 0.117.2 fix reject unset `WEBHOOK_SECRET` at startup, or only require a secret when one is configured?

## Maintenance Notes

- Created on 2026-08-26 from the [August 25 collectors](../../../raw/processed/2026-08-25/ai-security-wiki-topic-news-collector-2026-08-25T233059Z.json) as a connector webhook and vector-index authorization leaf.
