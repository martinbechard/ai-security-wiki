---
type: "Topic"
title: "browser-use web-ui Cleartext LLM API Key Storage"
description: "Security analysis for CVE-2026-82640 browser-use web-ui cleartext provider-key storage."
tags: ["data-and-privacy", "identity-and-access"]
---

# browser-use web-ui Cleartext LLM API Key Storage

## Current Understanding

The [August 30 topic collector source](../../../raw/processed/2026-08-30/ai-security-wiki-topic-news-collector-2026-08-30T233055Z.json) records [CVE-2026-82640](https://nvd.nist.gov/vuln/detail/CVE-2026-82640) for browser-use web-ui 2.0.0 through 3.0.0. [Browser Use](../../../upstream-ai-wiki/agentic-frameworks/browser-use.md) product context belongs in the upstream AI wiki; this page owns the local provider-key storage boundary.

NVD and the [VulnCheck advisory](https://www.vulncheck.com/advisories/browser-use-web-ui-2.0.0-through-3.0.0-cleartext-api-key-storage) say configured LLM API keys were written to predictably named JSON files without encryption or access restrictions. An attacker with local read access to the temporary settings directory could recover provider keys used by the browser agent.

## Security Impact

- Threat: local filesystem access can recover LLM provider keys and transfer autonomous browser-agent authority.
- Affected boundary: browser-use web-ui 2.0.0 through 3.0.0 temporary settings storage for configured LLM API keys.
- Exploit or incident status: public vulnerability disclosure; no local exploitation incident is recorded.
- Mitigation state: avoid cleartext provider-key persistence, restrict settings-directory permissions, rotate exposed keys, and prefer secret stores or short-lived scoped credentials.
- Confidence: high for vulnerability identity and affected range from NVD and VulnCheck; medium for remediation because the collector did not capture a fixed release.
- Residual risk: browser agents often combine model keys with web session state, so local key disclosure can become both spend abuse and cross-site action authority.

## Control Implications

- Treat provider keys as delegated action and cost authority, not just configuration.
- Keep browser-agent settings outside shared temporary directories when secrets are present.
- Require key rotation evidence after any runtime filesystem exposure.

## Authoritative Sources

- [August 30 topic collector source](../../../raw/processed/2026-08-30/ai-security-wiki-topic-news-collector-2026-08-30T233055Z.json)
- [NVD CVE-2026-82640](https://nvd.nist.gov/vuln/detail/CVE-2026-82640)
- [VulnCheck advisory](https://www.vulncheck.com/advisories/browser-use-web-ui-2.0.0-through-3.0.0-cleartext-api-key-storage)
- [browser-use web-ui issue 736](https://github.com/browser-use/web-ui/issues/736)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [data and privacy](index.md)
- [identity and access](../identity-and-access/index.md)
- [browser-use web-ui artifact path containment](../infrastructure-and-supply-chain/browser-use-web-ui-artifact-path-containment.md)

## Open Questions

- Which browser-use web-ui release first removes cleartext provider-key persistence or constrains the temporary settings directory?

## Maintenance Notes

- Created on 2026-08-30 from the [August 30 topic collector](../../../raw/processed/2026-08-30/ai-security-wiki-topic-news-collector-2026-08-30T233055Z.json) as a browser-agent provider-key storage leaf.
