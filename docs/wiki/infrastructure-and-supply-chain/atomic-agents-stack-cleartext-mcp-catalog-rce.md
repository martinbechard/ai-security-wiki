---
type: "Topic"
title: "atomic-agents-stack Cleartext MCP Catalog RCE"
description: "Security analysis for GHSA-xhcr-cqfr-m3hv cleartext MCP catalog trust collapse in atomic-agents-stack."
tags: ["infrastructure-and-supply-chain", "agent-and-tool-security"]
---

# atomic-agents-stack Cleartext MCP Catalog RCE

## Current Understanding

The [August 17 topic news collector source](../../../raw/processed/2026-08-17/ai-security-wiki-topic-news-collector-2026-08-17T233246Z.json) records GHSA-xhcr-cqfr-m3hv for atomic-agents-stack through 1.0.0. General framework and catalog-use practice belongs in the upstream AI development wiki; this page owns the local MCP supply-chain integrity and command-spawn boundary.

The HTTP MCP registry backend accepted cleartext `http` URLs and later spawned catalog-supplied commands and arguments as local stdio subprocesses. A network man-in-the-middle could rewrite a catalog response and convert tool discovery into arbitrary command execution on the agent host. Version 1.1.0 is listed as patched.

The [August 19 leaf update watch source](../../../raw/processed/2026-08-18/ai-security-wiki-leaf-update-watch-20260819T000420Z.json) adds [GitHub Advisory Database publication and review evidence](https://github.com/advisories/GHSA-xhcr-cqfr-m3hv) that GHSA-xhcr-cqfr-m3hv is high severity with CVSS 8.7 and that fixed version 1.1.0 remains the relevant remediation target. It does not change the local boundary: MCP catalog transport integrity is host-execution control when catalog entries can spawn local commands.

The reusable security rule is that MCP catalog metadata is delegated authority, not passive documentation. If a catalog can name local commands, then transport integrity, source authentication, command allowlisting, and reviewable provenance become host-execution controls.

## Security Impact

- Threat: cleartext tool-catalog transport can become local code execution when catalog entries are translated into stdio subprocess commands.
- Affected boundary: atomic-agents-stack through 1.0.0; HTTP MCP registry backend and registry-sourced stdio spawning.
- Exploit or incident status: public GitHub advisory; no CVE ID was assigned in the fetched record.
- Mitigation state: upgrade to 1.1.0, require HTTPS or signed catalog data, pin trusted registries, and allowlist executable command templates.
- Confidence: high for affected range, high-severity CVSS 8.7 advisory state, and patch target from the GitHub advisory; lower for exact mitigation semantics until release notes are inspected in detail.
- Residual risk: agent stacks that auto-install or auto-spawn MCP tools need independent review of catalog provenance even when transport is encrypted.

## Authoritative Sources

- [August 17 topic news collector source](../../../raw/processed/2026-08-17/ai-security-wiki-topic-news-collector-2026-08-17T233246Z.json)
- [August 19 leaf update watch source](../../../raw/processed/2026-08-18/ai-security-wiki-leaf-update-watch-20260819T000420Z.json)
- GitHub advisory GHSA-xhcr-cqfr-m3hv: https://github.com/advisories/GHSA-xhcr-cqfr-m3hv
- atomic-agents-stack release page: https://github.com/dep0we/atomic-agents-stack/releases#release-v1.1.0

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [agent and tool security](../agent-and-tool-security/index.md)
- [Agent build and dependency execution boundaries](agent-build-and-dependency-execution-boundaries.md)
- [AI supply chain provenance credentialing](ai-supply-chain-provenance-credentialing.md)
- Upstream AI development wiki owns general framework orchestration and MCP catalog practice.

## Open Questions

- Which integrity evidence should be mandatory before an agent runtime can spawn a catalog-sourced MCP server command?

## Maintenance Notes

- Created on 2026-08-17 from the August 17 topic collector as an MCP catalog supply-chain advisory leaf.
- Updated on 2026-08-19 from the August 19 leaf watcher with GitHub-reviewed severity and fixed-version evidence.
