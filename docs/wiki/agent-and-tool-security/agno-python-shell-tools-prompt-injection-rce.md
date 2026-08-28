---
type: "Topic"
title: "Agno Python and Shell tools prompt-injection RCE"
description: "Security analysis for CVE-2026-37003 Agno PythonTools and ShellTools prompt-injection RCE."
tags: ["agent-and-tool-security", "model-and-prompt-security"]
---

# Agno Python and Shell tools prompt-injection RCE

## Current Understanding

The [August 27 topic collector source](../../../raw/processed/2026-08-27/ai-security-wiki-topic-news-collector-2026-08-27T233104Z.json) records [CVE-2026-37003](https://nvd.nist.gov/vuln/detail/CVE-2026-37003) for Agno up to and including 2.5.8. Broad [Agno framework coverage](../../../upstream-ai-wiki/agentic-frameworks/agno.md) belongs upstream; this page owns the model-generated tool-argument execution boundary.

## Security Impact

- Threat: prompt-influenced content from web pages or documents can flow into PythonTools and ShellTools sinks such as `exec()`, `runpy.run_path()`, and `subprocess.run()`
- Affected boundary: Agno <= 2.5.8
- Exploit or incident status: public advisory evidence; no local in-the-wild exploitation evidence is recorded.
- Mitigation state: Upgrade when a fixed release is available and require explicit approval plus argument allowlists for Python and shell execution tools.
- Confidence: high for advisory existence and affected boundary; medium for remediation details when the primary advisory does not name a fixed release.
- Residual risk: model- or browser-reachable helper surfaces can convert ordinary tool arguments into internal data access, credential use, or host execution when final authorization is missing.

## Authoritative Sources

- [August 27 topic collector source](../../../raw/processed/2026-08-27/ai-security-wiki-topic-news-collector-2026-08-27T233104Z.json)
- [NVD record](https://nvd.nist.gov/vuln/detail/CVE-2026-37003)
- [CVE record](https://www.cve.org/CVERecord?id=CVE-2026-37003)
- [Researcher advisory](https://yerangamage.com/cves/detail/?slug=agno-rce-tools)

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

- Created on 2026-08-28 from the [August 27 topic collector](../../../raw/processed/2026-08-27/ai-security-wiki-topic-news-collector-2026-08-27T233104Z.json) as a focused execution-boundary leaf after routing broad Agno context upstream; next check patched-release adoption and whether public exploit evidence appears for prompt-influenced PythonTools or ShellTools calls.
