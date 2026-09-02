---
type: "Topic"
title: "Codex PowerShell Stop-Parsing Approval Bypass"
description: "Security analysis for CVE-2026-19591 command-approval bypass through PowerShell stop-parsing semantics in OpenAI Codex."
tags: ["agent-and-tool-security", "identity-and-access"]
---

# Codex PowerShell Stop-Parsing Approval Bypass

## Current Understanding

The [September 1 topic collector source](../../../raw/processed/2026-09-01/ai-security-wiki-topic-news-collector-2026-09-01T233307Z.json) records [CVE-2026-19591](https://nvd.nist.gov/vuln/detail/CVE-2026-19591) for OpenAI Codex CLI and Codex Desktop command-safety parsing. Broad OpenAI Codex product context belongs upstream in ai-wiki, and general coding-agent approval workflow belongs upstream in ai-dev-wiki; this page owns the concrete local command-approval and MCP configuration bypass.

NVD says Codex parsed PowerShell's `--%` stop-parsing token differently from PowerShell. An attacker-prepared repository instruction could cause a file-writing Git command to run without approval. If filesystem protections permit the write, later Codex configuration loading can start an attacker-controlled MCP server and execute code with user privileges. Fixed-version details were not captured in the source.

## Security Impact

- Threat: model-followed repository instructions can cross from command suggestion into unapproved local configuration writes.
- Affected boundary: OpenAI Codex CLI for Windows, macOS, and Linux; Codex Desktop for Windows and macOS; PowerShell command parsing; Codex configuration loading; MCP server startup.
- Exploit or incident status: public NVD vulnerability record; no local exploitation evidence is recorded.
- Mitigation state: patched version not yet identified locally; treat untrusted repositories, PowerShell stop-parsing syntax, Codex configuration writes, and MCP server definitions as approval-sensitive until vendor remediation is confirmed.
- Confidence: high for the CVE identity and attack path from NVD; medium for remediation because vendor fixed-version evidence is missing.
- Residual risk: command approval prompts are insufficient when parser normalization and shell execution disagree.

## Control Implications

- Canonicalize commands with the target shell semantics before approval classification.
- Treat repository-provided instructions and configuration paths as untrusted inputs.
- Require explicit review for writes to agent configuration and MCP server registration files.
- Pair command approval with filesystem policy that blocks untrusted repositories from mutating agent control-plane configuration.

## Authoritative Sources

- [September 1 topic collector source](../../../raw/processed/2026-09-01/ai-security-wiki-topic-news-collector-2026-09-01T233307Z.json)
- [NVD CVE-2026-19591](https://nvd.nist.gov/vuln/detail/CVE-2026-19591)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [coding agent command approval boundaries](coding-agent-command-approval-boundaries.md)
- [local agent execution and processing boundaries](local-agent-execution-and-processing-boundaries.md)
- Upstream AI wiki owns broad OpenAI Codex product context.
- Upstream AI development wiki owns general coding-agent command approval practice.

## Open Questions

- Which Codex CLI and Codex Desktop releases first align approval parsing with PowerShell stop-parsing behavior?

## Maintenance Notes

- Created on 2026-09-01 from the [September 1 topic collector](../../../raw/processed/2026-09-01/ai-security-wiki-topic-news-collector-2026-09-01T233307Z.json) as the PowerShell-specific Codex approval-bypass leaf.
