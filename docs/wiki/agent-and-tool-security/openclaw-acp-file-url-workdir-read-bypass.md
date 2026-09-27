---
type: "Topic"
title: "OpenClaw ACP File URL Workdir Read Bypass"
description: "Security analysis for the OpenClaw alternate file URL path classification issue that could read outside the working directory."
tags: ["agent-and-tool-security", "data-and-privacy"]
---

# OpenClaw ACP File URL Workdir Read Bypass

## Current Understanding

The [September 26 topic collector source](../../../raw/processed/2026-09-26/ai-security-wiki-topic-news-collector-2026-09-26T233301Z.json) records an OpenClaw CVE in the September 26 cluster where alternate `file:` URL path classification could lead to out-of-workdir reads. Broad OpenClaw product and coding-agent workflow context belongs upstream in ai-dev-wiki; this page owns the local ACP file containment boundary.

## Security Impact

- Threat: an agent-accessible file URL path can be classified as inside the workspace while resolving outside the intended working directory.
- Affected boundary: OpenClaw versions before the applicable 2026.7.1 or 2026.8.1 fix, ACP file access, `file:` URL parsing, and workdir containment.
- Exploit or incident status: disclosed CVE cluster; no confirmed exploitation is recorded in the collector.
- Mitigation state: update OpenClaw, canonicalize file URLs before policy checks, and enforce final resolved-path containment.
- Confidence: medium from NVD-backed collector evidence; exact CVE-to-patch mapping needs primary advisory reconciliation.
- Residual risk: file URL parsing variants need regression tests across URL encodings, path separators, and symlink-adjacent cases.

## Authoritative Sources

- [September 26 topic collector source](../../../raw/processed/2026-09-26/ai-security-wiki-topic-news-collector-2026-09-26T233301Z.json)
- [OpenClaw agent authority and approval cluster](openclaw-agent-authority-and-approval-cluster.md)

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

- Which OpenClaw CVE and patch commit own the alternate `file:` URL workdir-read bypass?

## Maintenance Notes

- Created on 2026-09-27 from the [September 26 topic collector source](../../../raw/processed/2026-09-26/ai-security-wiki-topic-news-collector-2026-09-26T233301Z.json) after verifier correction split the OpenClaw cluster by control boundary.
