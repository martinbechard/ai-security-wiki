---
type: "Topic"
title: "Downstream Agent Authorization Context"
description: "Security analysis for propagating user-bound authorization through production AI agents."
tags: ["identity-and-access", "agent-and-tool-security", "data-and-privacy"]
---

# Downstream Agent Authorization Context

## Current Understanding

The [August 21 topic news collector source](../../../raw/processed/2026-08-21/ai-security-wiki-topic-news-collector-2026-08-21T233219Z.json) records [AWS guidance](https://aws.amazon.com/blogs/security/propagate-user-authorization-context-in-ai-agents-with-amazon-bedrock-agentcore/) for propagating user authorization context through Amazon Bedrock AgentCore. Broad AWS, Bedrock, and [Amazon Bedrock AgentCore Runtime](../../../upstream-ai-wiki/mcp-servers/amazon-bedrock-agentcore-runtime.md) product coverage belongs upstream; this page owns the local least-privilege pattern where downstream systems, not the agent transcript, enforce access decisions.

The AWS pattern uses identity-provider claims, Bedrock AgentCore Runtime authorization, session-tagged credentials, metadata filtering for knowledge bases, and on-behalf-of token exchange for systems such as Salesforce. The security lesson is that prompt injection or agent bugs should not grant access beyond the requesting user's authority when credentials, filters, and downstream calls are bound to the user context. The source treats the AWS post as primary architecture guidance and the [Help Net Security report](https://www.helpnetsecurity.com/2026/08/20/aws-ai-agents-access-controls/) as in-window date corroboration.

## Security Impact

- Threat: agents that hold broad service credentials can turn prompt manipulation, planner bugs, or tool-call confusion into cross-user data access.
- Affected boundary: production agents that access DynamoDB, Bedrock Knowledge Bases, Salesforce, or similar downstream systems through Amazon Bedrock AgentCore Runtime and Identity patterns.
- Exploit or incident status: control architecture guidance, not a reported incident.
- Mitigation state: propagate user claims into short-lived credentials, filter retrieval by authorization metadata, and use token exchange so downstream systems remain the enforcement point.
- Confidence: medium-high because the item is primary cloud-provider guidance with secondary in-window corroboration.
- Residual risk: teams still need audit evidence that every retrieval and action path uses the propagated context, not a fallback service identity.

## Authoritative Sources

- [August 21 topic news collector source](../../../raw/processed/2026-08-21/ai-security-wiki-topic-news-collector-2026-08-21T233219Z.json)
- AWS Security Blog: https://aws.amazon.com/blogs/security/propagate-user-authorization-context-in-ai-agents-with-amazon-bedrock-agentcore/
- Help Net Security report: https://www.helpnetsecurity.com/2026/08/20/aws-ai-agents-access-controls/

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [production agent identity and access controls](production-agent-identity-and-access-controls.md)
- [MCP tool-level IAM authorization](mcp-tool-level-iam-authorization.md)

## Open Questions

- Which AWS Well-Architected Agentic AI Lens AGENTSEC03 control language should be linked here if it becomes the primary reusable control source?

## Maintenance Notes

- Created on 2026-08-21 from the [August 21 topic collector](../../../raw/processed/2026-08-21/ai-security-wiki-topic-news-collector-2026-08-21T233219Z.json) as a downstream-authorization pattern leaf.
