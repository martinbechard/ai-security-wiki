---
type: "Topic"
title: "Gitingest host-prefix token disclosure"
description: "Security analysis for CVE-2026-82289 Gitingest host-prefix validation and GitHub token disclosure."
tags: ["identity-and-access", "infrastructure-and-supply-chain"]
---

# Gitingest host-prefix token disclosure

## Current Understanding

The [August 28 topic collector source](../../../raw/processed/2026-08-28/ai-security-wiki-topic-news-collector-2026-08-28T233139Z.json) records [CVE-2026-82289](https://nvd.nist.gov/vuln/detail/CVE-2026-82289) for Gitingest through 0.3.1. Broad code-ingestion and context-building practice belongs upstream; this page owns the local credential-forwarding and trusted-host validation boundary.

## Security Impact

- Threat: URL validation accepts hostnames with `git.`, `gitlab.`, or `github.` prefixes instead of enforcing known hosts, allowing crafted destinations to receive GitHub personal access tokens through HTTP basic credentials.
- Affected boundary: Gitingest through 0.3.1 repository fetch and host validation.
- Exploit or incident status: GitHub Advisory Database and NVD evidence; no local in-the-wild exploitation evidence is recorded.
- Mitigation state: pin allowed repository hosts, attach credentials only after canonical host validation, and verify maintainer patch status.
- Confidence: medium-high for advisory existence and token disclosure path; medium for patch boundary because the advisory was unreviewed and fixed version was unknown in the source.
- Residual risk: AI context builders often run with repository tokens, so host parsing bugs can become supply-chain credential exfiltration paths.

## Authoritative Sources

- [August 28 topic collector source](../../../raw/processed/2026-08-28/ai-security-wiki-topic-news-collector-2026-08-28T233139Z.json)
- [GitHub advisory GHSA-mvv9-5ggf-37rj](https://github.com/advisories/GHSA-mvv9-5ggf-37rj)
- [NVD CVE-2026-82289](https://nvd.nist.gov/vuln/detail/CVE-2026-82289)
- [Gitingest issue 592](https://github.com/coderamp-labs/gitingest/issues/592)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [development agent credential isolation](development-agent-credential-isolation.md)
- [infrastructure and supply chain](../infrastructure-and-supply-chain/index.md)

## Open Questions

- Which Gitingest release enforces canonical trusted-host membership before attaching GitHub credentials?

## Maintenance Notes

- Created on 2026-08-29 from the [August 28 topic collector](../../../raw/processed/2026-08-28/ai-security-wiki-topic-news-collector-2026-08-28T233139Z.json) as an AI context-ingestion credential disclosure leaf.
