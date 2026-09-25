---
type: "Topic"
title: "mcp-remote Server URL Hash Code Execution"
description: "Security analysis for CVE-2026-51996, where mcp-remote server URL hashing could reach arbitrary code execution."
tags: ["infrastructure-and-supply-chain", "agent-and-tool-security"]
---

# mcp-remote Server URL Hash Code Execution

## Current Understanding

The [September 24 topic collector source](../../../raw/processed/2026-09-24/ai-security-wiki-topic-news-collector-2026-09-24T233211Z.json) records [CVE-2026-51996](https://cveawg.mitre.org/api/cve/CVE-2026-51996) for mcp-remote 0.1.16 through 0.1.38. Broad mcp-remote package cataloging belongs upstream; this page owns the local server-URL hashing execution boundary.

The CVE source identifies arbitrary code execution through `src/lib/utils.ts` and the `getServerUrlHash` function. This is independently maintainable from the related OAuth metadata SSRF and sensitive-information exposure issues because the affected range and execution primitive differ.

## Security Impact

- Threat: attacker-controlled remote server URL material can cross into code execution through URL-hash handling.
- Affected boundary: mcp-remote 0.1.16 through 0.1.38; `getServerUrlHash` and utility handling of server URL data.
- Exploit or incident status: public CVE/NVD records and public mcp-remote OAuth security write-up; no local incident evidence is recorded.
- Mitigation state: upgrade beyond the affected range and avoid deriving executable shell or file behavior from untrusted server URLs.
- Confidence: high for affected range and code-execution class; medium for exact exploit mechanics until patch detail is reviewed.
- Residual risk: MCP client bridges must sanitize remote server identity material before it reaches local filesystem, shell, or browser helpers.

## Authoritative Sources

- [September 24 topic collector source](../../../raw/processed/2026-09-24/ai-security-wiki-topic-news-collector-2026-09-24T233211Z.json)
- [CVE-2026-51996 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-51996)
- [NVD CVE-2026-51996](https://nvd.nist.gov/vuln/detail/CVE-2026-51996)
- [mcp-remote OAuth security write-up](https://github.com/playb0t/mcp-remote-oauth-security#readme)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [agent and tool security](../agent-and-tool-security/index.md)
- [mcp-remote browser open code execution](../agent-and-tool-security/mcp-remote-browser-open-code-execution.md)

## Open Questions

- Which local execution sink does `getServerUrlHash` reach in affected mcp-remote releases?

## Maintenance Notes

- Created on 2026-09-25 from the [September 24 topic collector source](../../../raw/processed/2026-09-24/ai-security-wiki-topic-news-collector-2026-09-24T233211Z.json) as the mcp-remote server-URL hashing execution leaf.
