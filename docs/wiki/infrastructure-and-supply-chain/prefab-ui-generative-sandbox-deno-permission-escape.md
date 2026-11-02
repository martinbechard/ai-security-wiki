---
type: "Topic"
title: "Prefab UI Generative Sandbox Deno-Permission Escape"
description: "Security analysis for CVE-2026-120338 generated-code access to inherited Deno file and network permissions."
tags: ["infrastructure-and-supply-chain", "agent-and-tool-security"]
---

# Prefab UI Generative Sandbox Deno-Permission Escape

## Current Understanding

The [November 2 collector source](../../../raw/processed/2026-11-02/ai-security-wiki-topic-news-collector-2026-11-02T003500Z.json) records [CVE-2026-120338](https://nvd.nist.gov/vuln/detail/CVE-2026-120338): Prefab UI Generative UI versions 0.14.0 through 0.20.2 let caller-supplied Python reach unrestricted Deno read, write, and network APIs through Pyodide's JavaScript bridge. General Prefab UI, FastMCP, Pyodide, and Deno context belongs upstream; this page owns the generated-code permission boundary.

In FastMCP deployments using the GenerativeUI provider, the relevant exposure condition is a reachable `generate_prefab_ui` tool. Version 0.21.0 is reported to revoke Deno permissions before code acceptance and start Deno with `--no-prompt`.

## Security Impact

- Threat: generated or agent-supplied code escapes intended UI generation to read, write, or use the network with server permissions.
- Affected boundary: Prefab UI Generative UI sandbox 0.14.0 through 0.20.2, Pyodide JavaScript bridge, and FastMCP GenerativeUI provider exposure.
- Exploit or incident status: public NVD and GitHub advisory disclosure; no local incident is recorded.
- Mitigation state: upgrade to 0.21.0, revoke host permissions before accepting untrusted code, and ensure the exposed tool cannot inherit server credentials or unrestricted network access.
- Confidence: high for the affected range, integration condition, and recorded mitigation mechanics.
- Residual risk: a patched sandbox still needs least-privilege execution and deliberate tool reachability controls because generated code is a high-capability agent output.

## Control Implications

- Make sandbox permissions explicit and deny by default before untrusted code enters the runtime.
- Review agent-visible UI-generation tools as code-execution entry points, including their inherited filesystem, network, and credential authority.

## Authoritative Sources

- [November 2 collector source](../../../raw/processed/2026-11-02/ai-security-wiki-topic-news-collector-2026-11-02T003500Z.json)
- [NVD CVE-2026-120338](https://nvd.nist.gov/vuln/detail/CVE-2026-120338)
- [GitHub advisory GHSA-595q-jv4r-q7j9](https://github.com/PrefectHQ/prefab/security/advisories/GHSA-595q-jv4r-q7j9)
- [Maintainer patch](https://github.com/PrefectHQ/prefab/commit/030f074f85e0b1be0dd44b0283185aecb26337a2)
- [0.21.0 release](https://github.com/PrefectHQ/prefab/releases/tag/v0.21.0)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [AI Agent Sandbox Escape Host File Access](ai-agent-sandbox-escape-host-file-access.md)
- [agent and tool security](../agent-and-tool-security/index.md)

## Open Questions

- Which FastMCP deployments expose `generate_prefab_ui`, and what process permissions remain after upgrading?

## Maintenance Notes

- Created on 2026-11-02 from the November 2 collector; retain generated-code sandbox escape separately from ordinary UI rendering flaws.
