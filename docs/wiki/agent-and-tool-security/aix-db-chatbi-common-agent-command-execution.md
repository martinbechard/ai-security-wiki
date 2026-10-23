---
type: "Topic"
title: "Aix-DB ChatBI Common-Agent Command Execution"
description: "Security analysis for CVE-2026-77926 prompt or document input reaching an ungated Aix-DB agent execution tool."
tags: ["agent-and-tool-security", "model-and-prompt-security"]
---

# Aix-DB ChatBI Common-Agent Command Execution

## Current Understanding

The [October 21 topic collector source](../../../raw/processed/2026-10-21/ai-security-wiki-topic-news-collector-2026-10-21T193103-0400.json) records [CVE-2026-77926](https://nvd.nist.gov/vuln/detail/CVE-2026-77926) for Aix-DB 1.2.4. Broad Aix-DB and agent-tool catalog context belongs upstream; this leaf owns the security boundary where crafted chat or document content can reach the common agent's execution tool.

## Security Impact

- Threat: untrusted prompt or document content can cause host-command execution and expose datasource credentials or model API keys.
- Affected boundary: Aix-DB 1.2.4 `POST /dify/get_answer` and document-processing paths reaching the common-agent `deepagents` execute tool.
- Exploit or incident status: public CVE disclosure; no local exploitation evidence is recorded.
- Mitigation state: restrict the endpoint and remove or approval-gate host execution until a maintainer fix is reconciled.
- Confidence: high for the disclosed mechanism; medium for remediation because the collected evidence names no fixed version.
- Residual risk: content that is treated as an agent instruction can cross directly into host authority.

## Authoritative Sources

- [October 21 topic collector source](../../../raw/processed/2026-10-21/ai-security-wiki-topic-news-collector-2026-10-21T193103-0400.json)
- [October 23 leaf update watch source](../../../raw/processed/2026-10-23/ai-security-wiki-leaf-update-watch-20261023T000535Z.json)
- [NVD CVE-2026-77926](https://nvd.nist.gov/vuln/detail/CVE-2026-77926)
- [VulnCheck advisory](https://www.vulncheck.com/advisories/aix-db-1.2.4-authenticated-rce-via-chatbi-common-agent-execute-tool)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [coding agent command approval boundaries](coding-agent-command-approval-boundaries.md)

## Open Questions

- Which maintained Aix-DB release, if any, removes or constrains the common-agent execution path?

## Maintenance Notes

- Updated on 2026-10-23 with watcher provenance; its exploit-tag reference was not independently confirmed as exploitation.
- Created on 2026-10-21 from the October 21 topic collector; reconcile maintainer release evidence before asserting a fixed version.
