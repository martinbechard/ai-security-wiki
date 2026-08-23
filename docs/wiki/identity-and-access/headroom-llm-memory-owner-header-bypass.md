---
type: "Topic"
title: "Headroom LLM Memory Owner Header Bypass"
description: "Security analysis for CVE-2026-77776 Headroom LLM proxy trusting a client-supplied memory owner header."
tags: ["identity-and-access", "data-and-privacy"]
---

# Headroom LLM Memory Owner Header Bypass

## Current Understanding

The [August 22 topic news collector source](../../../raw/processed/2026-08-22/ai-security-wiki-topic-news-collector-2026-08-22T233049Z.json) records CVE-2026-77776 for Headroom's LLM proxy memory-owner handling. This page owns the local identity and memory-isolation boundary.

The [NVD record](https://nvd.nist.gov/vuln/detail/CVE-2026-77776), [CVE record](https://www.cve.org/CVERecord?id=CVE-2026-77776), and [OpenCVE record](https://app.opencve.io/cve/CVE-2026-77776) describe the proxy deriving the memory owner from `x-headroom-user-id` without binding it to the authenticated caller. A client could name another user's identifier and read or write that user's stored LLM memory. The collector notes conflicting public affected-version hints, so exact version scope remains open.

## Security Impact

- Threat: client-supplied memory owner headers can collapse cross-user memory isolation.
- Affected boundary: Headroom LLM proxy memory owner derivation from `x-headroom-user-id`.
- Exploit or incident status: public CVE and secondary advisory evidence; no local exploitation evidence is recorded.
- Mitigation state: bind memory owner to authenticated identity, reject caller-supplied owner headers unless independently authorized, and verify the exact fixed version from primary evidence.
- Confidence: high for the authorization boundary; medium for affected-version details because source snippets conflict.
- Residual risk: stored LLM memory can contain prompts, secrets, documents, and tool outputs, so cross-user memory access is both privacy and authorization risk.

## Authoritative Sources

- [August 22 topic news collector source](../../../raw/processed/2026-08-22/ai-security-wiki-topic-news-collector-2026-08-22T233049Z.json)
- [NVD CVE-2026-77776](https://nvd.nist.gov/vuln/detail/CVE-2026-77776)
- [CVE record CVE-2026-77776](https://www.cve.org/CVERecord?id=CVE-2026-77776)
- [OpenCVE CVE-2026-77776](https://app.opencve.io/cve/CVE-2026-77776)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [production agent identity and access controls](production-agent-identity-and-access-controls.md)
- [AI coding telemetry access controls](../data-and-privacy/ai-coding-telemetry-access-controls.md)

## Open Questions

- Which primary Headroom advisory or release note confirms the exact affected and fixed versions for CVE-2026-77776?

## Maintenance Notes

- Created on 2026-08-22 from the [August 22 topic news collector source](../../../raw/processed/2026-08-22/ai-security-wiki-topic-news-collector-2026-08-22T233049Z.json) as the memory-owner member of the Headroom advisory set.
