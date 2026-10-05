---
type: "Topic"
title: "Zammad AI-Driven Zero-Day Breach"
description: "Security analysis for reported AI-driven exploitation of Zammad zero-days CVE-2026-102489 and CVE-2026-102490."
tags: ["threats-and-attacks", "incident-response", "agent-and-tool-security"]
---

# Zammad AI-Driven Zero-Day Breach

## Current Understanding

The [October 4 leaf update watch source](../../../raw/processed/2026-10-04/ai-security-wiki-leaf-update-watch-20261005T000246Z.json) records [BleepingComputer reporting](https://www.bleepingcomputer.com/news/security/divd-says-zammad-zero-days-enabled-ai-driven-network-breach/) that cites DIVD statements about an AI-driven breach through two Zammad zero-days, CVE-2026-102489 and CVE-2026-102490. Broad Zammad product background belongs upstream if needed; this page owns the local incident, autonomous attacker timing, and zero-day response boundary.

The captured report says the chain affected self-hosted Zammad/helpdesk deployments before version 7 and involved session hijacking, remote code execution, root escalation, privilege-escalation decisions, and exfiltration decisions in seconds. Because the raw source is secondary coverage, keep the technical mechanism and exact CVE boundaries open until DIVD primary advisories or Zammad records are captured.

## Security Impact

- Threat: an autonomous or AI-driven attacker can compress helpdesk zero-day exploitation, privilege escalation, and exfiltration decisions into an incident window too short for ordinary manual triage.
- Affected boundary: Zammad self-hosted/helpdesk deployments before version 7; CVE-2026-102489; CVE-2026-102490; session hijacking; remote code execution; root escalation; incident-response timing.
- Exploit or incident status: BleepingComputer reports confirmed exploitation based on DIVD statements; this wiki still needs DIVD or Zammad primary evidence for technical detail.
- Mitigation state: upgrade Zammad to version 7 or take vulnerable instances offline, preserve logs, look for session-hijacking and escalation artifacts, and treat AI-driven attack timing as an incident-response planning constraint.
- Confidence: medium for the AI-driven breach framing and mitigation because the captured evidence is secondary; high enough to track locally because named CVEs, affected product boundary, and mitigation guidance are specific.
- Residual risk: if primary advisories later narrow or expand the CVE mechanisms, this page should update the affected boundary and any digest wording without assuming the secondary report captured the complete chain.

## Authoritative Sources

- [October 4 leaf update watch source](../../../raw/processed/2026-10-04/ai-security-wiki-leaf-update-watch-20261005T000246Z.json)
- [BleepingComputer Zammad AI-driven breach coverage](https://www.bleepingcomputer.com/news/security/divd-says-zammad-zero-days-enabled-ai-driven-network-breach/)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [threats and attacks](index.md)
- [incident response](../incident-response/index.md)
- [agent and tool security](../agent-and-tool-security/index.md)
- [unattended AI agent attack automation](unattended-ai-agent-attack-automation.md)
- [Zammad AI Agent command execution](../agent-and-tool-security/zammad-ai-agent-command-execution.md)

## Open Questions

- Which DIVD primary advisories or Zammad records confirm CVE-2026-102489 and CVE-2026-102490 technical boundaries?
- Which forensic artifacts identify the reported session hijacking, remote code execution, root escalation, and exfiltration decisions?

## Maintenance Notes

- Created on 2026-10-05 from the [October 4 leaf update watch source](../../../raw/processed/2026-10-04/ai-security-wiki-leaf-update-watch-20261005T000246Z.json) after verifier correction split the Zammad breach chain from the broader unattended-agent attack automation pattern.
