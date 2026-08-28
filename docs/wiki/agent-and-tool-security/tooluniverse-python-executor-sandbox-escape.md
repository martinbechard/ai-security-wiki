---
type: "Topic"
title: "ToolUniverse Python executor sandbox escape"
description: "Security analysis for CVE-2026-81096 ToolUniverse unauthenticated Python executor sandbox escape."
tags: ["agent-and-tool-security", "infrastructure-and-supply-chain"]
---

# ToolUniverse Python executor sandbox escape

## Current Understanding

The [August 27 topic collector source](../../../raw/processed/2026-08-27/ai-security-wiki-topic-news-collector-2026-08-27T233104Z.json) records [CVE-2026-81096](https://nvd.nist.gov/vuln/detail/CVE-2026-81096) for ToolUniverse through 1.2.6. Broad [ToolUniverse background](../../../upstream-ai-wiki/topic-index.md) belongs upstream; this page owns the unauthenticated Python executor and sandbox-escape boundary for AI tool servers.

## Security Impact

- Threat: unauthenticated callers can submit Python to `python_code_executor`, escape the sandbox, and execute OS commands as the server process
- Affected boundary: ToolUniverse through 1.2.6
- Exploit or incident status: public advisory evidence; no local in-the-wild exploitation evidence is recorded.
- Mitigation state: Apply the [upstream advisory fix](https://github.com/mims-harvard/ToolUniverse/security/advisories/GHSA-pxwq-22vf-87fm) when available; do not expose code-execution tools without authentication, isolation, and denial of host command access.
- Confidence: high for advisory existence and affected boundary; medium for remediation details when the primary advisory does not name a fixed release.
- Residual risk: model- or browser-reachable helper surfaces can convert ordinary tool arguments into internal data access, credential use, or host execution when final authorization is missing.

## Authoritative Sources

- [August 27 topic collector source](../../../raw/processed/2026-08-27/ai-security-wiki-topic-news-collector-2026-08-27T233104Z.json)
- [NVD record](https://nvd.nist.gov/vuln/detail/CVE-2026-81096)
- [CVE record](https://www.cve.org/CVERecord?id=CVE-2026-81096)
- [GitHub security advisory](https://github.com/mims-harvard/ToolUniverse/security/advisories/GHSA-pxwq-22vf-87fm)
- [GitHub pull request](https://github.com/mims-harvard/ToolUniverse/pull/251)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](../agent-and-tool-security/index.md)
- [infrastructure and supply chain](../infrastructure-and-supply-chain/index.md)
- [identity and access](../identity-and-access/index.md)

## Open Questions

- No open wiki questions are recorded for this topic.

## Maintenance Notes

- Created on 2026-08-28 from the [August 27 topic collector](../../../raw/processed/2026-08-27/ai-security-wiki-topic-news-collector-2026-08-27T233104Z.json) as a focused Python executor sandbox-escape leaf after routing broad ToolUniverse context upstream; next check whether post-1.2.6 releases remove unauthenticated execution or only patch known bypasses.
