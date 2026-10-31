---
type: "Topic"
title: "Agno PandasTools Model-Controlled Reflection"
description: "Security analysis for CVE-2026-119050 model-selected PandasTools reflection."
tags: ["agent-and-tool-security", "model-and-prompt-security"]
---

# Agno PandasTools Model-Controlled Reflection

## Current Understanding

The [October 30 collector](../../../raw/processed/2026-10-30/ai-security-wiki-topic-news-collector-2026-10-30T232632Z.json) records [CVE-2026-119050](https://nvd.nist.gov/vuln/detail/CVE-2026-119050) for Agno through 3.1.11. Model-controlled function names reach `PandasTools` `getattr()`, enabling prompt injection to invoke unsafe readers such as `read_pickle` for code execution or local-file reads. Broad [Agno framework coverage](../../../upstream-ai-wiki/agentic-frameworks/agno.md) remains upstream; this leaf owns model-to-tool reflection.

## Security Impact

- Threat: prompt-influenced tool selection can invoke unsafe Pandas readers.
- Affected boundary: Agno through 3.1.11, model-selected function names, and PandasTools dispatch.
- Exploit or incident status: public CVE; no confirmed exploitation incident is recorded locally.
- Mitigation state: a fixed release is not established by the collector; use a fixed allowlist with typed arguments and disable unsafe readers.
- Confidence and residual risk: high for the stated boundary; reflective dispatch remains unsafe where tool names derive from untrusted model output.

## Authoritative Sources

- [October 30 collector](../../../raw/processed/2026-10-30/ai-security-wiki-topic-news-collector-2026-10-30T232632Z.json)
- [NVD CVE-2026-119050](https://nvd.nist.gov/vuln/detail/CVE-2026-119050)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [Agno PythonTools Code Injection](agno-pythontools-code-injection.md)

## Open Questions

- Which maintained Agno release replaces reflective PandasTools dispatch with an explicit allowlist?

## Maintenance Notes

- Created on 2026-10-30 as a boundary distinct from PythonTools code execution.
