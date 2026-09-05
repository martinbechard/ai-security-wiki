---
type: "Topic"
title: "LaVague Indirect Prompt Injection RCE"
description: "Security analysis for CVE-2026-85694 model-output Python execution in LaVague."
tags: ["model-and-prompt-security", "agent-and-tool-security"]
---

# LaVague Indirect Prompt Injection RCE

## Current Understanding

The [September 4 topic collector source](../../../raw/processed/2026-09-04/ai-security-wiki-topic-news-collector-2026-09-04T233156Z.json) records CVE-2026-85694 for LaVague 0.2.35. General LaVague framework coverage belongs upstream; this page owns indirect prompt-injection, model-output trust, and host-code execution implications.

[CVE-2026-85694](https://cveawg.mitre.org/api/cve/CVE-2026-85694), [NVD](https://nvd.nist.gov/vuln/detail/CVE-2026-85694), and the linked [VulnCheck advisory](https://www.vulncheck.com/advisories/lavague-0.2.35-remote-code-execution-via-eval-extraction) describe `PythonFromMarkdownExtractor.extract_as_object` evaluating untrusted model output derived from web content. A malicious web page can indirectly prompt the model to produce Python that executes on the operator's host without review.

## Security Impact

- Threat: indirect prompt injection turns web content into executable Python through model-output parsing.
- Affected boundary: LaVague 0.2.35 `PythonFromMarkdownExtractor`.
- Exploit or incident status: public CVE and advisory; no local exploitation evidence is recorded.
- Mitigation state: do not evaluate model output as Python, and require typed parsers or sandboxed review for generated objects.
- Confidence: high for execution path from CVE, NVD, public issue, and advisory evidence.
- Residual risk: browser agents that convert arbitrary pages into structured objects can inherit hostile page instructions as code-adjacent data.

## Authoritative Sources

- [September 4 topic collector source](../../../raw/processed/2026-09-04/ai-security-wiki-topic-news-collector-2026-09-04T233156Z.json)
- [CVE-2026-85694](https://cveawg.mitre.org/api/cve/CVE-2026-85694)
- [NVD CVE-2026-85694](https://nvd.nist.gov/vuln/detail/CVE-2026-85694)
- [VulnCheck advisory](https://www.vulncheck.com/advisories/lavague-0.2.35-remote-code-execution-via-eval-extraction)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [model and prompt security](index.md)
- [Langfun Python protocol model-output RCE](langfun-python-protocol-model-output-rce.md)

## Open Questions

- Which LaVague release removes or contains `extract_as_object` Python evaluation for untrusted web-derived outputs?

## Maintenance Notes

- Created on 2026-09-04 from the [September 4 topic collector source](../../../raw/processed/2026-09-04/ai-security-wiki-topic-news-collector-2026-09-04T233156Z.json).
