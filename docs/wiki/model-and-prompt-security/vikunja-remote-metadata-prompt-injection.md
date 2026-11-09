---
type: "Topic"
title: "Vikunja Remote Metadata Prompt Injection"
description: "Security analysis for CVE-2026-123498, where remote project metadata enters a coding agent authority block."
tags: ["model-and-prompt-security", "agent-and-tool-security"]
---

# Vikunja Remote Metadata Prompt Injection

## Current Understanding

The [November 9 collector source](../../../raw/processed/2026-11-09/ai-security-wiki-topic-news-collector-2026-11-09T003426Z.json) records NVD CVE-2026-123498 alongside [GHSA-cvh3-hf56-g9xm](https://github.com/go-vikunja/vikunja/security/advisories/GHSA-cvh3-hf56-g9xm). The advisory itself lists no CVE ID, so this mapping is retained as a source-identifier conflict rather than a confirmed alias. Before 2.7.1, the Vikunja veans integration rendered server-provided project titles and task content verbatim inside a coding agent's authoritative instruction block during SessionStart and PreCompact. General coding-agent workflow coverage belongs in ai-dev-wiki; this page owns the untrusted-metadata-to-prompt trust boundary.

## Security Impact

- Threat: a project writer or hostile server can place instructions that influence an agent able to read, modify, or execute commands in a developer checkout.
- Affected boundary: Vikunja project title and task-content ingestion by veans before 2.7.1 into SessionStart and PreCompact prompt construction.
- Exploit or incident status: public advisory describes the preconditions and a potential agent effect; no active exploitation or local incident is established.
- Mitigation state: upgrade to 2.7.1; fail closed for untrusted server metadata and render permitted remote content as fenced, labeled untrusted data outside the authority section.
- Confidence: high for the trust boundary and maintained fixed version; medium for deployment impact because exploitation depends on project write access and agent behavior.
- Residual risk: trusted collaborators can still submit adversarial content, so provenance labels and constrained tool approvals remain necessary.

## Authoritative Sources

- [November 9 collector source](../../../raw/processed/2026-11-09/ai-security-wiki-topic-news-collector-2026-11-09T003426Z.json)
- [GHSA-cvh3-hf56-g9xm](https://github.com/go-vikunja/vikunja/security/advisories/GHSA-cvh3-hf56-g9xm)
- [NVD CVE-2026-123498](https://nvd.nist.gov/vuln/detail/CVE-2026-123498)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [model and prompt security](index.md)
- [agent and tool security](../agent-and-tool-security/index.md)

## Open Questions

- Why does NVD associate CVE-2026-123498 with GHSA-cvh3-hf56-g9xm when the maintainer advisory lists no CVE ID?
- Does the maintained 2.7.1 release expose a testable policy that distinguishes trusted server metadata from trusted repository instruction files?

## Maintenance Notes

- Created on 2026-11-09 from the NVD-timed collector source; the maintainer advisory confirms the 2.7.1 remediation design.
