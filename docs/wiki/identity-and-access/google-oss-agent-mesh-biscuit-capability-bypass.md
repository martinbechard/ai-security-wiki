---
type: "Topic"
title: "Google OSS Agent Mesh Biscuit Capability Bypass"
description: "Security analysis for CVE-2026-102503 unauthenticated bypass of Google OSS Agent Mesh Biscuit capability enforcement."
tags: ["identity-and-access", "agent-and-tool-security"]
---

# Google OSS Agent Mesh Biscuit Capability Bypass

## Current Understanding

[CVE-2026-102503](https://nvd.nist.gov/vuln/detail/CVE-2026-102503) records that an unauthenticated libp2p peer can bypass Biscuit capability enforcement to invoke registered backend services in Google OSS Agent Mesh (SAM) 0.1.0-alpha.1 through alpha.2. The [October 19 collector](../../../raw/processed/2026-10-19/ai-security-wiki-topic-news-collector-2026-10-19T140139-0400.json) keeps the security boundary locally; broad Agent Mesh context remains upstream-owned.

## Security Impact

- Threat: a remote peer can invoke registered backend services without the required capability check.
- Affected boundary: Google OSS Agent Mesh 0.1.0-alpha.1 through alpha.2, libp2p peer authentication, and Biscuit authorization.
- Exploit or incident status: public CVE; active exploitation is not identified.
- Mitigation state: exact remediation release is not confirmed; restrict mesh exposure and enforce capability authorization server-side.
- Confidence: high for the reported authority boundary; medium for remediation state.
- Residual risk: peer identity and backend capability checks must be independently enforced.

## Authoritative Sources

- [October 19 collector source](../../../raw/processed/2026-10-19/ai-security-wiki-topic-news-collector-2026-10-19T140139-0400.json)
- [CVE-2026-102503](https://nvd.nist.gov/vuln/detail/CVE-2026-102503)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [Google OSS Agent Mesh MCP/OIDC Enrollment Bypass](google-oss-agent-mesh-mcp-oidc-enrollment-bypass.md)

## Open Questions

- Which project advisory identifies a fixed alpha release and migration guidance?

## Maintenance Notes

- Created on 2026-10-20 from the October 19 collector after splitting independently changing Agent Mesh CVEs.
