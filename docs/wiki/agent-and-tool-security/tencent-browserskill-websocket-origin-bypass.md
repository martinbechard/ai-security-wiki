---
type: "Topic"
title: "Tencent BrowserSkill WebSocket origin bypass"
description: "Security analysis for CVE-2026-94111 local WebSocket origin validation bypass in Tencent BrowserSkill."
tags: ["agent-and-tool-security", "infrastructure-and-supply-chain"]
---

# Tencent BrowserSkill WebSocket origin bypass

## Current Understanding

The [September 20 topic collector source](../../../raw/processed/2026-09-20/ai-security-wiki-topic-news-collector-2026-09-20T233226Z.json) records [CVE-2026-94111](https://cveawg.mitre.org/api/cve/CVE-2026-94111) for Tencent BrowserSkill through 0.3.0; local daemon WebSocket browser-client origin validation. Broad BrowserSkill and browser-agent product context belongs upstream; this page owns the local security boundary, exploit status, mitigation state, and residual risk.

The browser-agent local daemon trusts browser-extension origins too broadly, so a malicious, compromised, or inadvertently installed browser extension can open the localhost WebSocket connection to a privileged browser skill service. The source classifies the evidence as cve services primary record with issue, code, and vulncheck advisory references and records visible publication at 2026-09-20T11:56:07.027Z.

## Security Impact

- Threat: Browser agents depend on faithful page state and screenshots; a malicious extension accepted as a client can alter the agent's perception and actions at the browser-control boundary.
- Affected boundary: Tencent BrowserSkill through 0.3.0; local daemon WebSocket browser-client origin validation.
- Exploit or incident status: public vulnerability disclosure; no local in-the-wild incident is recorded.
- Mitigation state: upgrade when a fixed BrowserSkill release is available, bind local daemons to unpredictable session tokens, validate Origin strictly, and avoid ambient browser-to-localhost authority.
- Confidence: High confidence from CVE text and code reference; remediation version is not identified in the captured record.
- Residual risk: agent-exposed tool and model-runtime boundaries remain sensitive when tool inputs, model artifacts, or local daemon channels can cross into host authority.

## Authoritative Sources

- [September 20 topic collector source](../../../raw/processed/2026-09-20/ai-security-wiki-topic-news-collector-2026-09-20T233226Z.json)
- [CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-94111)
- [NVD record](https://nvd.nist.gov/vuln/detail/CVE-2026-94111)
- [GitHub issue](https://github.com/Tencent/BrowserSkill/issues/273)
- [https://github.com/Tencent/BrowserSkill/blob/cli-v0.3.0/crates/bsk-cli/src/daemon/ws.rs#L36-L57](https://github.com/Tencent/BrowserSkill/blob/cli-v0.3.0/crates/bsk-cli/src/daemon/ws.rs#L36-L57)
- [VulnCheck advisory](https://www.vulncheck.com/advisories/tencent-browserskill-through-0.3.0-origin-validation-error-in-local-websocket-daemon)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [MCP shell command policy bypasses](mcp-shell-command-policy-bypasses.md)
- [Agent tool filesystem path containment](../infrastructure-and-supply-chain/agent-tool-filesystem-path-containment.md)

## Open Questions

- What BrowserSkill release fixes the origin validation bypass after 0.3.0?

## Maintenance Notes

- Created on 2026-09-20 from the [September 20 topic collector source](../../../raw/processed/2026-09-20/ai-security-wiki-topic-news-collector-2026-09-20T233226Z.json) after upstream routing kept broad entity context in sibling wikis and local ownership on the security boundary.
