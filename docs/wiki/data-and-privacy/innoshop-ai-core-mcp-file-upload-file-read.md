---
type: "Topic"
title: "InnoShop AI Core MCP File Upload File Read"
description: "Security analysis for CVE-2026-108591 server-side file disclosure through InnoShop AI Core MCP file_upload."
tags: ["data-and-privacy"]
---

# InnoShop AI Core MCP File Upload File Read

## Current Understanding

The [October 10 topic collector source](../../../raw/processed/2026-10-10/ai-security-wiki-topic-news-collector-2026-10-10T232615Z.json) records [CVE-2026-108591](https://cveawg.mitre.org/api/cve/CVE-2026-108591) for InnoShop 0.9.2. Broad InnoShop product context belongs upstream; this page owns MCP file-tool credential exposure and server-side file-read risk.

Authenticated administrators with `files_create` permission can use the AI Core MCP `file_upload` tool in this sequence:

1. Pass `file://` or `php://` stream wrappers into the `source` argument.
2. Cause the server to read the target through `file_get_contents()`.
3. Store the result on the public media disk.

The exposed content can include `.env`, `APP_KEY`, and database credentials.

## Security Impact

- Threat: administrative file-upload authority can become server-side local file disclosure.
- Affected boundary: InnoShop 0.9.2, AI Core MCP `file_upload`, stream wrappers, public media disk, and application/database secrets.
- Exploit or incident status: public CVE Services and NVD evidence; no confirmed exploitation incident is recorded locally.
- Mitigation state: deny local stream wrappers for upload sources, restrict upload fetch schemes to intended remote media, rotate exposed credentials, and check public media for secret artifacts.
- Confidence: high for the file-read boundary; medium for privilege because exploitability depends on administrator `files_create` permission.
- Residual risk: admin-only MCP tools still need server-side scheme and path controls because compromised or overbroad admin roles can expose runtime secrets.

## Authoritative Sources

- [October 10 topic collector source](../../../raw/processed/2026-10-10/ai-security-wiki-topic-news-collector-2026-10-10T232615Z.json)
- [CVE-2026-108591 record](https://cveawg.mitre.org/api/cve/CVE-2026-108591)
- [NVD CVE-2026-108591](https://nvd.nist.gov/vuln/detail/CVE-2026-108591)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [data and privacy](index.md)
- [Docling local file read conversion backends](docling-local-file-read-conversion-backends.md)
- [AI provider override trust boundaries](ai-provider-override-trust-boundaries.md)

## Open Questions

- No open wiki questions are recorded for this topic.

## Maintenance Notes

- Created on 2026-10-11 from the [October 10 topic collector source](../../../raw/processed/2026-10-10/ai-security-wiki-topic-news-collector-2026-10-10T232615Z.json) after upstream index routing kept broad product and framework context outside the local security wiki.
