---
type: "Topic"
title: "Keploy Agent Control-Plane TLS Key Exposure"
description: "Security analysis for CVE-2026-82641 Keploy unauthenticated agent control-plane keylog exposure."
tags: ["data-and-privacy", "agent-and-tool-security"]
---

# Keploy Agent Control-Plane TLS Key Exposure

## Current Understanding

The [August 30 topic collector source](../../../raw/processed/2026-08-30/ai-security-wiki-topic-news-collector-2026-08-30T233055Z.json) records [CVE-2026-82641](https://nvd.nist.gov/vuln/detail/CVE-2026-82641) for Keploy 3.1.0 through 3.6.25. Keploy as a general development and testing workflow tool routes to ai-dev-wiki; this page owns the local security-control-plane and captured-traffic exposure boundary.

NVD and the [VulnCheck advisory](https://www.vulncheck.com/advisories/keploy-3.1.0-through-3.6.25-unauthenticated-tls-key-exposure) say Keploy bound its agent control-plane HTTP server to all interfaces without authentication. Attackers could access `/agent/pcap/keylog` for NSS keylog lines that decrypt recorded TLS traffic, or call `/agent/stop` and `/agent/storemocks` to manipulate recording sessions. The collector cites the [patch commit](https://github.com/keploy/keploy/commit/a6257d2b3184b85eb30edad345464aa292297b83) as remediation evidence.

## Security Impact

- Threat: unauthenticated control-plane access can expose TLS key material and alter test recording evidence.
- Affected boundary: Keploy 3.1.0 through 3.6.25 agent control-plane HTTP server, packet capture keylog endpoint, stop endpoint, and mock-storage endpoint.
- Exploit or incident status: public vulnerability disclosure; no local exploitation incident is recorded.
- Mitigation state: apply the patch or a fixed release, bind control planes to trusted interfaces, require authentication, rotate and quarantine affected recordings, and treat exposed NSS keylog lines as decrypted-traffic exposure.
- Confidence: high for advisory identity, affected range, and patch evidence from NVD, VulnCheck, issue, and commit references.
- Residual risk: AI-assisted testing and replay tools can hold production-like traffic, so control-plane exposure can undermine both confidentiality and test-evidence integrity.

## Control Implications

- Treat agent test harnesses as security-sensitive runtimes when they capture HTTP, TLS, or credential-bearing traffic.
- Require authentication and network binding review for recording, replay, mock generation, and packet-capture controls.
- Preserve tamper evidence when recorded traffic feeds bug reproduction, regression tests, or generated mocks.

## Authoritative Sources

- [August 30 topic collector source](../../../raw/processed/2026-08-30/ai-security-wiki-topic-news-collector-2026-08-30T233055Z.json)
- [NVD CVE-2026-82641](https://nvd.nist.gov/vuln/detail/CVE-2026-82641)
- [VulnCheck advisory](https://www.vulncheck.com/advisories/keploy-3.1.0-through-3.6.25-unauthenticated-tls-key-exposure)
- [Keploy issue 4394](https://github.com/keploy/keploy/issues/4394)
- [Keploy patch commit](https://github.com/keploy/keploy/commit/a6257d2b3184b85eb30edad345464aa292297b83)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [data and privacy](index.md)
- [agent and tool security](../agent-and-tool-security/index.md)
- [AI coding telemetry access controls](ai-coding-telemetry-access-controls.md)

## Open Questions

- Which Keploy release first includes the patch for authenticated agent control-plane access?

## Maintenance Notes

- Created on 2026-08-30 from the [August 30 topic collector](../../../raw/processed/2026-08-30/ai-security-wiki-topic-news-collector-2026-08-30T233055Z.json) as a captured-traffic and control-plane exposure leaf.
