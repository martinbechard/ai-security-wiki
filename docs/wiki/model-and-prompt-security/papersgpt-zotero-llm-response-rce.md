---
type: "Topic"
title: "PapersGPT Zotero LLM Response Remote Code Execution"
description: "Security analysis for CVE-2026-73032 where prompt-injected or malicious LLM responses execute in Zotero privilege."
tags: ["model-and-prompt-security", "infrastructure-and-supply-chain", "data-and-privacy"]
---

# PapersGPT Zotero LLM Response Remote Code Execution

## Current Understanding

CVE-2026-73032 describes PapersGPT for Zotero 0.6.1 executing arbitrary JavaScript when a malicious LLM endpoint, man-in-the-middle attacker, or prompt-injected PDF returns code that is passed unsanitized to `window.eval()` in `views.ts`. The [August 11 topic news collector source](../../../raw/processed/2026-08-11/ai-security-wiki-topic-news-collector-2026-08-11T233115Z.json) records [CVE.org](https://www.cve.org/CVERecord?id=CVE-2026-73032), the [PapersGPT for Zotero repository](https://github.com/papersgpt/papersgpt-for-zotero), and vulnerability-listing evidence.

Broad Zotero, PapersGPT, ChatGPT, Claude, Gemini, and DeepSeek context belongs upstream. The local security boundary is unsafe model-output handling: a research plugin treats LLM response text as executable privileged extension code, so prompt injection can cross from document content or endpoint response into file, process, and Zotero-data access.

## Security Impact

- Threat: malicious model output or prompt-injected document content can execute JavaScript in Zotero's chrome-privileged context.
- Affected boundary: PapersGPT for Zotero 0.6.1, LLM endpoint responses, prompt-injected PDFs, `window.eval()`, Zotero local data, filesystem access, and process execution.
- Exploit or incident status: CVE record and vulnerability-listing evidence; no confirmed in-the-wild exploitation in the collected source.
- Mitigation state: patch details were not captured; avoid vulnerable plugin versions and prohibit `eval()` of LLM-controlled text in privileged extension contexts.
- Confidence: medium-high because the CVE record is visible and corroborated by a vulnerability listing, but NVD detail was not successfully fetched in the collector run.
- Residual risk: document and research assistants often process attacker-controlled papers, PDFs, and endpoint output inside privileged local applications.

## Control Implications

- Treat all model responses as untrusted data, including responses from configured or proxied LLM endpoints.
- Never pass LLM-controlled text to `eval()`, dynamic function construction, shell execution, or privileged extension APIs.
- Sanitize PDF-derived prompts and retrieved text before they can affect local application behavior.
- Isolate AI plugin execution from file, process, and credential access unless explicitly required.
- Preserve endpoint, document, prompt, response, and executed-code evidence when investigating research-assistant compromise.

## Authoritative Sources

- [August 11 topic news collector source](../../../raw/processed/2026-08-11/ai-security-wiki-topic-news-collector-2026-08-11T233115Z.json)
- CVE.org CVE-2026-73032 record: https://www.cve.org/CVERecord?id=CVE-2026-73032
- PapersGPT for Zotero repository: https://github.com/papersgpt/papersgpt-for-zotero
- Red Hot Cyber vulnerability listing: https://www.redhotcyber.com/en/latest-critical-vulnerabilities/

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [model and prompt security](index.md)
- [evaluation artifact template execution risk](evaluation-artifact-template-execution-risk.md)
- [agent build and dependency execution boundaries](../infrastructure-and-supply-chain/agent-build-and-dependency-execution-boundaries.md)
- Upstream AI wiki owns broad PapersGPT, Zotero, and model-provider context when present.

## Open Questions

- Which NVD or VulnCheck record should be used for CVSS, CWE, patch, and affected-version details?
- Has PapersGPT for Zotero published a fixed version or mitigation guidance?

## Maintenance Notes

- Created on 2026-08-11 from the [August 11 topic collector](../../../raw/processed/2026-08-11/ai-security-wiki-topic-news-collector-2026-08-11T233115Z.json) after routing broad research-tool and model-provider context upstream.
