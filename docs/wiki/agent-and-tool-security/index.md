# Agent And Tool Security

## Current Understanding

- [SxDevOps MCP STDIO command injection](sxdevops-mcp-stdio-command-injection.md)
- [nexus-mcp nexus_reauth command injection](nexus-mcp-reauth-command-injection.md)
- [mcp-file-analyzer CSV tool path traversal](mcp-file-analyzer-csv-path-traversal.md)
- [03-lovepreetSingh MCP create_file path traversal](lovepreetsingh-mcp-create-file-path-traversal.md)
- [ACE-MCP get_file_snippet root traversal](ace-mcp-get-file-snippet-root-traversal.md)
- [MCPHub template import privilege management](mcphub-template-import-privilege-management.md)
- [Tencent BrowserSkill WebSocket origin bypass](tencent-browserskill-websocket-origin-bypass.md)

This topic owns security boundaries for autonomous action, tool calls, MCP, delegated authority, sandboxing, human approval, and cross-agent trust. General agent workflows stay in ai-dev-wiki; broad products and tools stay in ai-wiki.

## Leaf Pages

- [mcp-webresearch browser SSRF](mcp-webresearch-browser-ssrf.md)
- [Langflow KEV remote code execution](langflow-kev-rce.md)
- [agent network egress controls](agent-network-egress-controls.md)
- [Network-AI ApprovalInbox authorization bypass](network-ai-approval-inbox-authorization-bypass.md)
- [approval metadata access control](approval-metadata-access-control.md)
- [Google MCP Toolbox BigQuery forecast boundary bypass](google-mcp-toolbox-bigquery-forecast-boundary-bypass.md)
- [final query authorization for AI data tools](final-query-authorization-for-ai-data-tools.md)
- [next-ai-draw-io MCP server path traversal](next-ai-draw-io-mcp-server-path-traversal.md)
- [MaxKB MCP tool import remote code execution](maxkb-mcp-tool-import-rce.md)
- [cross-site agent forgery](cross-site-agent-forgery.md)
- [n8n AI Agent Project Viewer privilege escalation](n8n-ai-agent-project-viewer-privilege-escalation.md)
- [Google API hub MCP security controls](google-api-hub-mcp-security-controls.md)
- [Kimi Code FetchURL SSRF](kimi-code-fetchurl-ssrf.md)
- [Cloud observability MCP response controls](cloud-observability-mcp-response-controls.md)
- [Local agent execution and processing boundaries](local-agent-execution-and-processing-boundaries.md)
- [Coding agent command approval boundaries](coding-agent-command-approval-boundaries.md)
- [AI agent interaction transparency controls](ai-agent-interaction-transparency-controls.md)
- [Agentic browser intent collision](agentic-browser-intent-collision.md)
- [RovoBlast enterprise data exfiltration](rovoblast-enterprise-data-exfiltration.md)
- [GhostSplice MCP split instruction exfiltration](ghostsplice-mcp-split-instruction-exfiltration.md)
- [Ghostjacking poisoned operational log agent hijack](ghostjacking-poisoned-operational-log-agent-hijack.md)
- [Cursor Auto-Run Sandbox escapes](cursor-auto-run-sandbox-escapes.md)
- [Claude Code Templates Studio remote code execution](claude-code-templates-studio-rce.md)
- [MCP Atlassian Confluence attachment file read](mcp-atlassian-confluence-attachment-file-read.md)
- [Agent action runtime hooks](agent-action-runtime-hooks.md)
- [token-optimizer-mcp command injection](token-optimizer-mcp-command-injection.md)
- [swagger-testcase-mcp Swagger parser SSRF](swagger-testcase-mcp-swagger-parser-ssrf.md)
- [GoMarble Facebook Ads MCP SSRF](gomarble-facebook-ads-mcp-ssrf.md)
- [chrome-devtools-mcp symlink root bypass](chrome-devtools-mcp-symlink-root-bypass.md)
- [mcp-florence2 image fetch SSRF](mcp-florence2-image-fetch-ssrf.md)
- [SiYuan MCP debug key and file boundary](siyuan-mcp-debug-key-and-file-boundary.md)
- [PyCharm Jupyter MCP unauthenticated code execution](pycharm-jupyter-mcp-unauthenticated-code-execution.md)
- [Apache SkyWalking MCP SSRF GraphQL injection](apache-skywalking-mcp-ssrf-graphql-injection.md)
- [RAGFlow agent workflow Invoke SSRF](ragflow-agent-workflow-invoke-ssrf.md)
- [CodeWhale agent control plane vulnerabilities](codewhale-agent-control-plane-vulnerabilities.md)
- [CodeWhale auto-approved execution tools](codewhale-auto-approved-execution-tools.md)
- [CodeWhale project configuration authority](codewhale-project-configuration-authority.md)
- [CodeWhale instructions file-read authority](codewhale-instructions-file-read-authority.md)
- [CodeWhale allow_shell validation bypass](codewhale-allow-shell-validation-bypass.md)
- [CodeWhale git tool argument injection](codewhale-git-tool-argument-injection.md)
- [CodeWhale JS execution environment exposure](codewhale-js-execution-environment-exposure.md)
- [SiYuan MCP database clean path traversal](siyuan-mcp-database-clean-path-traversal.md)
- [Continue CLI unattended command denylist bypass](continue-cli-unattended-command-denylist-bypass.md)
- [mcp-ffmpeg-helper command injection](mcp-ffmpeg-helper-command-injection.md)
- [mcp-shell command policy bypasses](mcp-shell-command-policy-bypasses.md)
- [PraisonAI MCP origin and CSRF instruction persistence](praisonai-mcp-origin-and-csrf-instruction-persistence.md)
- [PraisonAI MCP session exhaustion](praisonai-mcp-session-exhaustion.md)
- [PraisonAI agent control plane advisory deferrals](praisonai-agent-control-plane-advisory-deferrals.md)
- [PraisonAI web_crawl SSRF](praisonai-web-crawl-ssrf.md)
- [PraisonAI ast_grep_rewrite approval bypass](praisonai-ast-grep-rewrite-approval-bypass.md)
- [PraisonAI IMAP command injection](praisonai-imap-command-injection.md)
- [cc-connect card callback command authorization](cc-connect-card-callback-command-authorization.md)
- [agentic AI emergency shutdown controls](agentic-ai-emergency-shutdown-controls.md)
- [browse-mcp file path boundary](browse-mcp-file-path-boundary.md)
- [Nextcloud MCP webhook vector index auth](nextcloud-mcp-webhook-vector-index-auth.md)
- [genieacs-mcp loopback DNS rebinding](genieacs-mcp-loopback-dns-rebinding.md)
- [Chainlit MCP setup command and SSRF](chainlit-mcp-setup-command-and-ssrf.md)
- [Spring AI tool dispatch authorization bypass](spring-ai-tool-dispatch-authorization-bypass.md)
- [Spring AI MCP Streamable HTTP session DoS](spring-ai-mcp-streamable-http-session-dos.md)
- [CKAN MCP Server SSRF filter bypass](ckan-mcp-server-ssrf-filter-bypass.md)
- [SiYuan MCP HTTP request secret exfiltration](siyuan-mcp-http-request-secret-exfiltration.md)
- [SiYuan MCP file tool blocklist bypass](siyuan-mcp-file-tool-blocklist-bypass.md)
- [Omnigent shared agent bundle overwrite RCE](omnigent-shared-agent-bundle-overwrite-rce.md)
- [Omnigent callable path runner RCE](omnigent-callable-path-runner-rce.md)
- [Omnigent shell policy parser bypass](omnigent-shell-policy-parser-bypass.md)
- [Omnigent agent bundle CWD workspace bypass](omnigent-agent-bundle-cwd-workspace-bypass.md)
- [MCP context injection transparency](mcp-context-injection-transparency.md)
- [mcp-fetch IPv6 SSRF](mcp-fetch-ipv6-ssrf.md)
- [Strands Agents Tools Python REPL consent bypass](strands-agents-tools-python-repl-consent-bypass.md)
- [Dradis AI provider SSRF](dradis-ai-provider-ssrf.md)

