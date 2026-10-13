---
type: "Topic"
title: "Agno PythonTools Code Injection"
description: "Security analysis for CVE-2026-108816, where Agno PythonTools run_python_code can execute attacker-controlled code."
tags: ["agent-and-tool-security", "infrastructure-and-supply-chain"]
---

# Agno PythonTools Code Injection

## Current Understanding

The [October 12 topic collector source](../../../raw/processed/2026-10-12/ai-security-wiki-topic-news-collector-2026-10-12T233447Z.json) records [CVE-2026-108816](https://nvd.nist.gov/vuln/detail/CVE-2026-108816) for Agno 3.0.0 through 3.0.6. Broad [Agno framework coverage](../../../upstream-ai-wiki/agentic-frameworks/agno.md) belongs upstream; this page owns the local Python tool execution boundary.

The CVE evidence says `PythonTools` `run_python_code` is vulnerable through the `code` argument, with public exploit material and no project response recorded in the CVE text available during collection. This is adjacent to but distinct from [Agno Python and Shell tools prompt-injection RCE](agno-python-shell-tools-prompt-injection-rce.md), which owns the earlier CVE-2026-37003 boundary through Agno 2.5.8.

## Security Impact

- Threat: attacker-controlled or model-influenced Python code can execute with the authority of the Agno process.
- Affected boundary: Agno 3.0.0 through 3.0.6, `PythonTools`, `run_python_code`, and the `code` argument.
- Exploit or incident status: public CVE and public GitHub issue/advisory references; no exploitation incident is recorded locally.
- Mitigation state: unresolved in local evidence; disable exposed PythonTools or isolate them until a verified fixed release is identified.
- Confidence: moderate-high for affected versions and public-exploit status from NVD-backed source evidence; remediation state remains lower confidence.
- Residual risk: Python execution tools remain privileged even when prompt-level filtering appears to work.

## Control Implications

- Treat PythonTools as code-execution services requiring explicit authorization, sandboxing, and environment isolation.
- Separate code-string validation from deployment authorization because safe parsing cannot make arbitrary Python low-risk.
- Regression-test model-generated and user-supplied code arguments separately from ShellTools or generic prompt-injection tests.

## Authoritative Sources

- [October 12 topic collector source](../../../raw/processed/2026-10-12/ai-security-wiki-topic-news-collector-2026-10-12T233447Z.json)
- [NVD CVE-2026-108816](https://nvd.nist.gov/vuln/detail/CVE-2026-108816)
- [Agno issue 10047](https://github.com/Agno-agi/Agno/issues/10047)
- [Agno PythonTools advisory](https://github.com/ybyu-ieu/agno-security-advisories/blob/main/advisories/agno-pythontools-run-python-code-arbitrary-code-execution.md)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [Agno AgentOS missing authentication](../identity-and-access/agno-agentos-missing-authentication.md)
- [Agno Python and Shell tools prompt-injection RCE](agno-python-shell-tools-prompt-injection-rce.md)

## Open Questions

- Has Agno published a fixed version or sandboxing guidance for CVE-2026-108816 after the CVE text recorded no project response?

## Maintenance Notes

- Created on 2026-10-13 from the October 12 topic collector as an Agno 3.x PythonTools execution leaf.
