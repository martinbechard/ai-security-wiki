---
type: "Topic"
title: "Stable Diffusion WebUI cmd-flags credential disclosure"
description: "Security analysis for CVE-2026-82288 Stable Diffusion WebUI cleartext auth flag exposure."
tags: ["data-and-privacy", "identity-and-access"]
---

# Stable Diffusion WebUI cmd-flags credential disclosure

## Current Understanding

The [August 28 topic collector source](../../../raw/processed/2026-08-28/ai-security-wiki-topic-news-collector-2026-08-28T233139Z.json) records [CVE-2026-82288](https://nvd.nist.gov/vuln/detail/CVE-2026-82288) for Stable Diffusion WebUI through 1.10.1. Broad model UI and local workbench context belongs upstream; this page owns the local configuration-introspection credential disclosure boundary.

## Security Impact

- Threat: unauthenticated access to `/sdapi/v1/cmd-flags` can expose parsed command-line arguments, including `gradio_auth` and `api_auth` values in cleartext.
- Affected boundary: Stable Diffusion WebUI through 1.10.1 command-flag introspection endpoint.
- Exploit or incident status: GitHub Advisory Database and NVD evidence; no local in-the-wild exploitation evidence is recorded.
- Mitigation state: restrict or remove credential-bearing introspection, rotate exposed credentials, and verify patched-version status from maintainer evidence.
- Confidence: medium-high for advisory existence and exposure path; medium for remediation because the advisory was unreviewed and patched version was unknown in the source.
- Residual risk: local model UIs often become shared workbenches, so debug endpoints can expose operational credentials even when model execution is treated as local-only.

## Authoritative Sources

- [August 28 topic collector source](../../../raw/processed/2026-08-28/ai-security-wiki-topic-news-collector-2026-08-28T233139Z.json)
- [GitHub advisory GHSA-75pm-v38f-v69m](https://github.com/advisories/GHSA-75pm-v38f-v69m)
- [NVD CVE-2026-82288](https://nvd.nist.gov/vuln/detail/CVE-2026-82288)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [data and privacy](index.md)
- [identity and access](../identity-and-access/index.md)

## Open Questions

- Which Stable Diffusion WebUI release removes or redacts auth flags from `/sdapi/v1/cmd-flags`?

## Maintenance Notes

- Created on 2026-08-29 from the [August 28 topic collector](../../../raw/processed/2026-08-28/ai-security-wiki-topic-news-collector-2026-08-28T233139Z.json) as a credential-disclosure leaf for AI workbench configuration endpoints.
