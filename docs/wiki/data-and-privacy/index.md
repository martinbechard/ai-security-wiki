# Data And Privacy

## Current Understanding

This topic owns AI-specific sensitive-data exposure, training and retrieval data risk, data provenance, privacy, retention, residency, and disclosure controls.

## Leaf Pages

- [1millionbot AI chat client XSS](1millionbot-ai-chat-client-xss.md)
- [Hatchet durable task event log disclosure](hatchet-durable-task-event-log-disclosure.md)
- [Hatchet durable callback payload disclosure](hatchet-durable-callback-payload-disclosure.md)
- [Hatchet worker status event disclosure](hatchet-worker-status-event-disclosure.md)
- [MaxKB MCP tool code exposure](maxkb-mcp-tool-code-exposure.md)
- [MaxKB knowledge object IDOR](maxkb-knowledge-object-idor.md)
- [MaxKB chat record IDOR](maxkb-chat-record-idor.md)
- [MaxKB chat share link owner bypass](maxkb-chat-share-link-owner-bypass.md)
- [next-ai-draw-io provider disclosure](next-ai-draw-io-provider-disclosure.md)
- [AI provider override trust boundaries](ai-provider-override-trust-boundaries.md)
- [ATO-approved sensitive data use](ato-approved-sensitive-data-use.md)
- [AI coding telemetry redaction controls](ai-coding-telemetry-redaction-controls.md)
- [AI coding telemetry access controls](ai-coding-telemetry-access-controls.md)
- [Model processing data residency controls](model-processing-data-residency-controls.md)
- [AI agent collaboration DLP controls](ai-agent-collaboration-dlp-controls.md)
- [AI development context exclusion controls](ai-development-context-exclusion-controls.md)
- [Codex training data controls and enforcement](codex-training-data-controls-and-enforcement.md)
- [MCP data movement exposure controls](mcp-data-movement-exposure-controls.md)
- [AI Sidebar extension AI chat theft](ai-sidebar-extension-ai-chat-theft.md)
- [Oracle Siebel AI data access vulnerability](oracle-siebel-ai-data-access-vulnerability.md)
- [SiYuan debug endpoint AI key disclosure](siyuan-debug-endpoint-ai-key-disclosure.md)
- [Spring AI semantic cache cross-context leakage](spring-ai-semantic-cache-cross-context-leakage.md)
- [Spring AI Redis chat memory query injection](spring-ai-redis-chat-memory-query-injection.md)
- [Private Safety Processing ZDR](private-safety-processing-zdr.md)
- [FiftyOne local AI dataset server exposure](fiftyone-local-ai-dataset-server-exposure.md)
- [LiteLLM provider credential routing leak](litellm-provider-credential-routing-leak.md)
- [Cheshire Cat AI memory points disclosure](cheshire-cat-ai-memory-points-disclosure.md)
- [Cheshire Cat AI default identity bypass](../identity-and-access/cheshire-cat-ai-default-identity-bypass.md)
- [IBM ContextForge jq filter credential disclosure](ibm-contextforge-jq-filter-credential-disclosure.md)
- [IBM ContextForge Translate session confusion](ibm-contextforge-translate-session-confusion.md)

