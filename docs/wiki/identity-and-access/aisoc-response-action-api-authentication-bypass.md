---
type: "Topic"
title: "AiSOC Response Action API Authentication Bypass"
description: "Security analysis for CVE-2026-103053 unauthenticated AiSOC response-action API control in default Docker Compose deployments."
tags: ["identity-and-access", "agent-and-tool-security"]
---

# AiSOC Response Action API Authentication Bypass

## Current Understanding

The [October 1 topic collector source](../../../raw/processed/2026-10-01/ai-security-wiki-topic-news-collector-2026-10-01T233213Z.json) records [CVE-2026-103053](https://cveawg.mitre.org/api/cve/CVE-2026-103053) for AiSOC versions 9.0.0 before 12.0.0. Broad AiSOC product context belongs upstream if it becomes durable; this page owns the local response-action API authentication boundary.

The CVE record says response-action API endpoints fail to enforce authentication when `AISOC_DEV_MODE` is enabled and `AISOC_ACTIONS_SERVICE_TOKEN` is empty in the default Docker Compose deployment. Unauthenticated attackers can list response-action integrations, submit and approve actions as arbitrary principals, and dispatch containment actions using vendor credentials.

## Security Impact

- Threat: unauthenticated users can reach high-authority response-action workflows.
- Affected boundary: AiSOC 9.0.0 before 12.0.0, default Docker Compose deployment, `AISOC_DEV_MODE`, empty `AISOC_ACTIONS_SERVICE_TOKEN`, response-action integrations, approvals, and containment actions.
- Exploit or incident status: public CVE record; no confirmed active exploitation is recorded in the source.
- Mitigation state: update to AiSOC 12.0.0 or later and require non-empty service tokens plus explicit authentication on response-action endpoints.
- Confidence: high for public CVE identity and behavior; medium for deployment-specific remediation beyond the CVE text.
- Residual risk: response-action control planes need fail-closed deployment defaults because development-mode fallbacks can carry production vendor credentials.

## Authoritative Sources

- [October 1 topic collector source](../../../raw/processed/2026-10-01/ai-security-wiki-topic-news-collector-2026-10-01T233213Z.json)
- [CVE-2026-103053 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-103053)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [agent and tool security](../agent-and-tool-security/index.md)
- [agentic AI emergency shutdown controls](../agent-and-tool-security/agentic-ai-emergency-shutdown-controls.md)

## Open Questions

- Which AiSOC advisory or release note documents deployment hardening beyond the 12.0.0 fixed version?

## Maintenance Notes

- Created on 2026-10-02 from the [October 1 topic collector source](../../../raw/processed/2026-10-01/ai-security-wiki-topic-news-collector-2026-10-01T233213Z.json) after splitting the AiSOC CVE cluster into item-level leaves.
