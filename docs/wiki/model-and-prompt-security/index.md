# Model And Prompt Security

## Current Understanding

- [vLLM bad_words logits corruption](vllm-bad-words-logits-corruption.md)

This topic owns model behavior risks, prompt injection, jailbreaks, poisoning, adversarial inputs, unsafe outputs, and model-boundary mitigations. General model and technique background remains in ai-wiki.

## Leaf Pages

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

- Updated on 2026-09-02 with the TOON decoder prototype pollution prompt-serialization leaf.
- Updated on 2026-09-04 with the LaVague model-output Python execution leaf.
- Updated on 2026-09-08 with the ASCII smuggling AI-ingestion normalization leaf and Open WebUI rendering/search input leaf.
- Updated on 2026-09-13 with the n8n Instance AI workflow-summary prototype-pollution leaf.
- Updated on 2026-09-15 with PraisonAI execute_code sandbox bypass and Apple Intelligence security prompt bypass leaves.
- Updated on 2026-09-18 with vLLM audio decompression and video decoder availability leaves.
- Updated on 2026-09-19 with split vLLM sampler-state corruption leaves.
- Updated on 2026-08-31 with ash_ai prompt-template execution and Microsoft Edge iOS LLM prompt-spoofing leaves.
- Record affected boundary, attack prerequisites, mitigation, residual risk, and evidence quality.
- Updated on 2026-08-19 with Context7 MCP prompt-injection and vLLM multimodal input-boundary leaves.
- Updated on 2026-08-19 after verifier correction split vLLM derender DoS and multimodal media SSRF/file-read leaves.
- Updated on 2026-08-21 with the Cryptographic Context Injection attack-pattern leaf.
- Updated on 2026-08-22 with Xinference prompt-driven parser RCE and legal filing prompt-injection leaves.
- Updated on 2026-08-27 with the Langfun model-output-as-code parser RCE leaf.
