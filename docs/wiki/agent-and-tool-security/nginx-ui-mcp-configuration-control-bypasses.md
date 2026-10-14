---
type: "Topic"
title: "Nginx UI MCP Configuration-Control Bypasses"
description: "Security analysis for CVE-2026-84317, CVE-2026-84318, CVE-2026-84319, and CVE-2026-84360, where Nginx UI MCP paths bypass comparable HTTP API controls."
tags: ["agent-and-tool-security", "identity-and-access"]
---

# Nginx UI MCP Configuration-Control Bypasses

## Current Understanding

The [October 13 topic collector source](../../../raw/processed/2026-10-13/ai-security-wiki-topic-news-collector-2026-10-13T232603Z.json) records [CVE-2026-84317](https://nvd.nist.gov/vuln/detail/CVE-2026-84317), [CVE-2026-84318](https://nvd.nist.gov/vuln/detail/CVE-2026-84318), [CVE-2026-84319](https://nvd.nist.gov/vuln/detail/CVE-2026-84319), and [CVE-2026-84360](https://nvd.nist.gov/vuln/detail/CVE-2026-84360) for Nginx UI before 2.4.1. Broad Nginx UI product context belongs upstream; this page owns the MCP administrative control-plane parity boundary.

The records describe MCP configuration paths that bypass controls enforced on comparable HTTP API paths. The cluster includes missing `ValidateConfigFile` checks for `nginx_config_add`, the ability to write restricted directives such as `load_module` and `js_import`, and bypass of an intended secure-session step-up control.

## Security Impact

- Threat: MCP endpoints become an alternate administrative control plane that skips validation and step-up authorization.
- Affected boundary: Nginx UI before 2.4.1, `/mcp` and `/mcp_message` configuration mutation paths, restricted Nginx directives, and secure-session enforcement.
- Exploit or incident status: public CVE records; no confirmed exploitation incident is recorded locally.
- Mitigation state: update to 2.4.1 or later and enforce validation and step-up controls uniformly across REST and MCP paths.
- Confidence: high for affected range and fixed version from the NVD/CVE records.
- Residual risk: agent-tool paths can drift from human HTTP APIs unless authorization and validation are centralized.

## Control Implications

- Enforce configuration validation in shared service code rather than only at REST controllers.
- Treat MCP mutation tools as privileged administrative APIs requiring equivalent step-up and policy checks.
- Regression-test restricted directives and secure-session requirements through both HTTP API and MCP transports.

## Authoritative Sources

- [October 13 topic collector source](../../../raw/processed/2026-10-13/ai-security-wiki-topic-news-collector-2026-10-13T232603Z.json)
- [NVD CVE-2026-84317](https://nvd.nist.gov/vuln/detail/CVE-2026-84317)
- [NVD CVE-2026-84318](https://nvd.nist.gov/vuln/detail/CVE-2026-84318)
- [NVD CVE-2026-84319](https://nvd.nist.gov/vuln/detail/CVE-2026-84319)
- [NVD CVE-2026-84360](https://nvd.nist.gov/vuln/detail/CVE-2026-84360)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [identity and access](../identity-and-access/index.md)
- [MCP tool-level IAM authorization](../identity-and-access/mcp-tool-level-iam-authorization.md)

## Open Questions

- Which Nginx UI 2.4.1 tests prove MCP mutation paths now share HTTP API validation and secure-session enforcement?

## Maintenance Notes

- Created on 2026-10-14 from the October 13 topic collector as one control-plane parity family because the CVEs share the same MCP configuration mutation boundary.
