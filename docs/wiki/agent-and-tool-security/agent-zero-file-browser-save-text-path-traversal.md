---
type: "Topic"
title: "Agent Zero FileBrowser Save-Text Path Traversal"
description: "Security analysis for CVE-2026-51851 delegated FileBrowser write-path traversal."
tags: ["agent-and-tool-security", "infrastructure-and-supply-chain"]
---

# Agent Zero FileBrowser Save-Text Path Traversal

## Current Understanding

The [October 29 topic collector source](../../../raw/processed/2026-10-29/ai-security-wiki-topic-news-collector-2026-10-29T232841Z.json) records [CVE-2026-51851](https://nvd.nist.gov/vuln/detail/CVE-2026-51851): Agent Zero versions 1.7 through 1.10 accept a user-controlled path in `FileBrowser.save_text_file` without normalization or validation. Broad Agent Zero context belongs upstream; this leaf owns delegated file-browser write containment, distinct from the existing privileged-console rendering boundary.

## Security Impact

- Threat: a user- or prompt-derived path can escape the intended workspace when the agent writes text.
- Affected boundary: Agent Zero 1.7 through 1.10, `python/helpers/file_browser.py` `FileBrowser.save_text_file`, and canonical write-target containment.
- Exploit or incident status: public NVD CVE disclosure; no exploitation incident is recorded locally.
- Mitigation state: no maintained fixed release is established by the collected evidence; normalize and resolve every requested write target, re-check it under an explicit workspace root, and restrict process filesystem privileges.
- Confidence: high for the reported versions and missing path validation; lower for the fixed-version boundary.
- Residual risk: prompt-mediated or user-supplied paths retain delegated host-write authority unless every write-capable tool independently enforces containment.

## Authoritative Sources

- [October 29 topic collector source](../../../raw/processed/2026-10-29/ai-security-wiki-topic-news-collector-2026-10-29T232841Z.json)
- [CVE-2026-51851](https://nvd.nist.gov/vuln/detail/CVE-2026-51851)
- [Agent Zero issue 1541](https://github.com/agent0ai/agent-zero/issues/1541)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [Agent Zero Web UI Stored XSS](agent-zero-web-ui-stored-xss.md)
- [agent tool filesystem path containment](../infrastructure-and-supply-chain/agent-tool-filesystem-path-containment.md)

## Open Questions

- Which maintained Agent Zero release fixes the `save_text_file` containment check, and are symlink targets rejected after path normalization?

## Maintenance Notes

- Created on 2026-10-29 from NVD-first evidence; retain delegated filesystem write control separately from Agent Zero Web UI content rendering.
