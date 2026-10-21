---
type: "Topic"
title: "NoteGen Synced Image Local-File Disclosure"
description: "Security analysis for CVE-2026-111935 synced NoteGen image paths causing local-file disclosure to an AI provider."
tags: ["data-and-privacy", "agent-and-tool-security"]
---

# NoteGen Synced Image Local-File Disclosure

## Current Understanding

[CVE-2026-111935](https://nvd.nist.gov/vuln/detail/CVE-2026-111935) reports that NoteGen through 0.38.3 accepts unvalidated synchronized `sourceUrl` values in chat image analysis. The [October 19 late collector](../../../raw/processed/2026-10-19/ai-security-wiki-topic-news-collector-2026-10-19T193149-0400.json) records that a collaborator controlling the sync target can cause a local image to be read and sent to an AI provider.

## Security Impact

- Threat: a sync collaborator can cause arbitrary local image disclosure to an AI provider.
- Affected boundary: NoteGen through 0.38.3, synced chat-image `sourceUrl`, and `image_inspect` handling.
- Exploit or incident status: public CVE with two linked remediation commits; active exploitation is not identified.
- Mitigation state: validate file origins and URLs before image analysis; release-level remediation is not confirmed by the collector.
- Confidence: high for the disclosure path; medium for fixed-version state.
- Residual risk: sync metadata is untrusted input even where collaborators are otherwise authorized.

## Authoritative Sources

- [October 19 late collector source](../../../raw/processed/2026-10-19/ai-security-wiki-topic-news-collector-2026-10-19T193149-0400.json)
- [October 20 leaf watch](../../../raw/processed/2026-10-20/ai-security-wiki-leaf-update-watch-20261021T000613Z.json)
- [CVE-2026-111935](https://nvd.nist.gov/vuln/detail/CVE-2026-111935)
- [first remediation commit](https://github.com/codexu/note-gen/commit/64e671eb58f56ad6ebec0d99d32f6037f9319979)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [data and privacy](index.md)
- [agent and tool security](../agent-and-tool-security/index.md)

## Open Questions

- Which NoteGen release includes both linked path-validation fixes?

## Maintenance Notes

- Created on 2026-10-20 from the October 19 late collector.
- Rechecked on 2026-10-20; the synchronized-path disclosure boundary remains unchanged.
