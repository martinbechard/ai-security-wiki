# Identity And Access

## Current Understanding

This topic owns human and non-human identity, authentication, authorization, credential handling, delegation, least privilege, and lifecycle controls for AI systems.

## Leaf Pages

- [Hatchet OAuth state reuse](hatchet-oauth-state-reuse.md)
- [MaxKB tool dispatch grant bypass](maxkb-tool-dispatch-grant-bypass.md)
- [MaxKB expired MCP application key](maxkb-expired-mcp-application-key.md)
- [MaxKB application node authorization bypass](maxkb-application-node-authorization-bypass.md)
- [MaxKB model parameter form cross-workspace write](maxkb-model-parameter-form-cross-workspace-write.md)
- [MCP tool-level IAM authorization](mcp-tool-level-iam-authorization.md)
- [MCP client OAuth redirect URI handling](mcp-client-oauth-redirect-uri-handling.md)
- [MCP SDK OAuth issuer binding](mcp-sdk-oauth-issuer-binding.md)
- [Development agent credential isolation](development-agent-credential-isolation.md)
- [Production agent identity and access controls](production-agent-identity-and-access-controls.md)
- [Agent synthetic insider risk](agent-synthetic-insider-risk.md)
- [MemOS internal service secret auth bypass](memos-internal-service-secret-auth-bypass.md)
- [OpenShift AI service account excessive permissions](openshift-ai-service-account-excessive-permissions.md)
- [ArcadeDB MCP server setting authorization bypass](arcadedb-mcp-server-setting-authorization-bypass.md)
- [ArcadeDB AI chat query_database authorization](arcadedb-ai-chat-query-database-authorization.md)
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
- [PraisonAI Jobs API unauthenticated execution](praisonai-jobs-api-unauthenticated-execution.md)

- [Telnyx MCP stored credential auth bypass](telnyx-mcp-stored-credential-auth-bypass.md)
- [FastGPT WeChat outLink auth bypass](fastgpt-wechat-outlink-auth-bypass.md)
- [VoltAgent memory ownership bypass](voltagent-memory-ownership-bypass.md)
- [Gitingest host-prefix token disclosure](gitingest-host-prefix-token-disclosure.md)
- [astron-agent workflow ownership bypass](astron-agent-workflow-ownership-bypass.md)
- [HEL Online Classroom AI plugin authorization cluster](hel-online-classroom-ai-plugin-authorization-cluster.md)
- [diboot AI Session authorization bypass](diboot-ai-session-authorization-bypass.md)
- [Kibana AI Assistant Knowledge Base cross-realm authorization](kibana-ai-assistant-knowledge-base-cross-realm-authorization.md)
- [Support Genix AI Chatbot admin takeover](support-genix-ai-chatbot-admin-takeover.md)
- [Agentimus AI SEO MCP WordPress broken access control](agentimus-ai-seo-mcp-wordpress-broken-access-control.md)
- [MountDev AI MCP Connector WordPress authorization bypass](mountdev-ai-mcp-connector-wordpress-authorization-bypass.md)
- [Azure AI Language missing authentication](azure-ai-language-missing-authentication.md)
- [Azure AI Foundry missing authentication](azure-ai-foundry-missing-authentication.md)
- [Copilot Studio signature verification privilege elevation](copilot-studio-signature-verification-privilege-elevation.md)
- [JeecgBoot Airag exportXls access control](jeecgboot-airag-exportxls-access-control.md)
- [OpenShift AI NIM Secret authorization bypass](openshift-ai-nim-secret-authorization-bypass.md)
- [Open WebUI OAuth token audience binding](open-webui-oauth-token-audience-binding.md)
- [Open WebUI chat channel authorization](open-webui-chat-channel-authorization.md)
- [Flowise chatflow and agentflow deletion authorization](flowise-chatflow-agentflow-deletion-authorization.md)
- [IBM ContextForge default credentials](ibm-contextforge-default-credentials.md)
- [Flowise node-load-method credential IDOR](flowise-node-load-method-credential-idor.md)
- [WPBot AI provider API-key spend](wpbot-ai-provider-api-key-spend.md)
- [WPBot Claude provider settings overwrite](wpbot-claude-provider-settings-overwrite.md)
- [CordysCRM AI CRM authorization cluster](cordyscrm-ai-crm-authorization-cluster.md)
- [CordysCRM MCP form config metadata exposure](cordyscrm-mcp-form-config-metadata-exposure.md)
- [CordysCRM SSE workflow event authorization](cordyscrm-sse-workflow-event-authorization.md)
- [CordysCRM record read authorization bypass](cordyscrm-record-read-authorization-bypass.md)
- [CordysCRM attachment preview authorization bypass](cordyscrm-attachment-preview-authorization-bypass.md)
- [Cheshire Cat AI default identity bypass](cheshire-cat-ai-default-identity-bypass.md)
- [MCPHub OAuth code redemption bypass](mcphub-oauth-code-redemption-bypass.md)
- [n8n Instance AI credential-origin confusion](n8n-instance-ai-credential-origin-confusion.md)
- [IBM Langflow MCP Tools cache isolation](ibm-langflow-mcp-tools-cache-isolation.md)
- [macOS secure-prompt clickjacking bypass](macos-secure-prompt-clickjacking-bypass.md)
- [NetLicensing MCP Server operator key fallback](netlicensing-mcp-server-operator-key-fallback.md)
- [Meta Ads MCP operator token fallback](meta-ads-mcp-operator-token-fallback.md)
- [Online Scheduling AI booking conversation authorization](online-scheduling-ai-booking-conversation-authorization.md)
- [Better Messages AI chatbot authorization cluster](better-messages-ai-chatbot-authorization-cluster.md)

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

