---
type: "Topic"
title: "Progress GenAI Agent Generator Command Injection"
description: "Security analysis for CVE-2026-91140 command injection through OpenAPI input in Progress Autonomous REST Connector GenAI Agents ARCGenAI-Generator."
tags: ["infrastructure-and-supply-chain", "agent-and-tool-security"]
---

# Progress GenAI Agent Generator Command Injection

## Current Understanding

The [October 6 topic collector source](../../../raw/processed/2026-10-06/ai-security-wiki-topic-news-collector-2026-10-06T233203Z.json) records [CVE-2026-91140](https://nvd.nist.gov/vuln/detail/CVE-2026-91140) / [GHSA-w86g-q6vw-5mw6](https://github.com/advisories/GHSA-w86g-q6vw-5mw6) for Progress Software Autonomous REST Connector GenAI Agents ARCGenAI-Generator version 2.0. General OpenAPI connector-generation practice belongs upstream in ai-dev-wiki unless focused on the security failure; this page owns the local generated-agent connector input and developer-workstation command-execution boundary.

The advisory says a crafted Swagger or OpenAPI document can reach shell-based temporary-file cleanup instructions and execute arbitrary operating-system commands on a developer's machine when the generator is invoked. The durable security lesson is that API specifications are code-adjacent supply-chain inputs when they drive generator scripts, cleanup commands, or generated connector execution.

## Security Impact

- Threat: crafted OpenAPI input can turn connector generation into developer-workstation command execution.
- Affected boundary: Progress Autonomous REST Connector GenAI Agents ARCGenAI-Generator 2.0, Swagger/OpenAPI document ingestion, generator temporary-file cleanup, and local shell execution.
- Exploit or incident status: public NVD and GitHub Advisory Database records; no local exploitation incident is recorded.
- Mitigation state: apply Progress remediation guidance when confirmed, avoid running ARCGenAI-Generator 2.0 on untrusted specifications, and sandbox generator execution with no ambient secrets or repository-write access.
- Confidence: medium-high for vulnerability class and affected generator version; medium for fixed-version detail until the official Progress bulletin is reconciled.
- Residual risk: AI connector generators often run during onboarding with developer credentials nearby, so specs from third parties need scanning and isolated generation.

## Authoritative Sources

- [October 6 topic collector source](../../../raw/processed/2026-10-06/ai-security-wiki-topic-news-collector-2026-10-06T233203Z.json)
- [NVD CVE-2026-91140](https://nvd.nist.gov/vuln/detail/CVE-2026-91140)
- [GitHub advisory GHSA-w86g-q6vw-5mw6](https://github.com/advisories/GHSA-w86g-q6vw-5mw6)
- [Progress DataDirect critical security alert bulletin](https://community.progress.com/s/article/Progress-DataDirect-Critical-Security-Alert-Bulletin-September-2026-CVE-2026-91140)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [agent and tool security](../agent-and-tool-security/index.md)
- [swagger-testcase-mcp Swagger parser SSRF](../agent-and-tool-security/swagger-testcase-mcp-swagger-parser-ssrf.md)

## Open Questions

- Which Progress release or configuration mitigates CVE-2026-91140 beyond avoiding ARCGenAI-Generator 2.0 on untrusted OpenAPI input?

## Maintenance Notes

- Created on 2026-10-07 from the [October 6 topic collector source](../../../raw/processed/2026-10-06/ai-security-wiki-topic-news-collector-2026-10-06T233203Z.json) as an API-spec-to-generator command-execution supply-chain leaf.
