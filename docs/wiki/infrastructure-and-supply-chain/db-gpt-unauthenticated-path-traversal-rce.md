---
type: "Topic"
title: "DB-GPT Unauthenticated Path Traversal Remote Code Execution"
description: "Security analysis for CVE-2026-73034 in DB-GPT v0.8.1 file-upload handling."
tags: ["infrastructure-and-supply-chain", "agent-and-tool-security"]
---

# DB-GPT Unauthenticated Path Traversal Remote Code Execution

## Current Understanding

CVE-2026-73034 describes an unauthenticated path traversal in DB-GPT v0.8.1. The [August 11 topic news collector source](../../../raw/processed/2026-08-11/ai-security-wiki-topic-news-collector-2026-08-11T233115Z.json) records [NVD](https://nvd.nist.gov/vuln/detail/CVE-2026-73034) and [CVE.org](https://www.cve.org/CVERecord?id=CVE-2026-73034) evidence that a remote attacker can inject directory traversal sequences into the `user_id` HTTP header of a Python file-upload endpoint, write files outside the intended directory, and potentially reach code execution through Python startup hooks, cron directories, or agent scripts.

Broad DB-GPT framework or application context belongs upstream. The local security issue is that an AI application/runtime file-upload boundary can become an infrastructure and agent-execution boundary when arbitrary write reaches runtime hooks or scripts.

## Security Impact

- Threat: unauthenticated file-upload traversal can write attacker-controlled files outside the intended upload directory and potentially reach remote code execution.
- Affected boundary: DB-GPT v0.8.1, `user_id` HTTP header handling, Python upload paths, startup hooks, cron paths, agent scripts, and deployed AI runtime hosts.
- Exploit or incident status: public NVD and CVE record; no confirmed in-the-wild exploitation in the collected source.
- Mitigation state: patch status was not captured in the collector; deployments should treat DB-GPT v0.8.1 as affected and isolate or remove unauthenticated upload reachability until upstream fix details are verified.
- Confidence: high for vulnerability existence and affected version because NVD and CVE records are in-window; medium for mitigation state until DB-GPT issue or commit evidence is captured.
- Residual risk: AI runtime platforms often combine upload, notebook, agent-script, and plugin execution paths, increasing the impact of arbitrary file write.

## Control Implications

- Normalize and constrain user-controlled path components before file writes.
- Deny traversal sequences in headers, filenames, archive members, and metadata fields.
- Keep upload destinations outside executable Python startup, scheduled task, plugin, and agent-script paths.
- Require authentication and authorization for upload endpoints that can affect runtime state.
- Monitor AI application hosts for unexpected writes to startup hooks, cron paths, scripts, and plugin directories.

## Authoritative Sources

- [August 11 topic news collector source](../../../raw/processed/2026-08-11/ai-security-wiki-topic-news-collector-2026-08-11T233115Z.json)
- NVD CVE-2026-73034 record: https://nvd.nist.gov/vuln/detail/CVE-2026-73034
- CVE.org CVE-2026-73034 record: https://www.cve.org/CVERecord?id=CVE-2026-73034
- Red Hot Cyber vulnerability listing: https://www.redhotcyber.com/en/latest-critical-vulnerabilities/

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [agent tool filesystem path containment](agent-tool-filesystem-path-containment.md)
- [Network-AI AgentRuntime sandbox path traversal](network-ai-agentruntime-sandbox-path-traversal.md)
- Upstream AI wiki owns broad DB-GPT entity coverage when present.

## Open Questions

- Which DB-GPT commit, release, or advisory documents the fix for CVE-2026-73034?
- Which CVSS, CWE, and affected-version range should be retained after NVD enrichment stabilizes?

## Maintenance Notes

- Created on 2026-08-11 from the [August 11 topic collector](../../../raw/processed/2026-08-11/ai-security-wiki-topic-news-collector-2026-08-11T233115Z.json) after routing broad DB-GPT background upstream.