- [GitLab AI Gateway model metadata credential disclosure](gitlab-ai-gateway-model-metadata-credential-disclosure.md)
- [GitLab AI Gateway inline flow Host credential disclosure](gitlab-ai-gateway-inline-flow-host-credential-disclosure.md)
- [Stable Diffusion WebUI cmd-flags credential disclosure](stable-diffusion-webui-cmd-flags-credential-disclosure.md)
- [NextChat OpenAI API key disclosure](nextchat-openai-api-key-disclosure.md)
- [browser-use web-ui cleartext LLM API key storage](browser-use-web-ui-cleartext-llm-api-key-storage.md)
- [Keploy agent control-plane TLS key exposure](keploy-agent-control-plane-tls-key-exposure.md)
- [Aix-DB Markdown chat stored XSS](aix-db-markdown-chat-stored-xss.md)
- [SureForms AI Forms stored XSS](sureforms-ai-forms-stored-xss.md)
- [llmware collection filter SQL injection](llmware-collection-filter-sql-injection.md)
- [Open WebUI knowledge object access control](open-webui-knowledge-object-access-control.md)
- [Flowise MongoDBMemory session leak](flowise-mongodbmemory-session-leak.md)
- [Flowise chat-model baseURL key exfiltration](flowise-chat-model-baseurl-key-exfiltration.md)
- [Flowise node-load-method credential IDOR](../identity-and-access/flowise-node-load-method-credential-idor.md)
- [WPBot chat-session contact disclosure](wpbot-chat-session-contact-disclosure.md)
- [MCP Documentation Server knowledge base exposure](mcp-documentation-server-knowledge-base-exposure.md)
- [OpenPanel MCP token query logging](openpanel-mcp-token-query-logging.md)
- [SQLBot Assistant SVG stored XSS](sqlbot-assistant-svg-stored-xss.md)
- [SQLBot previewData SQL file disclosure](sqlbot-previewdata-sql-file-disclosure.md)
- [AI Agent Automation memory ownership bypass](ai-agent-automation-memory-ownership-bypass.md)

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

- [identity and access](../identity-and-access/index.md)
- [governance and compliance](../governance-and-compliance/index.md)

## Open Questions

- No open topic questions are recorded.

## Maintenance Notes

- Updated on 2026-09-02 with the LiteLLM provider credential routing leak leaf.
- Updated on 2026-09-04 with the Cheshire Cat AI memory points disclosure leaf.
- Updated on 2026-09-07 with SureForms AI Forms stored XSS as an AI-enabled form data-contamination boundary.
- Updated on 2026-09-08 with the llmware collection-filter SQL injection leaf and Open WebUI knowledge-object access-control leaf for retrieval and assistant-workspace data boundaries.
- Updated on 2026-09-13 with Flowise credential IDOR, WPBot chat-session contact disclosure, and Cheshire Cat AI identity/data exposure links.
- Updated on 2026-09-16 with the Flowise MongoDBMemory session leak leaf and watcher metadata enrichment for WPBot provider-key spend.
- Updated on 2026-09-17 with Flowise chat-model baseURL key exfiltration, LiteLLM nested `user_config.api_base` request-redirection evidence, and Flowise MongoDBMemory watcher metadata.
- Updated on 2026-09-18 with MCP Documentation Server knowledge-base exposure, split SQLBot data/privacy leaves, and AI Agent Automation memory ownership evidence.
- Updated on 2026-09-20 with OpenPanel MCP token query logging and links from new assistant-conversation authorization leaves.
- Updated on 2026-09-21 with Hatchet durable event disclosure, MaxKB knowledge/chat IDOR, and 1millionbot chat rendering XSS leaves.
- Updated on 2026-09-15 with WPBot chat-session contact disclosure NVD metadata enrichment and PraisonAI file-boundary privacy implications through linked infrastructure leaves.
- Updated on 2026-08-31 with the Aix-DB AI rendered-content stored-XSS leaf plus watcher enrichment for existing browser-use, Jina Reader, NextChat, and Keploy advisory leaves.
- Updated on 2026-08-29 with the Stable Diffusion WebUI credential-disclosure leaf and GitLab/Spring watcher provenance.
- Updated on 2026-08-30 with NextChat provider-key forwarding, browser-use web-ui cleartext provider-key storage, and Keploy TLS keylog exposure leaves.
- Updated on 2026-08-28 with GitLab AI Gateway credential-disclosure leaves and Spring AI Redis chat-memory query-injection enrichment.
- Do not place private, proprietary, sensitive, PII, or company-internal source content in public collector prompts.
- Updated on 2026-08-19 with the Oracle Siebel Artificial Intelligence data-access advisory leaf.
- Updated on 2026-08-19 after verifier correction split SiYuan debug endpoint credential disclosure into a data/privacy leaf.
- Updated on 2026-08-21 with Spring AI cache and memory leaves plus the Private Safety Processing ZDR privacy-control leaf.
- Updated on 2026-08-22 with FiftyOne local AI dataset server exposure and watcher enrichments for Spring AI and Private Safety Processing.
