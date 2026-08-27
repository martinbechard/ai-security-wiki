---
type: "Topic"
title: "PraisonAI Agent Control Plane Advisory Deferrals"
description: "Evidence-preserving deferral for the unresolved PraisonAI August 25 GHSA mapping."
tags: ["agent-and-tool-security", "identity-and-access", "data-and-privacy"]
---

# PraisonAI Agent Control Plane Advisory Deferrals

## Current Understanding

The [August 25 topic news collector source](../../../raw/processed/2026-08-25/ai-security-wiki-topic-news-collector-2026-08-25T183709Z.json) records a broader PraisonAI advisory cluster than the local MCP origin and session leaves cover. The [August 26 leaf update watch source](../../../raw/processed/2026-08-26/ai-security-wiki-leaf-update-watch-20260827T000538Z.json) resolves the CVE mappings for `web_crawl` SSRF, AgentServer/API-key authentication enforcement, and `ast_grep_rewrite` approval bypass into focused leaves. Broad PraisonAI product and framework context belongs upstream in the AI wiki; this page now preserves only the unresolved GHSA-pvph-5j39-v8qc evidence.

Resolved PraisonAI mappings now live in focused pages:

- [PraisonAI web_crawl SSRF](praisonai-web-crawl-ssrf.md) owns CVE-2026-55525 and GHSA-5r34-2g38-6569.
- [PraisonAI AgentServer API Key Auth Enforcement](../identity-and-access/praisonai-agentserver-api-key-auth-enforcement.md) owns CVE-2026-55528/GHSA-7g3p-92qq-8wvh and CVE-2026-55541/GHSA-pvxx-r596-f5qj.
- [PraisonAI ast_grep_rewrite approval bypass](praisonai-ast-grep-rewrite-approval-bypass.md) owns CVE-2026-55530 and GHSA-cfxv-8fw8-rwpv.

The [August 25 late topic news collector source](../../../raw/processed/2026-08-25/ai-security-wiki-topic-news-collector-2026-08-25T233059Z.json) separately breaks out CVE-2026-55529, CVE-2026-55531, and CVE-2026-55532, which are already mapped to focused local leaves.

The remaining [GHSA-pvph-5j39-v8qc](https://github.com/MervinPraison/PraisonAI/security/advisories/GHSA-pvph-5j39-v8qc) mapping is still not resolved by the watcher update and should stay as explicit deferral evidence until a source ties it to a CVE and affected boundary.

## Security Impact

- Threat: one remaining PraisonAI GHSA may represent an additional control-plane security boundary not yet mapped to a CVE locally.
- Affected boundary: GHSA-pvph-5j39-v8qc; exact CVE, endpoint, affected package, and fixed version are not yet identified locally.
- Exploit or incident status: public NVD/GitHub advisory cluster; no local exploitation incident is recorded.
- Mitigation state: not yet identified for GHSA-pvph-5j39-v8qc; resolved mappings are covered in focused sibling leaves.
- Confidence: medium that one unresolved GHSA remains from the cluster; high-confidence mappings moved to focused leaves.
- Residual risk: leaving GHSA-pvph-5j39-v8qc unresolved can under-document one PraisonAI control-plane boundary.

## Authoritative Sources

- [August 25 topic news collector source](../../../raw/processed/2026-08-25/ai-security-wiki-topic-news-collector-2026-08-25T183709Z.json)
- [August 26 leaf update watch source](../../../raw/processed/2026-08-26/ai-security-wiki-leaf-update-watch-20260827T000538Z.json)
- [PraisonAI 4.6.58 release](https://github.com/MervinPraison/PraisonAI/releases/tag/v4.6.58)
- [PraisonAI GitHub security advisories](https://github.com/MervinPraison/PraisonAI/security/advisories)
- [GHSA-5r34-2g38-6569](https://github.com/MervinPraison/PraisonAI/security/advisories/GHSA-5r34-2g38-6569)
- [GHSA-7g3p-92qq-8wvh](https://github.com/MervinPraison/PraisonAI/security/advisories/GHSA-7g3p-92qq-8wvh)
- [GHSA-cfxv-8fw8-rwpv](https://github.com/MervinPraison/PraisonAI/security/advisories/GHSA-cfxv-8fw8-rwpv)
- [GHSA-pvph-5j39-v8qc](https://github.com/MervinPraison/PraisonAI/security/advisories/GHSA-pvph-5j39-v8qc)
- [GHSA-pvxx-r596-f5qj](https://github.com/MervinPraison/PraisonAI/security/advisories/GHSA-pvxx-r596-f5qj)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [PraisonAI MCP origin and CSRF instruction persistence](praisonai-mcp-origin-and-csrf-instruction-persistence.md)
- [PraisonAI MCP session exhaustion](praisonai-mcp-session-exhaustion.md)
- [PraisonAI web_crawl SSRF](praisonai-web-crawl-ssrf.md)
- [PraisonAI ast_grep_rewrite approval bypass](praisonai-ast-grep-rewrite-approval-bypass.md)
- [PraisonAI AgentServer API Key Auth Enforcement](../identity-and-access/praisonai-agentserver-api-key-auth-enforcement.md)
- [agent network egress controls](agent-network-egress-controls.md)
- [approval metadata access control](approval-metadata-access-control.md)

## Open Questions

- Which CVE and affected boundary, if any, maps to GHSA-pvph-5j39-v8qc?

## Maintenance Notes

- Created on 2026-08-26 as an explicit verifier-requested deferral page for PraisonAI advisories present in the early August 25 collector but not yet independently synthesized.
- Updated on 2026-08-27 from the [August 26 leaf watcher](../../../raw/processed/2026-08-26/ai-security-wiki-leaf-update-watch-20260827T000538Z.json) to normalize CVE-to-GHSA mappings and fixed-version evidence.
- Updated on 2026-08-27 after verifier correction split resolved PraisonAI mappings into focused SSRF, authentication, and approval-bypass leaves; this page retains only GHSA-pvph-5j39-v8qc.
