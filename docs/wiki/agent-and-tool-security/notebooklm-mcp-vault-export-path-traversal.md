---
type: "Topic"
title: "NotebookLM MCP Vault Export Path Traversal"
description: "Security analysis for CVE-2026-61647 path traversal in NotebookLM MCP vault export."
tags: ["agent-and-tool-security", "infrastructure-and-supply-chain"]
---

# NotebookLM MCP Vault Export Path Traversal

## Current Understanding

The [September 21 topic collector source](../../../raw/processed/2026-09-21/ai-security-wiki-topic-news-collector-2026-09-21T233156Z.json) records [CVE-2026-61647](https://cveawg.mitre.org/api/cve/CVE-2026-61647) for roomi-fields NotebookLM MCP versions 1.6.0 through 2.0.2. Broad NotebookLM and MCP catalog context belongs upstream; this page owns the local export-tool containment boundary.

`POST /batch-to-vault` and the `batch_to_vault` MCP tool accept attacker-controlled `vault_dir` and `slug_prefix` values that can write Markdown and JSON outside the intended vault. The source records 2.0.3 as the mitigation boundary, with `slug_prefix` sanitization and path containment when `NOTEBOOKLM_VAULT_ROOT` is configured; containment is not enabled when that variable is unset.

## Security Impact

- Threat: generated or attacker-controlled export parameters can become server-side filesystem writes outside the configured vault.
- Affected boundary: NotebookLM MCP 1.6.0 through 2.0.2; `batch-to-vault` HTTP endpoint and `batch_to_vault` MCP tool.
- Exploit or incident status: public CVE and GitHub advisory; no local in-the-wild incident is recorded.
- Mitigation state: upgrade to 2.0.3 or later, configure `NOTEBOOKLM_VAULT_ROOT`, normalize paths after slug handling, and reject writes that escape the server-owned vault root.
- Confidence: high because CVE Services and NVD agree with the project advisory.
- Residual risk: local vault and note-export tools remain sensitive when LLM output, tool arguments, or user-supplied names can select write paths.

## Authoritative Sources

- [September 21 topic collector source](../../../raw/processed/2026-09-21/ai-security-wiki-topic-news-collector-2026-09-21T233156Z.json)
- [CVE-2026-61647 JSON](https://cveawg.mitre.org/api/cve/CVE-2026-61647)
- [NVD CVE-2026-61647](https://nvd.nist.gov/vuln/detail/CVE-2026-61647)
- [GitHub advisory GHSA-jjhp-8crj-mppq](https://github.com/roomi-fields/notebooklm-mcp/security/advisories/GHSA-jjhp-8crj-mppq)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [Agent tool filesystem path containment](../infrastructure-and-supply-chain/agent-tool-filesystem-path-containment.md)

## Open Questions

- Is `NOTEBOOKLM_VAULT_ROOT` documented as required hardening for every 2.0.3 deployment profile?

## Maintenance Notes

- Created on 2026-09-21 from the [September 21 topic collector source](../../../raw/processed/2026-09-21/ai-security-wiki-topic-news-collector-2026-09-21T233156Z.json); preserve the conditional mitigation note for deployments where `NOTEBOOKLM_VAULT_ROOT` is unset.
