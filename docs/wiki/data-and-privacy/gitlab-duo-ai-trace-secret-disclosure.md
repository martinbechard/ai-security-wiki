---
type: "Topic"
title: "GitLab Duo AI Trace Secret Disclosure"
description: "Security analysis for CVE-2026-92470, where GitLab Duo AI troubleshooting could expose CI/CD variable values from debug-mode job traces."
tags: ["data-and-privacy", "agent-and-tool-security"]
---

# GitLab Duo AI Trace Secret Disclosure

## Current Understanding

The [September 26 topic collector source](../../../raw/processed/2026-09-26/ai-security-wiki-topic-news-collector-2026-09-26T233301Z.json) records CVE-2026-92470 for GitLab CE/EE patch releases 19.4.1, 19.3.3, and 19.2.7. Broad GitLab and Duo product context belongs upstream; this page owns the local AI troubleshooting trace-secret boundary.

GitLab Duo AI troubleshooting could expose CI/CD variable values from debug-mode job traces. The security issue is not general GitLab CI logging; locally it matters because AI troubleshooting features can summarize or expose secret-bearing operational traces.

## Security Impact

- Threat: AI troubleshooting can disclose CI/CD variable values from debug-mode traces.
- Affected boundary: GitLab CE/EE ranges before 19.2.7, 19.3.3, and 19.4.1, depending on the CVE record; Duo AI troubleshooting and debug-mode job traces.
- Exploit or incident status: vendor patch release corroborated by NVD; no confirmed exploitation is recorded in the collector.
- Mitigation state: upgrade to 19.2.7, 19.3.3, 19.4.1, or later and review debug-mode trace exposure to AI troubleshooting features.
- Confidence: high from vendor patch-release and NVD-backed collector evidence.
- Residual risk: AI troubleshooting integrations need secret redaction before trace content is summarized, embedded, or exposed to assistant workflows.

## Authoritative Sources

- [September 26 topic collector source](../../../raw/processed/2026-09-26/ai-security-wiki-topic-news-collector-2026-09-26T233301Z.json)
- [GitLab 19.4.1 patch release](https://docs.gitlab.com/releases/patches/patch-release-gitlab-19-4-1-released/)
- [NVD CVE-2026-92470](https://nvd.nist.gov/vuln/detail/CVE-2026-92470)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [data and privacy](index.md)
- [GitLab AI Gateway inline flow Host credential disclosure](gitlab-ai-gateway-inline-flow-host-credential-disclosure.md)

## Open Questions

- Which Duo AI troubleshooting views or APIs could surface debug-mode job trace variable values before the patched releases?

## Maintenance Notes

- Created on 2026-09-27 from the [September 26 topic collector source](../../../raw/processed/2026-09-26/ai-security-wiki-topic-news-collector-2026-09-26T233301Z.json) after verifier correction identified CVE-2026-92470 as a missing local durable leaf.
