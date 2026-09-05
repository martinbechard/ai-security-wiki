---
type: "Topic"
title: "Xinference Auto Register File Read"
description: "Security analysis for CVE-2026-85668 arbitrary local model-path reads in Xinference."
tags: ["infrastructure-and-supply-chain", "data-and-privacy"]
---

# Xinference Auto Register File Read

## Current Understanding

The [September 4 topic collector source](../../../raw/processed/2026-09-04/ai-security-wiki-topic-news-collector-2026-09-04T233156Z.json) records CVE-2026-85668 for Xinference v3.x at commit `4a94832`. Broad Xinference runtime coverage belongs upstream; this page owns model-registration path containment and local-file disclosure.

[CVE-2026-85668](https://cveawg.mitre.org/api/cve/CVE-2026-85668) and [NVD](https://nvd.nist.gov/vuln/detail/CVE-2026-85668) describe an unauthenticated arbitrary-path file read through `POST /v1/models/llm/auto-register`. The endpoint accepts a caller-supplied `model_path`, reads model configuration files such as `config.json`, `tokenizer_config.json`, and `chat_template.jinja`, and reflects parsed content back to the caller.

## Security Impact

- Threat: model-registration helpers can become arbitrary local-file readers.
- Affected boundary: Xinference v3.x at commit `4a94832` auto-register endpoint.
- Exploit or incident status: public CVE; no local exploitation evidence is recorded.
- Mitigation state: authenticate model registration, restrict paths to approved model roots, and avoid reflecting file contents before trust checks.
- Confidence: high for endpoint and file classes from direct CVE evidence.
- Residual risk: model directories often contain templates, tokens, local paths, or deployment metadata that were not intended for remote disclosure.

## Authoritative Sources

- [September 4 topic collector source](../../../raw/processed/2026-09-04/ai-security-wiki-topic-news-collector-2026-09-04T233156Z.json)
- [CVE-2026-85668](https://cveawg.mitre.org/api/cve/CVE-2026-85668)
- [NVD CVE-2026-85668](https://nvd.nist.gov/vuln/detail/CVE-2026-85668)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [agent tool filesystem path containment](agent-tool-filesystem-path-containment.md)

## Open Questions

- Which released Xinference version contains the path-containment fix for CVE-2026-85668?

## Maintenance Notes

- Created on 2026-09-04 from the [September 4 topic collector source](../../../raw/processed/2026-09-04/ai-security-wiki-topic-news-collector-2026-09-04T233156Z.json).
