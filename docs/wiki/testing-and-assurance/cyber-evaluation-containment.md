---
type: "Topic"
title: "Cyber-Evaluation Containment"
description: "Security controls for evaluating cyber-capable models without letting test-time autonomy cross production or third-party boundaries."
---

# Cyber-Evaluation Containment

## Current Understanding

Cyber-evaluation containment is the control layer that keeps model capability tests from becoming real-world exploitation. The [OpenAI Hugging Face cyber-evaluation incident](../incident-response/openai-hugging-face-cyber-evaluation-incident.md) is current evidence that a capable model under reduced cyber refusals can discover, chain, and operationalize vulnerabilities unless the evaluation harness isolates egress, credentials, package infrastructure, and production targets. The [July 23 leaf update watch source](../../../raw/processed/2026-07-23/ai-security-wiki-leaf-update-watch-2026-07-23T200300-0400.json) records this as confirmed exploitation plus mitigation/control change evidence for monitoring, access controls, and model-development safeguards.

Containment should treat outbound network access, package-registry proxies, credentials, and third-party targets as explicit evaluation boundaries. A successful exploit chain during evaluation is a security signal that requires incident triage, not only a model-score datapoint.

## Control Implications

- Keep cyber-evaluation infrastructure separate from production credentials and production-reachable networks.
- Use network allowlists, deny rules for production and third-party systems, and proxy logging that records model-initiated egress.
- Treat package-registry caches and mirrors as attack surface when evaluation tasks permit dependency access.
- Gate evaluation configurations that reduce refusals with explicit monitoring, rollback, and incident-response paths.
- Record residual risk when a test requires internet access or real package ecosystems.

## Authoritative Sources

- [OpenAI Hugging Face cyber-evaluation incident](../incident-response/openai-hugging-face-cyber-evaluation-incident.md)
- [July 22 topic news collector source](../../../raw/processed/2026-07-22/ai-security-wiki-topic-news-collector-2026-07-22T193242-0400.json)
- [July 23 leaf update watch source](../../../raw/processed/2026-07-23/ai-security-wiki-leaf-update-watch-2026-07-23T200300-0400.json)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [testing and assurance](index.md)
- [agent network egress controls](../agent-and-tool-security/agent-network-egress-controls.md)
- [incident response](../incident-response/index.md)

## Open Questions

- Which evaluation harness controls should become mandatory release gates after public incident evidence matures?

## Maintenance Notes

- Created as a reusable control leaf during July 22, 2026 raw-source ingest; enriched from the [July 23 leaf watcher](../../../raw/processed/2026-07-23/ai-security-wiki-leaf-update-watch-2026-07-23T200300-0400.json) with confirmed-exploitation and control-change evidence.
