---
type: "Topic"
title: "XAgent ToolServer Upload Path Traversal"
description: "Security analysis for CVE-2026-51912 path traversal through XAgent ToolServer file upload."
tags: ["agent-and-tool-security", "infrastructure-and-supply-chain"]
---

# XAgent ToolServer Upload Path Traversal

## Current Understanding

The [October 29 topic collector source](../../../raw/processed/2026-10-29/ai-security-wiki-topic-news-collector-2026-10-29T232841Z.json) records [CVE-2026-51912](https://nvd.nist.gov/vuln/detail/CVE-2026-51912): XAgent v1.0.0 accepts a traversal-bearing upload filename in `ToolServerNode` and can escape its intended working directory. Broad XAgent context belongs upstream; this leaf owns the agent-tool upload-to-host-filesystem containment boundary.

## Security Impact

- Threat: untrusted upload metadata selects a path outside the tool server's intended work directory.
- Affected boundary: XAgent v1.0.0, `ToolServer/ToolServerNode/main.py` `upload_file`, and canonical destination containment after filename normalization.
- Exploit or incident status: public NVD CVE disclosure; no exploitation incident is recorded locally.
- Mitigation state: no maintained fixed release is established by the NVD-first evidence; reject traversal and absolute paths, resolve the target, re-check it under a trusted root, and run the tool server with a non-privileged constrained filesystem.
- Confidence: high for the NVD-reported boundary and version; lower for remediation status.
- Residual risk: upload-capable agent tools remain host-write authority even after path filtering, so service exposure and container privileges require separate controls.

## Authoritative Sources

- [October 29 topic collector source](../../../raw/processed/2026-10-29/ai-security-wiki-topic-news-collector-2026-10-29T232841Z.json)
- [CVE-2026-51912](https://nvd.nist.gov/vuln/detail/CVE-2026-51912)
- [XAgent repository](https://github.com/OpenBMB/XAgent)
- [XAgent issue 420](https://github.com/OpenBMB/XAgent/issues/420)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [agent tool filesystem path containment](../infrastructure-and-supply-chain/agent-tool-filesystem-path-containment.md)

## Open Questions

- Which maintained XAgent release fixes CVE-2026-51912? The collector links [issue 420](https://github.com/OpenBMB/XAgent/issues/420), but that issue identifies CVE-2026-3954, so it is not treated as same-CVE remediation evidence.

## Maintenance Notes

- Created on 2026-10-29 from NVD-first evidence; preserve the unresolved advisory-reference mismatch rather than deriving remediation from it.