- Updated on 2026-09-03 with Agentimus and MountDev AI/MCP WordPress authorization leaves.
- Updated on 2026-09-04 with Azure AI Language missing-authentication coverage and Junie config trust-marker evidence.
- Updated on 2026-09-06 with Copilot Studio signature-verification privilege elevation and JeecgBoot Airag exportXls access-control leaves.
- Updated on 2026-09-07 with the OpenShift AI NIM Secret authorization bypass leaf.
- Updated on 2026-09-08 with Open WebUI OAuth/chat-channel authorization and Flowise destructive-flow authorization leaves.
- Updated on 2026-09-13 with ContextForge default credentials, Flowise credential IDOR, WPBot provider-key spend, Cheshire Cat AI default identity, MCPHub OAuth, n8n credential-origin, ArcadeDB, and NIST identity-control updates.
- Updated on 2026-09-15 with PraisonAI Jobs API unauthenticated execution, IBM Langflow MCP Tools cache isolation, and watcher metadata for Flowise, WPBot, and Cheshire Cat AI leaves.
- Updated on 2026-09-17 with the macOS secure-prompt clickjacking bypass leaf.
- Updated on 2026-09-18 with NetLicensing operator-key fallback, RMCP OAuth protected-resource binding, and AgentCore consent portal evidence.
- Updated on 2026-09-19 with Azure AI Foundry missing authentication, split CordysCRM authorization leaves, WPBot Claude settings overwrite, and Meta Ads MCP operator-token fallback leaves.
- Updated on 2026-09-20 with ArcadeDB AI chat tool authorization, Online Scheduling AI booking conversation ownership, and Better Messages AI chatbot authorization leaves.
- Updated on 2026-09-21 with Hatchet OAuth state reuse and MaxKB tool/MCP authorization leaves.
- Updated on 2026-09-01 with Kibana AI Assistant Knowledge Base cross-realm authorization, Support Genix AI Chatbot admin takeover, and Synthetic Insider Threat Matrix evidence.
- Updated on 2026-08-31 with diboot AI Session authorization bypass and ash_ai/MCPHub identity-boundary routing.
- Updated on 2026-08-29 with FastGPT channel authorization, VoltAgent memory ownership, Gitingest token disclosure, and watcher provenance for Telnyx.
- Updated on 2026-08-30 with astron-agent workflow ownership and HEL Online Classroom plugin authorization leaves.
- Updated on 2026-08-28 with Telnyx MCP stored-credential auth bypass plus watcher enrichments for one-api, UniFi Protect AI Key, and PraisonAI auth-enforcement leaves.
- Distinguish user identity, workload identity, agent identity, delegated authority, and tool credentials.
- Updated on 2026-08-17 with MemOS internal-service identity and OpenShift AI service-account least-privilege advisory leaves.
- Updated on 2026-08-19 with ArcadeDB, Apify, Onyx, and 9Router identity-boundary advisory leaves.
- Updated on 2026-08-21 with the downstream agent authorization context control leaf.
- Updated on 2026-08-22 with the Headroom proxy routing and memory-owner boundary leaf plus downstream authorization watcher evidence.
- Updated on 2026-08-23 with the delegated task authorization drift incident-pattern leaf.
- Updated on 2026-08-26 with Coroot MCP OAuth DCR redirect-hijack and Kibana AI Assistant conversation-owner leaves.
- Updated on 2026-08-27 with one-api channel-pinning provider-key, UniFi Protect AI Key privilege-escalation, and PraisonAI auth-enforcement leaves.
