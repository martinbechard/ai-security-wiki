---
type: "Topic"
title: "IBM MQ Agent LLM Worker Exhaustion"
description: "Security analysis for CVE-2026-19645 LLM worker exhaustion in IBM MQ Agent CD."
tags: ["agent-and-tool-security"]
---

# IBM MQ Agent LLM Worker Exhaustion

## Current Understanding

The [September 4 topic collector source](../../../raw/processed/2026-09-04/ai-security-wiki-topic-news-collector-2026-09-04T233156Z.json) records CVE-2026-19645 for IBM MQ Agent CD v1.0.0, v1.0.1, v2.0.0, and v2.0.1. Broad IBM MQ product details belong upstream; this page owns LLM-worker exhaustion and AI-console availability controls.

[CVE-2026-19645](https://cveawg.mitre.org/api/cve/CVE-2026-19645) and [NVD](https://nvd.nist.gov/vuln/detail/CVE-2026-19645) describe authenticated requests with a valid session cookie that can hold LLM agent workers for tens of seconds to over ten minutes. Concurrent expensive requests can exhaust the worker pool and degrade or deny the AI Agent feature for other IBM MQ Console users.

## Security Impact

- Threat: expensive authenticated AI-agent requests monopolize a shared LLM worker pool.
- Affected boundary: IBM MQ Agent CD v1.0.0, v1.0.1, v2.0.0, and v2.0.1.
- Exploit or incident status: public CVE; no local exploitation evidence is recorded.
- Mitigation state: enforce request cost limits, per-user concurrency caps, cancellation, and worker isolation for AI-console features.
- Confidence: high for affected versions and availability mechanics from direct CVE evidence.
- Residual risk: authenticated AI features can become tenant-wide availability risks when cost and concurrency are not part of authorization.

## Authoritative Sources

- [September 4 topic collector source](../../../raw/processed/2026-09-04/ai-security-wiki-topic-news-collector-2026-09-04T233156Z.json)
- [CVE-2026-19645](https://cveawg.mitre.org/api/cve/CVE-2026-19645)
- [NVD CVE-2026-19645](https://nvd.nist.gov/vuln/detail/CVE-2026-19645)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [Kibana AI Assistant and Agent Builder DoS](kibana-ai-assistant-and-agent-builder-dos.md)

## Open Questions

- Which IBM MQ Agent CD release adds worker-cost controls or fixes CVE-2026-19645?

## Maintenance Notes

- Created on 2026-09-04 from the [September 4 topic collector source](../../../raw/processed/2026-09-04/ai-security-wiki-topic-news-collector-2026-09-04T233156Z.json).
