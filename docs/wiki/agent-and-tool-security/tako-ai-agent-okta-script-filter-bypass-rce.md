---
type: "Topic"
title: "TAKO AI Agent Okta Script-Filter Bypass RCE"
description: "Security analysis for CVE-2026-63378 AI filtering used as an execution boundary."
tags: ["agent-and-tool-security", "testing-and-assurance"]
---

# TAKO AI Agent Okta Script-Filter Bypass RCE

## Current Understanding

The [October 30 collector](../../../raw/processed/2026-10-30/ai-security-wiki-topic-news-collector-2026-10-30T232632Z.json) records [CVE-2026-63378](https://nvd.nist.gov/vuln/detail/CVE-2026-63378): TAKO AI Agent for Okta before 3.0.1-beta lets authenticated users use dynamic `getattr` call chains to bypass AI-based Python content filtering and execute arbitrary code as the application user, root in the default container.

## Security Impact

- Threat: AI content screening is bypassed to execute privileged application code.
- Affected boundary: TAKO AI Agent for Okta before 3.0.1-beta, authenticated script execution, and AI filtering.
- Exploit or incident status: public CVE; no confirmed exploitation incident is recorded locally.
- Mitigation state: upgrade to 3.0.1-beta and rotate reachable Okta tokens, JWT keys, and container secrets.
- Confidence and residual risk: high for the boundary; policy requires a non-executable authorization boundary, not model filtering alone.

## Authoritative Sources

- [October 30 collector](../../../raw/processed/2026-10-30/ai-security-wiki-topic-news-collector-2026-10-30T232632Z.json)
- [NVD CVE-2026-63378](https://nvd.nist.gov/vuln/detail/CVE-2026-63378)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)

## Open Questions

- Does the fixed version remove dynamic execution or only extend the AI filter patterns?

## Maintenance Notes

- Created on 2026-10-30 as a control-boundary distinct from first-admin bootstrap.
