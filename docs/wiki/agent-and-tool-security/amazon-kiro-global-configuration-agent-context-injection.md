---
type: "Topic"
title: "Amazon Kiro Global Configuration Agent Context Injection"
description: "Security analysis for CVE-2026-95985, where untrusted repository instructions could cause Kiro to modify auto-loaded global agent configuration."
tags: ["agent-and-tool-security", "infrastructure-and-supply-chain"]
---

# Amazon Kiro Global Configuration Agent Context Injection

## Current Understanding

The [September 24 topic collector source](../../../raw/processed/2026-09-24/ai-security-wiki-topic-news-collector-2026-09-24T233211Z.json) records [CVE-2026-95985](https://cveawg.mitre.org/api/cve/CVE-2026-95985) for Amazon Kiro IDE before 1.0.242 on macOS, Windows, and Linux. Broad Amazon Kiro product context and coding-agent workspace practice belongs upstream; this page owns the local boundary where an untrusted repository can influence persistent global agent context.

The issue is separate from [Amazon Kiro Powers prompt injection exfiltration](amazon-kiro-powers-prompt-injection-exfiltration.md). Here, crafted instructions in an untrusted repository could cause agent modifications to auto-loaded global configuration paths, injecting content into future Kiro agent sessions.

## Security Impact

- Threat: a repository can persist instructions into global agent context and affect future workspaces beyond the original trust boundary.
- Affected boundary: Amazon Kiro IDE before 1.0.242, global configuration paths, repository instructions, and auto-loaded agent context on macOS, Windows, and Linux.
- Exploit or incident status: public CVE, NVD, AWS security bulletin, and Kiro changelog evidence; no local in-the-wild exploitation evidence is recorded.
- Mitigation state: upgrade to Kiro IDE 1.0.242 or later; prevent untrusted workspace instructions from writing global agent configuration without explicit review; users who ran earlier Kiro versions in untrusted workspaces should review `~/.kiro` for entries they did not create.
- Confidence: high for affected version and platform scope from AWS and CVE evidence; medium for exact write path details until patch internals are reviewed.
- Residual risk: coding-agent global instructions are a supply-chain surface because they can outlive a single repository checkout.

## Authoritative Sources

- [September 24 topic collector source](../../../raw/processed/2026-09-24/ai-security-wiki-topic-news-collector-2026-09-24T233211Z.json)
- [CVE-2026-95985 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-95985)
- [NVD CVE-2026-95985](https://nvd.nist.gov/vuln/detail/CVE-2026-95985)
- [AWS security bulletin 2026-117](https://aws.amazon.com/security/security-bulletins/2026-117-aws/)
- [Kiro IDE 1.0.242 changelog](https://kiro.dev/changelog/ide/1-0-242/)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [Amazon Kiro Powers prompt injection exfiltration](amazon-kiro-powers-prompt-injection-exfiltration.md)
- [coding agent command approval boundaries](coding-agent-command-approval-boundaries.md)
- [AI development workstation containment](../infrastructure-and-supply-chain/ai-development-workstation-containment.md)

## Open Questions

- Which Kiro global configuration files were writable through this issue, and does the fix add provenance prompts, write denials, or path-specific controls?

## Maintenance Notes

- Created on 2026-09-25 from the [September 24 topic collector source](../../../raw/processed/2026-09-24/ai-security-wiki-topic-news-collector-2026-09-24T233211Z.json); maintain this as persistent agent-context integrity, not broad Kiro product behavior.
- Updated on 2026-09-26 from the leaf-watch source to preserve the post-exposure `~/.kiro` review guidance from the CVE record.
