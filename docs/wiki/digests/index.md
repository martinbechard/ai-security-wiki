# AI Security Digests

## Current Understanding

Monthly digests summarize processed security updates and link to durable local leaves for detail. Collectors save raw evidence first; ingest updates a digest only after the local security analysis and federation routing are complete.

The active digest records each independently changing security item or closely coupled advisory family separately, not by collector run or raw artifact.

## Digest Pages

- [2026-09.md](2026-09.md) is the active September 2026 digest.
- [2026-08.md](2026-08.md) is the active August 2026 digest.
- [2026-07.md](2026-07.md) is the previous July 2026 digest.

## Authoritative Sources

- [September 1 topic collector source](../../../raw/processed/2026-09-01/ai-security-wiki-topic-news-collector-2026-09-01T233307Z.json)
- [September 1 leaf update watch source](../../../raw/processed/2026-09-01/ai-security-wiki-leaf-update-watch-20260902T000316Z.json)
- [September 2 topic collector source](../../../raw/processed/2026-09-02/ai-security-wiki-topic-news-collector-2026-09-02T233120Z.json)
- [September 2 leaf update watch source](../../../raw/processed/2026-09-02/ai-security-wiki-leaf-update-watch-20260903T000347Z.json)
- [September 3 topic collector source](../../../raw/processed/2026-09-03/ai-security-wiki-topic-news-collector-2026-09-03T233104Z.json)
- [September 3 leaf update watch source](../../../raw/processed/2026-09-03/ai-security-wiki-leaf-update-watch-20260904T000442Z.json)
- [August 31 topic collector source](../../../raw/processed/2026-08-31/ai-security-wiki-topic-news-collector-2026-08-31T233224Z.json)
- [September 1 leaf update watch source](../../../raw/processed/2026-08-31/ai-security-wiki-leaf-update-watch-20260901T000350Z.json)
- [August 27 topic collector source](../../../raw/processed/2026-08-27/ai-security-wiki-topic-news-collector-2026-08-27T233104Z.json)
- [August 27 leaf update watch source](../../../raw/processed/2026-08-27/ai-security-wiki-leaf-update-watch-20260828T000238Z.json)
- [August 28 topic collector source](../../../raw/processed/2026-08-28/ai-security-wiki-topic-news-collector-2026-08-28T233139Z.json)
- [August 29 leaf update watch source](../../../raw/processed/2026-08-29/ai-security-wiki-leaf-update-watch-20260829T000405Z.json)
- [August 29 topic collector source](../../../raw/processed/2026-08-29/ai-security-wiki-topic-news-collector-2026-08-29T233233Z.json)
- [August 30 leaf update watch source](../../../raw/processed/2026-08-29/ai-security-wiki-leaf-update-watch-20260830T000338Z.json)
- [August 30 topic collector source](../../../raw/processed/2026-08-30/ai-security-wiki-topic-news-collector-2026-08-30T233055Z.json)
- [August 31 leaf update watch source](../../../raw/processed/2026-08-30/ai-security-wiki-leaf-update-watch-20260831T000130Z.json)
- [schema.md](../schema.md)
- [automated update feeds](../source-workflows/automated-update-feeds.md)
- [August 20 leaf update watch source](../../../raw/processed/2026-08-20/ai-security-wiki-leaf-update-watch-20260821T000216Z.json)
- [August 21 topic news collector source](../../../raw/processed/2026-08-21/ai-security-wiki-topic-news-collector-2026-08-21T233219Z.json)
- [August 21 leaf update watch source](../../../raw/processed/2026-08-21/ai-security-wiki-leaf-update-watch-20260822T000454Z.json)
- [August 22 topic news collector source](../../../raw/processed/2026-08-22/ai-security-wiki-topic-news-collector-2026-08-22T233049Z.json)
- [August 22 leaf update watch source](../../../raw/processed/2026-08-22/ai-security-wiki-leaf-update-watch-20260823T000329Z.json)
- [August 23 topic news collector source](../../../raw/processed/2026-08-23/ai-security-wiki-topic-news-collector-2026-08-23T233302Z.json)
- [August 23 leaf update watch source](../../../raw/processed/2026-08-23/ai-security-wiki-leaf-update-watch-20260824T000259Z.json)
- [August 25 leaf update watch source](../../../raw/processed/2026-08-25/ai-security-wiki-leaf-update-watch-20260825T184651Z.json)
- [August 25 topic news collector source](../../../raw/processed/2026-08-25/ai-security-wiki-topic-news-collector-2026-08-25T183709Z.json)
- [August 25 late topic news collector source](../../../raw/processed/2026-08-25/ai-security-wiki-topic-news-collector-2026-08-25T233059Z.json)
- [August 26 leaf update watch source](../../../raw/processed/2026-08-25/ai-security-wiki-leaf-update-watch-20260826T001230Z.json)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [topic-index.md](../topic-index.md)

## Open Questions

- No open digest questions are recorded.

## Maintenance Notes

