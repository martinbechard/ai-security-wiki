---
type: "Topic"
title: "JetBrains Rider AI Assistant Skill Auto Update"
description: "Security analysis for CVE-2026-100265 third-party AI Assistant skill auto-update without user confirmation in JetBrains Rider."
tags: ["infrastructure-and-supply-chain", "agent-and-tool-security"]
---

# JetBrains Rider AI Assistant Skill Auto Update

## Current Understanding

The [October 1 topic collector source](../../../raw/processed/2026-10-01/ai-security-wiki-topic-news-collector-2026-10-01T233213Z.json) records [CVE-2026-100265](https://cveawg.mitre.org/api/cve/CVE-2026-100265) for JetBrains Rider before 2026.2.1 allowing AI Assistant to auto-update third-party skills without user confirmation. Broad IDE and AI Assistant product background belongs upstream; this page owns the local skill supply-chain and approval boundary.

Assistant skills can change tool behavior, prompts, and execution affordances inside developer environments. Silent third-party skill updates weaken provenance, review, and consent controls even when the IDE itself is trusted.

## Security Impact

- Threat: third-party AI Assistant skills can change without an explicit user confirmation step.
- Affected boundary: JetBrains Rider before 2026.2.1; AI Assistant third-party skill update path.
- Exploit or incident status: public CVE record; no confirmed exploitation is recorded in the source.
- Mitigation state: update Rider to 2026.2.1 or later and treat third-party skill updates as governed supply-chain changes.
- Confidence: medium for CVE text and affected version; primary JetBrains advisory detail remains to be reconciled.
- Residual risk: agent or assistant skill ecosystems need signed manifests, approval evidence, and visible update provenance because small skill changes can alter delegated development behavior.

## Authoritative Sources

- [October 1 topic collector source](../../../raw/processed/2026-10-01/ai-security-wiki-topic-news-collector-2026-10-01T233213Z.json)
- [CVE-2026-100265 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-100265)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [agent and tool security](../agent-and-tool-security/index.md)
- [Plugin4Shell coding-agent plugin version bypass](../agent-and-tool-security/plugin4shell-coding-agent-plugin-version-bypass.md)
- Upstream AI development wiki owns general portable plugin and skill governance practice.

## Open Questions

- Which JetBrains advisory or release note documents the confirmation behavior added in Rider 2026.2.1?

## Maintenance Notes

- Created on 2026-10-02 from the [October 1 topic collector source](../../../raw/processed/2026-10-01/ai-security-wiki-topic-news-collector-2026-10-01T233213Z.json).
