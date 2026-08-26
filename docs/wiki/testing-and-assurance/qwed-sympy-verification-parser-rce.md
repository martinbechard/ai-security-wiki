---
type: "Topic"
title: "QWED SymPy Verification Parser RCE"
description: "Security analysis for QWED-MCP and QWED verification SymPy parse_expr remote-code-execution advisories."
tags: ["testing-and-assurance", "infrastructure-and-supply-chain", "agent-and-tool-security"]
---

# QWED SymPy Verification Parser RCE

## Current Understanding

The [August 25 topic news collector source](../../../raw/processed/2026-08-25/ai-security-wiki-topic-news-collector-2026-08-25T183709Z.json) and [August 25 late topic news collector source](../../../raw/processed/2026-08-25/ai-security-wiki-topic-news-collector-2026-08-25T233059Z.json) record two QWED SymPy parser advisories. Broad QWED product and deterministic-verification practice belongs upstream; this page owns the local security-assurance control-plane execution boundary.

[CVE-2026-55546](https://nvd.nist.gov/vuln/detail/CVE-2026-55546) affects QWED-MCP before the [0.2.1 release](https://github.com/QWED-AI/qwed-mcp/releases/tag/v0.2.1), where attacker-controlled expression strings reached SymPy `parse_expr` without restricted globals or AST validation. [CVE-2026-55585](https://nvd.nist.gov/vuln/detail/CVE-2026-55585) affects QWED/qwed-verification before 5.1.2, where tenant-supplied math verification expressions and batch jobs flowed into the same unsafe parsing pattern; default signup could issue ordinary tenant API keys according to the [GitHub advisory](https://github.com/QWED-AI/qwed-verification/security/advisories/GHSA-q27q-98j4-9pfv). The two advisories are kept together because the reusable security lesson is the same parser boundary across MCP and API verification surfaces, while affected package/version details remain distinct.

## Security Impact

- Threat: a verification or evaluation gateway can execute arbitrary Python code while processing untrusted math expressions.
- Affected boundary: QWED-MCP before 0.2.1 and qwed-verification before 5.1.2; CVE-2026-55546 is CRITICAL 9.8 and CVE-2026-55585 is HIGH 8.8 in the collector evidence.
- Exploit or incident status: public vulnerability advisories; no local in-the-wild exploitation evidence is recorded.
- Mitigation state: upgrade QWED-MCP to 0.2.1 or later and qwed-verification/QWED to 5.1.2 or later; use sandboxed parsing namespaces and AST allowlists for expression evaluation.
- Confidence: high for advisory identity, affected packages, and fixed versions from NVD/GitHub evidence.
- Residual risk: assurance systems often run near prompts, model outputs, datasets, and release gates, so compromise can corrupt both execution hosts and audit evidence.

## Control Implications

- Treat evaluation parsers as privileged execution surfaces, not neutral validators.
- Replace dynamic expression evaluation with constrained parsers or symbolic engines configured with restricted namespaces.
- Keep tenant identity, input source, parser mode, package version, and execution sandbox evidence in evaluation audit logs.

## Authoritative Sources

- [August 25 topic news collector source](../../../raw/processed/2026-08-25/ai-security-wiki-topic-news-collector-2026-08-25T183709Z.json)
- [August 25 late topic news collector source](../../../raw/processed/2026-08-25/ai-security-wiki-topic-news-collector-2026-08-25T233059Z.json)
- [NVD CVE-2026-55546](https://nvd.nist.gov/vuln/detail/CVE-2026-55546)
- [NVD CVE-2026-55585](https://nvd.nist.gov/vuln/detail/CVE-2026-55585)
- [QWED-MCP 0.2.1 release](https://github.com/QWED-AI/qwed-mcp/releases/tag/v0.2.1)
- [QWED verification advisory GHSA-q27q-98j4-9pfv](https://github.com/QWED-AI/qwed-verification/security/advisories/GHSA-q27q-98j4-9pfv)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [testing and assurance](index.md)
- [evaluation platform control plane RCE](evaluation-platform-control-plane-rce.md)
- [AI-generated code security assurance](ai-generated-code-security-assurance.md)

## Open Questions

- Are QWED-MCP and qwed-verification deployed together often enough that one compromised parser surface implies cross-service compromise?

## Maintenance Notes

- Created on 2026-08-26 from the [August 25 collectors](../../../raw/processed/2026-08-25/ai-security-wiki-topic-news-collector-2026-08-25T233059Z.json) as a shared verification-parser RCE leaf with separate CVE/version details.
