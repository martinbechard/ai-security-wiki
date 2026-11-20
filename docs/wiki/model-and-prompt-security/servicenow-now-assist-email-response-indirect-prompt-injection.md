---
type: "Topic"
title: "ServiceNow Now Assist email-response indirect prompt injection"
description: "Security analysis for CVE-2026-18883 in the Now Assist for CSM Email Response AI Agent."
tags: ["model-and-prompt-security", "agent-and-tool-security"]
---

# ServiceNow Now Assist email-response indirect prompt injection

## Current Understanding

The [November 20 collector source](../../../raw/processed/2026-11-20/ai-security-wiki-topic-news-collector-2026-11-20T003127Z.json) records [CVE-2026-18883](https://nvd.nist.gov/vuln/detail/CVE-2026-18883) in the Email Response AI Agent in Now Assist for CSM. Broad ServiceNow context belongs upstream; this leaf owns the untrusted-email-to-agent-instruction boundary.

[ServiceNow states](https://support.servicenow.com/kb?id=kb_article_view&sysparm_article=KB3235180) that it centrally remediated the indirect prompt-injection condition without a platform-version upgrade or hot fix and was not aware of malicious exploitation. Deployment owners should verify the centrally managed service posture rather than infer a local patch requirement or absence of future risk.

## Security Impact

- Threat: untrusted email content can influence an autonomous response agent as indirect instructions.
- Affected boundary: Now Assist for CSM Email Response AI Agent.
- Exploit or incident status: vendor reports no known malicious exploitation; no local incident is recorded.
- Mitigation state: centrally remediated according to ServiceNow; verify service status and retain separation between untrusted email and executable agent instructions.
- Confidence: high for the vendor-stated remediation and exploitation qualifier; deployment-specific control state requires confirmation.
- Residual risk: centrally managed remediation does not remove the need to monitor untrusted-content handling and agent actions.

## Authoritative Sources

- [November 20 collector source](../../../raw/processed/2026-11-20/ai-security-wiki-topic-news-collector-2026-11-20T003127Z.json)
- [CVE-2026-18883 NVD record](https://nvd.nist.gov/vuln/detail/CVE-2026-18883)
- [ServiceNow security bulletin KB3235180](https://support.servicenow.com/kb?id=kb_article_view&sysparm_article=KB3235180)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [model and prompt security](index.md)
- [agent and tool security](../agent-and-tool-security/index.md)

## Open Questions

- Which deployment-visible signal confirms ServiceNow's centrally deployed remediation for a given Now Assist tenant?

## Maintenance Notes

- Created on 2026-11-20 from the November 20 collector. Preserve the vendor's no-known-exploitation statement as a time-bounded qualifier.
