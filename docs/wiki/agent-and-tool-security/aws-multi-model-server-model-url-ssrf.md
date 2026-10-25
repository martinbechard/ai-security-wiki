---
type: "Topic"
title: "AWS Multi Model Server Model URL SSRF"
description: "Security analysis for CVE-2026-115813 model download URL SSRF."
tags: ["agent-and-tool-security", "infrastructure-and-supply-chain"]
---

# AWS Multi Model Server Model URL SSRF

## Current Understanding

The [October 23 collector](../../../raw/processed/2026-10-23/ai-security-wiki-topic-news-collector-2026-10-23T233200Z.json) records [CVE-2026-115813](https://cveawg.mitre.org/api/cve/CVE-2026-115813) / [GHSA-g55x-6xv3-fpjr](https://github.com/advisories/GHSA-g55x-6xv3-fpjr): AWS Multi Model Server 1.1.11 and earlier fetches attacker-crafted model download URLs. This page owns the model-download egress boundary, separate from archive extraction.

## Security Impact

- Threat: a model URL drives server-side requests to internal services.
- Affected boundary: AWS Multi Model Server 1.1.11 and earlier, model URL input, and runtime egress.
- Exploit or incident status: public GitHub advisory; no local incident is recorded.
- Mitigation state: end of life with no fix; migrate and restrict egress while retiring the service.
- Confidence: high for mechanism, version, and no-fix state.
- Residual risk: replacement servers still need destination validation and egress policy.

## Authoritative Sources

- [October 23 collector](../../../raw/processed/2026-10-23/ai-security-wiki-topic-news-collector-2026-10-23T233200Z.json)
- [October 24 leaf watch](../../../raw/processed/2026-10-24/ai-security-wiki-leaf-update-watch-20261025T000016Z.json)
- [GHSA-g55x-6xv3-fpjr](https://github.com/advisories/GHSA-g55x-6xv3-fpjr)
- [AWS bulletin](https://aws.amazon.com/security/security-bulletins/2026-148-aws)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [AWS Multi Model Server archive traversal](../infrastructure-and-supply-chain/aws-multi-model-server-archive-traversal.md)

## Open Questions

- Which egress logs show whether model URLs reached private services?

## Maintenance Notes

- Updated on 2026-10-24 from the [October 24 leaf watch](../../../raw/processed/2026-10-24/ai-security-wiki-leaf-update-watch-20261025T000016Z.json), which corroborated the existing boundary without changing current understanding or adding a duplicate digest item.
- Created on 2026-10-23 as the model-download member of a two-boundary family.
