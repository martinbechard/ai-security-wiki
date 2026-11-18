---
type: "Topic"
title: "code-review-mcp-server Command Injection"
description: "Security analysis of CVE-2026-68934, where code-review-mcp-server command strings accepted attacker-controlled parameters."
tags: ["agent-and-tool-security"]
---

# code-review-mcp-server Command Injection

## Current Understanding

The [November 18 topic collector source](../../../raw/processed/2026-11-18/ai-security-wiki-topic-news-collector-2026-11-18T003403Z.json) records CVE-2026-68934 / [GHSA-jq3q-62jc-fqq9](https://github.com/advisories/GHSA-jq3q-62jc-fqq9) in code-review-mcp-server before 1.5.3. Broad product context belongs upstream and development workflow practice belongs in ai-dev-wiki; this page owns the local delegated host-command boundary.

The advisory states that MCP tools interpolated `folderPath` and `baseBranch` into `child_process.execSync` shell strings. Crafted values could execute arbitrary host commands. Version 1.5.3 changes those calls to `execFileSync` argument arrays, removing shell interpretation.

## Security Impact

- Threat: repository content or prompts influencing MCP tool parameters can become host commands.
- Affected boundary: MCP tools accepting `folderPath` and `baseBranch` in versions before 1.5.3.
- Exploit or incident status: public GitHub Reviewed advisory; no incident is recorded in the source.
- Mitigation state: upgrade to 1.5.3 or later and audit comparable MCP tools for shell-string invocation.
- Confidence: high for the mechanism, affected range, and fixed version from the advisory and linked release.
- Residual risk: safe argument arrays do not remove authority risk when an agent can select repositories or invoke privileged tools without appropriate containment.

## Control Implications

- Prefer process APIs that accept explicit executable and argument vectors.
- Validate paths and revision identifiers before crossing an MCP-to-host execution boundary.
- Run coding-agent tools with least privilege and a constrained workspace.

## Authoritative Sources

- [November 18 topic collector source](../../../raw/processed/2026-11-18/ai-security-wiki-topic-news-collector-2026-11-18T003403Z.json)
- [GHSA-jq3q-62jc-fqq9](https://github.com/advisories/GHSA-jq3q-62jc-fqq9)
- [code-review-mcp-server v1.5.3 release](https://github.com/Orcus2021/code-review-mcp-server/releases/tag/v1.5.3)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [Kubeshark MCP pod-regex command injection](kubeshark-mcp-pod-regex-command-injection.md)

## Open Questions

- No open wiki questions are recorded for this topic.

## Maintenance Notes

- Created on 2026-11-18 from the November 18 collector after routing catalog and workflow context to their upstream owners.
