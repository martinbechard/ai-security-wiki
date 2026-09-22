---
type: "Topic"
title: "MaxKB Model Parameter Form Cross-Workspace Write"
description: "Security analysis for CVE-2026-77523 cross-workspace model parameter form read/write in MaxKB."
tags: ["identity-and-access", "infrastructure-and-supply-chain"]
---

# MaxKB Model Parameter Form Cross-Workspace Write

## Current Understanding

The [September 21 topic collector source](../../../raw/processed/2026-09-21/ai-security-wiki-topic-news-collector-2026-09-21T233156Z.json) records [CVE-2026-77523](https://cveawg.mitre.org/api/cve/CVE-2026-77523) for MaxKB 2.10.3-lts and earlier. Broad MaxKB product context belongs upstream; this page owns workspace scoping for model parameter defaults.

The model parameter form route authorizes the path workspace, but `ModelSerializer.ModelParams` loads and saves a `Model` by ID alone without including `workspace_id` in the query. An authenticated user with model read permission in an attacker-controlled workspace can supply a known victim `model_id` to read or overwrite the victim's `model_params_form` in another workspace, potentially altering workflows that use those defaults. No fixed version was available in the captured record.

## Security Impact

- Threat: model parameter defaults can be read or overwritten across workspace boundaries.
- Affected boundary: MaxKB 2.10.3-lts and earlier; model parameter form route and model lookup.
- Exploit or incident status: public GitHub advisory; no local exploitation evidence is recorded.
- Mitigation state: no fixed version identified; bind model lookups to the authorized workspace and audit unexpected model parameter changes.
- Confidence: high for advisory existence and affected range; fixed-version confidence is unavailable.
- Residual risk: model defaults influence downstream assistant behavior and workflow execution even when the write path is not a direct tool call.

## Authoritative Sources

- [September 21 topic collector source](../../../raw/processed/2026-09-21/ai-security-wiki-topic-news-collector-2026-09-21T233156Z.json)
- [CVE-2026-77523 JSON](https://cveawg.mitre.org/api/cve/CVE-2026-77523)
- [GitHub advisory GHSA-g888-8cvh-9284](https://github.com/1Panel-dev/MaxKB/security/advisories/GHSA-g888-8cvh-9284)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [infrastructure and supply chain](../infrastructure-and-supply-chain/index.md)

## Open Questions

- Which MaxKB release fixes CVE-2026-77523?

## Maintenance Notes

- Created on 2026-09-21 from the [September 21 topic collector source](../../../raw/processed/2026-09-21/ai-security-wiki-topic-news-collector-2026-09-21T233156Z.json).
