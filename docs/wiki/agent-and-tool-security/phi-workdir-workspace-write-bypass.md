---
type: "Topic"
title: "Phi Workdir Workspace Write Bypass"
description: "Security analysis for CVE-2026-108595 unchecked workdir bypass of Phi workspace write controls."
tags: ["agent-and-tool-security"]
---

# Phi Workdir Workspace Write Bypass

## Current Understanding

The [October 10 topic collector source](../../../raw/processed/2026-10-10/ai-security-wiki-topic-news-collector-2026-10-10T232615Z.json) records [CVE-2026-108595](https://cveawg.mitre.org/api/cve/CVE-2026-108595) for Phi 0.3.0 through 0.28.4. General agent-framework catalog context belongs upstream or in ai-dev-wiki; this page owns delegated sub-agent write-control boundaries.

Spawned sub-agents can escape `workspace_only_writes` and `readonly` mode through unchecked `workdir` handling. That makes working directory selection a policy input for delegated agents rather than neutral execution metadata.

## Security Impact

- Threat: delegated sub-agents can write outside intended workspace controls.
- Affected boundary: Phi 0.3.0 through 0.28.4, spawned sub-agent workdir handling, `workspace_only_writes`, and readonly mode.
- Exploit or incident status: public CVE Services and NVD evidence; no confirmed exploitation incident is recorded locally.
- Mitigation state: canonicalize workdir values against the authorized workspace root, enforce write policy after process spawn, and test readonly delegation paths.
- Confidence: high for workspace-control bypass identity; medium for impact because reachable files depend on host permissions.
- Residual risk: workspace write controls need final path and process-context enforcement after all delegation parameters resolve.

## Authoritative Sources

- [October 10 topic collector source](../../../raw/processed/2026-10-10/ai-security-wiki-topic-news-collector-2026-10-10T232615Z.json)
- [CVE-2026-108595 record](https://cveawg.mitre.org/api/cve/CVE-2026-108595)
- [NVD CVE-2026-108595](https://nvd.nist.gov/vuln/detail/CVE-2026-108595)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [local agent execution and processing boundaries](local-agent-execution-and-processing-boundaries.md)
- [agent tool filesystem path containment](../infrastructure-and-supply-chain/agent-tool-filesystem-path-containment.md)

## Open Questions

- No open wiki questions are recorded for this topic.

## Maintenance Notes

- Created on 2026-10-11 from the [October 10 topic collector source](../../../raw/processed/2026-10-10/ai-security-wiki-topic-news-collector-2026-10-10T232615Z.json) after upstream index routing kept broad product and framework context outside the local security wiki.
