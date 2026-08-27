---
type: "Topic"
title: "PraisonAI AgentServer API Key Auth Enforcement"
description: "Security analysis for CVE-2026-55528 and CVE-2026-55541 authentication enforcement failures in PraisonAI control-plane endpoints."
tags: ["identity-and-access", "agent-and-tool-security"]
---

# PraisonAI AgentServer API Key Auth Enforcement

## Current Understanding

The [August 26 leaf update watch source](../../../raw/processed/2026-08-26/ai-security-wiki-leaf-update-watch-20260827T000538Z.json) resolves two closely coupled PraisonAI authentication advisories. CVE-2026-55528 maps to [GHSA-7g3p-92qq-8wvh](https://github.com/MervinPraison/PraisonAI/security/advisories/GHSA-7g3p-92qq-8wvh) for AgentServer `auth_token` non-enforcement fixed in `praisonaiagents` 1.6.58. CVE-2026-55541 maps to [GHSA-pvxx-r596-f5qj](https://github.com/MervinPraison/PraisonAI/security/advisories/GHSA-pvxx-r596-f5qj) for `praisonai serve --api-key` non-enforcement fixed in PraisonAI 4.6.58.

These advisories can share one durable identity leaf because both concern configured authentication material that was not enforced at served agent/control-plane endpoints. Broad PraisonAI framework context belongs upstream; this page owns the local API-key and token enforcement boundary for agent control planes.

## Security Impact

- Threat: deployments that believe they configured an API key or auth token can expose agent-control endpoints without the intended authentication gate.
- Affected boundary: AgentServer `auth_token` in `praisonaiagents` before 1.6.58 and `praisonai serve --api-key` in PraisonAI before 4.6.58.
- Exploit or incident status: public CVE/GitHub advisory mappings; no local exploitation incident is recorded.
- Mitigation state: upgrade `praisonaiagents` to 1.6.58 or later and PraisonAI to 4.6.58 or later; verify endpoint-level auth enforcement in deployment tests.
- Confidence: high for mapping and fixed-version evidence from the August 26 watcher and GHSA pages.
- Residual risk: agent-control planes need negative tests proving configured credentials are enforced on every served endpoint, not just accepted by configuration.

## Authoritative Sources

- [August 26 leaf update watch source](../../../raw/processed/2026-08-26/ai-security-wiki-leaf-update-watch-20260827T000538Z.json)
- [GHSA-7g3p-92qq-8wvh](https://github.com/MervinPraison/PraisonAI/security/advisories/GHSA-7g3p-92qq-8wvh)
- [GHSA-pvxx-r596-f5qj](https://github.com/MervinPraison/PraisonAI/security/advisories/GHSA-pvxx-r596-f5qj)
- [CVE-2026-55528 record](https://cveawg.mitre.org/api/cve/CVE-2026-55528)
- [CVE-2026-55541 record](https://cveawg.mitre.org/api/cve/CVE-2026-55541)
- [PraisonAI 4.6.58 release](https://github.com/MervinPraison/PraisonAI/releases/tag/v4.6.58)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [production agent identity and access controls](production-agent-identity-and-access-controls.md)
- [PraisonAI MCP origin and CSRF instruction persistence](../agent-and-tool-security/praisonai-mcp-origin-and-csrf-instruction-persistence.md)

## Open Questions

- No open wiki questions are recorded for this topic.

## Maintenance Notes

- Created on 2026-08-27 from the [August 26 leaf watcher](../../../raw/processed/2026-08-26/ai-security-wiki-leaf-update-watch-20260827T000538Z.json) after verifier correction split the resolved PraisonAI authentication mappings into a focused identity leaf.
