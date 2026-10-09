---
type: "Topic"
title: "Pydantic AI Local Web Chat Origin Bypass"
description: "Security analysis for Pydantic AI local web chat Host and browser-simple request controls."
tags: ["agent-and-tool-security", "identity-and-access"]
---

# Pydantic AI Local Web Chat Origin Bypass

## Current Understanding

The [October 8 topic collector source](../../../raw/processed/2026-10-08/ai-security-wiki-topic-news-collector-2026-10-08T233132Z.json) records Pydantic AI local web chat flaws affecting `Agent.to_web()`, `clai web`, and `/api/chat`. Broad Pydantic AI developer-experience context belongs upstream; this page owns the browser-to-local-agent authority boundary.

[CVE-2026-107292](https://cveawg.mitre.org/api/cve/CVE-2026-107292) says the local chat endpoint did not validate the `Host` header. [CVE-2026-107295](https://cveawg.mitre.org/api/cve/CVE-2026-107295) says `pydantic-ai-slim` web UI `/api/chat` accepted browser-simple cross-origin requests that can trigger agent tool execution. The CVE records cite fixed releases 1.107.5/2.30.0 for Host validation and 1.107.4/2.28.0 for browser-simple cross-origin requests.

## Security Impact

- Threat: a malicious web page or rebinding path can reach a developer's local agent chat endpoint and cause model/tool execution under local authority.
- Affected boundary: Pydantic AI and `pydantic-ai-slim`, `Agent.to_web()`, `clai web`, local `/api/chat`, Host validation, cross-origin browser requests, and local tool authority.
- Exploit or incident status: public CVE Services records and GitHub advisories; no confirmed exploitation incident is recorded locally.
- Mitigation state: update to fixed releases and require Host, Origin, CSRF, and loopback binding checks before local web agents accept browser-origin traffic.
- Confidence: high for affected ranges and fixed versions; medium for exploitability because local exposure depends on developer workflow and network binding.
- Residual risk: local agent UIs need browser-threat testing because localhost does not by itself prevent cross-origin request or DNS-rebinding paths.

## Authoritative Sources

- [October 8 topic collector source](../../../raw/processed/2026-10-08/ai-security-wiki-topic-news-collector-2026-10-08T233132Z.json)
- [CVE-2026-107292 record](https://cveawg.mitre.org/api/cve/CVE-2026-107292)
- [GHSA-q2xc-rrxj-58x9](https://github.com/pydantic/pydantic-ai/security/advisories/GHSA-q2xc-rrxj-58x9)
- [CVE-2026-107295 record](https://cveawg.mitre.org/api/cve/CVE-2026-107295)
- [GHSA-h4xc-3qfq-jf93](https://github.com/pydantic/pydantic-ai/security/advisories/GHSA-h4xc-3qfq-jf93)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [approval metadata access control](approval-metadata-access-control.md)
- [cross-site agent forgery](cross-site-agent-forgery.md)
- Upstream AI wiki owns broad [Pydantic AI framework coverage](../../../upstream-ai-wiki/agentic-frameworks/pydantic-ai.md).

## Open Questions

- Do the fixed Pydantic AI local web-chat paths reject browser-simple requests before any model call or tool dispatch is initialized?

## Maintenance Notes

- Created on 2026-10-09 from the [October 8 topic collector source](../../../raw/processed/2026-10-08/ai-security-wiki-topic-news-collector-2026-10-08T233132Z.json) as a local browser-to-agent authority leaf.
