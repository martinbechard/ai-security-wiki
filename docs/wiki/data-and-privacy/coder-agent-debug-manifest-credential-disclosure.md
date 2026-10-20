---
type: "Topic"
title: "Coder Agent-Debug Manifest Credential Disclosure"
description: "Security analysis for CVE-2026-111926 exposing workspace environment values through Coder's local agent-debug server."
tags: ["data-and-privacy", "identity-and-access"]
---

# Coder Agent-Debug Manifest Credential Disclosure

## Current Understanding

[CVE-2026-111926](https://nvd.nist.gov/vuln/detail/CVE-2026-111926) affects Coder 2.10.0 through before 2.34.8. The [October 19 collector](../../../raw/processed/2026-10-19/ai-security-wiki-topic-news-collector-2026-10-19T140139-0400.json) records that an unauthenticated loopback agent-debug endpoint on port 2113 can disclose template-provided environment values to a lower-privileged process in the same workspace. Broad Coder product context remains upstream-owned.

## Security Impact

- Threat: a co-resident low-privilege process can read cloud or registry credentials from a local agent manifest.
- Affected boundary: Coder agent-debug server, workspace loopback network, and template-provided environment values.
- Exploit or incident status: public CVE and [GitHub Security Advisory](https://github.com/coder/coder/security/advisories/GHSA-73wg-wxvv-9r4j); active exploitation is not identified.
- Mitigation state: upgrade to 2.34.8 or later and prevent untrusted workspace processes from reaching local agent debugging services.
- Confidence: high for the affected range and disclosure boundary.
- Residual risk: loopback-only services are not a sufficient trust boundary between workspace processes.

## Authoritative Sources

- [October 19 collector source](../../../raw/processed/2026-10-19/ai-security-wiki-topic-news-collector-2026-10-19T140139-0400.json)
- [CVE-2026-111926](https://nvd.nist.gov/vuln/detail/CVE-2026-111926)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [data and privacy](index.md)
- [identity and access](../identity-and-access/index.md)

## Open Questions

- Does the 2.34.8 remediation also limit manifest fields exposed to authenticated local diagnostics?

## Maintenance Notes

- Created on 2026-10-20 from the October 19 collector; verify any later Coder advisory scope before changing the fixed-version boundary.
