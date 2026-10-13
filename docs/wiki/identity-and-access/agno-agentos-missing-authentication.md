---
type: "Topic"
title: "Agno AgentOS Missing Authentication"
description: "Security analysis for CVE-2026-108818, where Agno AgentOS authentication can be absent by default or mis-bound."
tags: ["identity-and-access", "agent-and-tool-security"]
---

# Agno AgentOS Missing Authentication

## Current Understanding

The [October 12 topic collector source](../../../raw/processed/2026-10-12/ai-security-wiki-topic-news-collector-2026-10-12T233447Z.json) records [CVE-2026-108818](https://nvd.nist.gov/vuln/detail/CVE-2026-108818) for Agno versions up to 2.7.3 and 3.0.6. Broad [Agno framework coverage](../../../upstream-ai-wiki/agentic-frameworks/agno.md) belongs upstream; this page owns the local AgentOS authentication boundary.

The CVE evidence says `auth.py` `get_authentication_dependency` has a missing-authentication issue involving the `security_key` argument. The source records public exploit material and notes that the project had not responded in the CVE text available during collection.

## Security Impact

- Threat: remote AgentOS access can bypass expected authentication and expose agent control-plane authority.
- Affected boundary: Agno 2.7.0 through 2.7.3 and 3.0.0 through 3.0.6, AgentOS, `auth.py`, `get_authentication_dependency`, and `security_key` handling.
- Exploit or incident status: public CVE and public GitHub issue/advisory references; no exploitation incident is recorded locally.
- Mitigation state: unresolved in local evidence; require explicit authentication in deployments and recheck upstream response before treating any release as fixed.
- Confidence: moderate-high for affected versions and public-exploit status from NVD-backed source evidence; remediation state remains lower confidence.
- Residual risk: agent control planes need deployment-time authentication proof, not assumptions from framework defaults.

## Control Implications

- Require authentication middleware to fail closed when no security key or dependency is configured.
- Test unauthenticated access to AgentOS endpoints in every deployment profile.
- Keep missing-authentication exposure separate from tool-code execution exposure because they have different mitigations and blast radii.

## Authoritative Sources

- [October 12 topic collector source](../../../raw/processed/2026-10-12/ai-security-wiki-topic-news-collector-2026-10-12T233447Z.json)
- [NVD CVE-2026-108818](https://nvd.nist.gov/vuln/detail/CVE-2026-108818)
- [Agno issue 10051](https://github.com/Agno-agi/Agno/issues/10051)
- [Agno AgentOS advisory](https://github.com/ybyu-ieu/agno-security-advisories/blob/main/advisories/agno-agentos-no-authentication-by-default.md)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [Agno PythonTools code injection](../agent-and-tool-security/agno-pythontools-code-injection.md)
- [Agno Python and Shell tools prompt-injection RCE](../agent-and-tool-security/agno-python-shell-tools-prompt-injection-rce.md)

## Open Questions

- Has Agno published a fixed version or deployment guidance for CVE-2026-108818 after the CVE text recorded no project response?

## Maintenance Notes

- Created on 2026-10-13 from the October 12 topic collector as an AgentOS authentication leaf distinct from Agno tool-execution leaves.
