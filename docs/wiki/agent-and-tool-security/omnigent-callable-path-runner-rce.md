---
type: "Topic"
title: "Omnigent Callable Path Runner RCE"
description: "Security analysis for CVE-2026-62675 Omnigent dotted Python callable-path runner command execution."
tags: ["agent-and-tool-security", "infrastructure-and-supply-chain"]
---

# Omnigent Callable Path Runner RCE

## Current Understanding

The [August 22 topic news collector source](../../../raw/processed/2026-08-22/ai-security-wiki-topic-news-collector-2026-08-22T233049Z.json) records CVE-2026-62675 for Omnigent before 0.3.0. This page owns the local agent configuration parsing boundary where a dotted Python callable path can become runner code execution.

The [NVD record](https://nvd.nist.gov/vuln/detail/CVE-2026-62675) describes authenticated agent bundles with a dotted Python callable path that the runner could import and invoke, including attacker-selected callables such as `subprocess.check_output`. That path could expose files, environment variables, credentials, workspace data, internal services, and availability. The [0.3.0 release](https://github.com/omnigent-ai/omnigent/releases/tag/v0.3.0) is the patch boundary captured by the collector.

## Security Impact

- Threat: a model or user-controlled agent-bundle field can cross from declarative configuration into Python import and invocation authority.
- Affected boundary: Omnigent before 0.3.0 callable path handling in authenticated agent bundles.
- Exploit or incident status: public NVD advisory evidence; no local exploitation evidence is recorded.
- Mitigation state: upgrade to 0.3.0 or later, replace dynamic callable imports with explicit registries, and deny unsafe standard-library callables.
- Confidence: high for advisory identifier and fix version from NVD and release evidence.
- Residual risk: agent platforms must test every configuration field that names code, not only shell-command fields.

## Authoritative Sources

- [August 22 topic news collector source](../../../raw/processed/2026-08-22/ai-security-wiki-topic-news-collector-2026-08-22T233049Z.json)
- [NVD CVE-2026-62675](https://nvd.nist.gov/vuln/detail/CVE-2026-62675)
- [Omnigent 0.3.0 release](https://github.com/omnigent-ai/omnigent/releases/tag/v0.3.0)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [agent action runtime hooks](agent-action-runtime-hooks.md)
- [evaluation artifact template execution risk](../model-and-prompt-security/evaluation-artifact-template-execution-risk.md)

## Open Questions

- Which callable registry or parser behavior replaced dotted import execution in Omnigent 0.3.0?

## Maintenance Notes

- Created on 2026-08-22 from the [August 22 topic news collector source](../../../raw/processed/2026-08-22/ai-security-wiki-topic-news-collector-2026-08-22T233049Z.json) as the callable-path member of the Omnigent 0.3.0 advisory set.
