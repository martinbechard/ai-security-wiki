---
type: "Topic"
title: "Xinference Llama3 Tool Call Eval RCE"
description: "Security analysis for CVE-2026-61539 Xinference unsafe eval in Llama3 tool-call parsing."
tags: ["model-and-prompt-security", "agent-and-tool-security", "infrastructure-and-supply-chain"]
---

# Xinference Llama3 Tool Call Eval RCE

## Current Understanding

The [August 22 topic news collector source](../../../raw/processed/2026-08-22/ai-security-wiki-topic-news-collector-2026-08-22T233049Z.json) records CVE-2026-61539 for Xinference 2.5.0 and earlier, with public sources identifying 2.7.0 as fixed. Broad Xinference product and Llama3 model context belongs upstream; this page owns the local prompt-to-parser execution boundary.

The [NVD record](https://nvd.nist.gov/vuln/detail/CVE-2026-61539), [GitLab advisory](https://advisories.gitlab.com/pypi/xinference/CVE-2026-61539/), and [GitHub Advisory Database evidence](https://github.com/advisories) in the collector describe attacker-influenced Llama3 tool-call output being passed to Python `eval()` while handling `/v1/chat/completions` requests with tools. That makes a prompt or model-output parsing path capable of executing commands in the server process.

## Security Impact

- Threat: model-generated tool-call text can cross into interpreter execution when parsers use `eval()` instead of a constrained data parser.
- Affected boundary: Xinference 2.5.0 and earlier Llama3 tool-call parsing for OpenAI-compatible chat completions with tools.
- Exploit or incident status: public CVE and advisory evidence; no local exploitation evidence is recorded.
- Mitigation state: update to a fixed release, treat model tool-call output as untrusted data, and require structured parsing with schema validation.
- Confidence: high for the prompt-to-eval vulnerability class; medium for the exact fixed version until a primary Xinference release advisory is captured.
- Residual risk: tool-call parsers are security-critical even when the model appears to produce JSON-like arguments, because prompt influence can shape parser input.

## Authoritative Sources

- [August 22 topic news collector source](../../../raw/processed/2026-08-22/ai-security-wiki-topic-news-collector-2026-08-22T233049Z.json)
- [NVD CVE-2026-61539](https://nvd.nist.gov/vuln/detail/CVE-2026-61539)
- [GitLab advisory CVE-2026-61539](https://advisories.gitlab.com/pypi/xinference/CVE-2026-61539/)
- [GitHub Advisory Database](https://github.com/advisories)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [model and prompt security](index.md)
- [evaluation artifact template execution risk](evaluation-artifact-template-execution-risk.md)
- [PapersGPT Zotero LLM response remote code execution](papersgpt-zotero-llm-response-rce.md)

## Open Questions

- Which primary Xinference release or advisory confirms the exact fixed version and parser replacement for CVE-2026-61539?

## Maintenance Notes

- Created on 2026-08-22 from the [August 22 topic news collector source](../../../raw/processed/2026-08-22/ai-security-wiki-topic-news-collector-2026-08-22T233049Z.json) as a prompt-driven parser execution leaf.
