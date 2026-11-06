---
type: "Topic"
title: "mcp-go OAuth Resource-Metadata Origin Validation"
description: "Security analysis for CVE-2026-123272 mcp-go OAuth protected-resource metadata origin validation."
tags: ["identity-and-access", "agent-and-tool-security"]
---

# mcp-go OAuth Resource-Metadata Origin Validation

## Current Understanding

The [November 5 topic collector source](../../../raw/processed/2026-11-05/ai-security-wiki-topic-news-collector-2026-11-06T003522Z.json) identifies CVE-2026-123272 in `mark3labs/mcp-go` before 1.2.1. Broad mcp-go SDK and MCP coverage belongs upstream; this page owns the local OAuth protected-resource metadata origin-validation boundary.

The collected vulnerability-database evidence describes `OAuthHandler.fetchServerMetadata` accepting unvalidated well-known Protected Resource Metadata. That leaves a hostile MCP endpoint able to steer credential authority toward an unintended protected resource; the collected record identifies 1.2.1 as the fixed version, but maintainer advisory, patch, and release evidence have not yet been captured.

## Security Impact

- Threat: unvalidated OAuth resource metadata can misbind delegated authority across protected resources.
- Affected boundary: mcp-go before 1.2.1; `OAuthHandler.fetchServerMetadata` and well-known Protected Resource Metadata handling.
- Exploit or incident status: public vulnerability-database record; active exploitation and a local incident are not established.
- Mitigation state: upgrade to 1.2.1 or later only after confirming maintainer release evidence; independently enforce origin and resource binding for OAuth metadata.
- Confidence: medium because the captured evidence identifies the affected boundary and fixed version but lacks maintainer-authored advisory, patch, or release confirmation.
- Residual risk: version-only remediation cannot establish redirect, final-destination, or resource-audience behavior without primary evidence.

## Authoritative Sources

- [November 5 topic collector source](../../../raw/processed/2026-11-05/ai-security-wiki-topic-news-collector-2026-11-06T003522Z.json)
- [NVD CVE-2026-123272](https://nvd.nist.gov/vuln/detail/CVE-2026-123272)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [mcp-go DNS rebinding host validation](../agent-and-tool-security/mcp-go-dns-rebinding-host-validation.md)
- [mcp-go StreamableHTTP body DoS](../agent-and-tool-security/mcp-go-streamable-http-body-dos.md)

## Open Questions

- Which maintainer advisory, patch, or 1.2.1 release note confirms the reported protected-resource metadata origin-validation change?

## Maintenance Notes

- Created on 2026-11-05 from the [November 5 topic collector source](../../../raw/processed/2026-11-05/ai-security-wiki-topic-news-collector-2026-11-06T003522Z.json); do not promote the recorded fixed-version guidance beyond medium confidence without primary evidence.
