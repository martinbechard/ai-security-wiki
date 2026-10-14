---
type: "Topic"
title: "Vercel deepsec Sandbox Tarball Link Escape"
description: "Security analysis for CVE-2026-109375, where deepsec result tarball extraction can follow links outside a sandbox."
tags: ["infrastructure-and-supply-chain", "agent-and-tool-security"]
---

# Vercel deepsec Sandbox Tarball Link Escape

## Current Understanding

The [October 13 topic collector source](../../../raw/processed/2026-10-13/ai-security-wiki-topic-news-collector-2026-10-13T232603Z.json) records [CVE-2026-109375](https://nvd.nist.gov/vuln/detail/CVE-2026-109375) for Vercel deepsec 0.1.0 before 1.1.17. General coding-agent scanner workflow context belongs upstream in the [AI-assisted security repair gates](../../../upstream-ai-dev-wiki/governance-and-risk/ai-assisted-security-repair-gates.md) coverage; this page owns the local sandbox escape and generated-artifact extraction boundary.

The CVE evidence says `extractTarballLocally` follows symbolic or hard links in result tarballs. Sandboxed code, including code controlled by a prompt-injected coding agent, can plant links that write files outside the sandbox on the orchestrator host.

## Security Impact

- Threat: generated scan artifacts can escape a sandbox during result collection.
- Affected boundary: Vercel deepsec 0.1.0 before 1.1.17, result tarball extraction, symbolic links, hard links, and orchestrator host filesystem writes.
- Exploit or incident status: public CVE record; no confirmed exploitation incident is recorded locally.
- Mitigation state: update to 1.1.17 or later and reject or safely materialize links during archive extraction.
- Confidence: high for affected range and artifact-boundary issue from NVD/CVE evidence.
- Residual risk: security scanners and coding-agent sandboxes still need hostile-artifact handling because the agent controls output files.

## Control Implications

- Treat tarballs, logs, coverage files, and generated reports from sandboxed code as hostile input.
- Extract archives with link, path traversal, ownership, permission, and file-type checks.
- Add regression tests for symlinks, hard links, nested paths, and replacement attacks during artifact collection.

## Authoritative Sources

- [October 13 topic collector source](../../../raw/processed/2026-10-13/ai-security-wiki-topic-news-collector-2026-10-13T232603Z.json)
- [NVD CVE-2026-109375](https://nvd.nist.gov/vuln/detail/CVE-2026-109375)
- [CVE Services CVE-2026-109375](https://cveawg.mitre.org/api/cve/CVE-2026-109375)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [AI agent sandbox escape host file access](ai-agent-sandbox-escape-host-file-access.md)
- [Agent build and dependency execution boundaries](agent-build-and-dependency-execution-boundaries.md)

## Open Questions

- Does the public deepsec 1.1.17 fix reject links entirely or extract them with containment checks?

## Maintenance Notes

- Created on 2026-10-14 from the October 13 topic collector after routing general coding-agent scanner practice upstream.
