---
type: "Topic"
title: "astron-agent workflow ownership bypass"
description: "Security analysis for CVE-2026-82475 iFlytek astron-agent workflow copy ownership validation failure."
tags: ["identity-and-access", "agent-and-tool-security", "data-and-privacy"]
---

# astron-agent workflow ownership bypass

## Current Understanding

The [August 29 topic collector source](../../../raw/processed/2026-08-29/ai-security-wiki-topic-news-collector-2026-08-29T233233Z.json) records [CVE-2026-82475](https://nvd.nist.gov/vuln/detail/CVE-2026-82475) for iFlytek astron-agent through 1.1.1. Broad iFlytek and astron-agent product coverage belongs upstream if it becomes durable; this page owns the local tenant workflow ownership boundary for an AI agent control plane.

The affected `copyFlow` path is an authenticated authorization failure rather than unauthenticated RCE. According to the collector's NVD-backed summary and upstream references, an authenticated attacker can enumerate workflow identifiers and copy or overwrite workflows they do not own, exposing workflow definitions and potentially altering another tenant's agent orchestration.

## Security Impact

- Threat: cross-tenant workflow copy or overwrite can disclose agent definitions, tool orchestration, prompts, and configuration, and can tamper with another user's automation path.
- Affected boundary: iFlytek astron-agent through 1.1.1 workflow ownership checks around `copyFlow`.
- Exploit or incident status: public NVD and [VulnCheck evidence](https://www.vulncheck.com/advisories/iflytek-astron-agent-through-1.1.1-workflow-hijacking-via-missing-ownership-check) with upstream code and issue references; no local in-the-wild exploitation evidence is recorded.
- Mitigation state: exact fixed release is not yet confirmed locally; control expectation is object-owner validation before workflow read, copy, or overwrite.
- Confidence: high for advisory existence and ownership-boundary description; medium for remediation status.
- Residual risk: agent workflow definitions can carry delegated action and secret-adjacent configuration, so treating them as ordinary documents understates control-plane risk.

## Authoritative Sources

- [August 29 topic collector source](../../../raw/processed/2026-08-29/ai-security-wiki-topic-news-collector-2026-08-29T233233Z.json)
- [NVD CVE-2026-82475](https://nvd.nist.gov/vuln/detail/CVE-2026-82475)
- [VulnCheck advisory](https://www.vulncheck.com/advisories/iflytek-astron-agent-through-1.1.1-workflow-hijacking-via-missing-ownership-check)
- [Upstream issue 1590](https://github.com/iflytek/astron-agent/issues/1590)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [Kibana AI Assistant conversation ownership bypass](kibana-ai-assistant-conversation-ownership-bypass.md)
- [VoltAgent memory ownership bypass](voltagent-memory-ownership-bypass.md)
- [downstream agent authorization context](downstream-agent-authorization-context.md)

## Open Questions

- Which astron-agent release first binds workflow copy and overwrite operations to the authenticated workflow owner?

## Maintenance Notes

- Created on 2026-08-30 from the [August 29 topic collector](../../../raw/processed/2026-08-29/ai-security-wiki-topic-news-collector-2026-08-29T233233Z.json) as an agent-control-plane authorization leaf.
