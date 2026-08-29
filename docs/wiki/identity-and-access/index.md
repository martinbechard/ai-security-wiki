# Identity And Access

## Current Understanding

This topic owns human and non-human identity, authentication, authorization, credential handling, delegation, least privilege, and lifecycle controls for AI systems.

## Leaf Pages

- [MCP tool-level IAM authorization](mcp-tool-level-iam-authorization.md)
- [MCP client OAuth redirect URI handling](mcp-client-oauth-redirect-uri-handling.md)
- [MCP SDK OAuth issuer binding](mcp-sdk-oauth-issuer-binding.md)
- [Development agent credential isolation](development-agent-credential-isolation.md)
- [Production agent identity and access controls](production-agent-identity-and-access-controls.md)
- [Agent synthetic insider risk](agent-synthetic-insider-risk.md)
- [MemOS internal service secret auth bypass](memos-internal-service-secret-auth-bypass.md)
- [OpenShift AI service account excessive permissions](openshift-ai-service-account-excessive-permissions.md)
- [ArcadeDB MCP server setting authorization bypass](arcadedb-mcp-server-setting-authorization-bypass.md)
- [Apify MCP token authority leak](apify-mcp-token-authority-leak.md)
- [Onyx MCP OAuth token isolation](onyx-mcp-oauth-token-isolation.md)
- [9Router OIDC test SSRF](9router-oidc-test-ssrf.md)
- [Coroot MCP OAuth DCR redirect hijack](coroot-mcp-oauth-dcr-redirect-hijack.md)
- [Kibana AI Assistant conversation ownership bypass](kibana-ai-assistant-conversation-ownership-bypass.md)
- [Downstream agent authorization context](downstream-agent-authorization-context.md)
- [Headroom LLM memory owner header bypass](headroom-llm-memory-owner-header-bypass.md)
- [Agent delegated task authorization drift](agent-delegated-task-authorization-drift.md)
- [one-api channel pinning provider key bypass](one-api-channel-pinning-provider-key-bypass.md)
- [UniFi Protect AI Key privilege escalation](unifi-protect-ai-key-privilege-escalation.md)
- [PraisonAI AgentServer API Key Auth Enforcement](praisonai-agentserver-api-key-auth-enforcement.md)

- [Telnyx MCP stored credential auth bypass](telnyx-mcp-stored-credential-auth-bypass.md)
- [FastGPT WeChat outLink auth bypass](fastgpt-wechat-outlink-auth-bypass.md)
- [VoltAgent memory ownership bypass](voltagent-memory-ownership-bypass.md)
- [Gitingest host-prefix token disclosure](gitingest-host-prefix-token-disclosure.md)

## Authoritative Sources

- [federation.md](../federation.md)
- [schema.md](../schema.md)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](../agent-and-tool-security/index.md)
- [data and privacy](../data-and-privacy/index.md)

## Open Questions

- No open topic questions are recorded.

## Maintenance Notes

- Updated on 2026-08-29 with FastGPT channel authorization, VoltAgent memory ownership, Gitingest token disclosure, and watcher provenance for Telnyx.
- Updated on 2026-08-28 with Telnyx MCP stored-credential auth bypass plus watcher enrichments for one-api, UniFi Protect AI Key, and PraisonAI auth-enforcement leaves.
- Distinguish user identity, workload identity, agent identity, delegated authority, and tool credentials.
- Updated on 2026-08-17 with MemOS internal-service identity and OpenShift AI service-account least-privilege advisory leaves.
- Updated on 2026-08-19 with ArcadeDB, Apify, Onyx, and 9Router identity-boundary advisory leaves.
- Updated on 2026-08-21 with the downstream agent authorization context control leaf.
- Updated on 2026-08-22 with the Headroom proxy routing and memory-owner boundary leaf plus downstream authorization watcher evidence.
- Updated on 2026-08-23 with the delegated task authorization drift incident-pattern leaf.
- Updated on 2026-08-26 with Coroot MCP OAuth DCR redirect-hijack and Kibana AI Assistant conversation-owner leaves.
- Updated on 2026-08-27 with one-api channel-pinning provider-key, UniFi Protect AI Key privilege-escalation, and PraisonAI auth-enforcement leaves.
