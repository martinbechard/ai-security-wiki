---
type: "Topic"
title: "9router Hermes Agent Auto-Accept Hook Injection"
description: "Security analysis for CVE-2026-108593 configuration injection into Hermes Agent auto-accept hooks."
tags: ["agent-and-tool-security"]
---

# 9router Hermes Agent Auto-Accept Hook Injection

## Current Understanding

The [October 10 topic collector source](../../../raw/processed/2026-10-10/ai-security-wiki-topic-news-collector-2026-10-10T232615Z.json) records [CVE-2026-108593](https://cveawg.mitre.org/api/cve/CVE-2026-108593) for 9router 0.4.1 through 0.5.99. Broad 9router and Hermes Agent product context belongs upstream; this page owns approval-bypass and post-LLM hook execution risk.

Authenticated dashboard users can inject arbitrary keys into Hermes Agent `config.yaml` through `POST /api/cli-tools/hermes-settings`. The collector highlights `hooks_auto_accept` and a `hooks.post_llm_call` shell command, which can execute after an LLM call without the approval boundary users expect.

## Security Impact

- Threat: dashboard configuration writes can silently install auto-approved post-LLM shell hooks.
- Affected boundary: 9router 0.4.1 through 0.5.99, Hermes Agent settings, `hooks_auto_accept`, `hooks.post_llm_call`, and approval mediation.
- Exploit or incident status: public CVE Services and NVD evidence; no confirmed exploitation incident is recorded locally.
- Mitigation state: patch settings validation, allowlist accepted config keys, require explicit approval for hook execution, and audit existing Hermes configs.
- Confidence: high for affected range and approval-bypass boundary from CVE evidence.
- Residual risk: agent hook systems need schema-constrained configuration because small config writes can become persistent execution policy changes.

## Authoritative Sources

- [October 10 topic collector source](../../../raw/processed/2026-10-10/ai-security-wiki-topic-news-collector-2026-10-10T232615Z.json)
- [CVE-2026-108593 record](https://cveawg.mitre.org/api/cve/CVE-2026-108593)
- [NVD CVE-2026-108593](https://nvd.nist.gov/vuln/detail/CVE-2026-108593)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [agent action runtime hooks](agent-action-runtime-hooks.md)
- [coding agent command approval boundaries](coding-agent-command-approval-boundaries.md)

## Open Questions

- No open wiki questions are recorded for this topic.

## Maintenance Notes

- Created on 2026-10-11 from the [October 10 topic collector source](../../../raw/processed/2026-10-10/ai-security-wiki-topic-news-collector-2026-10-10T232615Z.json) after upstream index routing kept broad product and framework context outside the local security wiki.
