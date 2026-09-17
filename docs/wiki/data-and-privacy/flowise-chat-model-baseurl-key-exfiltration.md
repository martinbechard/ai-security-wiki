---
type: "Topic"
title: "Flowise chat-model baseURL key exfiltration"
description: "Security analysis for CVE-2026-91935 Flowise chat-model baseURL validation gaps that can leak LLM provider keys."
tags: ["data-and-privacy", "agent-and-tool-security"]
---

# Flowise chat-model baseURL key exfiltration

## Current Understanding

The [September 16 topic collector source](../../../raw/processed/2026-09-16/ai-security-wiki-topic-news-collector-2026-09-16T233115Z.json) records [CVE-2026-91935](https://cveawg.mitre.org/api/cve/CVE-2026-91935) for Flowise and `flowise-components` before 3.1.4. Broad Flowise product and workflow-builder coverage belongs upstream; this page owns the local model-node destination-control and provider-key boundary.

The CVE says users with `chatflows:create` or `chatflows:update` permissions could set chat-model `baseURL` parameters that Flowise failed to validate, redirecting provider requests to arbitrary hosts. Because the request carries configured LLM provider credentials, ordinary builder permissions can become provider-key exfiltration and, depending on destination controls, internal-host access.

## Security Impact

- Threat: authenticated flow authors can redirect chat-model traffic to attacker-controlled hosts and capture configured LLM provider keys.
- Affected boundary: Flowise and `flowise-components` before 3.1.4, chat-model node request destinations, provider credentials, and tenant or workspace builder permissions.
- Exploit or incident status: public CVE and NVD records; no local exploitation incident is recorded.
- Mitigation state: upgrade to 3.1.4 or later, disallow arbitrary model endpoint overrides for untrusted builders, and bind provider credentials to allowlisted destinations.
- Confidence: high for CVE/NVD publication, affected versions, and key-exfiltration class.
- Residual risk: low-code LLM builders often conflate workflow-edit rights with model-endpoint authority; provider-key controls need to survive node-specific override paths.

## Control Implications

- Treat `baseURL` and equivalent model endpoint fields as privileged routing configuration.
- Scope provider credentials to approved provider hosts and reject runtime overrides that change destination trust.
- Audit flow-author permissions for paths that can cause server-side requests to carry stored secrets.

## Authoritative Sources

- [September 16 topic collector source](../../../raw/processed/2026-09-16/ai-security-wiki-topic-news-collector-2026-09-16T233115Z.json)
- [CVE-2026-91935 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-91935)
- [NVD CVE-2026-91935 record](https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2026-91935)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [data and privacy](index.md)
- [Flowise node-load-method credential IDOR](../identity-and-access/flowise-node-load-method-credential-idor.md)
- [AI provider override trust boundaries](ai-provider-override-trust-boundaries.md)

## Open Questions

- Which Flowise chat-model nodes still permit endpoint overrides after the 3.1.4 fix, and are those overrides bound to provider credential scope?

## Maintenance Notes

- Created on 2026-09-17 from the [September 16 topic collector](../../../raw/processed/2026-09-16/ai-security-wiki-topic-news-collector-2026-09-16T233115Z.json) as a provider-key destination-control leaf.