- [Amazon Kiro Powers prompt injection exfiltration](amazon-kiro-powers-prompt-injection-exfiltration.md)

- [sentry-selfhosted-mcp raw_sentry_api SSRF](sentry-selfhosted-mcp-raw-api-ssrf.md)

- [mcp-file-context-server path traversal](mcp-file-context-server-path-traversal.md)

- [mcp-use inspector proxy SSRF](mcp-use-inspector-proxy-ssrf.md)

- [mcp-go DNS rebinding host validation](mcp-go-dns-rebinding-host-validation.md)

- [Apify MCP get-html-skeleton SSRF](apify-mcp-get-html-skeleton-ssrf.md)

- [mcp-router unauthenticated aggregator exposure](mcp-router-unauthenticated-aggregator-exposure.md)

- [ToolUniverse Python executor sandbox escape](tooluniverse-python-executor-sandbox-escape.md)

- [UI-TARS desktop MCP unauthenticated RCE](ui-tars-desktop-mcp-unauthenticated-rce.md)

- [Agno Python and Shell tools prompt-injection RCE](agno-python-shell-tools-prompt-injection-rce.md)
- [SiYuan MCP asset upload file read](siyuan-mcp-asset-upload-file-read.md)
- [argocd-mcp unauthenticated HTTP tool control](argocd-mcp-unauthenticated-http-tool-control.md)
- [pg-aiguide MCP DNS rebinding Host allow-list](pg-aiguide-mcp-dns-rebinding-host-allow-list.md)
- [tiger-gh-mcp-server DNS rebinding Host allow-list](tiger-gh-mcp-server-dns-rebinding-host-allow-list.md)
- [Skyvern TextPromptBlock Jinja sandbox escape](skyvern-textpromptblock-jinja-sandbox-escape.md)
- [ash_ai tool loop request exhaustion](ash-ai-tool-loop-request-exhaustion.md)
- [ash_ai MCP origin validation DNS rebinding](ash-ai-mcp-origin-validation-dns-rebinding.md)
- [MCPHub control plane advisory cluster](mcphub-control-plane-advisory-cluster.md)
- [sdcb chats MCP fetch-tools SSRF](sdcb-chats-mcp-fetch-tools-ssrf.md)
- [Codex PowerShell stop-parsing approval bypass](codex-powershell-stop-parsing-approval-bypass.md)
- [LiteLLM MCP authentication bypass KEV](litellm-mcp-authentication-bypass-kev.md)
- [n8n Workflow Tool credential exfiltration](n8n-workflow-tool-credential-exfiltration.md)
- [Agent-S GUI action denial of service](agent-s-gui-action-denial-of-service.md)
- [openbrowser Browser Agent message denial of service](openbrowser-browser-agent-message-denial-of-service.md)
- [Postgres MCP Pro RangeFunction bypass](postgres-mcp-pro-rangefunction-bypass.md)
- [OGX MCP server_url SSRF](ogx-mcp-server-url-ssrf.md)
- [IBM Langflow MCP localhost header bypass](ibm-langflow-mcp-localhost-header-bypass.md)
- [IBM ContextForge tool invocation DNS rebinding](ibm-contextforge-tool-invocation-dns-rebinding.md)
- [IBM ContextForge A2A DNS rebinding](ibm-contextforge-a2a-dns-rebinding.md)
- [AWS Labs Postgres MCP Server readonly bypass](awslabs-postgres-mcp-server-readonly-bypass.md)
- [FastChat worker registration SSRF and model spoofing](fastchat-worker-registration-ssrf-model-spoofing.md)
- [IBM MQ Agent LLM worker exhaustion](ibm-mq-agent-llm-worker-exhaustion.md)
- [PlaywrightCapture favicon redirect SSRF](playwrightcapture-favicon-redirect-ssrf.md)
- [Rowboat custom MCP server SSRF](rowboat-custom-mcp-server-ssrf.md)
- [cli-mcp-server command allowlist bypass](cli-mcp-server-command-allowlist-bypass.md)
- [CowAgent tool denial of service](cowagent-tool-denial-of-service.md)
- [aichat API endpoint memory allocation DoS](aichat-api-endpoint-memory-allocation-dos.md)
- [Kibana AI Assistant and Agent Builder DoS](kibana-ai-assistant-and-agent-builder-dos.md)
- [runZero Platform MCP authorization bypass](runzero-platform-mcp-authorization-bypass.md)
- [hermes-agent ACP MCP DoS](hermes-agent-acp-mcp-dos.md)
- [knowns MCP doc and memory path traversal](knowns-mcp-doc-memory-path-traversal.md)
- [knowns code.find path traversal](knowns-code-find-path-traversal.md)
- [Open WebUI fetch and RAG SSRF](open-webui-fetch-and-rag-ssrf.md)
- [Open WebUI terminal execution boundaries](open-webui-terminal-execution-boundaries.md)
- [Open WebUI automation scheduler denial of service](open-webui-automation-scheduler-dos.md)
- [Flowise agent node code execution](flowise-agent-node-code-execution.md)
- [Flowise CSV Agent prompt-injection RCE](flowise-csv-agent-prompt-injection-rce.md)
- [Flowise HTTP MCP document-loader SSRF](flowise-http-mcp-document-loader-ssrf.md)
- [OmniRoute ACP custom-agent RCE](omniroute-acp-custom-agent-rce.md)
- [IBM Langflow public MCP endpoint RCE](ibm-langflow-public-mcp-endpoint-rce.md)
- [IBM Langflow scanner code-execution bypasses](ibm-langflow-scanner-code-execution-bypasses.md)
- [IBM Langflow MCP stdio command execution](ibm-langflow-mcp-stdio-command-execution.md)
- [IBM Langflow file and endpoint disclosure](ibm-langflow-file-and-endpoint-disclosure.md)
- [Bifrost MCP stdio registration RCE](bifrost-mcp-stdio-registration-rce.md)
- [Docker MCP Gateway OCI label argument injection](docker-mcp-gateway-oci-label-argument-injection.md)
- [mcp-searxng web_url_read SSRF](mcp-searxng-web-url-read-ssrf.md)
- [Contentful MCP Server network option injection](contentful-mcp-server-network-option-injection.md)
- [MCP Memory Keeper context import path traversal](mcp-memory-keeper-context-import-path-traversal.md)
- [IBM Langflow flow component SSRF](ibm-langflow-flow-component-ssrf.md)
- [mcp-gitlab transport exposure and PAT theft](mcp-gitlab-transport-exposure-and-pat-theft.md)
- [mcp-gitlab SSE unauthenticated file access](mcp-gitlab-sse-unauthenticated-file-access.md)
- [mcp-gitlab Streamable HTTP DNS rebinding](mcp-gitlab-streamable-http-dns-rebinding.md)
- [mcp-gitlab dynamic API URL PAT exfiltration](mcp-gitlab-dynamic-api-url-pat-exfiltration.md)
- [MKP Kubernetes log tool DoS](mkp-kubernetes-log-tool-dos.md)
- [MCPVault recursive metadata path filtering](mcpvault-recursive-metadata-path-filtering.md)
- [Sentry Seer telemetry agent execution](sentry-seer-telemetry-agent-execution.md)
- [Plugin4Shell coding-agent plugin version bypass](plugin4shell-coding-agent-plugin-version-bypass.md)

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
- [infrastructure and supply chain](../infrastructure-and-supply-chain/index.md)

