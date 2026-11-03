---
type: Topic
title: Network-AI A2A Task API Missing Authentication
description: A no-secret Network-AI A2A deployment can expose delegated task lifecycle operations without authentication.
tags: [identity-and-access]
---

# Network-AI A2A Task API Missing Authentication

## Current Understanding

[CVE-2026-120314](https://nvd.nist.gov/vuln/detail/CVE-2026-120314) affects network-ai 5.14.0 through 5.15.4 when `A2AServer` has no configured secret. Unauthenticated JSON-RPC callers can send, read, or cancel A2A tasks. Delegated-agent task APIs must fail closed when identity configuration is absent and authorize every lifecycle operation.

No exploitation is reported. Confidence is medium: the NVD record is in-window, but the raw evidence does not establish whether the no-secret behavior was an intentional deployment mode or a patched fail-open default.

- Mitigation state: require an A2A secret and enforce per-operation authorization; fixed-release evidence is not yet established.
- Residual risk: exposed task endpoints permit unauthorized state changes while deployments accept a missing secret.

## Authoritative Sources

- [November 3 collector source](../../../raw/processed/2026-11-03/ai-security-wiki-topic-news-collector-2026-11-03T002828Z.json)
- [NVD CVE-2026-120314](https://nvd.nist.gov/vuln/detail/CVE-2026-120314)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [Network-AI ApprovalInbox authorization bypass](../agent-and-tool-security/network-ai-approval-inbox-authorization-bypass.md)

## Open Questions

- Is a configured secret now mandatory, and which release makes this task endpoint fail closed?

## Maintenance Notes

- Created on 2026-11-03. A2A protocol and product background remain upstream-owned; this page covers the local delegated-authority boundary.
