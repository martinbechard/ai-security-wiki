---
type: "Topic"
title: "mini-swe-agent Bubblewrap Environment Secret Exposure"
description: "Security analysis for CVE-2026-108592 host environment secret inheritance in mini-swe-agent sandboxes."
tags: ["data-and-privacy"]
---

# mini-swe-agent Bubblewrap Environment Secret Exposure

## Current Understanding

The [October 10 topic collector source](../../../raw/processed/2026-10-10/ai-security-wiki-topic-news-collector-2026-10-10T232615Z.json) records [CVE-2026-108592](https://cveawg.mitre.org/api/cve/CVE-2026-108592) for mini-swe-agent 1.10.0 through 2.4.6. General coding-agent practice belongs in ai-dev-wiki; this page owns credential isolation and prompt-injection exfiltration boundaries.

The affected `BubblewrapEnvironment` invokes `bwrap` without `--clearenv`, so host environment variables remain visible inside task execution. Prompt-injected task content can cause the agent to read API keys from inherited environment variables and exfiltrate them over the shared network.

## Security Impact

- Threat: sandboxed coding-agent tasks can inherit and exfiltrate host API keys.
- Affected boundary: mini-swe-agent 1.10.0 through 2.4.6, BubblewrapEnvironment, host environment variables, shared network egress, and prompt-injected task content.
- Exploit or incident status: public CVE Services and NVD evidence; no confirmed exploitation incident is recorded locally.
- Mitigation state: clear the environment before sandbox entry, pass only explicit allowlisted variables, isolate network egress, and rotate exposed credentials.
- Confidence: high for the secret-inheritance boundary from CVE evidence.
- Residual risk: agent sandboxes need explicit environment and network policy because prompt injection can turn ambient credentials into exfiltration payloads.

## Authoritative Sources

- [October 10 topic collector source](../../../raw/processed/2026-10-10/ai-security-wiki-topic-news-collector-2026-10-10T232615Z.json)
- [CVE-2026-108592 record](https://cveawg.mitre.org/api/cve/CVE-2026-108592)
- [NVD CVE-2026-108592](https://nvd.nist.gov/vuln/detail/CVE-2026-108592)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [data and privacy](index.md)
- [development agent credential isolation](../identity-and-access/development-agent-credential-isolation.md)
- [AI development workstation containment](../infrastructure-and-supply-chain/ai-development-workstation-containment.md)

## Open Questions

- No open wiki questions are recorded for this topic.

## Maintenance Notes

- Created on 2026-10-11 from the [October 10 topic collector source](../../../raw/processed/2026-10-10/ai-security-wiki-topic-news-collector-2026-10-10T232615Z.json) after upstream index routing kept broad product and framework context outside the local security wiki.
