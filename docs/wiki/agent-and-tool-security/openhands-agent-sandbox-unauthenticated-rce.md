---
type: "Topic"
title: "OpenHands Agent Sandbox Unauthenticated RCE"
description: "Security analysis for CVE-2026-112346 exposed OpenHands sandbox-agent servers."
tags: ["agent-and-tool-security", "identity-and-access"]
---

# OpenHands Agent Sandbox Unauthenticated RCE

## Current Understanding

The October 26 collector records [CVE-2026-112346](https://nvd.nist.gov/vuln/detail/CVE-2026-112346) and [GHSA-rp7h-crm7-h5qj](https://github.com/advisories/GHSA-rp7h-crm7-h5qj) in OpenHands Software Agent SDK before 1.52.0. Product context is upstream-owned; this page owns the sandbox control-server network binding, session authentication, mounted-workspace, and secret-store boundary.

## Security Impact

- Threat: a reachable sandbox server bound to `0.0.0.0` with empty session keys accepts unauthenticated HTTP or WebSocket command execution as root.
- Affected boundary: DockerWorkspace and Apptainer launchers before 1.52.0.
- Exploit or incident status: public advisory; no local exploitation evidence is recorded.
- Mitigation state: upgrade to [1.52.0](https://github.com/OpenHands/software-agent-sdk/releases/tag/v1.52.0), bind control services privately, require non-empty session keys, and minimize mounts and secrets.
- Confidence: high for the condition and fixed-release boundary.
- Residual risk: a sandbox remains a host-exposure path if its control API is routable or can read broadly mounted credentials.

## Authoritative Sources

- [October 26 collector source](../../../raw/processed/2026-10-26/ai-security-wiki-topic-news-collector-2026-10-26T233009Z.json)
- [CVE-2026-112346 record](https://www.cve.org/CVERecord?id=CVE-2026-112346)
- [OpenHands 1.52.0 release](https://github.com/OpenHands/software-agent-sdk/releases/tag/v1.52.0)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [AI agent sandbox escape host file access](../infrastructure-and-supply-chain/ai-agent-sandbox-escape-host-file-access.md)

## Open Questions

- Which deployment templates still expose workspace-agent ports or mount plaintext secret stores after upgrade?

## Maintenance Notes

- Created on 2026-10-26 from the October 26 collector.
