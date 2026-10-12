---
type: "Topic"
title: "JeecgBoot Third-Party App Config Authorization Bypass"
description: "Security analysis for CVE-2026-108883 JeecgBoot third-party application configuration modification by authenticated users."
tags: ["identity-and-access", "data-and-privacy"]
---

# JeecgBoot Third-Party App Config Authorization Bypass

## Current Understanding

The [October 11 topic collector source](../../../raw/processed/2026-10-11/ai-security-wiki-topic-news-collector-2026-10-11T233138Z.json) records [CVE-2026-108883](https://nvd.nist.gov/vuln/detail/CVE-2026-108883) as a JeecgBoot post-run authorization delta. Broad JeecgBoot, DingTalk, WeCom, and Feishu product context belongs upstream; this page owns third-party integration configuration authority.

The NVD evidence says any authenticated user can modify DingTalk, WeCom, or Feishu third-party application client IDs, secrets, agent IDs, and corp IDs through `editThirdAppConfig`.

## Security Impact

- Threat: authenticated users can overwrite third-party integration credentials and control identifiers.
- Affected boundary: JeecgBoot through 3.9.5, `editThirdAppConfig`, DingTalk, WeCom, Feishu, client IDs, secrets, agent IDs, and corp IDs.
- Exploit or incident status: public NVD and CVE Services records; no confirmed exploitation incident is recorded locally.
- Mitigation state: enforce administrative authorization on integration configuration writes, rotate exposed or overwritten secrets, and audit third-party app config changes.
- Confidence: high for affected fields and endpoint boundary from NVD evidence.
- Residual risk: third-party app configuration is both an identity boundary and a secret-management boundary because it controls outbound enterprise messaging integrations.

## Authoritative Sources

- [October 11 topic collector source](../../../raw/processed/2026-10-11/ai-security-wiki-topic-news-collector-2026-10-11T233138Z.json)
- [NVD CVE-2026-108883](https://nvd.nist.gov/vuln/detail/CVE-2026-108883)
- [CVE-2026-108883 record](https://cveawg.mitre.org/api/cve/CVE-2026-108883)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [JeecgBoot AI App Configuration Disclosure](../data-and-privacy/jeecgboot-ai-app-configuration-disclosure.md)
- [JeecgBoot MCP Server Configuration Token Disclosure](../data-and-privacy/jeecgboot-mcp-server-configuration-token-disclosure.md)
- [AI provider override trust boundaries](../data-and-privacy/ai-provider-override-trust-boundaries.md)

## Open Questions

- Does JeecgBoot provide post-fix rotation or invalidation guidance for modified third-party integration secrets?

## Maintenance Notes

- Created on 2026-10-12 from the [October 11 topic collector source](../../../raw/processed/2026-10-11/ai-security-wiki-topic-news-collector-2026-10-11T233138Z.json) after routing broad integration product context upstream.
