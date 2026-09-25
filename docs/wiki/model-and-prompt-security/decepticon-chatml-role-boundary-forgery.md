---
type: "Topic"
title: "Decepticon ChatML Role Boundary Forgery"
description: "Security analysis for CVE-2026-61732, where Decepticon web-crawl output could inject ChatML role-boundary literals into autonomous red-team agent execution."
tags: ["model-and-prompt-security", "agent-and-tool-security"]
---

# Decepticon ChatML Role Boundary Forgery

## Current Understanding

The [September 24 topic collector source](../../../raw/processed/2026-09-24/ai-security-wiki-topic-news-collector-2026-09-24T233211Z.json) records [CVE-2026-61732](https://cveawg.mitre.org/api/cve/CVE-2026-61732) for BitterSecurity Decepticon and decepticon-core before 1.1.17. Broad Decepticon product or framework context belongs upstream; this page owns the local prompt/content boundary where retrieved web content can forge operator-role messages.

Decepticon composed web-crawl output into LLM messages without neutralizing ChatML special-token literals. For providers that parse those literals into role-boundary tokens, attacker-controlled page content could create a new operator turn and influence autonomous command execution inside the red-team agent's Kali sandbox.

## Security Impact

- Threat: attacker-hosted web content can cross from retrieval data into forged operator instructions for an autonomous security agent.
- Affected boundary: BitterSecurity Decepticon and decepticon-core before 1.1.17, ChatML-style providers including vLLM, SGLang, Ollama, LM Studio, and text-generation-webui, and command execution inside the agent sandbox.
- Exploit or incident status: public CVE, NVD, GitHub advisory, and patch commit evidence; no local in-the-wild exploitation evidence is recorded.
- Mitigation state: upgrade to 1.1.17 or later, escape or structurally encode retrieved content, and verify provider-specific special-token handling before passing web-crawl text into command-capable agents.
- Confidence: high for the vulnerable versions and ChatML boundary from advisory and patch evidence; medium for provider-specific exploitability across model runtimes.
- Residual risk: red-team agents must preserve role boundaries even when the content source is intentionally adversarial.

## Authoritative Sources

- [September 24 topic collector source](../../../raw/processed/2026-09-24/ai-security-wiki-topic-news-collector-2026-09-24T233211Z.json)
- [CVE-2026-61732 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-61732)
- [NVD CVE-2026-61732](https://nvd.nist.gov/vuln/detail/CVE-2026-61732)
- [GHSA-g5f9-3xfg-p9mf](https://github.com/BitterSecurity/Decepticon/security/advisories/GHSA-g5f9-3xfg-p9mf)
- [Decepticon patch commit](https://github.com/BitterSecurity/Decepticon/commit/79ee2aaf22f4c36a5b1968f6ca3f8086b6e35b67)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [model and prompt security](index.md)
- [agent and tool security](../agent-and-tool-security/index.md)
- [ASCII smuggling AI ingestion normalization](ascii-smuggling-ai-ingestion-normalization.md)
- [LaVague indirect prompt injection RCE](lavague-indirect-prompt-injection-rce.md)

## Open Questions

- Which configured model providers parse the literal ChatML tokens into role boundaries in affected Decepticon deployments?

## Maintenance Notes

- Created on 2026-09-25 from the [September 24 topic collector source](../../../raw/processed/2026-09-24/ai-security-wiki-topic-news-collector-2026-09-24T233211Z.json); maintain this as a prompt-boundary leaf, not a general red-team-agent product page.
