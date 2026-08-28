---
type: "Topic"
title: "QWED SymPy Verification Parser RCE"
description: "Security analysis for QWED-MCP and QWED verification SymPy parse_expr remote-code-execution advisories."
tags: ["testing-and-assurance", "infrastructure-and-supply-chain", "agent-and-tool-security"]
---

# QWED SymPy Verification Parser RCE

## Current Understanding

Two QWED SymPy parser advisories share this security-assurance control-plane execution boundary. Broad QWED product and deterministic-verification practice belongs upstream; this page owns the local risk that a validator or verification API can become a Python execution sink. The [August 25 topic news collector source](../../../raw/processed/2026-08-25/ai-security-wiki-topic-news-collector-2026-08-25T183709Z.json), [August 25 late topic news collector source](../../../raw/processed/2026-08-25/ai-security-wiki-topic-news-collector-2026-08-25T233059Z.json), and [August 27 leaf update watch source](../../../raw/processed/2026-08-27/ai-security-wiki-leaf-update-watch-20260828T000238Z.json) provide the current evidence.

[CVE-2026-55546](https://nvd.nist.gov/vuln/detail/CVE-2026-55546) affects QWED-MCP before the [0.2.1 release](https://github.com/QWED-AI/qwed-mcp/releases/tag/v0.2.1), where [`verify_math_expression()`](https://github.com/QWED-AI/qwed-mcp/blob/main/src/qwed_mcp/engines/math_engine.py) passes attacker-controlled expression and claimed-result strings to SymPy `parse_expr` after only normalizing caret syntax. The [August 27 leaf update watch source](../../../raw/processed/2026-08-27/ai-security-wiki-leaf-update-watch-20260828T000238Z.json) clarifies that exploitation requires a downstream integration that invokes this public library function with attacker-controlled input because the default MCP tool registry does not expose it.

[CVE-2026-55585](https://nvd.nist.gov/vuln/detail/CVE-2026-55585) affects QWED/qwed-verification before 5.1.2, where tenant-supplied math verification expressions and batch jobs flow into the same unsafe parsing pattern. The [GitHub advisory](https://github.com/QWED-AI/qwed-verification/security/advisories/GHSA-q27q-98j4-9pfv) and watcher source record two API paths:

- Direct math verification: [`src/qwed_new/api/main.py`](https://github.com/QWED-AI/qwed-verification/blob/main/src/qwed_new/api/main.py) accepts any valid tenant API key for `POST /verify/math`, reads the expression field, performs only cosmetic normalization, and passes the expression text to `parse_expr`.
- Batch verification: [`src/qwed_new/core/batch.py`](https://github.com/QWED-AI/qwed-verification/blob/main/src/qwed_new/core/batch.py) accepts math items through `POST /verify/batch`, stores `item.query` in a batch job, and later passes `VerificationType.MATH` input to `parse_expr` without sanitization.

Default signup and API-key issuance can make both paths reachable to ordinary tenants in shared deployments.

The two advisories are kept together because the reusable security lesson is the same parser boundary across MCP and API verification surfaces, while affected package/version details remain distinct.

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

- [August 27 leaf update watch source](../../../raw/processed/2026-08-27/ai-security-wiki-leaf-update-watch-20260828T000238Z.json)
- [CVE-2026-55546 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-55546)
- [CVE-2026-55585 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-55585)
- [August 25 topic news collector source](../../../raw/processed/2026-08-25/ai-security-wiki-topic-news-collector-2026-08-25T183709Z.json)
- [August 25 late topic news collector source](../../../raw/processed/2026-08-25/ai-security-wiki-topic-news-collector-2026-08-25T233059Z.json)
- [NVD CVE-2026-55546](https://nvd.nist.gov/vuln/detail/CVE-2026-55546)
- [NVD CVE-2026-55585](https://nvd.nist.gov/vuln/detail/CVE-2026-55585)
- [QWED-MCP 0.2.1 release](https://github.com/QWED-AI/qwed-mcp/releases/tag/v0.2.1)
- [QWED verification advisory GHSA-q27q-98j4-9pfv](https://github.com/QWED-AI/qwed-verification/security/advisories/GHSA-q27q-98j4-9pfv)

## Related Code

- [QWED-MCP `src/qwed_mcp/engines/math_engine.py`](https://github.com/QWED-AI/qwed-mcp/blob/main/src/qwed_mcp/engines/math_engine.py)
- [QWED verification `src/qwed_new/api/main.py`](https://github.com/QWED-AI/qwed-verification/blob/main/src/qwed_new/api/main.py)
- [QWED verification `src/qwed_new/core/batch.py`](https://github.com/QWED-AI/qwed-verification/blob/main/src/qwed_new/core/batch.py)

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

- Updated on 2026-08-28 with August 27 leaf-update evidence for CVE-2026-55546, CVE-2026-55585.
- Created on 2026-08-26 from the [August 25 collectors](../../../raw/processed/2026-08-25/ai-security-wiki-topic-news-collector-2026-08-25T233059Z.json) as a shared verification-parser RCE leaf with separate CVE/version details.
