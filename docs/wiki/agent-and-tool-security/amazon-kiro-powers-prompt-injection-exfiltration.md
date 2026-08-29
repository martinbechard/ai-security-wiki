---
type: "Topic"
title: "Amazon Kiro Powers prompt injection exfiltration"
description: "Security analysis for the Amazon Kiro Powers prompt-injection data-exfiltration report."
tags: ["agent-and-tool-security", "data-and-privacy"]
---

# Amazon Kiro Powers prompt injection exfiltration

## Current Understanding

The [August 27 topic collector source](../../../raw/processed/2026-08-27/ai-security-wiki-topic-news-collector-2026-08-27T233104Z.json) records [Mindgard](https://mindgard.ai/blog/amazon-kiro-data-exfiltration) and [The Hacker News](https://thehackernews.com/2026/08/amazon-kiro-prompt-injection-can.html) reporting that attacker-controlled repository content could steer Amazon Kiro IDE through Kiro Powers into local file reads and outbound exfiltration. Broad Amazon Kiro product coverage belongs upstream in [ai-wiki](../../../upstream-ai-wiki/topic-index.md) or [ai-dev-wiki](../../../upstream-ai-dev-wiki/topic-index.md); this page owns the repository-content, extension-bundle, file-read, MCP configuration, and network-egress security boundary.

## Security Impact

- Threat: repository-controlled instructions can cause an IDE agent to read local files and send them to an attacker endpoint through Kiro Powers
- Affected boundary: Amazon Kiro IDE 0.7.45 on Windows; reported fixed in 0.8.140; no CVE recorded in the source
- Exploit or incident status: public advisory evidence; no local in-the-wild exploitation evidence is recorded.
- Mitigation state: Upgrade to Kiro IDE 0.8.140 or later where applicable; treat repository names, files, extension bundles, and MCP configuration as untrusted context and require explicit network egress controls.
- Confidence: high for advisory existence and affected boundary; medium for remediation details when the primary advisory does not name a fixed release.
- Residual risk: model- or browser-reachable helper surfaces can convert ordinary tool arguments into internal data access, credential use, or host execution when final authorization is missing.

## Authoritative Sources

- [August 29 leaf update watch source](../../../raw/processed/2026-08-29/ai-security-wiki-leaf-update-watch-20260829T000405Z.json)
- [August 27 topic collector source](../../../raw/processed/2026-08-27/ai-security-wiki-topic-news-collector-2026-08-27T233104Z.json)
- [Mindgard disclosure](https://mindgard.ai/blog/amazon-kiro-data-exfiltration)
- [The Hacker News report](https://thehackernews.com/2026/08/amazon-kiro-prompt-injection-can.html)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](../agent-and-tool-security/index.md)
- [infrastructure and supply chain](../infrastructure-and-supply-chain/index.md)
- [identity and access](../identity-and-access/index.md)

## Open Questions

- No open wiki questions are recorded for this topic.

## Maintenance Notes

- Updated on 2026-08-29 with [August 29 watcher](../../../raw/processed/2026-08-29/ai-security-wiki-leaf-update-watch-20260829T000405Z.json) provenance for the same durable advisory boundary.
- Created on 2026-08-28 from the [August 27 topic collector](../../../raw/processed/2026-08-27/ai-security-wiki-topic-news-collector-2026-08-27T233104Z.json) as a focused repository-content and Kiro Powers exfiltration leaf after routing broad Amazon Kiro context upstream; next check whether Amazon publishes a CVE or additional platform/version boundaries.
