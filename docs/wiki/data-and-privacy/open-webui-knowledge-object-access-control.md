---
type: "Topic"
title: "Open WebUI knowledge object access control"
description: "Security analysis for Open WebUI 0.11.0 cross-user knowledge attachment and cleanup ownership gaps."
tags: ["data-and-privacy", "identity-and-access"]
---

# Open WebUI knowledge object access control

## Current Understanding

The [September 8 topic collector source](../../../raw/processed/2026-09-08/ai-security-wiki-topic-news-collector-2026-09-08T233200Z.json) records NVD in-window updates for Open WebUI knowledge-object authorization issues fixed in 0.11.0. Broad product context belongs upstream; this page owns the data boundary where shared assistant knowledge bases, attachments, and cleanup operations must remain bound to the owning user or workspace.

The relevant records describe cross-user knowledge attachment reads and knowledge-base cleanup object-ownership gaps. The durable control is per-object authorization for retrieval attachments and maintenance operations, not just user authentication or UI-level visibility.

## Security Impact

- Threat: users can read or manipulate knowledge objects outside their intended ownership scope.
- Affected boundary: Open WebUI versions before 0.11.0; knowledge attachments and knowledge-base cleanup paths.
- Exploit or incident status: public NVD/CVE/GitHub advisory evidence; no local exploitation incident is recorded.
- Mitigation state: upgrade to Open WebUI 0.11.0 or later and enforce object ownership on read, attach, cleanup, and deletion paths.
- Confidence: high for NVD update timing and affected boundary; medium for exact exploit prerequisites.
- Residual risk: RAG systems can leak private context when vector-store or attachment permissions are less strict than chat permissions.

## Authoritative Sources

- [September 8 topic collector source](../../../raw/processed/2026-09-08/ai-security-wiki-topic-news-collector-2026-09-08T233200Z.json)
- [Open WebUI v0.11.0 release](https://github.com/open-webui/open-webui/releases/tag/v0.11.0)
- [CVE-2026-70481 NVD record](https://nvd.nist.gov/vuln/detail/CVE-2026-70481)
- [CVE-2026-70482 NVD record](https://nvd.nist.gov/vuln/detail/CVE-2026-70482)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [data and privacy](index.md)
- [MCP data movement exposure controls](mcp-data-movement-exposure-controls.md)
- [identity and access](../identity-and-access/index.md)

## Open Questions

- No open wiki questions are recorded for this topic.

## Maintenance Notes

- Created on 2026-09-08 from the September 8 topic collector after verifier correction split the Open WebUI release wave into focused security-boundary leaves.
