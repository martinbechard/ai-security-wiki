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

The [October 5 leaf update watch source](../../../raw/processed/2026-10-05/ai-security-wiki-leaf-update-watch-20261006T000405Z.json) adds Zammad's October 5 advisory for CVE-2026-102489 and CVE-2026-102490. That source narrows the remote-code-execution exploitability assessment to Zammad 6.5 and earlier, identifies 7.2.0 hardening, and describes CVE-2026-102490 as a local privilege-escalation issue under high-priority analysis.

## Security Impact

- Threat: an autonomous or AI-driven attacker can compress helpdesk zero-day exploitation, privilege escalation, and exfiltration decisions into an incident window too short for ordinary manual triage.
- Affected boundary: Zammad 6.3.0 to 6.5.4 session hijack and RCE path; Zammad 7.0.0 to 7.1.3 code present but not exploitable under runtime conditions per the captured Zammad/DIVD evidence; Zammad v1.5.0 to v7.1.0-alpha local privilege-escalation path; DIVD-2026-00015 incident response.
- Exploit or incident status: BleepingComputer reports confirmed exploitation based on DIVD statements; the October 5 Zammad advisory and CVE updates provide primary-vendor boundary evidence for exploitability and mitigation scope.
- Mitigation state: update to Zammad 7.2.0 or apply the vendor-supported hardening path, preserve logs, look for session-hijacking and escalation artifacts, and treat AI-driven attack timing as an incident-response planning constraint.
- Confidence: high for the Zammad version-boundary and mitigation update; medium for the AI-driven breach framing until DIVD primary case text is fully reconciled.
- Residual risk: if primary advisories later narrow or expand the CVE mechanisms, this page should update the affected boundary and any digest wording without assuming the secondary report captured the complete chain.

## Authoritative Sources

- [October 4 leaf update watch source](../../../raw/processed/2026-10-04/ai-security-wiki-leaf-update-watch-20261005T000246Z.json)
- [October 5 leaf update watch source](../../../raw/processed/2026-10-05/ai-security-wiki-leaf-update-watch-20261006T000405Z.json)
- [BleepingComputer Zammad AI-driven breach coverage](https://www.bleepingcomputer.com/news/security/divd-says-zammad-zero-days-enabled-ai-driven-network-breach/)
- [Zammad October 5 advisory](https://zammad.com/en/advisories/cve-2026-102489-cve-2026-102490)

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
- Does the final DIVD case text align fully with Zammad's 7.0.0 to 7.1.3 exploitability assessment?

## Maintenance Notes

- Created on 2026-10-05 from the [October 4 leaf update watch source](../../../raw/processed/2026-10-04/ai-security-wiki-leaf-update-watch-20261005T000246Z.json) after verifier correction split the Zammad breach chain from the broader unattended-agent attack automation pattern.
- Updated on 2026-10-06 from the [October 5 leaf update watch source](../../../raw/processed/2026-10-05/ai-security-wiki-leaf-update-watch-20261006T000405Z.json) with Zammad primary advisory version boundaries and 7.2.0 mitigation evidence.
