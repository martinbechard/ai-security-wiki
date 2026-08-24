---
type: "Topic"
title: "FiftyOne Local AI Dataset Server Exposure"
description: "Security analysis for CVE-2026-53656 FiftyOne CORS and media-route local file-read exposure."
tags: ["data-and-privacy", "infrastructure-and-supply-chain"]
---

# FiftyOne Local AI Dataset Server Exposure

## Current Understanding

The [August 22 topic news collector source](../../../raw/processed/2026-08-22/ai-security-wiki-topic-news-collector-2026-08-22T233049Z.json) records CVE-2026-53656 for FiftyOne before 1.17.0. Broad visual AI dataset tooling context belongs upstream; this page owns the local privacy and workstation-exposure boundary for dataset servers running on developer or analyst machines.

The [NVD record](https://nvd.nist.gov/vuln/detail/CVE-2026-53656) says the unauthenticated local App/API server returned `Access-Control-Allow-Origin: *`, and the `/media` route accepted filesystem paths. A malicious website visited by the user could therefore read files accessible to the server and exfiltrate them. The collector records the fixed behavior as explicit `allowed_origins` configuration with same-origin defaults in FiftyOne 1.17.0.

## Security Impact

- Threat: a local AI dataset server can become a browser-origin file-read bridge when permissive CORS combines with filesystem-addressed media routes.
- Affected boundary: FiftyOne before 1.17.0 local unauthenticated App/API server and `/media` file serving.
- Exploit or incident status: public NVD record; no local exploitation evidence is recorded.
- Mitigation state: update to 1.17.0 or later, restrict allowed origins, avoid serving arbitrary filesystem paths, and keep local analysis servers off sensitive workstations.
- Confidence: medium-high because NVD and collector evidence identify the affected range and fix class; primary project advisory details were not captured.
- Residual risk: browser-accessible local AI tooling can expose datasets, prompts, credentials, notebooks, or model artifacts even without network-facing deployment.

## Authoritative Sources

- [August 22 topic news collector source](../../../raw/processed/2026-08-22/ai-security-wiki-topic-news-collector-2026-08-22T233049Z.json)
- [August 23 leaf update watch source](../../../raw/processed/2026-08-23/ai-security-wiki-leaf-update-watch-20260824T000259Z.json)
- [NVD CVE-2026-53656](https://nvd.nist.gov/vuln/detail/CVE-2026-53656)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [data and privacy](index.md)
- [AI development workstation containment](../infrastructure-and-supply-chain/ai-development-workstation-containment.md)
- [Ray browser-triggered AI compute RCE](../infrastructure-and-supply-chain/ray-browser-triggered-ai-compute-rce.md)

## Open Questions

- Which FiftyOne advisory or release note confirms the exact `/media` path-handling change in 1.17.0?

## Maintenance Notes

- Created on 2026-08-22 from the [August 22 topic news collector source](../../../raw/processed/2026-08-22/ai-security-wiki-topic-news-collector-2026-08-22T233049Z.json) as a local AI dataset server exposure leaf.
