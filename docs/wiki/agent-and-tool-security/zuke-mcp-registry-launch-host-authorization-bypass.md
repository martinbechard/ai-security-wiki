---
type: "Topic"
title: "Zuke MCP Registry Launch-Host Authorization Bypass"
description: "Security analysis for CVE-2026-119287 writable registry command descriptors."
tags: ["agent-and-tool-security", "infrastructure-and-supply-chain"]
---

# Zuke MCP Registry Launch-Host Authorization Bypass

## Current Understanding

The [October 30 collector](../../../raw/processed/2026-10-30/ai-security-wiki-topic-news-collector-2026-10-30T232632Z.json) records [CVE-2026-119287](https://nvd.nist.gov/vuln/detail/CVE-2026-119287): Zuke before 1.51.0 accepts command-form descriptors from a writable MCP registry without applying launch-host authorization.

## Security Impact

- Threat: a registry writer can select local programs and arguments for a run-capable caller.
- Affected boundary: @zuke/core before 1.51.0, writable registry descriptors, and local program launch.
- Exploit or incident status: public CVE; no confirmed exploitation incident is recorded locally.
- Mitigation state: upgrade to 1.51.0 or later and restrict registry write access.
- Confidence and residual risk: high for the boundary; registry metadata remains executable supply-chain input.

## Authoritative Sources

- [October 30 collector](../../../raw/processed/2026-10-30/ai-security-wiki-topic-news-collector-2026-10-30T232632Z.json)
- [NVD CVE-2026-119287](https://nvd.nist.gov/vuln/detail/CVE-2026-119287)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)

## Open Questions

- Does the fixed release authenticate registry provenance before displaying confirmation text?

## Maintenance Notes

- Created on 2026-10-30 from NVD-backed collector evidence.
