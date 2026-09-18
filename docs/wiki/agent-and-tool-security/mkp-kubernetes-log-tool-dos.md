---
type: "Topic"
title: "MKP Kubernetes Log Tool DoS"
description: "Security analysis for CVE-2026-50125 unbounded pod-log reads in the MKP Kubernetes MCP server."
tags: ["agent-and-tool-security", "infrastructure-and-supply-chain"]
---

# MKP Kubernetes Log Tool DoS

## Current Understanding

The [September 17 topic collector source](../../../raw/processed/2026-09-17/ai-security-wiki-topic-news-collector-2026-09-17T233119Z.json) records CVE-2026-50125 for MKP before 0.4.1. Broad Kubernetes and MCP server context belongs upstream; this page owns the local security boundary where a read-looking Kubernetes log tool can become unauthenticated process memory exhaustion.

The CVE says MKP exposed the default HTTP endpoint and registered an unauthenticated `get_resource` tool that accepted caller-controlled Kubernetes pod-log `limitBytes` and `tailLines` values. A reachable attacker could request large logs and force large in-memory copies.

## Security Impact

- Threat: unauthenticated MCP tool callers can turn log retrieval into memory exhaustion.
- Affected boundary: MKP before 0.4.1, default port 8080 MCP endpoint, Kubernetes pod log subresource, and log size parameters.
- Exploit or incident status: public CVE record; no local exploitation incident is recorded.
- Mitigation state: upgrade to 0.4.1 or later, authenticate the MCP endpoint, cap `limitBytes` and `tailLines`, and stream or page log data instead of retaining unbounded copies.
- Confidence: high for CVE publication and affected boundary.
- Residual risk: Kubernetes-control MCP tools need per-tool volume limits even when the underlying Kubernetes API is read-only.

## Authoritative Sources

- [September 17 topic collector source](../../../raw/processed/2026-09-17/ai-security-wiki-topic-news-collector-2026-09-17T233119Z.json)
- [CVE-2026-50125 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-50125)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [agent network egress controls](agent-network-egress-controls.md)
- [MCP tool-level IAM authorization](../identity-and-access/mcp-tool-level-iam-authorization.md)

## Open Questions

- Which Kubernetes MCP tools enforce bounded response sizes before copying log or resource data into memory?

## Maintenance Notes

- Created on 2026-09-18 from the [September 17 topic collector](../../../raw/processed/2026-09-17/ai-security-wiki-topic-news-collector-2026-09-17T233119Z.json) as a Kubernetes MCP availability leaf.
