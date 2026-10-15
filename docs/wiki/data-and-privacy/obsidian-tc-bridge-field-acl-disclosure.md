---
type: "Topic"
title: "obsidian-tc Bridge-Field ACL Disclosure"
description: "Security analysis for CVE-2026-77362 ACL-protected bridge-field disclosure in obsidian-tc."
tags: ["data-and-privacy", "agent-and-tool-security"]
---

# obsidian-tc Bridge-Field ACL Disclosure

## Current Understanding

[The October 14 collector](../../../raw/processed/2026-10-14/ai-security-wiki-topic-news-collector-2026-10-14T233300Z.json) records [CVE-2026-77362](https://nvd.nist.gov/vuln/detail/CVE-2026-77362) for obsidian-tc before 1.3.1. Broad Obsidian context belongs upstream; this page owns disclosure through bridge-tool response fields.

## Security Impact

- Threat: bridge tools can return ACL-protected derived fields, template paths, or function bodies.
- Affected boundary: obsidian-tc before 1.3.1 and bridge-tool response serialization.
- Exploit or incident status: public CVE; no confirmed exploitation incident is recorded locally.
- Mitigation state: version 1.3.1 filters relevant returned fields.
- Confidence and residual risk: high for the stated boundary; response shaping is part of authorization for agent tools.

## Control Implications

- Apply authorization to every derived and metadata field, not only primary objects.
- Test tool outputs for field-level leakage across caller scopes.

## Authoritative Sources

- [October 14 topic collector source](../../../raw/processed/2026-10-14/ai-security-wiki-topic-news-collector-2026-10-14T233300Z.json)
- [NVD CVE-2026-77362](https://nvd.nist.gov/vuln/detail/CVE-2026-77362)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [data and privacy](index.md)
- [obsidian-tc resolved-path ACL bypass](../agent-and-tool-security/obsidian-tc-resolved-path-acl-bypass.md)

## Open Questions

- Which bridge-tool fields are covered by the 1.3.1 regression suite?

## Maintenance Notes

- Created on 2026-10-14 from the October 14 collector.
