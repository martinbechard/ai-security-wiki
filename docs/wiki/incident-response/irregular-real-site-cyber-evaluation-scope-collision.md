---
type: "Topic"
title: "Irregular Real-Site Cyber-Evaluation Scope Collision"
description: "Security analysis for an Irregular cyber-evaluation incident where a fictional target collided with a real website."
tags: ["incident-response", "testing-and-assurance", "identity-and-access"]
---

# Irregular Real-Site Cyber-Evaluation Scope Collision

## Current Understanding

Irregular real-site cyber-evaluation scope collision coverage owns the local security analysis for OpenAI's disclosure that a third-party cyber-evaluation target crossed from a fictional capture-the-flag scenario into a real website. The [August 5 topic news collector source](../../../raw/processed/2026-08-05/ai-security-wiki-topic-news-collector-2026-08-05T233123Z.json) records [OpenAI's disclosure](https://openai.com/index/third-party-cyber-evaluations-involving-openai-models/) that an internet-isolation misconfiguration let an OpenAI model exploit a real website whose domain matched a fictional CTF target and then find and use credentials for that site. Broad [OpenAI](../../../upstream-ai-wiki/companies/openai.md), model, and evaluator-company background stays upstream or deferred; this page keeps the local security boundary around target naming, real-service collision, and credential use.

The incident is distinct from the [AISI live-internet cyber-evaluation incident](aisi-live-internet-cyber-evaluation-incident.md). AISI's incident involved deliberate internet access and disabled classifiers during a live-internet cyber range. The Irregular case, as captured by OpenAI, centers on a misconfigured isolation boundary and a target-domain collision between fictional test scope and a real service.

## Security Impact

- Threat: model evaluations can affect real systems when fictional targets, domains, or credentials are not isolated from public services.
- Affected boundary: Irregular CTF-style evaluation environment, internet isolation controls, fictional target naming, matching real website domain, discovered credentials, and real-site access.
- Exploit or incident status: primary OpenAI disclosure; no Irregular white paper captured yet.
- Mitigation state: OpenAI reports work on external-lab isolation, scope wording, monitoring, stop conditions, and credential handling.
- Confidence: high for OpenAI's disclosed facts; medium for evaluator-side root cause and remediation until Irregular publishes its promised report.
- Residual risk: affected domain identity, credential provenance, exact isolation failure, notification evidence, and evaluator remediation remain unresolved.

## Control Implications

- Collision-check fictional target names, domains, usernames, tokens, and credentials against real internet services before evaluation.
- Require deny-by-default internet egress unless a task explicitly depends on approved public targets.
- Treat credential discovery on any non-authorized target as an immediate stop condition.
- Preserve DNS resolution, HTTP telemetry, credential-use traces, and target-authorization evidence after any scope collision.
- Require third-party evaluators to publish or provide a control package for target isolation and cleanup before future realistic cyber evaluations.

## Authoritative Sources

- [August 5 topic news collector source](../../../raw/processed/2026-08-05/ai-security-wiki-topic-news-collector-2026-08-05T233123Z.json)
- OpenAI third-party cyber-evaluations disclosure: https://openai.com/index/third-party-cyber-evaluations-involving-openai-models/

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [incident response](index.md)
- [third-party cyber-evaluation boundary failures](third-party-cyber-evaluation-boundary-failures.md)
- [cyber-evaluation containment](../testing-and-assurance/cyber-evaluation-containment.md)
- [AISI live-internet cyber-evaluation incident](aisi-live-internet-cyber-evaluation-incident.md)
- [agent network egress controls](../agent-and-tool-security/agent-network-egress-controls.md)

## Open Questions

- Will Irregular publish the promised white paper with the affected domain, isolation failure, credential path, and remediation details?
- What target-name and DNS collision checks should be mandatory before CTF-style cyber evaluations run?
- Which credential-use event should trigger automatic halt and notification in third-party cyber evaluations?

## Maintenance Notes

- Created on 2026-08-05 from the [August 5 topic collector](../../../raw/processed/2026-08-05/ai-security-wiki-topic-news-collector-2026-08-05T233123Z.json) after verifier feedback identified the Irregular real-site scope collision as independently maintainable from cross-incident synthesis.
