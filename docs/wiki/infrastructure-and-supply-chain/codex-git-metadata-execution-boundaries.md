---
type: "Topic"
title: "Codex Git Metadata Execution Boundaries"
description: "Security analysis for Codex Git metadata inspection CVEs involving fsmonitor and attr/filter execution."
tags: ["infrastructure-and-supply-chain", "agent-and-tool-security"]
---

# Codex Git Metadata Execution Boundaries

## Current Understanding

The [September 1 topic collector source](../../../raw/processed/2026-09-01/ai-security-wiki-topic-news-collector-2026-09-01T233307Z.json) records two closely coupled OpenAI Codex Git metadata execution CVEs: [CVE-2026-19592](https://nvd.nist.gov/vuln/detail/CVE-2026-19592) for preserved `core.fsmonitor` helpers and [CVE-2026-19593](https://nvd.nist.gov/vuln/detail/CVE-2026-19593) for Codex Desktop `attr.tree` plus clean or process filters. Broad Codex and Git product context belongs upstream; this page owns the AI coding-agent workspace-trust and metadata-inspection boundary.

Both records turn passive repository inspection into code execution when attacker-controlled local Git configuration is preserved. CVE-2026-19592 affects Codex CLI and Codex Desktop metadata collection that invokes Git without disabling repository-local `core.fsmonitor`. CVE-2026-19593 affects Codex Desktop workspace inspection when Git attributes and filters cause Git to run attacker-controlled programs outside the Codex command sandbox.

## Security Impact

- Threat: opening or inspecting an attacker-prepared repository can execute local code before model interaction, command approval, or a workspace-trust prompt.
- Affected boundary: Codex CLI on Windows, macOS, and Linux for `core.fsmonitor`; Codex Desktop on Windows and macOS for both CVEs; Git on PATH; preserved local `.git/config`.
- Exploit or incident status: public NVD records; no local exploitation evidence is recorded.
- Mitigation state: fixed versions were not captured in the source; safe invocation requires disabling unsafe Git config hooks and filters during agent-owned metadata collection.
- Confidence: high for the CVE identities and affected surfaces from NVD; medium for remediation until vendor release evidence is captured.
- Residual risk: repository metadata is a code-execution surface for coding agents, not just an indexing input.

## Control Implications

- Treat `.git/config`, attributes, filters, fsmonitor hooks, and repository-local helpers as untrusted until workspace trust is established.
- Run pre-trust Git inspection with safe config overrides that disable hooks, fsmonitor, filters, and external helpers.
- Keep command approval, workspace trust, and filesystem sandboxing as separate controls because pre-model inspection can bypass model-mediated approval.

## Authoritative Sources

- [September 1 topic collector source](../../../raw/processed/2026-09-01/ai-security-wiki-topic-news-collector-2026-09-01T233307Z.json)
- [NVD CVE-2026-19592](https://nvd.nist.gov/vuln/detail/CVE-2026-19592)
- [NVD CVE-2026-19593](https://nvd.nist.gov/vuln/detail/CVE-2026-19593)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [AI development workstation containment](ai-development-workstation-containment.md)
- [agent build and dependency execution boundaries](agent-build-and-dependency-execution-boundaries.md)
- [local agent execution and processing boundaries](../agent-and-tool-security/local-agent-execution-and-processing-boundaries.md)

## Open Questions

- Which Codex release disables fsmonitor, attr, and filter execution during pre-trust repository inspection?

## Maintenance Notes

- Created on 2026-09-01 from the [September 1 topic collector](../../../raw/processed/2026-09-01/ai-security-wiki-topic-news-collector-2026-09-01T233307Z.json) as a closely coupled Git metadata execution boundary for CVE-2026-19592 and CVE-2026-19593.
