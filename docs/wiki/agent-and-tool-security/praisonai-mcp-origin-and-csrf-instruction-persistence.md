---
type: "Topic"
title: "PraisonAI MCP Origin And CSRF Instruction Persistence"
description: "Security analysis for PraisonAI MCP origin-validation and text/plain CSRF flaws that enable local tool calls and persistent instruction changes."
tags: ["agent-and-tool-security", "identity-and-access"]
---

# PraisonAI MCP Origin And CSRF Instruction Persistence

## Current Understanding

The [August 25 topic news collector source](../../../raw/processed/2026-08-25/ai-security-wiki-topic-news-collector-2026-08-25T183709Z.json) and [August 25 late topic news collector source](../../../raw/processed/2026-08-25/ai-security-wiki-topic-news-collector-2026-08-25T233059Z.json) record PraisonAI MCP origin-validation failures fixed in the [4.6.58 release](https://github.com/MervinPraison/PraisonAI/releases/tag/v4.6.58). Broad PraisonAI framework context belongs upstream in the AI wiki; this page owns the local browser-to-localhost and persistent-agent-instruction security boundary.

[CVE-2026-55529](https://nvd.nist.gov/vuln/detail/CVE-2026-55529) describes `startswith` origin matching that accepts attacker-controlled localhost-like origins and allows local MCP `tools/call` requests without an API key. [CVE-2026-55532](https://nvd.nist.gov/vuln/detail/CVE-2026-55532) adds text/plain request handling without preflight, allowing CSRF-style browser requests that can invoke tools and persist agent instructions through file writes. The shared root cause is treating local MCP HTTP Stream endpoints as browser-safe without exact origin and content-type enforcement.

The [PraisonAI advisory deferrals](praisonai-agent-control-plane-advisory-deferrals.md) page preserves related August 25 PraisonAI evidence for `web_crawl` SSRF, missing endpoint authentication, and file-rewrite approval bypasses until those CVEs are verified into focused leaves.

## Security Impact

- Threat: a malicious web page can reach a local PraisonAI MCP server and persist agent instructions or invoke tools under the local user's authority.
- Affected boundary: PraisonAI before 4.6.58; CVE-2026-55529 and CVE-2026-55532.
- Exploit or incident status: public vulnerability advisories with patch references; no local exploitation incident is recorded.
- Mitigation state: upgrade to 4.6.58 or later, require API-key authentication for local tool calls, validate exact origins, and reject simple cross-site content types for state-changing calls.
- Confidence: high for advisory identity, affected range, and patch release from NVD/GitHub evidence.
- Residual risk: localhost MCP endpoints remain exposed to browser-origin attacks when they trust DNS names, string prefixes, or same-machine assumptions.

## Control Implications

- Treat local MCP HTTP transports as network-exposed services from the browser threat model.
- Bind agent-instruction persistence to authenticated users and explicit approval, not just local process reachability.
- Log Origin, Host, content type, session id, delegated user, tool name, file target, and instruction mutations.

## Authoritative Sources

- [August 25 topic news collector source](../../../raw/processed/2026-08-25/ai-security-wiki-topic-news-collector-2026-08-25T183709Z.json)
- [August 25 late topic news collector source](../../../raw/processed/2026-08-25/ai-security-wiki-topic-news-collector-2026-08-25T233059Z.json)
- [NVD CVE-2026-55529](https://nvd.nist.gov/vuln/detail/CVE-2026-55529)
- [NVD CVE-2026-55532](https://nvd.nist.gov/vuln/detail/CVE-2026-55532)
- [PraisonAI 4.6.58 release](https://github.com/MervinPraison/PraisonAI/releases/tag/v4.6.58)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [agentic browser intent collision](agentic-browser-intent-collision.md)
- [cross-site agent forgery](cross-site-agent-forgery.md)
- [MCP context injection transparency](mcp-context-injection-transparency.md)

## Open Questions

- Which PraisonAI file-write tools were reachable in common deployments, and were persisted instructions scoped per user or per project?

## Maintenance Notes

- Created on 2026-08-26 from the [August 25 collectors](../../../raw/processed/2026-08-25/ai-security-wiki-topic-news-collector-2026-08-25T233059Z.json) after grouping the shared origin/CSRF instruction-persistence advisory family.
