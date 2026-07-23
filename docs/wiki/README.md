---
type: "Project Wiki"
title: "AI Security Wiki"
description: "A federated synthesis layer for AI security threats, controls, assurance, governance, and incident knowledge."
---

# AI Security Wiki

This wiki owns security-specific analysis for AI systems. It extends the broader [AI wiki](../../upstream-ai-wiki/README.md) and [AI development wiki](../../upstream-ai-dev-wiki/README.md) without duplicating their durable entity or development-practice leaves.

The wiki is a navigation and synthesis layer, not the source of truth. Public collectors save raw source artifacts first; ingest updates durable local leaves and monthly digests only after federation routing and verification.

## Use

Run project-wiki checks from the repository root with the installed project-wiki skill:

```bash
python3 /Users/martinbechard/.agents/skills/project-wiki/scripts/wiki_ops.py status
python3 /Users/martinbechard/.agents/skills/project-wiki/scripts/wiki_ops.py lint
python3 /Users/martinbechard/.agents/skills/project-wiki/scripts/wiki_ops.py okf-validate
python3 /Users/martinbechard/.agents/skills/project-wiki/scripts/wiki_ops.py questions
```

## Pages

- [schema.md](schema.md)
- [topic-index.md](topic-index.md)
- [federation.md](federation.md)
- [glossary.md](glossary.md)
- [open-decisions.md](open-decisions.md)
- [known-defects.md](known-defects.md)
- [maintenance-log.md](maintenance-log.md)
- [digests](digests/index.md)

## Topic Folders

- [threats-and-attacks](threats-and-attacks/index.md) covers AI-specific threat actors, attack paths, abuse cases, and vulnerability classes.
- [model-and-prompt-security](model-and-prompt-security/index.md) covers model behavior risks, prompt injection, jailbreaks, poisoning, and output handling.
- [agent-and-tool-security](agent-and-tool-security/index.md) covers autonomous action, tool use, MCP, delegated authority, sandboxes, and approval boundaries.
- [data-and-privacy](data-and-privacy/index.md) covers sensitive data exposure, training and retrieval data, privacy, provenance, and retention.
- [identity-and-access](identity-and-access/index.md) covers human and non-human identity, authentication, authorization, credentials, and least privilege.
- [infrastructure-and-supply-chain](infrastructure-and-supply-chain/index.md) covers model, dependency, artifact, runtime, deployment, and hardware supply-chain security.
- [testing-and-assurance](testing-and-assurance/index.md) covers threat modeling, red teaming, security evaluation, monitoring, and release gates.
- [governance-and-compliance](governance-and-compliance/index.md) covers policies, standards, regulatory obligations, risk ownership, and evidence.
- [incident-response](incident-response/index.md) covers detection, triage, containment, recovery, disclosure, and lessons learned for AI incidents.
- [source-workflows](source-workflows/index.md) covers raw intake, public collection, federation routing, ingest, and digests.

## Operational Folders

- [raw](../../raw) stores unprocessed source artifacts.
- [raw/processed](../../raw/processed) stores fully synthesized or routed source artifacts.
- [Clippings](../../Clippings) stores human-saved source notes before ingest.
- [scripts](../../scripts) stores repository-local source and validation helpers.

## Automations

- [automated-update-feeds.md](source-workflows/automated-update-feeds.md) records the source-first automation model.
- AI Security Wiki Topic News Collector performs the daily public query for security-related AI items and saves raw JSON only.
- AI Security Wiki [Leaf Update Watch](source-workflows/leaf-update-watch.md) checks durable local security leaves for recent public changes.
- AI Security Wiki [Raw Project-Wiki Monitor](source-workflows/raw-project-wiki-monitor.md) ingests eligible raw artifacts into local leaves and digests after federation checks and verification.
