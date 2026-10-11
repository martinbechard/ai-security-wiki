---
type: "Topic"
title: "GenOffice MCP File Store Local Disclosure"
description: "Security analysis for CVE-2026-108582 world-readable GenOffice MCP file-store artifacts."
tags: ["data-and-privacy"]
---

# GenOffice MCP File Store Local Disclosure

## Current Understanding

The [October 10 topic collector source](../../../raw/processed/2026-10-10/ai-security-wiki-topic-news-collector-2026-10-10T232615Z.json) records [CVE-2026-108582](https://cveawg.mitre.org/api/cve/CVE-2026-108582) for GenOffice through 0.11.505. Broad GenOffice product context belongs upstream; this page owns document-artifact permissions and bearer-token bypass implications.

The NVD summary says the HTTP MCP server file store creates a world-readable `genoffice-mcp-http` directory under the system temporary directory. Local unprivileged users can list uploaded or generated documents directly from the filesystem, bypassing the HTTP bearer token that protects the MCP server surface.

## Security Impact

- Threat: generated or uploaded documents can leak to local users outside the MCP bearer-token boundary.
- Affected boundary: GenOffice through 0.11.505, HTTP MCP server file store, temporary directory permissions, and local OS user separation.
- Exploit or incident status: public CVE Services and NVD evidence; no confirmed exploitation incident is recorded locally.
- Mitigation state: restrict file-store permissions to the service identity, avoid shared temp paths for document artifacts, and rotate sensitive generated documents after patching.
- Confidence: high for the disclosure class and affected range; medium for deployment impact because local multi-user exposure varies.
- Residual risk: HTTP authentication does not protect artifacts once the backing file store is readable by other local principals.

## Authoritative Sources

- [October 10 topic collector source](../../../raw/processed/2026-10-10/ai-security-wiki-topic-news-collector-2026-10-10T232615Z.json)
- [CVE-2026-108582 record](https://cveawg.mitre.org/api/cve/CVE-2026-108582)
- [NVD CVE-2026-108582](https://nvd.nist.gov/vuln/detail/CVE-2026-108582)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [data and privacy](index.md)
- [MCP data movement exposure controls](mcp-data-movement-exposure-controls.md)

## Open Questions

- No open wiki questions are recorded for this topic.

## Maintenance Notes

- Created on 2026-10-11 from the [October 10 topic collector source](../../../raw/processed/2026-10-10/ai-security-wiki-topic-news-collector-2026-10-10T232615Z.json) after upstream index routing kept broad product and framework context outside the local security wiki.
