# Model And Prompt Security

## Current Understanding

- [vLLM Chat-Template Resource Exhaustion](vllm-chat-template-resource-exhaustion.md)
- [vLLM Phi-4 Multimodal Audio Attention GPU DoS](vllm-phi4mm-audio-attention-gpu-dos.md)
- [vLLM OCR Zero-Pixel Engine DoS](vllm-ocr-zero-pixel-engine-dos.md)
- [vLLM Pretokenized Prompt-ID Engine DoS](vllm-pretokenized-prompt-id-engine-dos.md)

- [vLLM gRPC Input Validation DoS](vllm-grpc-input-validation-dos.md)
- [vLLM Multimodal Media Resource Control](vllm-multimodal-media-resource-control.md)
- [vLLM Connector-Cache Logprob Tenant DoS](vllm-connector-cache-logprob-tenant-dos.md)
- [vLLM Stop-Token ID Engine DoS](vllm-stop-token-id-engine-dos.md)
- [vLLM Nemotron Image Decompression DoS](vllm-nemotron-image-decompression-dos.md)
- [vLLM Multimodal Metadata Engine DoS](vllm-multimodal-metadata-engine-dos.md)
- [vLLM Video Frame-Limit DoS](vllm-video-frame-limit-dos.md)

- [vLLM Multimodal Processor Kwargs DoS](vllm-mm-processor-kwargs-dos.md)
- [vLLM Forged UUID Cache Collision DoS](vllm-forged-uuid-cache-collision-dos.md)

- [MoviePilot Prompt-Injection Command Execution](moviepilot-prompt-injection-command-execution.md)
- [vLLM Audio Transcription Upload Heap Overflow DoS](vllm-audio-transcription-upload-heap-overflow-dos.md)
- [MCP Context Forge Global Prompts Stored XSS](mcp-context-forge-global-prompts-stored-xss.md)
- [Banks chat message role injection](banks-chat-message-role-injection.md)
- [vLLM Harmony tool cache salt oracle](vllm-harmony-tool-cache-salt-oracle.md)
- [vLLM multimodal cache desync DoS](vllm-multimodal-cache-desync-dos.md)
- [GitLab AI Gateway prompt template sandbox escape](gitlab-ai-gateway-prompt-template-sandbox-escape.md)
- [Open GenAI Stack Jinja prompt injection RCE](open-genai-stack-jinja-prompt-injection-rce.md)
- [vLLM multimodal decoder prompt length DoS](vllm-multimodal-decoder-prompt-length-dos.md)
- [Decepticon ChatML role boundary forgery](decepticon-chatml-role-boundary-forgery.md)
- [IBM FTM AI Agent RAG poisoning](ibm-ftm-ai-agent-rag-poisoning.md)
- [vLLM NIXL prefix cache worker DoS](vllm-nixl-prefix-cache-worker-dos.md)
- [vLLM Mooncake KV cache exhaustion](vllm-mooncake-kv-cache-exhaustion.md)
- [vLLM bad_words logits corruption](vllm-bad-words-logits-corruption.md)

This topic owns model behavior risks, prompt injection, jailbreaks, poisoning, adversarial inputs, unsafe outputs, and model-boundary mitigations. General model and technique background remains in ai-wiki.

## Leaf Pages

- [vLLM gRPC Input Validation DoS](vllm-grpc-input-validation-dos.md)
- [vLLM Multimodal Media Resource Control](vllm-multimodal-media-resource-control.md)
- [vLLM Connector-Cache Logprob Tenant DoS](vllm-connector-cache-logprob-tenant-dos.md)
- [vLLM Stop-Token ID Engine DoS](vllm-stop-token-id-engine-dos.md)
- [vLLM Nemotron Image Decompression DoS](vllm-nemotron-image-decompression-dos.md)
- [vLLM Multimodal Metadata Engine DoS](vllm-multimodal-metadata-engine-dos.md)
- [vLLM Video Frame-Limit DoS](vllm-video-frame-limit-dos.md)

