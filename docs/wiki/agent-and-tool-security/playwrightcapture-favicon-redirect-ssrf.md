---
type: "Topic"
title: "PlaywrightCapture Favicon Redirect SSRF"
description: "Security analysis for CVE-2026-85242 redirect bypass of private-address SSRF checks in PlaywrightCapture."
tags: ["agent-and-tool-security", "infrastructure-and-supply-chain"]
---

# PlaywrightCapture Favicon Redirect SSRF

## Current Understanding

The [September 4 topic collector source](../../../raw/processed/2026-09-04/ai-security-wiki-topic-news-collector-2026-09-04T233156Z.json) records CVE-2026-85242 for PlaywrightCapture. Broad Playwright and capture tooling context belongs upstream; this page owns browser-agent SSRF redirect controls and private-network egress.

[CVE-2026-85242](https://cveawg.mitre.org/api/cve/CVE-2026-85242), [NVD](https://nvd.nist.gov/vuln/detail/CVE-2026-85242), and the [PlaywrightCapture fix commit](https://github.com/Lookyloo/PlaywrightCapture/commit/b912a04f7b190807b5e14e497048896bc5016fb9) describe `only_global_lookup` validating only the initial favicon URL. Because `aiohttp` follows redirects without revalidating each destination, attacker-controlled page content can point to a public favicon URL that redirects to localhost, loopback, or another non-public network resource.

## Security Impact

- Threat: redirect chains bypass private-address checks in browser/capture tooling.
- Affected boundary: PlaywrightCapture favicon retrieval when `only_global_lookup` is enabled.
- Exploit or incident status: public CVE and [PlaywrightCapture fix commit](https://github.com/Lookyloo/PlaywrightCapture/commit/b912a04f7b190807b5e14e497048896bc5016fb9); no local exploitation evidence is recorded.
- Mitigation state: revalidate every redirect destination after DNS resolution and before connecting.
- Confidence: high for redirect-bypass behavior from CVE, NVD, and the linked fix commit.
- Residual risk: browser automation can discover secondary URLs such as favicons, images, scripts, or redirects that were not the operator's visible target.

## Authoritative Sources

- [September 4 topic collector source](../../../raw/processed/2026-09-04/ai-security-wiki-topic-news-collector-2026-09-04T233156Z.json)
- [CVE-2026-85242](https://cveawg.mitre.org/api/cve/CVE-2026-85242)
- [NVD CVE-2026-85242](https://nvd.nist.gov/vuln/detail/CVE-2026-85242)
- [PlaywrightCapture fix commit](https://github.com/Lookyloo/PlaywrightCapture/commit/b912a04f7b190807b5e14e497048896bc5016fb9)

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

- Which PlaywrightCapture version first revalidates favicon redirects under `only_global_lookup`?

## Maintenance Notes

- Created on 2026-09-04 from the [September 4 topic collector source](../../../raw/processed/2026-09-04/ai-security-wiki-topic-news-collector-2026-09-04T233156Z.json).
