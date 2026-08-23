# Model And Prompt Security

## Current Understanding

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
- [Cryptographic Context Injection](cryptographic-context-injection.md)
- [Xinference Llama3 tool call eval RCE](xinference-llama3-tool-call-eval-rce.md)
- [Legal filing prompt injection](legal-filing-prompt-injection.md)

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

- Record affected boundary, attack prerequisites, mitigation, residual risk, and evidence quality.
- Updated on 2026-08-19 with Context7 MCP prompt-injection and vLLM multimodal input-boundary leaves.
- Updated on 2026-08-19 after verifier correction split vLLM derender DoS and multimodal media SSRF/file-read leaves.
- Updated on 2026-08-21 with the Cryptographic Context Injection attack-pattern leaf.
- Updated on 2026-08-22 with Xinference prompt-driven parser RCE and legal filing prompt-injection leaves.
