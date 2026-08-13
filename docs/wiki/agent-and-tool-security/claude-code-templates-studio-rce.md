---
type: "Topic"
title: "Claude Code Templates Studio Remote Code Execution"
description: "Security analysis for unauthenticated command execution in Claude Code Templates Studio before 1.29.4."
tags: ["agent-and-tool-security", "infrastructure-and-supply-chain"]
---

# Claude Code Templates Studio Remote Code Execution

## Current Understanding

CVE-2026-73222 describes Claude Code Templates before 1.29.4 launching Claude Code Studio on all interfaces at port 3444 with permissive CORS and no authentication. The [August 11 topic news collector source](../../../raw/processed/2026-08-11/ai-security-wiki-topic-news-collector-2026-08-11T233115Z.json) records the CVE feed evidence and the [project changelog](https://github.com/davila7/claude-code-templates/blob/main/CHANGELOG.md), which says version 1.29.4 removed shell execution, constrained arguments, bound Studio to loopback, and restricted CORS.

The [August 12 leaf update watch source](../../../raw/processed/2026-08-12/ai-security-wiki-leaf-update-watch-20260813T000229Z.json) adds [NVD](https://nvd.nist.gov/vuln/detail/CVE-2026-73222) and [GitHub Advisory Database](https://github.com/davila7/claude-code-templates/security/advisories/GHSA-79wm-x847-7cvg) evidence for CVE-2026-73222 / GHSA-79wm-x847-7cvg. The watcher confirms unauthenticated OS command injection through the `--studio` server, wildcard CORS, `0.0.0.0` binding, shell execution, and fixed version 1.29.4.

Broad Claude Code Templates and [Claude Code](../../../upstream-ai-wiki/developer-tools/claude-code.md) workflow context belongs upstream. The local security boundary is the high-privilege local agent companion server: a developer tool that can spawn commands becomes a local control plane, so binding, authentication, CORS, shell execution, and argument validation are security requirements rather than setup details.

## Security Impact

- Threat: an attacker who reaches the Studio port or lures a developer to a malicious page can trigger OS command execution with developer privileges.
- Affected boundary: `claude-code-templates` before 1.29.4, Claude Code Studio launched with `--studio`, port 3444, CORS, request fields passed to `child_process.spawn`, shell execution, and developer workstation credentials.
- Exploit or incident status: public vulnerability-database and GitHub advisory update with project changelog patch evidence; no confirmed in-the-wild exploitation in the collected source.
- Mitigation state: update to 1.29.4 or later; ensure local agent tool servers bind to loopback, require authentication when reachable across origins, and avoid shell execution for request-controlled fields.
- Confidence: high for vulnerability content and fix direction because the changelog matches the CVE summary; in-window qualification relies on the August 11 CVE publication/update.
- Residual risk: other local agent companion tools may expose command surfaces with browser-reachable CORS or network binding defaults.

## Control Implications

- Bind local agent services to loopback unless remote access is explicitly required and authenticated.
- Deny permissive CORS for command-capable developer services.
- Avoid `shell` execution and validate every request-controlled argument before spawning child processes.
- Treat browser-to-localhost request paths as externally triggerable unless protected by origin, token, and user-intent checks.
- Inventory local agent tool servers that inherit developer credentials or shell access.

## Authoritative Sources

- [August 11 topic news collector source](../../../raw/processed/2026-08-11/ai-security-wiki-topic-news-collector-2026-08-11T233115Z.json)
- [August 12 leaf update watch source](../../../raw/processed/2026-08-12/ai-security-wiki-leaf-update-watch-20260813T000229Z.json)
- Claude Code Templates changelog: https://github.com/davila7/claude-code-templates/blob/main/CHANGELOG.md
- GitHub advisory GHSA-79wm-x847-7cvg: https://github.com/davila7/claude-code-templates/security/advisories/GHSA-79wm-x847-7cvg
- NVD CVE-2026-73222 record: https://nvd.nist.gov/vuln/detail/CVE-2026-73222
- Tenable CVE feed: https://www.tenable.com/cve
- Red Hot Cyber vulnerability listing: https://www.redhotcyber.com/en/latest-critical-vulnerabilities/

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [local agent execution and processing boundaries](local-agent-execution-and-processing-boundaries.md)
- [AI development workstation containment](../infrastructure-and-supply-chain/ai-development-workstation-containment.md)
- Upstream AI wiki owns broad [Claude Code](../../../upstream-ai-wiki/developer-tools/claude-code.md) context, and the upstream AI development wiki owns general local tool setup practice.

## Open Questions

- Which source should be treated as canonical if NVD, GHSA, and project changelog metadata diverge on affected-version or fix details?
- Are there published indicators of exploitation or only advisory and patch evidence?

## Maintenance Notes

- Created on 2026-08-11 from the [August 11 topic collector](../../../raw/processed/2026-08-11/ai-security-wiki-topic-news-collector-2026-08-11T233115Z.json) after routing broad Claude Code Templates context upstream.
- Updated on 2026-08-12 from the [August 12 leaf watcher](../../../raw/processed/2026-08-12/ai-security-wiki-leaf-update-watch-20260813T000229Z.json) with NVD, GHSA, CORS, binding, and fixed-version evidence.
