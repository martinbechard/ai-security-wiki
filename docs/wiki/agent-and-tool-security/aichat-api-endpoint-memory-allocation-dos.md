---
type: "Topic"
title: "aichat API Endpoint Memory Allocation DoS"
description: "Security analysis for CVE-2026-84857 uncontrolled memory allocation in sigoden aichat API endpoint handling."
tags: ["agent-and-tool-security", "infrastructure-and-supply-chain"]
---

# aichat API Endpoint Memory Allocation DoS

## Current Understanding

The [September 2 topic collector source](../../../raw/processed/2026-09-02/ai-security-wiki-topic-news-collector-2026-09-02T233120Z.json) records [CVE-2026-84857](https://nvd.nist.gov/vuln/detail/CVE-2026-84857) for sigoden aichat through 0.30.4. Broad aichat tool context routes upstream if it becomes durable; this page owns the local assistant API availability boundary.

NVD and the [GitHub advisory GHSA-w2m4-pj9f-6rwh](https://github.com/advisories/GHSA-w2m4-pj9f-6rwh) describe uncontrolled memory allocation in `src/serve.rs` in the API Endpoint component. The attack can be initiated remotely, public exploit material exists, and the fetched advisory text records no early vendor response.

## Security Impact

- Threat: remote requests can exhaust memory in a self-hosted assistant API endpoint.
- Affected boundary: sigoden aichat through 0.30.4; API Endpoint component in `src/serve.rs`.
- Exploit or incident status: public exploit disclosure according to NVD/GitHub advisory; no local incident is recorded.
- Mitigation state: fixed version is not yet identified locally; bound request sizes, memory usage, and concurrency while tracking vendor remediation.
- Confidence: medium-high from NVD and GitHub advisory; medium for remediation because vendor response and patch state are sparse.
- Residual risk: local chat endpoints can become automation backends, so availability failures may affect agent workflows beyond a single chat session.

## Control Implications

- Place memory and request-size limits around local assistant API servers.
- Keep self-hosted chat endpoints off untrusted networks unless authentication, rate limiting, and resource controls are present.
- Treat public exploit disclosure as enough to prioritize exposure review even when vendor remediation is unclear.

## Authoritative Sources

- [September 2 topic collector source](../../../raw/processed/2026-09-02/ai-security-wiki-topic-news-collector-2026-09-02T233120Z.json)
- [NVD CVE-2026-84857](https://nvd.nist.gov/vuln/detail/CVE-2026-84857)
- [GitHub advisory GHSA-w2m4-pj9f-6rwh](https://github.com/advisories/GHSA-w2m4-pj9f-6rwh)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [Local agent execution and processing boundaries](local-agent-execution-and-processing-boundaries.md)
- [AI development workstation containment](../infrastructure-and-supply-chain/ai-development-workstation-containment.md)

## Open Questions

- Which aichat release fixes CVE-2026-84857, and which deployment modes expose the API endpoint remotely?

## Maintenance Notes

- Created on 2026-09-02 from the [September 2 topic collector](../../../raw/processed/2026-09-02/ai-security-wiki-topic-news-collector-2026-09-02T233120Z.json) as a local assistant API availability leaf.
