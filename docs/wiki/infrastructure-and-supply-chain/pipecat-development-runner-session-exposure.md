---
type: "Topic"
title: "Pipecat Development-Runner Session Exposure"
description: "Security analysis for CVE-2026-102682 unauthenticated development-runner session and room creation when Pipecat is exposed beyond localhost."
tags: ["infrastructure-and-supply-chain", "agent-and-tool-security"]
---

# Pipecat Development-Runner Session Exposure

## Current Understanding

The [October 15 topic collector source](../../../raw/processed/2026-10-15/ai-security-wiki-topic-news-collector-2026-10-15T232644Z.json) records [CVE-2026-102682](https://cveawg.mitre.org/api/cve/CVE-2026-102682): Pipecat's development runner from 0.0.98 through 1.6.0 exposes unauthenticated endpoints that create bot sessions and Daily rooms. The default localhost binding limits exposure, but publishing the port, using `--host 0.0.0.0`, or tunnelling it admits unauthenticated callers. Broad Pipecat context belongs upstream; this page owns development-runtime exposure and deployment-gate controls.

Version 1.6.0 adds warnings and production-deployment guidance. The captured public evidence does not establish that those guidance changes authenticate the development endpoints or identify a fixed version.

## Security Impact

- Threat: unauthenticated callers create bot sessions and third-party Daily rooms, consuming resources and potentially receiving room URLs and join tokens.
- Affected boundary: pipecat-ai 0.0.98 through 1.6.0; development-runner `/start`, `/daily`, and `/daily-dialin-webhook` endpoints when network-exposed.
- Exploit or incident status: public CVE; no local exploitation incident is recorded.
- Mitigation state: keep development runners loopback-bound and non-routable, add authenticated production dispatch before publication, and treat exposure changes as release-gate events. Version 1.6.0 supplies warnings and guidance, but endpoint-authentication remediation is not established.
- Confidence: high for published exposure conditions and documented development-runner role; low for any claim of a fixed version.
- Residual risk: localhost defaults cease to protect a runner once a tunnel, proxy, container port, or explicit host setting exposes it.

## Authoritative Sources

- [October 15 topic collector source](../../../raw/processed/2026-10-15/ai-security-wiki-topic-news-collector-2026-10-15T232644Z.json)
- [CVE-2026-102682 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-102682)
- [Pipecat 1.6.0 release](https://github.com/pipecat-ai/pipecat/releases)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [production agent identity and access controls](../identity-and-access/production-agent-identity-and-access-controls.md)

## Open Questions

- Does Pipecat provide an authenticated production runner path that replaces these development endpoints, are all three named routes protected there, and is a fixed version published beyond 1.6.0?

## Maintenance Notes

- Created on 2026-10-15 from CVE-2026-102682; treat the localhost default as exposure reduction, not endpoint authentication.
