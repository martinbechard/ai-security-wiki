---
type: "Topic"
title: "n8n Workflow Tool Credential Exfiltration"
description: "Security analysis for CVE-2026-85166 credential-reference validation failure in n8n inline Workflow Tool sub-workflows."
tags: ["agent-and-tool-security", "data-and-privacy", "identity-and-access"]
---

# n8n Workflow Tool Credential Exfiltration

## Current Understanding

The [September 3 topic collector source](../../../raw/processed/2026-09-03/ai-security-wiki-topic-news-collector-2026-09-03T233104Z.json) records [CVE-2026-85166](https://nvd.nist.gov/vuln/detail/CVE-2026-85166) for n8n before 2.35.4 and for 2.36.x before 2.36.2. Broad [n8n-MCP](../../../upstream-ai-wiki/mcp-servers/n8n-mcp.md) and workflow-product context belongs upstream; this page owns the local security boundary where inline sub-workflow JSON can reference credentials outside the editor's ownership.

[NVD](https://nvd.nist.gov/vuln/detail/CVE-2026-85166), the [direct CVE record](https://cveawg.mitre.org/api/cve/CVE-2026-85166), the [GitHub advisory GHSA-4r56-g65c-fm83](https://github.com/n8n-io/n8n/security/advisories/GHSA-4r56-g65c-fm83), and the [VulnCheck advisory](https://www.vulncheck.com/advisories/n8n-before-2.36.2-credential-exfiltration-via-workflow-tool-node) describe a shared-workflow editor or API user persisting a Workflow Tool node that references a credential they do not own. Later execution by an identity that does own the credential can resolve the secret and send it to an attacker-controlled endpoint.

## Security Impact

- Threat: workflow authors can create delayed credential exfiltration through inline sub-workflow references.
- Affected boundary: n8n Workflow Tool node, inline workflow JSON, credential-reference validation, shared-workflow editor/API permissions, and execution by a credential-owning identity.
- Exploit or incident status: public NVD/CVE and advisory records; no local incident is recorded.
- Mitigation state: upgrade to the fixed 2.35.4 or 2.36.2 train and review shared workflows for inline sub-workflow credential references.
- Confidence: high from direct NVD/CVE timestamps plus vendor advisory references; medium for local exposure until workflow-sharing roles and execution identities are audited.
- Residual risk: agent and automation workflows can decouple workflow author, runtime identity, and credential owner, so review must validate references at save time and execution time.

## Control Implications

- Bind credential references to both the workflow author and the runtime identity before execution.
- Review inline workflow JSON as an executable authorization surface, not only as low-risk configuration.
- Add tests where a shared editor references credentials they cannot directly read and waits for a privileged executor to run the workflow.

## Authoritative Sources

- [September 3 topic collector source](../../../raw/processed/2026-09-03/ai-security-wiki-topic-news-collector-2026-09-03T233104Z.json)
- [NVD CVE-2026-85166](https://nvd.nist.gov/vuln/detail/CVE-2026-85166)
- [CVE-2026-85166 direct CVE record](https://cveawg.mitre.org/api/cve/CVE-2026-85166)
- [GitHub advisory GHSA-4r56-g65c-fm83](https://github.com/n8n-io/n8n/security/advisories/GHSA-4r56-g65c-fm83)
- [VulnCheck n8n Workflow Tool advisory](https://www.vulncheck.com/advisories/n8n-before-2.36.2-credential-exfiltration-via-workflow-tool-node)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [n8n AI Agent Project Viewer privilege escalation](n8n-ai-agent-project-viewer-privilege-escalation.md)
- [MCP tool-level IAM authorization](../identity-and-access/mcp-tool-level-iam-authorization.md)
- [MCP data movement exposure controls](../data-and-privacy/mcp-data-movement-exposure-controls.md)

## Open Questions

- Which shared workflow patterns and API roles can create inline Workflow Tool nodes in deployed n8n environments?

## Maintenance Notes

- Created on 2026-09-03 from the [September 3 topic collector](../../../raw/processed/2026-09-03/ai-security-wiki-topic-news-collector-2026-09-03T233104Z.json) as a credential-ownership leaf after routing broad n8n product context upstream.
