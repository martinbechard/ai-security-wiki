---
type: "Topic"
title: "Google OSS Agent Mesh MCP/OIDC Enrollment Bypass"
description: "Security analysis for CVE-2026-103091 self-enrollment and cross-node tool invocation in Google OSS Agent Mesh."
tags: ["identity-and-access", "agent-and-tool-security"]
---

# Google OSS Agent Mesh MCP/OIDC Enrollment Bypass

## Current Understanding

[CVE-2026-103091](https://nvd.nist.gov/vuln/detail/CVE-2026-103091) records that a remote actor can self-enroll through the Google OSS Agent Mesh MCP proxy/OIDC registration path and invoke tools across connected MCP backend nodes in 0.1.0-alpha.1 through alpha.8. The [October 19 collector](../../../raw/processed/2026-10-19/ai-security-wiki-topic-news-collector-2026-10-19T140139-0400.json) keeps this delegated-authority boundary locally.

## Security Impact

- Threat: remote self-enrollment can create authority to invoke tools across connected backend nodes.
- Affected boundary: Google OSS Agent Mesh 0.1.0-alpha.1 through alpha.8, MCP proxy/OIDC registration, and cross-node tool invocation.
- Exploit or incident status: public CVE; active exploitation is not identified.
- Mitigation state: exact remediation release is not confirmed; disable untrusted enrollment and bind OIDC registration to approved identities and resources.
- Confidence: high for the reported enrollment and tool boundary; medium for remediation state.
- Residual risk: authenticated enrollment does not imply authorization for every delegated tool.

## Authoritative Sources

- [October 19 collector source](../../../raw/processed/2026-10-19/ai-security-wiki-topic-news-collector-2026-10-19T140139-0400.json)
- [CVE-2026-103091](https://nvd.nist.gov/vuln/detail/CVE-2026-103091)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [Google OSS Agent Mesh Biscuit Capability Bypass](google-oss-agent-mesh-biscuit-capability-bypass.md)

## Open Questions

- Which project advisory identifies a fixed alpha release and whether existing agents need re-enrollment?

## Maintenance Notes

- Created on 2026-10-20 from the October 19 collector after splitting independently changing Agent Mesh CVEs.
