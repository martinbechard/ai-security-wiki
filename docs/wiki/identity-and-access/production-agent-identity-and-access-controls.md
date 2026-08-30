---
type: "Topic"
title: "Production Agent Identity And Access Controls"
description: "Security controls for treating production AI agents as scoped principals with auditable credentials and delegated access."
tags: ["identity-and-access", "agent-and-tool-security", "governance-and-compliance"]
---

# Production Agent Identity And Access Controls

## Current Understanding

Production agent identity and access controls treat an agent as a distinct security principal with scoped authority, short-lived credentials, and audit evidence. The [August 5 topic news collector source](../../../raw/processed/2026-08-05/ai-security-wiki-topic-news-collector-2026-08-05T233123Z.json) records official [AWS agent identity and access-management guidance](https://aws.amazon.com/marketplace/build-learn/ai-agent-learning-series/agent-identity-access-management?sc_channel=el&trk=7e3e88d0-f8b6-47e7-aa65-f49a94b86088) that production agents should not inherit a broad shared service account. Broad AWS, [Amazon Bedrock](../../../upstream-ai-wiki/developer-tools/amazon-bedrock.md), marketplace, and vendor catalog coverage routes to the upstream AI wiki; this page keeps the local identity, credential, and audit-control lens.

The AWS guidance is control guidance rather than a vulnerability advisory. It names these relevant production-agent boundaries:

- task-scoped IAM roles and permission boundaries;
- short-lived AWS STS credentials and secret rotation;
- OAuth 2.0 delegation and SAML/OIDC federation;
- tenant isolation;
- prompt-injection filtering for credential-exfiltration attempts;
- CloudTrail logging and S3 Object Lock evidence retention.

This page complements [development agent credential isolation](development-agent-credential-isolation.md). Development isolation separates local model, artifact, database, and Git credentials. Production identity control adds auditable workload identity, tenant-aware authorization, delegated user authority, non-repudiable logging, and immutable evidence for agents that call cloud, SaaS, or MCP tools.

The [August 6 leaf update watch source](../../../raw/processed/2026-08-06/ai-security-wiki-leaf-update-watch-20260807T000542Z.json) keeps the same AWS guidance in scope and reinforces prompt-injection credential-theft filtering as part of production-agent credential control.

The [August 29 topic collector source](../../../raw/processed/2026-08-29/ai-security-wiki-topic-news-collector-2026-08-29T233233Z.json) adds a [NIST Cybersecurity Insights signal](https://www.nist.gov/blogs/cybersecurity-insights/back-future-why-agentic-ai-needs-strong-identity-foundation) with an in-window HTTP `Last-Modified` value. NIST frames agentic AI as an identity and authorization problem where overbroad tokens, standing privilege, and missing granular authorization become harder to control when agents act faster and at larger scale than human users. This evidence reinforces the existing control rule rather than creating a broad NIST page locally.

## Security Impact

- Threat: agents with shared service-account credentials can overreach across tenants, tools, data classes, or user authority when prompts, tool outputs, or delegated tasks are hostile.
- Affected boundary: production agent principals, cloud IAM roles, STS sessions, secrets, OAuth delegation, SAML/OIDC federation, audit logs, and evidence stores.
- Exploit or incident status: control guidance, not an incident disclosure.
- Mitigation state: guidance-level mitigations include least privilege, short-lived credentials, tenant isolation, credential-exfiltration filtering, non-repudiable logging, and immutable evidence retention.
- Confidence: medium-high for AWS and NIST control recommendations because the sources are official and dated; NIST is treated as an updated guidance item because the page returned an in-window HTTP `Last-Modified` header.
- Residual risk: exact minimum permissions, token lifetime, delegated-user mapping, and prompt-injection credential filters remain workload-specific.

## Control Implications

- Assign each production agent a distinct principal or workload identity; avoid reusable shared service accounts.
- Scope credentials by task, tenant, tool, environment, and data class.
- Prefer short-lived credentials and automatic rotation over static secrets in agent configuration.
- Record delegated user authority separately from agent workload identity when an agent acts on behalf of a person.
- Monitor prompt-injection and tool-output paths for credential-exfiltration attempts.
- Preserve CloudTrail-equivalent audit events and immutable evidence for agent actions that affect production resources.
- Require production-readiness reviews to prove identity scope, credential lifetime, tenant isolation, and log retention before deployment.

## Authoritative Sources

- [August 6 leaf update watch source](../../../raw/processed/2026-08-06/ai-security-wiki-leaf-update-watch-20260807T000542Z.json)
- [August 29 topic collector source](../../../raw/processed/2026-08-29/ai-security-wiki-topic-news-collector-2026-08-29T233233Z.json)
- [August 5 topic news collector source](../../../raw/processed/2026-08-05/ai-security-wiki-topic-news-collector-2026-08-05T233123Z.json)
- [AWS agent identity and access-management guidance](https://aws.amazon.com/marketplace/build-learn/ai-agent-learning-series/agent-identity-access-management?sc_channel=el&trk=7e3e88d0-f8b6-47e7-aa65-f49a94b86088)
- [NIST agentic AI identity foundation blog](https://www.nist.gov/blogs/cybersecurity-insights/back-future-why-agentic-ai-needs-strong-identity-foundation)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [development agent credential isolation](development-agent-credential-isolation.md)
- [MCP tool-level IAM authorization](mcp-tool-level-iam-authorization.md)
- [AI provider override trust boundaries](../data-and-privacy/ai-provider-override-trust-boundaries.md)
- Upstream AI wiki owns broad [agent identity access model](../../../upstream-ai-wiki/techniques/agent-identity-access-model.md) and [Amazon Bedrock](../../../upstream-ai-wiki/developer-tools/amazon-bedrock.md) coverage.
- Upstream AI development wiki owns general [agent identity and delegated authority](../../../upstream-ai-dev-wiki/governance-and-risk/agent-identity-and-delegated-authority.md) practice.

## Open Questions

- Which cloud-provider evidence should be considered equivalent to CloudTrail and S3 Object Lock for non-AWS production agents?
- What minimum token lifetime and permission-boundary pattern should be required for agents that call MCP tools in production?
- Which prompt-injection filters can reliably detect credential-exfiltration attempts without suppressing legitimate delegated work?

## Maintenance Notes

- Created on 2026-08-05 from the [August 5 topic collector](../../../raw/processed/2026-08-05/ai-security-wiki-topic-news-collector-2026-08-05T233123Z.json) as a production identity-control leaf after routing broad AWS and vendor catalog coverage upstream.
- Updated on 2026-08-06 from the [August 6 leaf watcher](../../../raw/processed/2026-08-06/ai-security-wiki-leaf-update-watch-20260807T000542Z.json) to record supporting provenance for prompt-injection credential-theft filtering without creating a separate digest item. Next check should look for cross-cloud equivalents to AWS IAM, STS, CloudTrail, and S3 Object Lock guidance.
- Updated on 2026-08-30 from the [August 29 topic collector](../../../raw/processed/2026-08-29/ai-security-wiki-topic-news-collector-2026-08-29T233233Z.json) with NIST agentic-AI identity and least-standing-privilege guidance.
