---
type: "Topic"
title: "Apache Answer MCP Content-State Authorization"
description: "Security analysis for CVE-2026-71563 MCP retrieval of hidden and deleted Apache Answer content."
tags: ["data-and-privacy", "identity-and-access"]
---

# Apache Answer MCP Content-State Authorization

## Current Understanding

[CVE-2026-71563](https://nvd.nist.gov/vuln/detail/CVE-2026-71563) records that Apache Answer through 2.0.2 lets holders of a global API key use its MCP answer-retrieval tool to retrieve hidden, deleted, or pending-review answers. The [October 19 collector](../../../raw/processed/2026-10-19/ai-security-wiki-topic-news-collector-2026-10-19T140139-0400.json) states Apache recommends 2.0.3.

## Security Impact

- Threat: a broad credential bypasses content-state authorization through an MCP data tool.
- Affected boundary: Apache Answer through 2.0.2, global API keys, and MCP answer retrieval.
- Exploit or incident status: public CVE; active exploitation is not identified.
- Mitigation state: upgrade to 2.0.3 and enforce caller-specific visibility checks rather than credential-wide access.
- Confidence: high for the affected range and recommended upgrade.
- Residual risk: any globally scoped credential can still over-authorize data retrieval without object-state enforcement.

## Authoritative Sources

- [October 19 collector source](../../../raw/processed/2026-10-19/ai-security-wiki-topic-news-collector-2026-10-19T140139-0400.json)
- [CVE-2026-71563](https://nvd.nist.gov/vuln/detail/CVE-2026-71563)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [data and privacy](index.md)
- [identity and access](../identity-and-access/index.md)

## Open Questions

- Does 2.0.3 apply equivalent visibility checks to all MCP read tools?

## Maintenance Notes

- Created on 2026-10-20 from the October 19 collector.
