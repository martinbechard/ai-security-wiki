---
type: "Topic"
title: "Mage AI Browser Items File Read"
description: "Security analysis for CVE-2026-81030 project-browser path confinement failure in Mage AI."
tags: ["infrastructure-and-supply-chain", "identity-and-access"]
---

# Mage AI Browser Items File Read

## Current Understanding

CVE-2026-81030 affects Mage AI through 0.9.79 and crosses the local project-browser filesystem boundary. Broad Mage AI product and workflow-platform context belongs upstream. The [August 26 topic news collector source](../../../raw/processed/2026-08-26/ai-security-wiki-topic-news-collector-2026-08-26T233123Z.json) and [August 27 leaf update watch source](../../../raw/processed/2026-08-27/ai-security-wiki-leaf-update-watch-20260828T000238Z.json) provide the current evidence.

The `browser-items` API does not confine paths to the Mage AI project directory:

- [`BrowserItemResource.py`](https://github.com/mage-ai/mage-ai/blob/master/mage_ai/api/resources/BrowserItemResource.py) passes caller-supplied paths to filesystem read and write helpers.
- The watcher contrasts that with sibling [`FileContentResource.py`](https://github.com/mage-ai/mage-ai/blob/master/mage_ai/api/resources/FileContentResource.py) and [`FileResource.py`](https://github.com/mage-ai/mage-ai/blob/master/mage_ai/api/resources/FileResource.py), which call containment helpers.
- A Viewer-role user can supply an absolute path and read any file readable by the server process when the default configuration does not consult the permission model for this route.
- Editor-role writes also use the unconfined path, but the local boundary crossed here is Viewer read access because Editor can already execute code by design.

Locally, the security boundary is low-privilege project browsing: AI workflow platforms need path confinement even when adjacent high-privilege roles have broader execution authority.

## Security Impact

- Threat: a low-privilege workflow user can read server-local files outside intended project scope.
- Affected boundary: Mage AI through 0.9.79; `BrowserItemResource`; Viewer project-file read boundary; server-process filesystem access.
- Exploit or incident status: public NVD, issue, and VulnCheck evidence; no local exploitation incident is recorded.
- Mitigation state: no fixed version is recorded in the raw source; confine browser paths to canonical project roots and deny absolute or traversal paths.
- Confidence: high for advisory existence and affected boundary; medium for remediation state until a fixed release is confirmed.
- Residual risk: project browsers often appear read-only and low-risk, but they can disclose credentials, datasets, notebooks, and environment material when path checks fail.

## Authoritative Sources

- [August 27 leaf update watch source](../../../raw/processed/2026-08-27/ai-security-wiki-leaf-update-watch-20260828T000238Z.json)
- [CVE-2026-81030 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-81030)
- [August 26 topic news collector source](../../../raw/processed/2026-08-26/ai-security-wiki-topic-news-collector-2026-08-26T233123Z.json)
- [NVD CVE-2026-81030](https://nvd.nist.gov/vuln/detail/CVE-2026-81030)
- [Mage AI issue 6134](https://github.com/mage-ai/mage-ai/issues/6134)
- [VulnCheck advisory](https://www.vulncheck.com/advisories/mage-ai-through-0.9.79-arbitrary-file-read-via-unvalidated-path-in-browser-items-endpoint)

## Related Code

- [Mage AI `BrowserItemResource.py`](https://github.com/mage-ai/mage-ai/blob/master/mage_ai/api/resources/BrowserItemResource.py)
- [Mage AI `FileContentResource.py`](https://github.com/mage-ai/mage-ai/blob/master/mage_ai/api/resources/FileContentResource.py)
- [Mage AI `FileResource.py`](https://github.com/mage-ai/mage-ai/blob/master/mage_ai/api/resources/FileResource.py)

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

- Updated on 2026-08-28 with August 27 leaf-update evidence for CVE-2026-81030.
- Created on 2026-08-27 from the [August 26 topic collector](../../../raw/processed/2026-08-26/ai-security-wiki-topic-news-collector-2026-08-26T233123Z.json) as a role-bounded project-browser filesystem leaf.
