---
type: "Topic"
title: "Ray Browser-Triggered AI Compute RCE"
description: "Security analysis for CISA KEV CVE-2025-62593 browser-triggered remote code execution in Ray AI compute."
tags: ["infrastructure-and-supply-chain", "threats-and-attacks"]
---

# Ray Browser-Triggered AI Compute RCE

## Current Understanding

The [August 17 topic news collector source](../../../raw/processed/2026-08-17/ai-security-wiki-topic-news-collector-2026-08-17T233246Z.json) records CISA adding CVE-2025-62593 to the Known Exploited Vulnerabilities catalog on 2026-08-17. Broad Ray framework context belongs in the upstream AI wiki; this page owns the local active-exploitation and AI development infrastructure exposure lens.

[NVD](https://nvd.nist.gov/vuln/detail/CVE-2025-62593) describes Ray before 2.52.0 as an AI compute engine with an insufficient browser-attack guard based on the User-Agent header. Combined with DNS rebinding, a malicious site or advertisement can reach a developer-run Ray service through Firefox or Safari and trigger remote code execution. [CISA KEV evidence](https://www.cisa.gov/known-exploited-vulnerabilities-catalog?field_cve=CVE-2025-62593) records exploitation as active and technical impact as total.

The issue is locally important because AI compute and evaluation infrastructure often runs on developer workstations, lab clusters, or notebook-adjacent services that users assume are local. Browser-origin paths break that assumption: a web page can become an attack path into a local or reachable AI runtime.

The [August 19 leaf update watch source](../../../raw/processed/2026-08-18/ai-security-wiki-leaf-update-watch-20260819T000420Z.json) adds secondary [SecurityAffairs coverage](https://securityaffairs.com/197419/security/u-s-cisa-adds-a-ray-project-ray-flaw-to-its-known-exploited-vulnerabilities-catalog.html) of the CISA KEV entry and quoted Aviatrix analysis. Treat the added privilege-escalation, lateral-movement, command-and-control, data-exfiltration, and disruption effects as post-exploitation risk framing, not as a replacement for the CISA active-exploitation fact.

## Security Impact

- Threat: browser-origin DNS rebinding can reach and exploit developer-run AI compute services.
- Affected boundary: Ray before 2.52.0, especially developer-run or exposed Ray instances reachable from browser contexts.
- Exploit or incident status: CISA KEV active exploitation as of 2026-08-17.
- Mitigation state: patch to Ray 2.52.0 or later, restrict Ray service bind addresses, block browser-origin access, and audit exposed AI compute endpoints.
- Confidence: high for KEV addition, active exploitation flag, affected version, and patch reference from CISA, NVD, and vendor advisory references.
- Residual risk: teams need inventory of local Ray services and browser-reachable development endpoints because patching package versions alone may miss running services.

## Authoritative Sources

- [August 17 topic news collector source](../../../raw/processed/2026-08-17/ai-security-wiki-topic-news-collector-2026-08-17T233246Z.json)
- [August 19 leaf update watch source](../../../raw/processed/2026-08-18/ai-security-wiki-leaf-update-watch-20260819T000420Z.json)
- CISA KEV catalog entry: https://www.cisa.gov/known-exploited-vulnerabilities-catalog?field_cve=CVE-2025-62593
- NVD CVE-2025-62593: https://nvd.nist.gov/vuln/detail/CVE-2025-62593
- Ray advisory GHSA-q279-jhrf-cc6v: https://github.com/ray-project/ray/security/advisories/GHSA-q279-jhrf-cc6v

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [AI development workstation containment](ai-development-workstation-containment.md)
- [Agentic browser intent collision](../agent-and-tool-security/agentic-browser-intent-collision.md)
- Upstream AI wiki owns broad Ray framework context.

## Open Questions

- Which local inventories can prove that developer-run Ray services are patched, bound safely, or unreachable from browser-origin DNS rebinding paths?

## Maintenance Notes

- Created on 2026-08-17 from the August 17 topic collector after CISA KEV added CVE-2025-62593.
- Updated on 2026-08-19 from the August 19 leaf watcher with secondary post-exploitation risk framing while retaining CISA as the exploitation authority.
