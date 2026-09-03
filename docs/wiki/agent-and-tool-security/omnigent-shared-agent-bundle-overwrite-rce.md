---
type: "Topic"
title: "Omnigent Shared Agent Bundle Overwrite RCE"
description: "Security analysis for CVE-2026-62674 Omnigent shared or template agent bundle overwrite command execution."
tags: ["agent-and-tool-security", "infrastructure-and-supply-chain"]
---

# Omnigent Shared Agent Bundle Overwrite RCE

## Current Understanding

The [August 22 topic news collector source](../../../raw/processed/2026-08-22/ai-security-wiki-topic-news-collector-2026-08-22T233049Z.json) records CVE-2026-62674 for Omnigent before 0.3.0. Broad Omnigent product context belongs upstream if it becomes durable; this page owns the local control-plane boundary where shared or template agent bundles become future runner execution authority.

The [NVD record](https://nvd.nist.gov/vuln/detail/CVE-2026-62674) and linked [GitHub advisory GHSA-jrrm-9hc7-2v3h](https://github.com/omnigent-ai/omnigent/security/advisories/GHSA-jrrm-9hc7-2v3h) describe an authenticated user with edit access overwriting a shared or template agent bundle, adding a stdio MCP server, and causing future sessions using that shared agent to launch attacker-controlled commands with runner permissions. The [0.3.0 release](https://github.com/omnigent-ai/omnigent/releases/tag/v0.3.0) is the patch boundary captured by the collector.

## Security Impact

- Threat: editable shared agent bundles can become persistent executable control-plane artifacts for later users or sessions.
- Affected boundary: Omnigent before 0.3.0 shared/template agent bundles and stdio MCP server declarations.
- Exploit or incident status: public NVD and GitHub advisory evidence; no local exploitation evidence is recorded.
- Mitigation state: upgrade to 0.3.0 or later, review shared bundles as code, and require provenance plus approval for executable MCP declarations.
- Confidence: high for advisory identifiers and fix version from NVD, GitHub advisory, and release evidence.
- Residual risk: shared agent templates need ownership, review, and revocation controls because one edit can affect future runner sessions.

## Authoritative Sources

- [September 2 topic collector source](../../../raw/processed/2026-09-02/ai-security-wiki-topic-news-collector-2026-09-02T233120Z.json)
- [August 22 topic news collector source](../../../raw/processed/2026-08-22/ai-security-wiki-topic-news-collector-2026-08-22T233049Z.json)
- [August 23 leaf update watch source](../../../raw/processed/2026-08-23/ai-security-wiki-leaf-update-watch-20260824T000259Z.json)
- [NVD CVE-2026-62674](https://nvd.nist.gov/vuln/detail/CVE-2026-62674)
- [GitHub advisory GHSA-jrrm-9hc7-2v3h](https://github.com/omnigent-ai/omnigent/security/advisories/GHSA-jrrm-9hc7-2v3h)
- [Omnigent 0.3.0 release](https://github.com/omnigent-ai/omnigent/releases/tag/v0.3.0)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [CodeWhale agent control plane vulnerabilities](codewhale-agent-control-plane-vulnerabilities.md)
- [coding agent command approval boundaries](coding-agent-command-approval-boundaries.md)

## Open Questions

- Which Omnigent roles can edit shared or template bundles after the 0.3.0 fix?

## Maintenance Notes

- Updated on 2026-09-02 from the [September 2 topic collector source](../../../raw/processed/2026-09-02/ai-security-wiki-topic-news-collector-2026-09-02T233120Z.json) with in-window advisory provenance while keeping broad product context upstream.
- Created on 2026-08-22 from the [August 22 topic news collector source](../../../raw/processed/2026-08-22/ai-security-wiki-topic-news-collector-2026-08-22T233049Z.json) as the shared-bundle member of the Omnigent 0.3.0 advisory set.
