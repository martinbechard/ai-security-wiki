---
type: "Topic"
title: "Xinference Custom-Model Path Traversal"
description: "Security analysis for CVE-2026-112051 unauthenticated Windows path traversal in Xinference model registration."
tags: ["infrastructure-and-supply-chain"]
---

# Xinference Custom-Model Path Traversal

## Current Understanding

[CVE-2026-112051](https://nvd.nist.gov/vuln/detail/CVE-2026-112051) reports that Xinference through 4.0.1 accepts Windows backslash traversal in custom model names. The [October 19 collector](../../../raw/processed/2026-10-19/ai-security-wiki-topic-news-collector-2026-10-19T140139-0400.json) records that an unauthenticated caller can persist a model that writes or deletes JSON configuration or data files reachable by the service process.

## Security Impact

- Threat: unauthenticated model registration can change service configuration or data.
- Affected boundary: Windows custom-model registration through Xinference 4.0.1.
- Exploit or incident status: public CVE; active exploitation is not identified.
- Mitigation state: the collector links a [remediation commit](https://github.com/xorbitsai/inference/commit/beddc97ac211f8414597fe8479493be0603f7c84), but a first fixed release is not identified.
- Confidence: high for the control-plane path traversal; medium for the release boundary.
- Residual risk: model-management APIs should require authentication and canonical path containment even after a patch.

## Authoritative Sources

- [October 19 collector source](../../../raw/processed/2026-10-19/ai-security-wiki-topic-news-collector-2026-10-19T140139-0400.json)
- [CVE-2026-112051](https://nvd.nist.gov/vuln/detail/CVE-2026-112051)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)

## Open Questions

- Which released Xinference version includes the linked remediation?

## Maintenance Notes

- Created on 2026-10-20 from the October 19 collector.