## Open Questions

- No open topic questions are recorded.

## Maintenance Notes

- Updated on 2026-09-03 with n8n Workflow Tool credential exfiltration, Agent-S GUI action DoS, and openbrowser browser-agent message DoS leaves.
- Updated on 2026-09-04 with Postgres MCP Pro, OGX, IBM Langflow, IBM ContextForge, AWS Labs postgres-mcp-server, FastChat, IBM MQ Agent, PlaywrightCapture, and SiYuan MCP containment updates.
- Updated on 2026-09-05 with Rowboat custom MCP server SSRF and cli-mcp-server shell-substitution allowlist bypass leaves.
- Updated on 2026-09-06 with Cloud Monitoring remote MCP response-control evidence from the September 2 documentation update.
- Updated on 2026-09-07 with knowns MCP doc and memory path traversal.
- Updated on 2026-09-18 with mcp-gitlab, MKP, MCPVault, Sentry Seer, RMCP, and AgentCore authorization and transport evidence.
- Updated on 2026-09-08 with focused Open WebUI and Flowise security-boundary leaves plus Agno and PraisonAI NVD update provenance.
- Updated on 2026-09-13 with split CodeWhale, Flowise CSV Agent, knowns `code.find`, OmniRoute ACP, IBM Langflow, n8n Instance AI, and PyCharm advisory updates.
- Updated on 2026-09-16 with Docker MCP Gateway image-label runtime argument injection, mcp-searxng `web_url_read` SSRF, and watcher metadata enrichment for IBM Langflow and PraisonAI leaves.
- Updated on 2026-09-17 with Contentful MCP Server network-option injection, MCP Memory Keeper context-import path traversal, and watcher metadata enrichment for Docker MCP Gateway and mcp-searxng leaves.
- Updated on 2026-09-19 with cc-connect card callback authorization, split mcp-gitlab leaves, and mcp-searxng enrichment from the September 18 collector.
- Updated on 2026-09-20 with Plugin4Shell coding-agent plugin supply-chain coverage and cross-links from new AI chat authorization leaves.
- Updated on 2026-09-15 with Bifrost MCP stdio registration RCE, PraisonAI IMAP command injection, IBM Langflow flow-component SSRF, and Langflow scanner-bypass enrichment.
- Updated on 2026-09-02 with LiteLLM MCP KEV authentication bypass, CowAgent tool DoS, and aichat API memory-allocation leaves.
- Updated on 2026-09-01 with Codex PowerShell approval bypass, Kibana AI feature DoS, runZero Platform MCP authorization, and hermes-agent ACP/MCP availability leaves.
- Updated on 2026-08-31 with ash_ai tool-loop and MCP-origin leaves, the MCPHub advisory-family leaf, sdcb chats MCP fetch-tools SSRF, and watcher enrichment for Junie local-execution boundaries.
- Updated on 2026-08-29 with the SiYuan `asset.upload` file-read leaf and watcher provenance for August 27 agent-tool advisories.
- Updated on 2026-08-30 with the argocd-mcp unauthenticated HTTP tool-control leaf.
- Updated on 2026-08-30 with pg-aiguide and tiger-gh-mcp-server Host allow-list leaves plus the Skyvern prompt-template sandbox escape.
- Updated on 2026-08-28 with Kiro Powers prompt-injection exfiltration, MCP server/transport SSRF and exposure leaves, ToolUniverse/UI-TARS/Agno execution leaves, and watcher enrichments for mcp-fetch, Dradis, PraisonAI, and Strands Agents Tools.
- Keep each leaf focused on a distinct security boundary or control rather than a general agent workflow.
- Updated on 2026-08-16 with the GoMarble Facebook Ads MCP SSRF leaf.
- Updated on 2026-08-17 with the chrome-devtools-mcp symlink root bypass leaf.
- Updated on 2026-08-19 with MCP and agent-tool leaves for mcp-florence2, SiYuan, PyCharm, Apache SkyWalking, RAGFlow, and CodeWhale.
- Updated on 2026-08-19 after verifier correction split CodeWhale and SiYuan advisory routers into focused leaves.
- Updated on 2026-08-21 with the Spring AI tool-dispatch authorization leaf.
- Updated on 2026-08-22 with Spring AI MCP transport DoS, CKAN, SiYuan v3.8.0, and Omnigent agent-control-plane advisory leaves.
- Updated on 2026-08-23 with the MCP context-injection transparency leaf.
- Updated on 2026-08-26 with Continue CLI, mcp-ffmpeg-helper, mcp-shell, PraisonAI, browse-mcp, Nextcloud MCP, genieacs-mcp, Chainlit, and agentic AI shutdown leaves.
- Updated on 2026-08-27 with mcp-fetch IPv6 SSRF, Strands Agents Tools consent bypass, Dradis AI provider SSRF, and split PraisonAI control-plane leaves.
