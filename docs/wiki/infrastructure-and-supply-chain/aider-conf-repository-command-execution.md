---
type: "Topic"
title: "aider Conf Repository Command Execution"
description: "Security analysis for CVE-2026-85674 repository-supplied command execution through .aider.conf.yml."
tags: ["infrastructure-and-supply-chain", "agent-and-tool-security"]
---

# aider Conf Repository Command Execution

## Current Understanding

The [September 4 topic collector source](../../../raw/processed/2026-09-04/ai-security-wiki-topic-news-collector-2026-09-04T233156Z.json) records CVE-2026-85674 for aider 0.86.2. Broad aider coding-agent usage belongs in ai-dev-wiki or ai-wiki; this page owns repository-supplied command execution and approval-boundary risk.

[CVE-2026-85674](https://cveawg.mitre.org/api/cve/CVE-2026-85674) and [NVD](https://nvd.nist.gov/vuln/detail/CVE-2026-85674) describe automatic loading of `.aider.conf.yml` from a repository root. A crafted repository can set `test-cmd` or `lint-cmd` values that aider runs through a shell without user confirmation, LLM interaction, or an API key.

## Security Impact

- Threat: opening or running an agent in an untrusted repository can execute repository-supplied shell commands.
- Affected boundary: aider 0.86.2 repository configuration and test/lint command execution.
- Exploit or incident status: public CVE; no local exploitation evidence is recorded.
- Mitigation state: require trust before loading project config, show command provenance, and approval-gate repository-supplied shell commands.
- Confidence: high for affected behavior from direct CVE evidence.
- Residual risk: test and lint labels can make execution look routine even when the command body came from untrusted repository content.

## Authoritative Sources

- [September 4 topic collector source](../../../raw/processed/2026-09-04/ai-security-wiki-topic-news-collector-2026-09-04T233156Z.json)
- [CVE-2026-85674](https://cveawg.mitre.org/api/cve/CVE-2026-85674)
- [NVD CVE-2026-85674](https://nvd.nist.gov/vuln/detail/CVE-2026-85674)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [agent build and dependency execution boundaries](agent-build-and-dependency-execution-boundaries.md)
- [coding agent command approval boundaries](../agent-and-tool-security/coding-agent-command-approval-boundaries.md)

## Open Questions

- Which aider release changes `.aider.conf.yml` trust or prompts before executing repository-supplied commands?

## Maintenance Notes

- Created on 2026-09-04 from the [September 4 topic collector source](../../../raw/processed/2026-09-04/ai-security-wiki-topic-news-collector-2026-09-04T233156Z.json).
