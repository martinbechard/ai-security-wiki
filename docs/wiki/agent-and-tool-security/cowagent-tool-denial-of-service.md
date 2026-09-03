---
type: "Topic"
title: "CowAgent Tool Denial Of Service"
description: "Security analysis for CVE-2026-84425 and CVE-2026-84427 CowAgent BrowserTool and Bash Tool denial-of-service disclosures."
tags: ["agent-and-tool-security"]
---

# CowAgent Tool Denial Of Service

## Current Understanding

The [September 2 topic collector source](../../../raw/processed/2026-09-02/ai-security-wiki-topic-news-collector-2026-09-02T233120Z.json) records [CVE-2026-84425](https://nvd.nist.gov/vuln/detail/CVE-2026-84425) and [CVE-2026-84427](https://nvd.nist.gov/vuln/detail/CVE-2026-84427) for CowAgent tool components. Broad CowAgent product or framework background routes upstream; this page owns the local agent-tool availability boundary.

NVD reports remotely exploitable denial-of-service flaws in `agent/tools/browser/browser_tool.py` through CowAgent 2.1.3 and `agent/tools/bash/bash.py` through CowAgent 2.1.7. Both records say public exploit disclosure exists and early vendor contact did not receive a response; the fetched summaries do not identify fixed versions.

## Security Impact

- Threat: remote inputs can disrupt delegated browsing or shell-tool automation.
- Affected boundary: CowAgent Browser Tool through 2.1.3 and Bash Tool through 2.1.7.
- Exploit or incident status: public exploit disclosure according to NVD; no local incident is recorded.
- Mitigation state: fixed versions are not yet identified locally; restrict remote exposure, rate-limit tool entrypoints, and isolate tool workers.
- Confidence: medium from sparse NVD summaries; lower for remediation until vendor evidence is captured.
- Residual risk: execution-adjacent tools need availability controls because denial of service can interrupt safety checks, approvals, or cleanup.

## Control Implications

- Run browser and shell tools in restartable worker processes with resource limits.
- Avoid exposing agent tool endpoints directly to untrusted network inputs.
- Track vendor response and fixed-version evidence separately from public exploit status.

## Authoritative Sources

- [September 2 topic collector source](../../../raw/processed/2026-09-02/ai-security-wiki-topic-news-collector-2026-09-02T233120Z.json)
- [NVD CVE-2026-84425](https://nvd.nist.gov/vuln/detail/CVE-2026-84425)
- [NVD CVE-2026-84427](https://nvd.nist.gov/vuln/detail/CVE-2026-84427)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [Local agent execution and processing boundaries](local-agent-execution-and-processing-boundaries.md)
- [Agent action runtime hooks](agent-action-runtime-hooks.md)

## Open Questions

- Which CowAgent releases, if any, fix the BrowserTool and Bash Tool denial-of-service flaws?

## Maintenance Notes

- Created on 2026-09-02 from the [September 2 topic collector](../../../raw/processed/2026-09-02/ai-security-wiki-topic-news-collector-2026-09-02T233120Z.json) as a closely coupled CowAgent tool-availability advisory family.
