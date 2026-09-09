---
type: "Topic"
title: "Flowise chatflow and agentflow deletion authorization"
description: "Security analysis for Flowise 3.1.3 chatflow and agentflow deletion authorization confusion."
tags: ["identity-and-access", "agent-and-tool-security"]
---

# Flowise chatflow and agentflow deletion authorization

## Current Understanding

The [September 8 topic collector source](../../../raw/processed/2026-09-08/ai-security-wiki-topic-news-collector-2026-09-08T233200Z.json) records an in-window NVD update for Flowise chatflow and agentflow deletion authorization confusion fixed in 3.1.3. Broad Flowise workflow-builder context belongs upstream; this page owns the object-ownership boundary for destructive operations on shared agent-builder assets.

## Security Impact

- Threat: a user can delete or affect chatflow or agentflow objects outside the user's intended ownership or workspace authority.
- Affected boundary: Flowise versions before 3.1.3; chatflow and agentflow deletion paths.
- Exploit or incident status: public NVD/CVE/GitHub advisory evidence; no local exploitation incident is recorded.
- Mitigation state: upgrade to Flowise 3.1.3 or later and enforce owner/workspace authorization on destructive flow operations.
- Confidence: high for NVD update timing and fixed-version signal; medium for exact affected role combinations.
- Residual risk: agent-builder collaboration surfaces need backend object checks even when the UI hides destructive controls.

## Authoritative Sources

- [September 8 topic collector source](../../../raw/processed/2026-09-08/ai-security-wiki-topic-news-collector-2026-09-08T233200Z.json)
- [Flowise 3.1.3 release](https://github.com/FlowiseAI/Flowise/releases/tag/flowise@3.1.3)
- [CVE-2026-69262 NVD record](https://nvd.nist.gov/vuln/detail/CVE-2026-69262)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [MCP tool-level IAM authorization](mcp-tool-level-iam-authorization.md)
- [agent and tool security](../agent-and-tool-security/index.md)

## Open Questions

- No open wiki questions are recorded for this topic.

## Maintenance Notes

- Created on 2026-09-08 from the September 8 topic collector after verifier correction split the Flowise release wave into focused security-boundary leaves.
