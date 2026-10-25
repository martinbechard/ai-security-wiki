---
type: "Topic"
title: "PraisonAI Streaming Approval Policy Parity"
description: "Security analysis for CVE-2026-56838 recipe streaming approval bypass."
tags: ["agent-and-tool-security"]
---

# PraisonAI Streaming Approval Policy Parity

## Current Understanding

[CVE-2026-56838](https://nvd.nist.gov/vuln/detail/CVE-2026-56838), captured by the [October 24 collector](../../../raw/processed/2026-10-24/ai-security-wiki-topic-news-collector-2026-10-24T232700Z.json), reports that `recipe.run_stream` could skip the dangerous-tool approval path. This page owns policy parity across normal and streaming invocations.

## Security Impact

- Threat: a streaming invocation bypasses the approval control applied to an equivalent action.
- Affected boundary: PraisonAI 4.5.87 before 4.6.59.
- Exploit or incident status: public disclosure; no local incident is recorded.
- Mitigation state: upgrade to 4.6.59 and test every invocation path against the same approval policy.
- Confidence: high for disclosed scope and fixed version.
- Residual risk: alternate orchestration APIs can silently create privileged-policy drift.

## Authoritative Sources

- [October 24 collector](../../../raw/processed/2026-10-24/ai-security-wiki-topic-news-collector-2026-10-24T232700Z.json)
- [CVE-2026-56838](https://nvd.nist.gov/vuln/detail/CVE-2026-56838)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)

## Open Questions

- Are all asynchronous and batch invocation paths subject to the same policy gate?

## Maintenance Notes

- Created on 2026-10-24 after verifier-required split from the original approval family.
