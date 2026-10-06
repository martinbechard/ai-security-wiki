---
type: "Topic"
title: "Langflow Smart Transform Code Execution"
description: "Security analysis for GHSA-9fpm-3445-2vx4 / CVE-2026-7700 code execution through Smart Transform LLM-generated lambda evaluation."
tags: ["agent-and-tool-security", "model-and-prompt-security"]
---

# Langflow Smart Transform Code Execution

## Current Understanding

The [October 5 topic collector source](../../../raw/processed/2026-10-05/ai-security-wiki-topic-news-collector-2026-10-05T233142Z.json) records [GHSA-9fpm-3445-2vx4](https://github.com/advisories/GHSA-9fpm-3445-2vx4) / CVE-2026-7700 for Langflow Smart Transform. Broad Langflow product and low-code workflow background belongs upstream; this page owns the prompt-to-code execution boundary.

The advisory says Smart Transform could evaluate LLM-generated Python lambda code with full builtins. That turns model output, prompt steering, or transformed data into server-side Python execution when affected Langflow versions process the transform.

## Security Impact

- Threat: model-generated transform code can cross from data transformation into server-side Python execution.
- Affected boundary: Langflow Smart Transform 1.3.0 through before 1.10.3.
- Exploit or incident status: reviewed GitHub advisory and public vulnerability database evidence; no local exploitation incident is recorded.
- Mitigation state: update Langflow to a fixed release, remove unrestricted builtins from generated-code evaluation, and avoid treating LLM-authored code as trusted transformation logic.
- Confidence: high for the advisory and affected Smart Transform range captured in the October 5 source.
- Residual risk: workflow builders that deliberately turn prompts into executable transforms need a separate approval and sandbox boundary from ordinary flow editing.

## Authoritative Sources

- [October 5 topic collector source](../../../raw/processed/2026-10-05/ai-security-wiki-topic-news-collector-2026-10-05T233142Z.json)
- [GitHub advisory GHSA-9fpm-3445-2vx4](https://github.com/advisories/GHSA-9fpm-3445-2vx4)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [model and prompt security](../model-and-prompt-security/index.md)
- [IBM Langflow scanner code-execution bypasses](ibm-langflow-scanner-code-execution-bypasses.md)
- [IBM Langflow MCP stdio command execution](ibm-langflow-mcp-stdio-command-execution.md)
- Upstream AI wiki owns broad Langflow framework context.

## Open Questions

- Which Langflow release note or vendor advisory gives the canonical fixed-version and sandbox behavior for GHSA-9fpm-3445-2vx4?

## Maintenance Notes

- Created on 2026-10-06 from the [October 5 topic collector source](../../../raw/processed/2026-10-05/ai-security-wiki-topic-news-collector-2026-10-05T233142Z.json) after splitting Smart Transform prompt-to-code execution from MCP authorization and configuration issues.
