---
type: "Topic"
title: "Dagu MCP DAG-Specification Path Containment"
description: "Security analysis for CVE-2026-102943 MCP dagu_read path containment and workspace-isolation bypass in Dagu."
tags: ["agent-and-tool-security", "data-and-privacy"]
---

# Dagu MCP DAG-Specification Path Containment

## Current Understanding

The [November 6 collector source](../../../raw/processed/2026-11-06/ai-security-wiki-topic-news-collector-2026-11-07T003626Z.json) records [CVE-2026-102943](https://www.cve.org/CVERecord?id=CVE-2026-102943): before v2.11.0, Dagu's MCP `dagu_read` operation can read accessible `.yaml` or `.yml` files outside configured DAG directories through its `dag_spec` target. Broad Dagu product coverage belongs upstream; this page owns the MCP tool path-containment and workspace-authorization boundary.

## Security Impact

- Threat: a viewer-role API key can use a tool read to select an absolute or traversing YAML path outside the intended DAG workspace.
- Affected boundary: Dagu before v2.11.0, the MCP `dagu_read` `dag_spec` path through in-process `GetDAGSpec` handling.
- Exploit or incident status: the maintainer advisory documents a reproduced read-only condition; the retained sources do not establish write, command-execution, active-exploitation, or local-incident capability.
- Mitigation state: v2.11.0 is listed as patched. The maintainer advisory recommends enforcing resolved-path containment at the shared storage boundary and applying workspace-visibility authorization to this tool path.
- Confidence: high for the vulnerable read boundary, viewer-role prerequisite, and v2.11.0 remediation; no claim beyond readable YAML targets is made here.
- Residual risk: deployments should review YAML files reachable by the service for credentials or configuration secrets and rotate potentially exposed material.

## Authoritative Sources

- [November 6 collector source](../../../raw/processed/2026-11-06/ai-security-wiki-topic-news-collector-2026-11-07T003626Z.json)
- [CVE-2026-102943](https://www.cve.org/CVERecord?id=CVE-2026-102943)
- [GHSA-5m6c-38r8-5w76 maintainer advisory](https://github.com/dagucloud/dagu/security/advisories/GHSA-5m6c-38r8-5w76)
- [v2.11.0 release](https://github.com/dagucloud/dagu/releases/tag/v2.11.0)

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

- Does every supported Dagu deployment route MCP DAG-specification reads through the shared resolved-path containment and workspace-visibility checks in v2.11.0 or later?

## Maintenance Notes

- Created on 2026-11-06 from the November 5 CVE-record publication and the maintainer advisory. The underlying advisory predates this source window; the retained update is the newly published CVE record.
