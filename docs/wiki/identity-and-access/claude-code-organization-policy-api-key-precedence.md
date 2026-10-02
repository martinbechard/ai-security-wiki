---
type: "Topic"
title: "Claude Code Organization Policy API Key Precedence"
description: "Security analysis for CVE-2026-103012 credential precedence in Claude Code organization policy checks."
tags: ["identity-and-access", "agent-and-tool-security"]
---

# Claude Code Organization Policy API Key Precedence

## Current Understanding

The [October 1 topic collector source](../../../raw/processed/2026-10-01/ai-security-wiki-topic-news-collector-2026-10-01T233213Z.json) records [CVE-2026-103012](https://cveawg.mitre.org/api/cve/CVE-2026-103012) for a Claude Code organization-policy check that selected a locally stored API key ahead of a valid Claude Enterprise or Claude Team sign-in. Broad [Claude Code](../../../upstream-ai-wiki/developer-tools/claude-code.md) product coverage belongs upstream; this page owns the local enterprise policy, credential precedence, and delegated coding-agent identity boundary.

Enterprise policy checks need to bind to the signed-in organization identity, not merely to any locally available provider credential. If a personal or stale API key wins precedence during policy fetch, organization policy, audit, and least-privilege expectations can be bypassed or misapplied.

## Security Impact

- Threat: local credential precedence can cause a coding agent to fetch or apply policy under the wrong identity context.
- Affected boundary: Claude Code policy-fetch authentication path; exact affected and fixed versions require vendor confirmation.
- Exploit or incident status: public CVE record; no confirmed exploitation is recorded in the source.
- Mitigation state: vendor remediation detail is not captured in the source; operators should prefer organization-managed sign-in, audit local API keys, and require policy checks to use the active enterprise or team identity.
- Confidence: medium-high for CVE existence and boundary; medium for affected-version and remediation detail until primary vendor release notes are captured.
- Residual risk: local developer agents often hold multiple credentials, so credential selection needs explicit policy binding and audit evidence.

## Authoritative Sources

- [October 1 topic collector source](../../../raw/processed/2026-10-01/ai-security-wiki-topic-news-collector-2026-10-01T233213Z.json)
- [CVE-2026-103012 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-103012)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [development agent credential isolation](development-agent-credential-isolation.md)
- [coding agent command approval boundaries](../agent-and-tool-security/coding-agent-command-approval-boundaries.md)
- Upstream AI development wiki owns general enterprise coding-agent rollout practice.

## Open Questions

- Which Claude Code release or vendor advisory identifies the affected versions and fixed policy-fetch behavior?

## Maintenance Notes

- Created on 2026-10-02 from the [October 1 topic collector source](../../../raw/processed/2026-10-01/ai-security-wiki-topic-news-collector-2026-10-01T233213Z.json).
