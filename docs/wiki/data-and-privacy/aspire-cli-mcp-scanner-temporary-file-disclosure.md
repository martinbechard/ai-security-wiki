---
type: "Topic"
title: "Aspire CLI MCP Scanner Temporary-File Disclosure"
description: "Security analysis for CVE-2026-120792 insecure temporary diagnostics in the Aspire CLI MCP scanner."
tags: ["data-and-privacy", "agent-and-tool-security"]
---

# Aspire CLI MCP Scanner Temporary-File Disclosure

## Current Understanding

[CVE-2026-120792](https://github.com/advisories/GHSA-q6jf-24jf-m3cg), captured in the [November 11 collector source](../../../raw/processed/2026-11-11/ai-security-wiki-topic-news-collector-2026-11-11T193154-0500.json), concerns insecure temporary diagnostics in Aspire CLI's deprecated MCP configuration scanner. Broad Aspire context belongs upstream and development setup practice belongs in the AI development wiki; this page owns the local sensitive-configuration disclosure boundary.

The reviewed GitHub advisory says a local attacker can obtain configuration data from a shared non-Windows temporary directory when agent or MCP initialization invokes the scanner. A .NET SDK or runtime update alone does not establish that the independently shipped CLI is fixed.

## Security Impact

- Threat: a local user reads sensitive MCP or agent configuration written to a shared temporary directory.
- Affected boundary: Aspire CLI 13.2.0 through 13.6.4; npm CLI packages >= 13.4.2 and < 13.6.5 on Linux and macOS.
- Exploit or incident status: public vendor advisory; no active-exploitation incident is recorded.
- Mitigation state: update the CLI and its platform package dependency to 13.6.5 or later through the installation method in use.
- Confidence: high, based on Microsoft’s reviewed advisory and release reference.
- Residual risk: shared temporary directories remain a data boundary for other local tools even after this deprecated scanner is removed.

## Authoritative Sources

- [November 11 collector source](../../../raw/processed/2026-11-11/ai-security-wiki-topic-news-collector-2026-11-11T193154-0500.json)
- [GHSA-q6jf-24jf-m3cg](https://github.com/advisories/GHSA-q6jf-24jf-m3cg)
- [Microsoft Aspire 13.6.5 release](https://github.com/microsoft/aspire/releases/tag/v13.6.5)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [data and privacy](index.md)
- [local agent execution and processing boundaries](../agent-and-tool-security/local-agent-execution-and-processing-boundaries.md)

## Open Questions

- Which supported local installation paths still invoke the deprecated scanner?

## Maintenance Notes

- Created on 2026-11-11 from the November 11 collector source.
