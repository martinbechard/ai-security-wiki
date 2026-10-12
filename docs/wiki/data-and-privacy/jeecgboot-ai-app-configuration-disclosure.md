---
type: "Topic"
title: "JeecgBoot AI App Configuration Disclosure"
description: "Security analysis for CVE-2026-108878 JeecgBoot AI application configuration disclosure."
tags: ["data-and-privacy", "identity-and-access"]
---

# JeecgBoot AI App Configuration Disclosure

## Current Understanding

The [October 11 topic collector source](../../../raw/processed/2026-10-11/ai-security-wiki-topic-news-collector-2026-10-11T233138Z.json) records [CVE-2026-108878](https://nvd.nist.gov/vuln/detail/CVE-2026-108878) as a post-run JeecgBoot authorization delta. Broad JeecgBoot product context belongs upstream; this page owns AI app configuration disclosure.

The NVD evidence says low-privileged users can read any AI application configuration through `AiragAppController queryById`. Exposed configuration includes system prompts, memory prompts, model IDs, knowledge base IDs, and plugin bindings.

## Security Impact

- Threat: low-privileged users can read AI app configuration and prompt material outside ownership boundaries.
- Affected boundary: JeecgBoot through 3.9.5, `AiragAppController queryById`, AI application configuration, system prompts, memory prompts, model IDs, knowledge base IDs, and plugin bindings.
- Exploit or incident status: public NVD and CVE Services records; no confirmed exploitation incident is recorded locally.
- Mitigation state: enforce owner/tenant checks on AI app configuration reads, redact prompt and plugin binding details where not needed, and review exposed configurations.
- Confidence: high for affected version and exposed fields from NVD evidence.
- Residual risk: AI app configuration combines prompt governance, retrieval topology, model routing, and plugin authority in one sensitive object.

## Authoritative Sources

- [October 11 topic collector source](../../../raw/processed/2026-10-11/ai-security-wiki-topic-news-collector-2026-10-11T233138Z.json)
- [NVD CVE-2026-108878](https://nvd.nist.gov/vuln/detail/CVE-2026-108878)
- [CVE-2026-108878 record](https://cveawg.mitre.org/api/cve/CVE-2026-108878)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [data and privacy](index.md)
- [JeecgBoot MCP Server Configuration Token Disclosure](jeecgboot-mcp-server-configuration-token-disclosure.md)
- [JeecgBoot AI Prompt Template Authorization Bypass](../identity-and-access/jeecgboot-ai-prompt-template-authorization-bypass.md)
- [JeecgBoot Third-Party App Config Authorization Bypass](../identity-and-access/jeecgboot-third-party-app-config-authorization-bypass.md)

## Open Questions

- Does the same JeecgBoot fixed version cover AI app configuration reads and the earlier October 10 authorization cluster?

## Maintenance Notes

- Created on 2026-10-12 from the [October 11 topic collector source](../../../raw/processed/2026-10-11/ai-security-wiki-topic-news-collector-2026-10-11T233138Z.json) after merging broad JeecgBoot context upstream.
