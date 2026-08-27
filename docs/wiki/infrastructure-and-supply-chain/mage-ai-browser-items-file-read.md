---
type: "Topic"
title: "Mage AI Browser Items File Read"
description: "Security analysis for CVE-2026-81030 project-browser path confinement failure in Mage AI."
tags: ["infrastructure-and-supply-chain", "identity-and-access"]
---

# Mage AI Browser Items File Read

## Current Understanding

The [August 26 topic news collector source](../../../raw/processed/2026-08-26/ai-security-wiki-topic-news-collector-2026-08-26T233123Z.json) records CVE-2026-81030 for Mage AI through 0.9.79. Broad Mage AI product and workflow-platform context belongs upstream; this page owns the local project-browser filesystem boundary.

The collector records that the `browser-items` API did not confine paths to the Mage AI project directory. A Viewer-role user could supply an absolute path and read any file readable by the server process. The same unconfined path branch also allowed Editor-role writes, although the source notes that Editor can already execute code by design. Locally, the security boundary is low-privilege project browsing: AI workflow platforms need path confinement even when adjacent high-privilege roles have broader execution authority.

## Security Impact

- Threat: a low-privilege workflow user can read server-local files outside intended project scope.
- Affected boundary: Mage AI through 0.9.79; `BrowserItemResource`; Viewer project-file read boundary; server-process filesystem access.
- Exploit or incident status: public NVD, issue, and VulnCheck evidence; no local exploitation incident is recorded.
- Mitigation state: no fixed version is recorded in the raw source; confine browser paths to canonical project roots and deny absolute or traversal paths.
- Confidence: high for advisory existence and affected boundary; medium for remediation state until a fixed release is confirmed.
- Residual risk: project browsers often appear read-only and low-risk, but they can disclose credentials, datasets, notebooks, and environment material when path checks fail.

## Authoritative Sources

- [August 26 topic news collector source](../../../raw/processed/2026-08-26/ai-security-wiki-topic-news-collector-2026-08-26T233123Z.json)
- [NVD CVE-2026-81030](https://nvd.nist.gov/vuln/detail/CVE-2026-81030)
- [Mage AI issue 6134](https://github.com/mage-ai/mage-ai/issues/6134)
- [VulnCheck advisory](https://www.vulncheck.com/advisories/mage-ai-through-0.9.79-arbitrary-file-read-via-unvalidated-path-in-browser-items-endpoint)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [agent tool filesystem path containment](agent-tool-filesystem-path-containment.md)
- [AI agent sandbox escape host file access](ai-agent-sandbox-escape-host-file-access.md)

## Open Questions

- Which Mage AI release first fixes CVE-2026-81030, and does it apply canonical path checks consistently across read and write browser-item operations?

## Maintenance Notes

- Created on 2026-08-27 from the [August 26 topic collector](../../../raw/processed/2026-08-26/ai-security-wiki-topic-news-collector-2026-08-26T233123Z.json) as a role-bounded project-browser filesystem leaf.
