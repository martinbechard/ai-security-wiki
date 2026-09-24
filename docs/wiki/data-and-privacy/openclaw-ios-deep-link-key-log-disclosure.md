---
type: "Topic"
title: "OpenClaw iOS Deep Link Key Log Disclosure"
description: "Security analysis for CVE-2026-95815, where OpenClaw iOS logs agent deep-link bearer keys to diagnostics."
tags: ["data-and-privacy", "agent-and-tool-security"]
---

# OpenClaw iOS Deep Link Key Log Disclosure

## Current Understanding

The [September 23 topic collector source](../../../raw/processed/2026-09-23/ai-security-wiki-topic-news-collector-2026-09-23T233151Z.json) records [CVE-2026-95815](https://cveawg.mitre.org/api/cve/CVE-2026-95815) / [GHSA-5j57-84cx-r295](https://github.com/openclaw/openclaw/security/advisories/GHSA-5j57-84cx-r295) for OpenClaw iOS before 2026.8.11. Broad OpenClaw product context belongs upstream; this page owns the local delegated-action credential logging boundary.

OpenClaw iOS logged full agent deep-link URLs, including persistent bearer keys, to unified logs as public diagnostic data. Attackers who obtain diagnostic archives can recover unrotated keys and replay forged deep links to submit agent requests without local confirmation prompts.

## Security Impact

- Threat: diagnostic archive access becomes delegated agent-command replay access.
- Affected boundary: OpenClaw iOS before 2026.8.11, agent deep-link URLs, persistent bearer keys, unified logs, and local confirmation prompts.
- Exploit or incident status: public CVE, NVD, GitHub advisory, and patch commit evidence; no local in-the-wild exploitation evidence is recorded.
- Mitigation state: deploy the fixed iOS version or a build containing commit `8361f3704dd5e151ff1325e62ff5de658b6c62e6`; rotate any deep-link bearer keys that may have appeared in diagnostics.
- Confidence: high for affected boundary and patch reference from CVE, NVD, GitHub advisory, and commit evidence.
- Residual risk: mobile agent deep links should be treated as credentials and redacted from diagnostics by default.

## Authoritative Sources

- [September 23 topic collector source](../../../raw/processed/2026-09-23/ai-security-wiki-topic-news-collector-2026-09-23T233151Z.json)
- [CVE-2026-95815 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-95815)
- [NVD CVE-2026-95815](https://nvd.nist.gov/vuln/detail/CVE-2026-95815)
- [GitHub Security Advisory GHSA-5j57-84cx-r295](https://github.com/openclaw/openclaw/security/advisories/GHSA-5j57-84cx-r295)
- [OpenClaw patch commit](https://github.com/openclaw/openclaw/commit/8361f3704dd5e151ff1325e62ff5de658b6c62e6)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [data and privacy](index.md)
- [agent and tool security](../agent-and-tool-security/index.md)
- [Agent delegated task authorization drift](../identity-and-access/agent-delegated-task-authorization-drift.md)

## Open Questions

- Is 2026.8.11 available through the same iOS distribution channel used by affected OpenClaw deployments, and does the fix rotate previously logged bearer keys?

## Maintenance Notes

- Created on 2026-09-24 from the [September 23 topic collector source](../../../raw/processed/2026-09-23/ai-security-wiki-topic-news-collector-2026-09-23T233151Z.json) as a delegated-action credential disclosure leaf.
