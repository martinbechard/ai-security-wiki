---
type: "Topic"
title: "CodeWhale JS Execution Environment Exposure"
description: "Security analysis for CodeWhale js_execution environment-variable exposure."
tags: ["agent-and-tool-security", "identity-and-access", "data-and-privacy"]
---

# CodeWhale JS Execution Environment Exposure

## Current Understanding

The [August 18 topic news collector source](../../../raw/processed/2026-08-18/ai-security-wiki-topic-news-collector-2026-08-18T233017Z.json) records CodeWhale `js_execution` environment-variable exposure. Broad coding-agent workflow practice belongs upstream; this page owns the local inherited-environment and secret-exposure boundary.

[CodeWhale agent control plane vulnerabilities](codewhale-agent-control-plane-vulnerabilities.md) routes the broader advisory cluster. This leaf keeps JavaScript execution environment exposure separate because inherited environment scoping can change independently from approval policy, project configuration, or git argument handling.

## Security Impact

- Threat: JavaScript execution tools can expose host environment variables, including credentials, to model-visible or repository-influenced code.
- Affected boundary: CodeWhale before 0.8.64 or `>=0.8.41` and `<0.8.64`, depending on the exact CVE.
- Exploit or incident status: public NVD keyword evidence; full per-CVE records still need direct re-fetch.
- Mitigation state: update to 0.8.64 or later and run execution tools with explicit minimal environment variables.
- Confidence: medium-high from collector evidence; exact CVSS, CWE, and per-CVE mapping need primary records.
- Residual risk: execution sandboxes need secret inventory evidence because inherited environment variables can be invisible in normal approval prompts.

## Authoritative Sources

- [August 18 topic news collector source](../../../raw/processed/2026-08-18/ai-security-wiki-topic-news-collector-2026-08-18T233017Z.json)
- [NVD CVE-2026-75915](https://nvd.nist.gov/vuln/detail/CVE-2026-75915)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [CodeWhale agent control plane vulnerabilities](codewhale-agent-control-plane-vulnerabilities.md)
- [development agent credential isolation](../identity-and-access/development-agent-credential-isolation.md)

## Open Questions

- Which environment variables does the fixed CodeWhale `js_execution` tool preserve by default?

## Maintenance Notes

- Created on 2026-08-19 after verifier correction split the CodeWhale advisory cluster.