- Updated on 2026-09-03 with item-level September entries for GPT-6 Astra deployment safety, Daybreak frontline-defender access, n8n credential exfiltration, Ollama model-pull SSRF, WordPress MCP authorization, Agent-S GUI action DoS, and openbrowser message-budget DoS; watcher enrichments remained leaf-level without duplicate digest items.
- Updated on 2026-09-02 with item-level September entries for LiteLLM, Windows ML CLI, TOON, Tencent AI-Infra-Guard, claude-skill-antivirus, agentverus-scanner, CowAgent, and aichat security items; Omnigent and watcher corroboration remained leaf-level without duplicate digest items.
- Updated on 2026-09-01 with the first September digest, using item-level entries for Astra release gates, Codex command/Git execution boundaries, model-artifact supply-chain flaws, Kibana AI feature authorization/DoS, runZero MCP authorization, hermes-agent availability, Support Genix admin takeover, and watcher enrichments without grouping by raw artifact, collector run, sweep category, or ingest batch.
- Updated on 2026-08-31 with item-level August 31 entries for ash_ai, Theia AI Agent Mode, MCPHub, Aix-DB, diboot, sdcb chats, Microsoft Edge iOS, OpenShift AI guardrails-detectors, Junie non-interactive trust behavior, and date-placed watcher enrichments without grouping by raw artifact, collector run, sweep category, or ingest batch.
- Updated on 2026-08-29 with item-level August 28 entries for [collective cyber-defense controls](../governance-and-compliance/collective-cyber-defense-controls.md), SiYuan `asset.upload`, AI gateway SSRF, channel authorization, workbench credential disclosure, agent memory ownership, code-ingestion token disclosure, crawler file writes, and workflow callback SSRF; watcher sightings were folded into existing leaves without duplicate digest items.
- Updated on 2026-08-30 with item-level August 29 entries for argocd-mcp, astron-agent, HEL Online Classroom, and NIST agentic-AI identity guidance; watcher repeats were folded into existing leaves without duplicate digest entries.
- Updated on 2026-08-30 with item-level August 30 entries for browser-use web-ui, Jina Reader, NextChat, and Keploy advisories plus date-placed August 29 MCP Host/Skyvern entries, August 28 Google MCP/NemoClaw entries, and August 26 AI cost-anomaly control evidence; ordering remains reverse chronological and not grouped by raw artifact, collector run, sweep category, or ingest batch.
- Updated on 2026-08-28 with 2026-08-27 Kiro, MCP, tool-execution, Spring AI, GitLab AI Gateway, ServiceNow AI platform, and watcher digest coverage.
- Updated on 2026-08-27 after August 26 raw ingest; the active monthly digest uses one entry per independently changing security item or closely coupled advisory family.
- Updated on 2026-08-26 after the August digest added item-level entries for August 24-25 MCP, agent-tool, identity, infrastructure, and verification-parser advisories plus selected watcher enrichments while folding duplicate or low-signal sightings into durable leaves.
- Updated on 2026-08-23 after the August digest added item-level entries for [MCP context-injection transparency](../agent-and-tool-security/mcp-context-injection-transparency.md), [agent delegated task authorization drift](../identity-and-access/agent-delegated-task-authorization-drift.md), and [frontier model critical cyber release gates](../testing-and-assurance/frontier-model-critical-cyber-release-gates.md) governance evidence while folding duplicate SiYuan and watcher corroboration into existing leaves.
- Updated on 2026-08-22 after the August digest added item-level entries for CKAN MCP SSRF, SiYuan v3.8.0 advisories, split Omnigent advisories, split Infracost advisories, FiftyOne, split Headroom advisories, TensorZero, ONNX external-data writes, NLTK pickle model loading, Xinference parser RCE, and [legal filing prompt injection](../model-and-prompt-security/legal-filing-prompt-injection.md) while folding watcher corroboration into existing leaves.
- Updated on 2026-08-21 after the August digest added item-level entries for Spring AI security CVEs, [Cryptographic Context Injection](../model-and-prompt-security/cryptographic-context-injection.md), [AI-generated OT exploit scripts](../threats-and-attacks/ai-generated-ot-exploit-scripts.md), [Private Safety Processing ZDR](../data-and-privacy/private-safety-processing-zdr.md), [downstream agent authorization context](../identity-and-access/downstream-agent-authorization-context.md), and [AI-themed installer malware lures](../threats-and-attacks/ai-themed-installer-malware-lures.md) while folding watcher repeats into existing leaves.
- Updated on 2026-08-17 after the August digest added item-level entries for OpenAI Defender's Window, MLflow 3.15.0 advisories, chrome-devtools-mcp, atomic-agents-stack, Ray KEV, MemOS, OpenShift AI, Kiota, and watcher enrichments.
- Updated on 2026-08-19 after the August digest added item-level entries for OpenAI pacing controls, [autonomous CI/CD exploit adaptation](../threats-and-attacks/autonomous-ci-cd-exploit-adaptation.md), generated-code remediation evidence, UpTrain, MCP/agent advisories, vLLM, Transformers, 9Router, Oracle Siebel AI, and watcher enrichments.
- Updated on 2026-08-20 after the August digest folded watcher evidence into existing item-level advisory entries without adding batch or duplicate digest items.
- Updated on 2026-08-16 after the August digest added item-level entries for [GoMarble Facebook Ads MCP SSRF](../agent-and-tool-security/gomarble-facebook-ads-mcp-ssrf.md), [semantic governance policy telemetry](../testing-and-assurance/semantic-governance-policy-telemetry.md), and [macOS Screen Sharing AI-accelerated exploitability](../threats-and-attacks/macos-screen-sharing-ai-accelerated-exploitability.md).
- Updated on 2026-08-15 after the August digest added item-level entries for MCP package advisories, delegated-action guidance, agentic threat clustering, provenance credentialing, Apigee MCP gateway controls, and Junie trust-marker evidence.
- Updated on 2026-08-14 after the August digest added item-level entries for [Zoom annotation advisory research](../threats-and-attacks/zoom-annotation-rce-ai-assisted-research.md), [agent action runtime hooks](../agent-and-tool-security/agent-action-runtime-hooks.md), [agent synthetic insider risk](../identity-and-access/agent-synthetic-insider-risk.md), [hidden context exposure reconnaissance](../model-and-prompt-security/hidden-context-exposure-reconnaissance.md), [NemoClaw runtime evidence](../testing-and-assurance/agent-runtime-security-evidence.md), model residency caveats, and frontier-model review transparency.
- Updated on 2026-08-09 after the August digest added item-level entries for cross-provider containment, Astra release gates, Junie non-interactive execution, Model Armor residency and filter lifecycle, AI Office GPAI enforcement, and GPAI systemic-risk evidence.
- Updated on 2026-08-11 after the August digest added item-level entries for [GhostSplice](../agent-and-tool-security/ghostsplice-mcp-split-instruction-exfiltration.md), [Ghostjacking](../agent-and-tool-security/ghostjacking-poisoned-operational-log-agent-hijack.md), [Cursor sandbox escapes](../agent-and-tool-security/cursor-auto-run-sandbox-escapes.md), [Claude Code Templates Studio RCE](../agent-and-tool-security/claude-code-templates-studio-rce.md), [DB-GPT path traversal/RCE](../infrastructure-and-supply-chain/db-gpt-unauthenticated-path-traversal-rce.md), [PapersGPT Zotero RCE](../model-and-prompt-security/papersgpt-zotero-llm-response-rce.md), [AI Sidebar chat theft](../data-and-privacy/ai-sidebar-extension-ai-chat-theft.md), [Anthropic provenance labeling](../governance-and-compliance/synthetic-content-provenance-labeling-controls.md), [California provenance rollout](../governance-and-compliance/california-ai-transparency-act-provenance-controls.md), and [cyber-evaluation containment](../testing-and-assurance/cyber-evaluation-containment.md) controls.
- Updated on 2026-08-12 after the August digest added item-level entries for [LiteLLM supply-chain secret exposure](../infrastructure-and-supply-chain/litellm-supply-chain-secret-exposure.md), [encrypted reasoning trace replay](../model-and-prompt-security/encrypted-reasoning-trace-replay.md), [CSA cloud AI threat taxonomy](../governance-and-compliance/cloud-ai-system-compromise-threat-taxonomy.md), and [NIST AI-enabled vulnerability management](../testing-and-assurance/ai-enabled-vulnerability-management-modernization.md), while watcher repeats enriched existing items without duplicate digest entries.
- Updated on 2026-08-13 after the August digest added item-level entries for [GhostJacking](../agent-and-tool-security/ghostjacking-poisoned-operational-log-agent-hijack.md), [MCP Atlassian CVE-2026-73498](../agent-and-tool-security/mcp-atlassian-confluence-attachment-file-read.md), [SAFE AI incident sharing guidance](../incident-response/safe-ai-incident-sharing-guidance.md), and [Taiwan AI-assisted attack automation](../threats-and-attacks/unattended-ai-agent-attack-automation.md), while LiteLLM and watcher repeats enriched existing leaves without duplicate digest entries.
- Updated on 2026-08-11 after the August digest added the Codex Security plugin workflow-boundary entry.
- Updated on 2026-08-10 after the August digest added item-level entries for Daybreak/GPT-5.6-Cyber controls, V8 vulnerability-discovery evidence, MCP data movement exposure, AI token jacking, RovoBlast, AI Office enforcement, and OpenAI/Hugging Face coordination evidence.
- Updated on 2026-08-09 after the August digest added item-level entries for Cloud Monitoring MCP residency, Cloud Monitoring MCP IAM, Google Cloud cost attribution, and NemoClaw Deep Agents runtime evidence.
- Updated on 2026-08-07 after the August digest added item-level entries for Astra release gates, frontier-review transparency, Kimi K3 assessment dispute, and defensive AI infrastructure.
- Created on 2026-07-22 as the digest hub.
