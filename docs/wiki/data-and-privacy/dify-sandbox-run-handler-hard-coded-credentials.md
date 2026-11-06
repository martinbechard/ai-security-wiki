---
type: "Topic"
title: "Dify Sandbox Run Handler Hard-Coded Credentials"
description: "Security analysis for CVE-2026-123135 hard-coded credentials in Dify Sandbox Run Handler."
tags: ["data-and-privacy", "identity-and-access", "agent-and-tool-security"]
---

# Dify Sandbox Run Handler Hard-Coded Credentials

## Current Understanding

The [November 5 topic collector source](../../../raw/processed/2026-11-05/ai-security-wiki-topic-news-collector-2026-11-06T003522Z.json) identifies CVE-2026-123135 as hard-coded credentials in Dify Sandbox Run Handler configuration through Dify 1.18.0 and 2.0.0-beta.2. Broad Dify product context belongs upstream; this page owns the sandbox credential and agent-triggered execution boundary.

The collected vulnerability-database evidence identifies `api/configs/feature/__init__.py` as the affected component, reports that an attack can be launched remotely, and reports public exploit availability. No maintainer advisory, patch, or fixed release was identified, so that report does not establish active exploitation or an actionable release remediation.

## Security Impact

- Threat: embedded sandbox credentials can expose sandbox-backed services or data to a remote actor.
- Affected boundary: Dify through 1.18.0 and 2.0.0-beta.2; Sandbox Run Handler configuration and its credentials.
- Exploit or incident status: public vulnerability-database evidence reports public exploit availability; active exploitation and a local incident are not established.
- Mitigation state: no fixed release is established. Rotate any potentially exposed sandbox credentials, restrict reachable sandbox services, and obtain maintainer remediation before treating an upgrade as a fix.
- Confidence: medium because the evidence is vulnerability-database reporting without a maintainer advisory, patch, or fixed release.
- Residual risk: sandbox isolation is weakened when credentials are embedded in application configuration and can still expose downstream services after network restrictions.

## Authoritative Sources

- [November 5 topic collector source](../../../raw/processed/2026-11-05/ai-security-wiki-topic-news-collector-2026-11-06T003522Z.json)
- [OpenCVE CVE-2026-123135](https://app.opencve.io/cve/CVE-2026-123135)
- [Rapid7 CVE-2026-123135](https://www.rapid7.com/db/vulnerabilities/cve-2026-123135/)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [data and privacy](index.md)
- [Dify plaintext API key exposure](dify-plaintext-api-key-exposure.md)
- [development agent credential isolation](../identity-and-access/development-agent-credential-isolation.md)

## Open Questions

- Which maintainer advisory, issue, patch, or release establishes the affected versions and remediation for CVE-2026-123135?

## Maintenance Notes

- Created on 2026-11-05 from the [November 5 topic collector source](../../../raw/processed/2026-11-05/ai-security-wiki-topic-news-collector-2026-11-06T003522Z.json); retain the distinction between reported public exploit availability and evidence of active exploitation.
