---
type: "Topic"
title: "FastChat Worker Registration SSRF Model Spoofing"
description: "Security analysis for CVE-2026-85695 unauthenticated FastChat worker registration."
tags: ["agent-and-tool-security", "data-and-privacy"]
---

# FastChat Worker Registration SSRF Model Spoofing

## Current Understanding

The [September 4 topic collector source](../../../raw/processed/2026-09-04/ai-security-wiki-topic-news-collector-2026-09-04T233156Z.json) records CVE-2026-85695 for FastChat. Broad model-serving framework coverage belongs upstream; this page owns worker identity, model spoofing, SSRF, and prompt confidentiality.

[CVE-2026-85695](https://cveawg.mitre.org/api/cve/CVE-2026-85695) and [NVD](https://nvd.nist.gov/vuln/detail/CVE-2026-85695) describe `/register_worker` accepting unauthenticated worker addresses. Attackers can register arbitrary endpoints, trigger SSRF, register malicious workers under victim model names, intercept prompts, images, and responses, or probe internal network ports across the worker mesh.

## Security Impact

- Threat: unauthenticated worker registration lets attackers impersonate model workers and redirect controller traffic.
- Affected boundary: FastChat worker-registration control plane.
- Exploit or incident status: public CVE; no local exploitation evidence is recorded.
- Mitigation state: authenticate workers, bind model names to trusted worker identities, and restrict controller egress to approved workers.
- Confidence: high for control-plane and data-exposure mechanics from direct CVE evidence.
- Residual risk: model-serving meshes often carry high-value prompts and images, so worker identity is both an availability and confidentiality boundary.

## Authoritative Sources

- [September 4 topic collector source](../../../raw/processed/2026-09-04/ai-security-wiki-topic-news-collector-2026-09-04T233156Z.json)
- [CVE-2026-85695](https://cveawg.mitre.org/api/cve/CVE-2026-85695)
- [NVD CVE-2026-85695](https://nvd.nist.gov/vuln/detail/CVE-2026-85695)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [agent network egress controls](agent-network-egress-controls.md)

## Open Questions

- Which FastChat release authenticates worker registration and how should existing deployments rotate worker trust?

## Maintenance Notes

- Created on 2026-09-04 from the [September 4 topic collector source](../../../raw/processed/2026-09-04/ai-security-wiki-topic-news-collector-2026-09-04T233156Z.json).
