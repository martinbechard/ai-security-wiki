---
type: "Topic"
title: "Astron Agent LocalExecutor Tenant Root Code Execution"
description: "Security analysis for CVE-2026-108263 default LocalExecutor tenant code execution in Astron Agent."
tags: ["infrastructure-and-supply-chain"]
---

# Astron Agent LocalExecutor Tenant Root Code Execution

## Current Understanding

The [October 10 topic collector source](../../../raw/processed/2026-10-10/ai-security-wiki-topic-news-collector-2026-10-10T232615Z.json) records [CVE-2026-108263](https://cveawg.mitre.org/api/cve/CVE-2026-108263) for Astron Agent before 1.1.2. Broad Astron Agent product context belongs upstream; this page owns tenant isolation, code-execution defaults, and shared credential blast radius.

When `CODE_EXEC_TYPE` is not explicitly changed, workflow code-node paths select `LocalExecutor` by default. Authenticated low-privilege tenants can then:

- execute code as root in the `core-workflow` container,
- use shared service and database credentials,
- bypass tenant checks,
- read or modify other tenants data, and
- disrupt shared services.

## Security Impact

- Threat: tenant workflow code can execute as root in a shared service container.
- Affected boundary: Astron Agent before 1.1.2, `CODE_EXEC_TYPE`, `LocalExecutor`, workflow code nodes, `core-workflow` container, shared service credentials, and tenant data boundaries.
- Exploit or incident status: public CVE Services and NVD evidence; no confirmed exploitation incident is recorded locally.
- Mitigation state: update to 1.1.2 or later, choose isolated executors by default, split tenant credentials, and audit workflow code-node access.
- Confidence: high for affected range and root execution path from CVE evidence.
- Residual risk: agent workflow platforms need safe execution defaults because unset deployment variables can become tenant-wide code execution policy.

## Authoritative Sources

- [October 10 topic collector source](../../../raw/processed/2026-10-10/ai-security-wiki-topic-news-collector-2026-10-10T232615Z.json)
- [CVE-2026-108263 record](https://cveawg.mitre.org/api/cve/CVE-2026-108263)
- [NVD CVE-2026-108263](https://nvd.nist.gov/vuln/detail/CVE-2026-108263)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [astron-agent workflow ownership bypass](../identity-and-access/astron-agent-workflow-ownership-bypass.md)
- [AI agent sandbox escape host file access](ai-agent-sandbox-escape-host-file-access.md)

## Open Questions

- No open wiki questions are recorded for this topic.

## Maintenance Notes

- Created on 2026-10-11 from the [October 10 topic collector source](../../../raw/processed/2026-10-10/ai-security-wiki-topic-news-collector-2026-10-10T232615Z.json) after upstream index routing kept broad product and framework context outside the local security wiki.
