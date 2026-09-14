---
type: "Topic"
title: "Flowise CSV Agent prompt-injection RCE"
description: "Security analysis for CVE-2026-70477 Flowise CSV Agent prompt injection reaching Pyodide execution."
tags: ["agent-and-tool-security", "model-and-prompt-security"]
---

# Flowise CSV Agent prompt-injection RCE

## Current Understanding

The [September 13 topic collector source](../../../raw/processed/2026-09-13/ai-security-wiki-topic-news-collector-2026-09-13T171540Z.json) adds in-window NVD evidence for [CVE-2026-70477](https://nvd.nist.gov/vuln/detail/CVE-2026-70477). Broad Flowise product and flow-builder context belongs upstream; this page owns the distinct CSV Agent prompt-to-code boundary.

The record describes Flowise before 3.1.3, where prompt injection against a chatflow using the CSV Agent node can make the LLM produce malicious Python that bypasses a blocklist validator and executes in an unsandboxed Pyodide environment. NVD reports CVSS v3.1 9.8 critical and points to the Flowise 3.1.3 fix.

## Security Impact

- Threat: prompt-controlled CSV Agent output can become malicious Python execution when validator blocklists are the main barrier before Pyodide execution.
- Affected boundary: Flowise before 3.1.3, CSV Agent node, LLM-generated Python, blocklist validation, and Pyodide execution environment.
- Exploit or incident status: public NVD/GitHub advisory evidence; no local exploitation incident is recorded.
- Mitigation state: upgrade to Flowise 3.1.3 or later, avoid unsandboxed code execution from model output, and use allow-listed operations instead of blocklist validation.
- Confidence: high for NVD severity, affected version, and fixed-version signal; medium for exact chatflow prerequisites until the GitHub advisory is reconciled.
- Residual risk: agent-builder components that translate prompt output into executable code need sandbox and capability controls even when the interpreter is browser-like or embedded.

## Authoritative Sources

- [September 13 topic collector source](../../../raw/processed/2026-09-13/ai-security-wiki-topic-news-collector-2026-09-13T171540Z.json)
- [CVE-2026-70477 NVD record](https://nvd.nist.gov/vuln/detail/CVE-2026-70477)
- [Flowise advisory GHSA-5xvg-pmgg-3mxr](https://github.com/FlowiseAI/Flowise/security/advisories/GHSA-5xvg-pmgg-3mxr)
- [Flowise 3.1.3 release](https://github.com/FlowiseAI/Flowise/releases/tag/flowise@3.1.3)
- [Flowise fix commit f4e2794f6a576b94578f2fdafbf49c2fb304626c](https://github.com/FlowiseAI/Flowise/commit/f4e2794f6a576b94578f2fdafbf49c2fb304626c)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [Flowise agent node code execution](flowise-agent-node-code-execution.md)
- [LaVague indirect prompt injection RCE](../model-and-prompt-security/lavague-indirect-prompt-injection-rce.md)

## Open Questions

- Which Flowise deployments exposed CSV Agent chatflows to untrusted users before 3.1.3?

## Maintenance Notes

- Created on 2026-09-13 from the [September 13 topic collector](../../../raw/processed/2026-09-13/ai-security-wiki-topic-news-collector-2026-09-13T171540Z.json) after verifier correction split CVE-2026-70477 from the broader Flowise code-execution router.