- [MoviePilot Prompt-Injection Command Execution](moviepilot-prompt-injection-command-execution.md)
- [vLLM Audio Transcription Upload Heap Overflow DoS](vllm-audio-transcription-upload-heap-overflow-dos.md)
- [MCP Context Forge Global Prompts Stored XSS](mcp-context-forge-global-prompts-stored-xss.md)
- [Banks chat message role injection](banks-chat-message-role-injection.md)
- [vLLM Harmony tool cache salt oracle](vllm-harmony-tool-cache-salt-oracle.md)
- [vLLM multimodal cache desync DoS](vllm-multimodal-cache-desync-dos.md)
- [GitLab AI Gateway prompt template sandbox escape](gitlab-ai-gateway-prompt-template-sandbox-escape.md)
- [Open GenAI Stack Jinja prompt injection RCE](open-genai-stack-jinja-prompt-injection-rce.md)
- [vLLM multimodal decoder prompt length DoS](vllm-multimodal-decoder-prompt-length-dos.md)
- [Decepticon ChatML role boundary forgery](decepticon-chatml-role-boundary-forgery.md)
- [Evaluation artifact template execution risk](evaluation-artifact-template-execution-risk.md)
- [PapersGPT Zotero LLM response remote code execution](papersgpt-zotero-llm-response-rce.md)
- [Encrypted reasoning trace replay](encrypted-reasoning-trace-replay.md)
- [Hidden context exposure reconnaissance](hidden-context-exposure-reconnaissance.md)
- [Context7 MCP custom instructions prompt injection](context7-mcp-custom-instructions-prompt-injection.md)
- [vLLM multimodal input boundary vulnerabilities](vllm-multimodal-input-boundary-vulnerabilities.md)
- [vLLM derender denial of service](vllm-derender-denial-of-service.md)
- [vLLM multimodal media SSRF file read](vllm-multimodal-media-ssrf-file-read.md)
- [vLLM audio input decompression DoS](vllm-audio-input-decompression-dos.md)
- [vLLM video decoder VRAM exhaustion](vllm-video-decoder-vram-exhaustion.md)
- [vLLM sampler state corruption](vllm-sampler-state-corruption.md)
- [vLLM allowed_token_ids logits corruption](vllm-allowed-token-ids-logits-corruption.md)
- [vLLM prompt-token sampler state corruption](vllm-prompt-token-sampler-state-corruption.md)
- [vLLM NIXL prefix cache worker DoS](vllm-nixl-prefix-cache-worker-dos.md)
- [vLLM Mooncake KV cache exhaustion](vllm-mooncake-kv-cache-exhaustion.md)
- [Cryptographic Context Injection](cryptographic-context-injection.md)
- [Xinference Llama3 tool call eval RCE](xinference-llama3-tool-call-eval-rce.md)
- [Legal filing prompt injection](legal-filing-prompt-injection.md)
- [Langfun Python protocol model output RCE](langfun-python-protocol-model-output-rce.md)
- [ash_ai EEx prompt template RCE](ash-ai-eex-prompt-template-rce.md)
- [Microsoft Edge iOS LLM prompt spoofing](microsoft-edge-ios-llm-prompt-spoofing.md)
- [TOON decoder prototype pollution](toon-decoder-prototype-pollution.md)
- [LaVague indirect prompt injection RCE](lavague-indirect-prompt-injection-rce.md)
- [ASCII smuggling AI ingestion normalization](ascii-smuggling-ai-ingestion-normalization.md)
- [Open WebUI rendering and search input risks](open-webui-rendering-and-search-input-risks.md)
- [n8n Instance AI summary prototype pollution](n8n-instance-ai-summary-prototype-pollution.md)
- [PraisonAI execute_code sandbox bypass](praisonai-execute-code-sandbox-bypass.md)
- [Apple Intelligence security prompt bypass](apple-intelligence-security-prompt-bypass.md)
- [IBM FTM AI Agent RAG poisoning](ibm-ftm-ai-agent-rag-poisoning.md)

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

- [threats and attacks](../threats-and-attacks/index.md)
- [testing and assurance](../testing-and-assurance/index.md)

## Open Questions

- No open topic questions are recorded.

## Maintenance Notes

- Updated on 2026-10-26 with split vLLM template, Phi-4 audio, OCR image, and prompt-ID availability controls.

- Updated on 2026-10-15 with the MoviePilot untrusted-metadata-to-command-execution leaf from the October 15 source ingest.
- Updated on 2026-10-14 with the MCP Context Forge Global Prompts stored-XSS leaf from the October 13 topic collector.
- Updated on 2026-10-13 with the October 12 vLLM audio transcription upload heap-overflow DoS leaf.

- Updated on 2026-10-09 with Banks chat-message role injection and watcher provenance for vLLM Harmony and multimodal cache advisories.
- Updated on 2026-10-08 with vLLM Harmony tool cache salt oracle and vLLM multimodal cache desync DoS as separate privacy and availability boundaries; after source processing, recheck source links point to `raw/processed`.
- Updated on 2026-10-03 with GitLab AI Gateway prompt-template sandbox escape coverage from the October 2 source ingest.
- Updated on 2026-09-30 with Open GenAI Stack prompt-injection-to-Jinja server-side expression evaluation coverage.
- Updated on 2026-09-27 with vLLM multimodal decoder prompt-length DoS as a disaggregated-serving availability boundary.
- Updated on 2026-09-25 with Decepticon ChatML role-boundary forgery as a retrieved-content prompt boundary.
- Updated on 2026-09-02 with the TOON decoder prototype pollution prompt-serialization leaf.
- Updated on 2026-09-04 with the LaVague model-output Python execution leaf.
- Updated on 2026-09-08 with the ASCII smuggling AI-ingestion normalization leaf and Open WebUI rendering/search input leaf.
- Updated on 2026-09-13 with the n8n Instance AI workflow-summary prototype-pollution leaf.
- Updated on 2026-09-15 with PraisonAI execute_code sandbox bypass and Apple Intelligence security prompt bypass leaves.
- Updated on 2026-09-18 with vLLM audio decompression and video decoder availability leaves.
- Updated on 2026-09-19 with split vLLM sampler-state corruption leaves.
- Updated on 2026-09-23 with vLLM NIXL and Mooncake connector availability leaves.
- Updated on 2026-09-24 with IBM FTM AI agent RAG poisoning as a retrieval-integrity-to-MCP-action boundary.
- Updated on 2026-08-31 with ash_ai prompt-template execution and Microsoft Edge iOS LLM prompt-spoofing leaves.
- Record affected boundary, attack prerequisites, mitigation, residual risk, and evidence quality.
- Updated on 2026-08-19 with Context7 MCP prompt-injection and vLLM multimodal input-boundary leaves.
- Updated on 2026-08-19 after verifier correction split vLLM derender DoS and multimodal media SSRF/file-read leaves.
- Updated on 2026-08-21 with the Cryptographic Context Injection attack-pattern leaf.
- Updated on 2026-08-22 with Xinference prompt-driven parser RCE and legal filing prompt-injection leaves.
- Updated on 2026-08-27 with the Langfun model-output-as-code parser RCE leaf.
