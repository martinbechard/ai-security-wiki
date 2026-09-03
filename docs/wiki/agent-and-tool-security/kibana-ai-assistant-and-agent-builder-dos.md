---
type: "Topic"
title: "Kibana AI Assistant And Agent Builder DoS"
description: "Security analysis for Kibana AI Assistant and Agent Builder low-privilege denial-of-service CVEs."
tags: ["agent-and-tool-security", "testing-and-assurance"]
---

# Kibana AI Assistant And Agent Builder DoS

## Current Understanding

The [September 1 topic collector source](../../../raw/processed/2026-09-01/ai-security-wiki-topic-news-collector-2026-09-01T233307Z.json) records two closely coupled Kibana AI feature denial-of-service CVEs: [CVE-2026-72644](https://nvd.nist.gov/vuln/detail/CVE-2026-72644) for Observability AI Assistant process termination and [CVE-2026-72682](https://nvd.nist.gov/vuln/detail/CVE-2026-72682) for Agent Builder unbounded memory consumption. Broad Elastic and Kibana product context belongs upstream; this page owns the local AI assistant and agent-builder resource-isolation boundary.

NVD says a low-privileged authenticated Observability AI Assistant user can submit a crafted request that triggers an unhandled error, terminates the Kibana process, and denies service to all users and spaces until restart. NVD also says a user with read-level Agent Builder privileges can trigger unbounded memory consumption and terminate the process.

## Security Impact

- Threat: low-privileged AI feature access can become tenant-wide or platform-wide service denial.
- Affected boundary: Kibana Observability AI Assistant feature access and Kibana Agent Builder read-level privilege path; exact fixed versions not captured locally.
- Exploit or incident status: public NVD vulnerability records; no local incident is recorded.
- Mitigation state: fixed-version details require Elastic advisory reconciliation; isolate AI feature errors and resource limits from the platform process.
- Confidence: high for CVE identities and impact from NVD; medium for remediation until Elastic fixed-version evidence is captured.
- Residual risk: AI assistant and agent-builder control planes need resource guards even for read or low feature privileges.

## Control Implications

- Apply per-user, per-space, and per-request resource limits to AI assistant and agent-builder requests.
- Handle malformed or adversarial AI feature requests without terminating the shared platform process.
- Treat AI feature privilege as action authority requiring service-level blast-radius analysis.

## Authoritative Sources

- [September 2 leaf update watch source](../../../raw/processed/2026-09-02/ai-security-wiki-leaf-update-watch-20260903T000347Z.json)
- [September 1 topic collector source](../../../raw/processed/2026-09-01/ai-security-wiki-topic-news-collector-2026-09-01T233307Z.json)
- [NVD CVE-2026-72644](https://nvd.nist.gov/vuln/detail/CVE-2026-72644)
- [NVD CVE-2026-72682](https://nvd.nist.gov/vuln/detail/CVE-2026-72682)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [AI workload cost anomaly monitoring](../testing-and-assurance/ai-workload-cost-anomaly-monitoring.md)
- [Kibana AI Assistant conversation ownership bypass](../identity-and-access/kibana-ai-assistant-conversation-ownership-bypass.md)

## Open Questions

- Which Elastic advisory maps CVE-2026-72644 and CVE-2026-72682 to fixed Kibana versions?

## Maintenance Notes

- Updated on 2026-09-02 from the [September 2 leaf update watch source](../../../raw/processed/2026-09-02/ai-security-wiki-leaf-update-watch-20260903T000347Z.json) with direct in-window provenance while preserving the existing security boundary.
- Created on 2026-09-01 from the [September 1 topic collector](../../../raw/processed/2026-09-01/ai-security-wiki-topic-news-collector-2026-09-01T233307Z.json) as a closely coupled AI feature DoS leaf.
