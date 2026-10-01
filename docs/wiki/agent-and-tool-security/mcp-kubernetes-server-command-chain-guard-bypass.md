---
type: "Topic"
title: "mcp-kubernetes-server Command Chain Guard Bypass"
description: "Security analysis for CVE-2025-59376, where write and delete guards inspect only the first command word."
tags: ["agent-and-tool-security", "identity-and-access"]
---

# mcp-kubernetes-server Command Chain Guard Bypass

## Current Understanding

The [September 30 topic collector source](../../../raw/processed/2026-09-30/ai-security-wiki-topic-news-collector-2026-09-30T233235Z.json) records [CVE-2025-59376](https://nvd.nist.gov/vuln/detail/CVE-2025-59376) for feiskyer `mcp-kubernetes-server` through 0.1.11. Broad Kubernetes and MCP server catalog context belongs upstream; this page owns the local final-command authorization boundary.

The source says `--disable-write` and `--disable-delete` checks consider only the first command word. A chained command can begin with an allowed read-like command and then perform a blocked write or delete operation, so policy is enforced on a parsed prefix rather than the final command sequence that reaches Kubernetes.

## Security Impact

- Threat: model- or caller-selected command strings can smuggle write or delete operations through read-shaped prefixes.
- Affected boundary: feiskyer `mcp-kubernetes-server` through 0.1.11, `--disable-write`, `--disable-delete`, command parsing, and Kubernetes operation execution.
- Exploit or incident status: public NVD record and public referenced source-code location; no local exploitation incident is recorded.
- Mitigation state: fixed version was not identified in the collector evidence; avoid relying on first-token command checks and enforce Kubernetes permissions with parsed commands and cluster-native RBAC.
- Confidence: high for the control-bypass fact from NVD and referenced source code; medium for remediation state until a fixed release is identified.
- Residual risk: Kubernetes MCP servers need final-operation authorization because shell-style command composition can bypass UI- or flag-level tool intent.

## Authoritative Sources

- [September 30 topic collector source](../../../raw/processed/2026-09-30/ai-security-wiki-topic-news-collector-2026-09-30T233235Z.json)
- [NVD CVE-2025-59376](https://nvd.nist.gov/vuln/detail/CVE-2025-59376)
- [Referenced source-code boundary](https://github.com/feiskyer/mcp-kubernetes-server/blob/78957b6c1a3982080cf6fcaac6f6e9014116a71c/src/mcp_kubernetes_server/main.py#L106-L137)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [MCP tool-level IAM authorization](../identity-and-access/mcp-tool-level-iam-authorization.md)
- Upstream AI wiki owns broad MCP and Kubernetes server catalog context.
- Upstream AI development wiki owns general Kubernetes MCP operations practice.

## Open Questions

- Which `mcp-kubernetes-server` release first fixes CVE-2025-59376?

## Maintenance Notes

- Created on 2026-10-01 from the [September 30 topic collector source](../../../raw/processed/2026-09-30/ai-security-wiki-topic-news-collector-2026-09-30T233235Z.json).
