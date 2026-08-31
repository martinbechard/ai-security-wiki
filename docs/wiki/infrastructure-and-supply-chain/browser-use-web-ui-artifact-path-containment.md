---
type: "Topic"
title: "browser-use web-ui Artifact Path Containment"
description: "Security analysis for CVE-2026-82637 browser-use web-ui arbitrary recording and trace path creation."
tags: ["infrastructure-and-supply-chain", "agent-and-tool-security"]
---

# browser-use web-ui Artifact Path Containment

## Current Understanding

The [August 30 topic collector source](../../../raw/processed/2026-08-30/ai-security-wiki-topic-news-collector-2026-08-30T233055Z.json) records [CVE-2026-82637](https://nvd.nist.gov/vuln/detail/CVE-2026-82637) for browser-use web-ui 2.0.0 through 3.0.0. [Browser Use](../../../upstream-ai-wiki/agentic-frameworks/browser-use.md) product coverage belongs in the upstream AI wiki; this page owns the local browser-agent artifact path boundary.

NVD and the [VulnCheck advisory](https://www.vulncheck.com/advisories/browser-use-web-ui-2.0.0-through-3.0.0-arbitrary-directory-creation) say the unauthenticated Gradio `run_agent_task` path failed to validate browser settings paths. Attackers could supply absolute recording, trace, history, or download paths and create directories wherever the root-running container had write access.

## Security Impact

- Threat: unauthenticated agent-task submission can convert recording and trace configuration into host or container filesystem writes.
- Affected boundary: browser-use web-ui 2.0.0 through 3.0.0, `run_agent_task`, Gradio interface, recording, trace, history, and download directories.
- Exploit or incident status: public vulnerability database and advisory evidence; no local exploitation incident is recorded.
- Mitigation state: constrain configured artifact paths to an intended workspace, reject absolute paths, run containers as non-root, and require authentication before task execution.
- Confidence: high for the advisory and affected range from NVD and VulnCheck; medium for remediation because the collector did not capture a fixed release.
- Residual risk: browser-agent artifacts are often used as forensic evidence, so attacker-controlled artifact paths can undermine both containment and later incident reconstruction.

## Control Implications

- Apply [agent tool filesystem path containment](agent-tool-filesystem-path-containment.md) to recordings, traces, histories, and downloads.
- Treat browser-agent task settings as untrusted even when the UI is meant for local use.
- Verify resolved paths after joins, symlinks, and container mount translation.

## Authoritative Sources

- [August 30 topic collector source](../../../raw/processed/2026-08-30/ai-security-wiki-topic-news-collector-2026-08-30T233055Z.json)
- [NVD CVE-2026-82637](https://nvd.nist.gov/vuln/detail/CVE-2026-82637)
- [VulnCheck advisory](https://www.vulncheck.com/advisories/browser-use-web-ui-2.0.0-through-3.0.0-arbitrary-directory-creation)
- [browser-use web-ui issue 737](https://github.com/browser-use/web-ui/issues/737)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [agent tool filesystem path containment](agent-tool-filesystem-path-containment.md)
- [AI agent sandbox escape host file access](ai-agent-sandbox-escape-host-file-access.md)

## Open Questions

- Which browser-use web-ui release first constrains recording, trace, history, and download paths after CVE-2026-82637?

## Maintenance Notes

- Created on 2026-08-30 from the [August 30 topic collector](../../../raw/processed/2026-08-30/ai-security-wiki-topic-news-collector-2026-08-30T233055Z.json) as a browser-agent artifact containment leaf.
