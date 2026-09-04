---
type: "Topic"
title: "Windows ML CLI Localhost Trust Remote Code RCE"
description: "Security analysis for CVE-2026-84452 Windows ML CLI unauthenticated localhost API and trust_remote_code remote code execution."
tags: ["infrastructure-and-supply-chain", "model-and-prompt-security"]
---

# Windows ML CLI Localhost Trust Remote Code RCE

## Current Understanding

The [September 2 topic collector source](../../../raw/processed/2026-09-02/ai-security-wiki-topic-news-collector-2026-09-02T233120Z.json) records [CVE-2026-84452](https://nvd.nist.gov/vuln/detail/CVE-2026-84452) for Windows ML CLI before 0.4.0. Broad Windows ML product and local model-building workflow context belongs upstream; this page owns the local security boundary where a browser origin can drive a localhost AI runtime API into loading attacker-controlled model code.

[NVD](https://nvd.nist.gov/vuln/detail/CVE-2026-84452) says Windows ML CLI exposes CLI commands through a localhost HTTP API without authentication and allows wildcard CORS origins. A malicious website can send cross-origin requests to build or config endpoints, set `trust_remote_code` to true, and reach `AutoConfig.from_pretrained` with remote-code trust enabled.

The [September 3 leaf update watch source](../../../raw/processed/2026-09-03/ai-security-wiki-leaf-update-watch-20260904T000442Z.json) adds [direct CVE update evidence](https://cveawg.mitre.org/api/cve/CVE-2026-84452) and the Microsoft advisory reference [GHSA-96p9-rh4f-92cf](https://github.com/microsoft/winml-cli/security/advisories/GHSA-96p9-rh4f-92cf). It confirms 0.4.0 as the fixed version and keeps the control focus on loopback authentication, restricted CORS, and model-code trust configuration.

## Security Impact

- Threat: a malicious website can control a local model-building API and cause remote Python code import.
- Affected boundary: Windows ML CLI before 0.4.0; localhost HTTP API; wildcard CORS; `trust_remote_code` model loading.
- Exploit or incident status: public NVD vulnerability record; no local incident is recorded.
- Mitigation state: upgrade to 0.4.0 or later, require localhost API authentication, restrict CORS origins, and disable remote-code trust for untrusted model repositories.
- Confidence: high from in-window NVD/CVE publication and Microsoft advisory references.
- Residual risk: localhost control planes for AI developer tools are browser-reachable unless origin, token, and command-scope controls are explicit.

## Control Implications

- Treat local AI runtime APIs as network services, even when bound to loopback.
- Require explicit user mediation before a browser page can modify model-loading configuration.
- Keep remote model-code trust disabled by default and scoped to verified repositories.

## Authoritative Sources

- [September 2 topic collector source](../../../raw/processed/2026-09-02/ai-security-wiki-topic-news-collector-2026-09-02T233120Z.json)
- [September 3 leaf update watch source](../../../raw/processed/2026-09-03/ai-security-wiki-leaf-update-watch-20260904T000442Z.json)
- [NVD CVE-2026-84452](https://nvd.nist.gov/vuln/detail/CVE-2026-84452)
- [Microsoft advisory GHSA-96p9-rh4f-92cf](https://github.com/microsoft/winml-cli/security/advisories/GHSA-96p9-rh4f-92cf)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [AI development workstation containment](ai-development-workstation-containment.md)
- [Hugging Face Transformers trust_remote_code cache write](huggingface-transformers-trust-remote-code-cache-write.md)

## Open Questions

- Which local Windows ML CLI installations expose browser-reachable localhost APIs before 0.4.0?

## Maintenance Notes

- Created on 2026-09-02 from the [September 2 topic collector](../../../raw/processed/2026-09-02/ai-security-wiki-topic-news-collector-2026-09-02T233120Z.json) as a localhost-control-plane and model-code trust boundary.
- Updated on 2026-09-03 from the [September 3 leaf update watch](../../../raw/processed/2026-09-03/ai-security-wiki-leaf-update-watch-20260904T000442Z.json) with Microsoft advisory evidence and fixed-version confirmation.
