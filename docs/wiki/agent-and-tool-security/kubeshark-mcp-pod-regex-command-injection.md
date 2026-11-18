---
type: "Topic"
title: "Kubeshark MCP Pod-Regex Command Injection"
description: "Security analysis of CVE-2026-129236, where a Kubeshark MCP tool argument could redirect a privileged Kubernetes worker image."
tags: ["agent-and-tool-security", "infrastructure-and-supply-chain"]
---

# Kubeshark MCP Pod-Regex Command Injection

## Current Understanding

The [November 18 topic collector source](../../../raw/processed/2026-11-18/ai-security-wiki-topic-news-collector-2026-11-18T003403Z.json) records [CVE-2026-129236](https://nvd.nist.gov/vuln/detail/CVE-2026-129236) / [GHSA-8vf2-hxg5-crqh](https://github.com/advisories/GHSA-8vf2-hxg5-crqh) in Kubeshark MCP v53.1.0 through v53.3.0. Broad Kubeshark catalog context belongs upstream; this page owns the delegated MCP tool-argument boundary.

The `start_kubeshark` tool passed caller-controlled `pod_regex` before an end-of-options separator. A value beginning with `--set` could redirect Helm image values to an attacker-controlled registry. The advisory says that a resulting privileged worker DaemonSet could lead to node and cluster-admin compromise. v53.4.0 places `pod_regex` after a literal `--` separator.

## Security Impact

- Threat: untrusted content can influence an agent's MCP tool call and reinterpret an intended regex as a deployment option.
- Affected boundary: local stdio MCP server, `--allow-destructive`, and a kubeconfig able to deploy the worker DaemonSet.
- Exploit or incident status: public GitHub Reviewed advisory; no incident is recorded in the source.
- Mitigation state: upgrade to v53.4.0 or later, avoid destructive mode when it is not required, and constrain kubeconfig authority.
- Confidence: high for affected versions, mechanism, and remediation from the advisory and linked release.
- Residual risk: the patch removes this option-injection path but privileged MCP deployment authority remains sensitive to indirect prompt injection and tool-approval failures.

## Control Implications

- Put untrusted content behind an explicit review boundary before it can shape destructive MCP arguments.
- Use argument arrays and end-of-options separators for tool-to-command transitions.
- Scope Kubernetes credentials to the narrowest workload and namespace permissions.

## Authoritative Sources

- [November 18 topic collector source](../../../raw/processed/2026-11-18/ai-security-wiki-topic-news-collector-2026-11-18T003403Z.json)
- [GHSA-8vf2-hxg5-crqh](https://github.com/advisories/GHSA-8vf2-hxg5-crqh)
- [CVE-2026-129236](https://nvd.nist.gov/vuln/detail/CVE-2026-129236)
- [Kubeshark v53.4.0 release](https://github.com/kubeshark/kubeshark/releases/tag/v53.4.0)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [agent tool filesystem path containment](../infrastructure-and-supply-chain/agent-tool-filesystem-path-containment.md)

## Open Questions

- No open wiki questions are recorded for this topic.

## Maintenance Notes

- Created on 2026-11-18 from the November 18 collector after routing Kubeshark product background upstream.
