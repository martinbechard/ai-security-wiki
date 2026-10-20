---
type: "Topic"
title: "OneUptime Cluster-Scoped AI Action Authorization"
description: "Security analysis for CVE-2026-112047 cluster-scope authorization failures in OneUptime AI and agent actions."
tags: ["identity-and-access", "agent-and-tool-security"]
---

# OneUptime Cluster-Scoped AI Action Authorization

## Current Understanding

[CVE-2026-112047](https://nvd.nist.gov/vuln/detail/CVE-2026-112047) records that OneUptime 14.0.2 through before 14.0.69 applied project-wide permissions to cluster-scoped AI actions. The [October 19 collector](../../../raw/processed/2026-10-19/ai-security-wiki-topic-news-collector-2026-10-19T140139-0400.json) identifies these affected operations; general OneUptime coverage stays upstream:

- AI access tests
- agent resets
- kubectl-plan approval
- incident AI conversations
- commands

## Security Impact

- Threat: an authenticated member can invoke AI-enabled operational actions against clusters outside its scope.
- Affected boundary: Kubernetes AI and agent actions in OneUptime 14.0.2 through before 14.0.69.
- Exploit or incident status: public CVE and [project advisory](https://github.com/OneUptime/oneuptime/security/advisories/GHSA-8fph-9j9f-xxgc); active exploitation is not identified.
- Mitigation state: upgrade to 14.0.69 or later and test authorization at the cluster resource boundary for every delegated action.
- Confidence: high for the affected range and authorization failure.
- Residual risk: project membership can become excessive authority where AI actions dispatch to infrastructure.

## Authoritative Sources

- [October 19 collector source](../../../raw/processed/2026-10-19/ai-security-wiki-topic-news-collector-2026-10-19T140139-0400.json)
- [CVE-2026-112047](https://nvd.nist.gov/vuln/detail/CVE-2026-112047)
- [14.0.69 release](https://github.com/OneUptime/oneuptime/releases/tag/14.0.69)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [agent and tool security](../agent-and-tool-security/index.md)

## Open Questions

- Does the release apply the same cluster-level authorization check to all listed AI action families?

## Maintenance Notes

- Created on 2026-10-20 from the October 19 collector.
