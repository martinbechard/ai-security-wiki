---
type: "Topic"
title: "hermes-agent ACP MCP DoS"
description: "Security analysis for CVE-2026-84288 and CVE-2026-84289 denial-of-service issues in NousResearch hermes-agent ACP and MCP components."
tags: ["agent-and-tool-security", "testing-and-assurance"]
---

# hermes-agent ACP MCP DoS

## Current Understanding

The [September 1 topic collector source](../../../raw/processed/2026-09-01/ai-security-wiki-topic-news-collector-2026-09-01T233307Z.json) records [CVE-2026-84288](https://nvd.nist.gov/vuln/detail/CVE-2026-84288) and [CVE-2026-84289](https://nvd.nist.gov/vuln/detail/CVE-2026-84289) for NousResearch hermes-agent through 0.18.2. Broad NousResearch and framework context belongs upstream; this page owns the local ACP/MCP agent-control-plane availability boundary.

NVD says CVE-2026-84288 affects `HermesACPAgent.prompt` in `acp_adapter/session.py` and can produce remote denial of service through the ACP Prompt Workflow. CVE-2026-84289 affects `list_tools` in `tools/mcp_tool.py` and can cause uncontrolled memory allocation in the MCP Tool component. The source also records that public exploits may be available and that the vendor did not respond.

## Security Impact

- Threat: remote ACP prompt workflows and MCP tool-list handling can degrade agent control-plane availability.
- Affected boundary: NousResearch hermes-agent up to 0.18.2; ACP Prompt Workflow; MCP Tool component.
- Exploit or incident status: public NVD records and sparse GitHub Advisory Database listing; NVD notes public exploit availability may exist.
- Mitigation state: patched release not identified locally; bound prompt and tool-list handling, validate sizes, and isolate ACP/MCP bridge components.
- Confidence: medium-high for CVE identity and affected component from NVD; medium for remediation because vendor response and patch state are unresolved.
- Residual risk: ACP and MCP bridges multiply availability risk because prompt flows and tool metadata can both be remote-controlled.

## Control Implications

- Bound ACP prompt payloads, prompt workflow state, and model-mediated retry loops.
- Bound MCP tool-list size, memory allocation, and response parsing.
- Treat unpatched agent-framework bridges as high-risk even when the vulnerability class is denial of service.

## Authoritative Sources

- [September 2 leaf update watch source](../../../raw/processed/2026-09-02/ai-security-wiki-leaf-update-watch-20260903T000347Z.json)
- [September 1 topic collector source](../../../raw/processed/2026-09-01/ai-security-wiki-topic-news-collector-2026-09-01T233307Z.json)
- [NVD CVE-2026-84288](https://nvd.nist.gov/vuln/detail/CVE-2026-84288)
- [NVD CVE-2026-84289](https://nvd.nist.gov/vuln/detail/CVE-2026-84289)
- [GitHub Advisory GHSA-fvfr-42vv-wp2g](https://github.com/advisories/GHSA-fvfr-42vv-wp2g)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [AI workload cost anomaly monitoring](../testing-and-assurance/ai-workload-cost-anomaly-monitoring.md)
- [agent runtime security evidence](../testing-and-assurance/agent-runtime-security-evidence.md)

## Open Questions

- Is there a maintained hermes-agent release or fork that fixes CVE-2026-84288 and CVE-2026-84289 despite the NVD vendor-contact note?

## Maintenance Notes

- Updated on 2026-09-02 from the [September 2 leaf update watch source](../../../raw/processed/2026-09-02/ai-security-wiki-leaf-update-watch-20260903T000347Z.json) with direct in-window provenance while preserving the existing security boundary.
- Created on 2026-09-01 from the [September 1 topic collector](../../../raw/processed/2026-09-01/ai-security-wiki-topic-news-collector-2026-09-01T233307Z.json) as a closely coupled ACP/MCP denial-of-service leaf.
