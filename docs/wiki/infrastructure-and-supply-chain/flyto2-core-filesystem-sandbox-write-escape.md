---
type: "Topic"
title: "Flyto2 Core filesystem sandbox write escape"
description: "Security analysis for CVE-2026-77312 filesystem write confinement before Flyto2 Core v2.26.8."
tags: ["infrastructure-and-supply-chain", "agent-and-tool-security"]
---

# Flyto2 Core filesystem sandbox write escape

## Current Understanding

The [November 20 collector source](../../../raw/processed/2026-11-20/ai-security-wiki-topic-news-collector-2026-11-20T003127Z.json) records [CVE-2026-77312](https://nvd.nist.gov/vuln/detail/CVE-2026-77312) in Flyto2 Core before v2.26.8. Broad Flyto product context belongs upstream; this leaf owns the `FLYTO_SANDBOX_DIR` file-write confinement boundary.

## Security Impact

- Threat: agent workflow output can write beyond its intended sandbox.
- Affected boundary: Flyto2 Core before v2.26.8 and `FLYTO_SANDBOX_DIR` file-write handling.
- Exploit or incident status: public NVD and upstream advisory records; no confirmed exploitation or local incident is recorded.
- Mitigation state: upgrade to v2.26.8, validate resolved paths and mounts, and restrict write authority to the approved workspace.
- Confidence: high for the affected release boundary and stated confinement failure.
- Residual risk: mounts and host-side permissions can still widen the effective write boundary.

## Authoritative Sources

- [November 20 collector source](../../../raw/processed/2026-11-20/ai-security-wiki-topic-news-collector-2026-11-20T003127Z.json)
- [CVE-2026-77312](https://nvd.nist.gov/vuln/detail/CVE-2026-77312)
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

- Which Flyto2 modules write through this boundary in deployed workflows?

## Maintenance Notes

- Created on 2026-11-20 by splitting the filesystem boundary from the shared Flyto2 advisory family.
