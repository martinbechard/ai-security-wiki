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

The [August 22 leaf update watch source](../../../raw/processed/2026-08-22/ai-security-wiki-leaf-update-watch-20260823T000329Z.json) adds [JFrog's AgentCore Gateway and Artifactory example](https://jfrog.com/blog/amazon-bedrock-agentcore-gateway-jfrog-artifactory/) as a same-pattern implementation signal: a gateway performs on-behalf-of token exchange so the downstream repository system receives per-user identity rather than a broad shared tool credential. That evidence links this page to [MCP tool-level IAM authorization](mcp-tool-level-iam-authorization.md) without moving the broad AgentCore product coverage out of upstream ownership.

The [agent delegated task authorization drift](agent-delegated-task-authorization-drift.md) leaf records the incident-pattern side of the same control: even when a human delegates a legitimate goal, downstream systems still need subject/resource authorization checks that prevent an agent from acting on another user's queue entry, booking, or account state.

The [September 17 leaf update watch source](../../../raw/processed/2026-09-17/ai-security-wiki-leaf-update-watch-20260918T000418Z.json) adds AWS AgentCore Identity Consent portal evidence. The pattern gives IDE and MCP clients a managed three-legged OAuth web experience, binds consent to a session, authenticates through the organization's IdP, stores resulting user tokens in the AgentCore Identity token vault, and records consent operations in CloudTrail. Broad AWS and AgentCore product coverage stays upstream; locally, this is a managed user-consent/session-binding implementation for downstream tool authorization.

## Security Impact

- Threat: agents that hold broad service credentials can turn prompt manipulation, planner bugs, or tool-call confusion into cross-user data access.
- Affected boundary: production agents that access DynamoDB, Bedrock Knowledge Bases, Salesforce, GitHub, Slack, or similar downstream systems through Amazon Bedrock AgentCore Runtime, Gateway, and Identity patterns.
- Exploit or incident status: control architecture guidance, not a reported incident.
- Mitigation state: propagate user claims into short-lived credentials, filter retrieval by authorization metadata, use on-behalf-of token exchange, bind OAuth consent sessions to the user, store per-user tool tokens in a managed vault, and audit consent through CloudTrail or equivalent evidence.
- Confidence: medium-high because the item is primary cloud-provider guidance with secondary in-window corroboration.
- Residual risk: teams still need audit evidence that every retrieval and action path uses the propagated context, not a fallback service identity.

## Authoritative Sources

- [August 21 topic news collector source](../../../raw/processed/2026-08-21/ai-security-wiki-topic-news-collector-2026-08-21T233219Z.json)
- [August 22 leaf update watch source](../../../raw/processed/2026-08-22/ai-security-wiki-leaf-update-watch-20260823T000329Z.json)
- [September 17 leaf update watch source](../../../raw/processed/2026-09-17/ai-security-wiki-leaf-update-watch-20260918T000418Z.json)
- [AWS Security Blog on propagating user authorization context](https://aws.amazon.com/blogs/security/propagate-user-authorization-context-in-ai-agents-with-amazon-bedrock-agentcore/)
- [AWS AgentCore consent portal guidance](https://aws.amazon.com/blogs/machine-learning/manage-end-user-oauth-consent-for-ai-agents-with-amazon-bedrock-agentcore/)
- [Help Net Security report on AWS AI agent access controls](https://www.helpnetsecurity.com/2026/08/20/aws-ai-agents-access-controls/)
- [JFrog AgentCore Gateway example](https://jfrog.com/blog/amazon-bedrock-agentcore-gateway-jfrog-artifactory/)

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
- [agent delegated task authorization drift](agent-delegated-task-authorization-drift.md)

## Open Questions

- Which AWS Well-Architected Agentic AI Lens AGENTSEC03 control language should be linked here if it becomes the primary reusable control source?
- Which AgentCore Gateway targets require consent revocation tests in addition to initial authorization-code flow tests?

## Maintenance Notes

- Created on 2026-08-21 from the [August 21 topic collector](../../../raw/processed/2026-08-21/ai-security-wiki-topic-news-collector-2026-08-21T233219Z.json) as a downstream-authorization pattern leaf.
- Updated on 2026-08-22 from the [August 22 leaf update watch source](../../../raw/processed/2026-08-22/ai-security-wiki-leaf-update-watch-20260823T000329Z.json) with JFrog Artifactory on-behalf-of token-exchange evidence.
- Updated on 2026-08-23 with a cross-link to [agent delegated task authorization drift](agent-delegated-task-authorization-drift.md) as the incident-pattern complement to downstream authorization propagation.
- Updated on 2026-09-18 from the [September 17 leaf update watch source](../../../raw/processed/2026-09-17/ai-security-wiki-leaf-update-watch-20260918T000418Z.json) with AgentCore Identity Consent portal, session-binding, token-vault, and CloudTrail evidence.
