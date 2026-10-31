---
type: "Topic"
title: "praktor Telegram Upload Persistent Agent Instruction Injection"
description: "Security analysis for CVE-2026-62331 durable agent-context overwrite."
tags: ["model-and-prompt-security", "agent-and-tool-security"]
---

# praktor Telegram Upload Persistent Agent Instruction Injection

## Current Understanding

The [October 30 collector](../../../raw/processed/2026-10-30/ai-security-wiki-topic-news-collector-2026-10-30T232632Z.json) records [CVE-2026-62331](https://nvd.nist.gov/vuln/detail/CVE-2026-62331): praktor before 0.9.1 joins Telegram-controlled filenames into its persistent agent workspace; unrestricted senders can overwrite `CLAUDE.md`, instructions, skills, hooks, or configuration for later runs.

## Security Impact

- Threat: file traversal becomes stored instruction injection and durable agent-control compromise.
- Affected boundary: praktor before 0.9.1, Telegram uploads, and persistent agent workspace files.
- Exploit or incident status: public CVE; no confirmed exploitation incident is recorded locally.
- Mitigation state: upgrade to 0.9.1, restrict senders, and inspect durable instruction and hook files.
- Confidence and residual risk: high for the boundary; persistent context surfaces amplify one upload into later agent actions.

## Authoritative Sources

- [October 30 collector](../../../raw/processed/2026-10-30/ai-security-wiki-topic-news-collector-2026-10-30T232632Z.json)
- [NVD CVE-2026-62331](https://nvd.nist.gov/vuln/detail/CVE-2026-62331)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [model and prompt security](index.md)

## Open Questions

- Does upgrade also repair existing attacker-written context files?

## Maintenance Notes

- Created on 2026-10-30 from NVD-backed collector evidence.
