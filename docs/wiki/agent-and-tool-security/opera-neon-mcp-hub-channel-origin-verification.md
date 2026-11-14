---
type: "Topic"
title: "Opera Neon MCP Hub Channel-Origin Verification"
description: "Security analysis for CVE-2026-123139 extension-to-browser-agent command-channel origin verification."
tags: ["agent-and-tool-security", "browser-agent-security"]
---

# Opera Neon MCP Hub Channel-Origin Verification

## Current Understanding

The [November 13 collector source](../../../raw/processed/2026-11-13/ai-security-wiki-topic-news-collector-2026-11-13T192923-0500.json) records [CVE-2026-123139](https://nvd.nist.gov/vuln/detail/CVE-2026-123139): Opera Neon MCP Hub extension 0.0.1 on macOS and Windows did not verify the source of a communication channel, allowing a malicious installed extension to send commands to Browser Operator. Broad Opera coverage belongs upstream; this leaf owns the delegated browser-agent channel-origin boundary.

## Security Impact

- Threat: an installed extension can impersonate a trusted command-channel peer and exercise browser-agent authority.
- Affected boundary: MCP Hub extension 0.0.1 communication with Browser Operator on macOS and Windows.
- Exploit or incident status: public CVE disclosure; no active exploitation or local incident is established.
- Mitigation state: verify Opera's remediation guidance, audit installed extensions, and bind both sender identity and origin before accepting browser-agent commands.
- Confidence: high for disclosure and affected component; fixed-build evidence is not retained in the collector.
- Residual risk: channel authentication must remain effective for every extension lifecycle and message route.

## Authoritative Sources

- [November 13 collector source](../../../raw/processed/2026-11-13/ai-security-wiki-topic-news-collector-2026-11-13T192923-0500.json)
- [NVD CVE-2026-123139](https://nvd.nist.gov/vuln/detail/CVE-2026-123139)
- [Opera security advisory](https://security.opera.com/en/improper-verification-of-source-of-a-communication-channel-opera-security-advisories/)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)

## Open Questions

- Which Opera Neon build remediates CVE-2026-123139, and how does it bind extension identity to Browser Operator commands?

## Maintenance Notes

- Created on 2026-11-13 from an NVD-timed disclosure; product background remains federated upstream.
