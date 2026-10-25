---
type: "Topic"
title: "SageMath MCP Command Execution"
description: "Security analysis for CVE-2026-106763 command execution in sagemath-mcp-server."
tags: ["agent-and-tool-security"]
---

# SageMath MCP Command Execution

## Current Understanding

[CVE-2026-106763](https://nvd.nist.gov/vuln/detail/CVE-2026-106763), captured by the [October 24 collector](../../../raw/processed/2026-10-24/ai-security-wiki-topic-news-collector-2026-10-24T232700Z.json), reports a remote command-execution path in `@justice8096/sagemath-mcp-server` 1.0.1. This page keeps a bounded NVD-first finding pending maintainer remediation evidence.

## Security Impact

- Threat: tool input reaches a host command-execution path.
- Affected boundary: `@justice8096/sagemath-mcp-server` 1.0.1.
- Exploit or incident status: public disclosure; no local incident is recorded.
- Mitigation state: no maintainer patch is identified; do not expose or trust this package with host authority.
- Confidence: medium because primary advisory detail is not identified.
- Residual risk: MCP tool wrappers may delegate arbitrary interpreter authority.

## Authoritative Sources

- [October 24 collector](../../../raw/processed/2026-10-24/ai-security-wiki-topic-news-collector-2026-10-24T232700Z.json)
- [CVE-2026-106763](https://nvd.nist.gov/vuln/detail/CVE-2026-106763)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)

## Open Questions

- Is there a supported release with a maintainer-provided remediation?

## Maintenance Notes

- Created on 2026-10-24 after verifier-required split from a mixed MCP family.
