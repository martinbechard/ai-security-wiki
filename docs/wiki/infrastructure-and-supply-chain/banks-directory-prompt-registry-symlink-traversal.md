---
type: "Topic"
title: "Banks Directory Prompt Registry Symlink Traversal"
description: "Security analysis for CVE-2026-107716 symlink traversal and file disclosure or overwrite in Banks DirectoryPromptRegistry."
tags: ["infrastructure-and-supply-chain", "model-and-prompt-security"]
---

# Banks Directory Prompt Registry Symlink Traversal

## Current Understanding

The [October 8 topic collector source](../../../raw/processed/2026-10-08/ai-security-wiki-topic-news-collector-2026-10-08T233132Z.json) records [CVE-2026-107716](https://cveawg.mitre.org/api/cve/CVE-2026-107716) for the Banks prompt template package. Broad prompt-template package context belongs upstream; this page owns the local prompt-registry filesystem boundary.

Banks before 2.5.1 can follow symlinks in `DirectoryPromptRegistry` for `index.json` or `.jinja` files outside the intended registry root. When an attacker can influence a prompt directory, the advisory describes arbitrary file disclosure or overwrite risk.

## Security Impact

- Threat: untrusted prompt registries can escape their directory and read or overwrite files that prompt-loading code should not touch.
- Affected boundary: Banks before 2.5.1, `DirectoryPromptRegistry`, `index.json`, `.jinja` files, symlink resolution, and prompt-registry root containment.
- Exploit or incident status: public CVE Services record and GitHub advisory; no confirmed exploitation incident is recorded locally.
- Mitigation state: update to Banks 2.5.1 or later and require canonical path containment before reading or writing prompt registry files.
- Confidence: high for affected range and fixed version; medium for write impact until registry write paths are inspected.
- Residual risk: prompt registries are supply-chain artifacts and need the same path-containment treatment as code, model, and tool manifests.

## Authoritative Sources

- [October 8 topic collector source](../../../raw/processed/2026-10-08/ai-security-wiki-topic-news-collector-2026-10-08T233132Z.json)
- [CVE-2026-107716 record](https://cveawg.mitre.org/api/cve/CVE-2026-107716)
- [GHSA-556j-vv39-8rqv](https://github.com/masci/banks/security/advisories/GHSA-556j-vv39-8rqv)
- [Banks 2.5.1 release](https://github.com/masci/banks/releases/tag/v2.5.1)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [Banks chat message role injection](../model-and-prompt-security/banks-chat-message-role-injection.md)
- [agent build and dependency execution boundaries](agent-build-and-dependency-execution-boundaries.md)
- Upstream AI wiki owns broad prompt-template package coverage.

## Open Questions

- Does Banks 2.5.1 reject symlinks, resolve and constrain them, or only patch selected registry paths?

## Maintenance Notes

- Created on 2026-10-09 from the [October 8 topic collector source](../../../raw/processed/2026-10-08/ai-security-wiki-topic-news-collector-2026-10-08T233132Z.json) as a prompt-registry supply-chain leaf.
