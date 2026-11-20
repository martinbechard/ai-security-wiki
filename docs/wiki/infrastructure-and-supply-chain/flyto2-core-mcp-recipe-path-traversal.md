---
type: "Topic"
title: "Flyto2 Core MCP recipe path traversal"
description: "Security analysis for CVE-2026-77314 MCP recipe path traversal before Flyto2 Core v2.26.8."
tags: ["infrastructure-and-supply-chain", "agent-and-tool-security"]
---

# Flyto2 Core MCP recipe path traversal

## Current Understanding

The [November 20 collector source](../../../raw/processed/2026-11-20/ai-security-wiki-topic-news-collector-2026-11-20T003127Z.json) records [CVE-2026-77314](https://nvd.nist.gov/vuln/detail/CVE-2026-77314) in Flyto2 Core before v2.26.8. Broad Flyto product context belongs upstream; this leaf owns the MCP `run_recipe` path-containment boundary.

## Security Impact

- Threat: recipe selection can traverse beyond the bundled recipe directory.
- Affected boundary: Flyto2 Core before v2.26.8 and MCP `run_recipe` path resolution.
- Exploit or incident status: public NVD and upstream advisory records; no confirmed exploitation or local incident is recorded.
- Mitigation state: upgrade to v2.26.8, canonicalize recipe paths, and allow recipes only from an approved root.
- Confidence: high for the affected release boundary and recipe traversal description.
- Residual risk: external recipe mounts or permissive policy can recreate an unsafe authority boundary.

## Authoritative Sources

- [November 20 collector source](../../../raw/processed/2026-11-20/ai-security-wiki-topic-news-collector-2026-11-20T003127Z.json)
- [CVE-2026-77314](https://nvd.nist.gov/vuln/detail/CVE-2026-77314)
- [Flyto2 Core v2.26.8 release](https://github.com/flytohub/flyto-core/releases/tag/v2.26.8)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [Flyto2 Core advisory family](flyto2-core-agent-workflow-security-family.md)

## Open Questions

- Does the fixed path resolver reject symlinks that exit the approved recipe root?

## Maintenance Notes

- Created on 2026-11-20 by separating MCP recipe selection from the Flyto2 advisory family.
