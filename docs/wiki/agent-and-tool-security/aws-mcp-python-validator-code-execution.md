---
type: "Topic"
title: "AWS MCP Python Validator Code Execution"
description: "Security analysis for CVE-2026-115845 incomplete disallowed-input validation in run_script."
tags: ["agent-and-tool-security", "testing-and-assurance"]
---

# AWS MCP Python Validator Code Execution

## Current Understanding

[CVE-2026-115845](https://nvd.nist.gov/vuln/detail/CVE-2026-115845), captured by the [October 24 collector](../../../raw/processed/2026-10-24/ai-security-wiki-topic-news-collector-2026-10-24T232700Z.json), reports that crafted input could bypass an incomplete `run_script` Python denylist in AWS MCP Server and execute code in the authenticated user's isolated session. AWS states the service-side issue is fixed and requires no customer action; this page retains the validator-assurance boundary.

## Security Impact

- Threat: crafted tool input crosses from validation into code execution.
- Affected boundary: AWS MCP Server `run_script`; no customer version or deployment action is stated.
- Exploit or incident status: public disclosure; no local exploitation or incident is recorded.
- Mitigation state: provider reports a service-side fix; obtain the primary bulletin and retain session audit evidence.
- Confidence: medium because remediation and residual tenant scope are reported only through NVD evidence.
- Residual risk: a denylist remains an incomplete execution boundary even inside an isolated session.

## Authoritative Sources

- [October 24 collector](../../../raw/processed/2026-10-24/ai-security-wiki-topic-news-collector-2026-10-24T232700Z.json)
- [CVE-2026-115845](https://nvd.nist.gov/vuln/detail/CVE-2026-115845)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)

## Open Questions

- What provider bulletin defines the session, audit, and residual tenant implications of the service-side remediation?

## Maintenance Notes

- Created on 2026-10-24 with an explicit NVD-first confidence boundary.
