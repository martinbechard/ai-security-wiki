---
type: "Topic"
title: "AI Agent Sandbox Escape Host File Access"
description: "Security analysis for local agent sandbox escapes that reach host files through VM, mount, or kernel boundaries."
---

# AI Agent Sandbox Escape Host File Access

## Current Understanding

The [July 25 topic news collector source](../../../raw/processed/2026-07-25/ai-security-wiki-topic-news-collector-2026-07-25T193052-0400.json) records [Secure.com reporting](https://www.secure.com/news/researchers-escape-ai-agent-sandbox-and-reach-the-host-mac) this research chain:

1. A single shared folder was connected to a local AI-agent session.
2. The path crossed a Linux VM boundary.
3. A Linux kernel flaw identified as CVE-2026-46331 was used as the pedit COW primitive.
4. Host Mac file access was reached.

The reported outcomes were reachable SSH keys and cloud credentials, plus a product default change toward cloud-based agent work.

The collector marks confidence as medium and asks for primary CVE or vendor corroboration before treating the full chain as confirmed. The local durable lesson is therefore narrower: AI-agent sandboxes need explicit host-mount minimization, credential separation, kernel patch management, and proof that a shared workspace cannot become a host file browser.

The [July 29 leaf update watch source](../../../raw/processed/2026-07-29/ai-security-wiki-leaf-update-watch-2026-07-29T200338-0400.json) repeats Secure.com reporting as demonstrated-research evidence and keeps primary CVE/vendor corroboration as follow-up. This does not change the confidence level; it reinforces that host filesystem mounts and credential-bearing paths must be modeled as reachable when a local agent sandbox combines a shared folder, VM boundary, and kernel vulnerability.

## Security Impact

- Threat: a local agent sandbox escape converts a narrow folder grant into broader host file and credential access.
- Affected boundary: local AI-agent sandbox using a Linux VM, shared host mount, Linux kernels v5.18 through v7.1-rc6 for the referenced pedit COW primitive, and host macOS file access.
- Exploit or incident status: public security research report; primary CVE, kernel, or vendor status was not captured in the [collector source](../../../raw/processed/2026-07-25/ai-security-wiki-topic-news-collector-2026-07-25T193052-0400.json).
- Mitigation state: keep local sandboxes patched, minimize shared mounts, isolate SSH keys and cloud credentials from agent-readable paths, and prefer cloud execution only when its isolation and data-handling boundary is explicitly acceptable.
- Confidence: medium for the reported chain and visible date; lower for CVE/vendor status until primary corroboration is captured.
- Residual risk: cloud-default execution may reduce host-file exposure while creating separate data-residency, credential, and provider-access questions.

## Authoritative Sources

- [July 25 topic news collector source](../../../raw/processed/2026-07-25/ai-security-wiki-topic-news-collector-2026-07-25T193052-0400.json)
- [July 29 leaf update watch source](../../../raw/processed/2026-07-29/ai-security-wiki-leaf-update-watch-2026-07-29T200338-0400.json)
- Secure.com research report: https://www.secure.com/news/researchers-escape-ai-agent-sandbox-and-reach-the-host-mac

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [agent tool filesystem path containment](agent-tool-filesystem-path-containment.md)
- [data and privacy](../data-and-privacy/index.md)
- [incident response](../incident-response/index.md)
- Upstream AI development wiki owns general local-agent runtime workflow guidance.

## Open Questions

- Which primary CVE, Linux kernel, or vendor record confirms CVE-2026-46331 details and affected versions?
- Which product boundary changed to default local agent work to the cloud, and what data-handling controls apply there?

## Maintenance Notes

- Added from the [July 25 topic news collector source](../../../raw/processed/2026-07-25/ai-security-wiki-topic-news-collector-2026-07-25T193052-0400.json); enriched from the [July 29 leaf watcher](../../../raw/processed/2026-07-29/ai-security-wiki-leaf-update-watch-2026-07-29T200338-0400.json). Keep the page at medium confidence until primary corroboration is captured.
