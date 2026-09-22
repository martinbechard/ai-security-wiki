---
type: "Topic"
title: "Hatchet SNS Metadata SSRF"
description: "Security analysis for CVE-2026-61681 SSRF in Hatchet's SNS UnsubscribeConfirmation handler."
tags: ["infrastructure-and-supply-chain", "agent-and-tool-security"]
---

# Hatchet SNS Metadata SSRF

## Current Understanding

The [September 21 topic collector source](../../../raw/processed/2026-09-21/ai-security-wiki-topic-news-collector-2026-09-21T233156Z.json) records [CVE-2026-61681](https://cveawg.mitre.org/api/cve/CVE-2026-61681) for Hatchet before 0.91.1. Broad Hatchet product and durable-workflow context belongs upstream; this page owns the local SSRF and cloud-metadata boundary.

The [CVE record](https://cveawg.mitre.org/api/cve/CVE-2026-61681) describes an SNS `UnsubscribeConfirmation` handler that calls `http.Get()` on `payload.UnsubscribeURL` after signature verification even though the signature builder excludes `UnsubscribeURL`. An authenticated Hatchet tenant can replace that field in an otherwise valid AWS-signed message with an internal URL, reaching EC2 Instance Metadata Service, internal services, or internal HTTP APIs. Version 0.91.1 fixes the issue.

## Security Impact

- Threat: a tenant-authenticated integration path can become a server-side request primitive into metadata or internal service networks.
- Affected boundary: Hatchet before 0.91.1; SNS ingestor `UnsubscribeConfirmation` handling and unsigned URL coverage.
- Exploit or incident status: public CVE and GitHub advisory; no local exploitation evidence is recorded.
- Mitigation state: upgrade to 0.91.1 or later, verify every URL-bearing field that drives outbound requests, and enforce network egress controls for workflow infrastructure.
- Confidence: high because the CVE record, GitHub advisory, and patch reference agree on mechanism and fix.
- Residual risk: durable agent workflow systems often hold cloud credentials and task state, so integration callbacks need both signature coverage and destination allowlists.

## Authoritative Sources

- [September 21 topic collector source](../../../raw/processed/2026-09-21/ai-security-wiki-topic-news-collector-2026-09-21T233156Z.json)
- [CVE-2026-61681 JSON](https://cveawg.mitre.org/api/cve/CVE-2026-61681)
- [NVD CVE-2026-61681](https://nvd.nist.gov/vuln/detail/CVE-2026-61681)
- [GitHub advisory GHSA-fjwv-jf2v-j499](https://github.com/hatchet-dev/hatchet/security/advisories/GHSA-fjwv-jf2v-j499)
- [Hatchet patch commit](https://github.com/hatchet-dev/hatchet/commit/2d211bce16e5022afaf95780de82dc30e0bcba98)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [agent network egress controls](../agent-and-tool-security/agent-network-egress-controls.md)
- [Hatchet durable task event log disclosure](../data-and-privacy/hatchet-durable-task-event-log-disclosure.md)
- [Hatchet OAuth state reuse](../identity-and-access/hatchet-oauth-state-reuse.md)

## Open Questions

- No open wiki questions are recorded for this topic.

## Maintenance Notes

- Created on 2026-09-21 from the [September 21 topic collector source](../../../raw/processed/2026-09-21/ai-security-wiki-topic-news-collector-2026-09-21T233156Z.json); split from the Hatchet advisory cluster because SSRF and metadata exposure have a separate mitigation boundary from tenant event disclosure.
