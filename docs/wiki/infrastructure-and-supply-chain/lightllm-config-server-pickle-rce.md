---
type: "Topic"
title: "LightLLM Config Server pickle RCE"
description: "Security analysis for CVE-2026-90919 unauthenticated LightLLM Config Server pickle deserialization."
tags: ["infrastructure-and-supply-chain", "agent-and-tool-security"]
---

# LightLLM Config Server pickle RCE

## Current Understanding

The [September 14 topic collector source](../../../raw/processed/2026-09-14/ai-security-wiki-topic-news-collector-2026-09-14T233124Z.json) records [CVE-2026-90919](https://cveawg.mitre.org/api/cve/CVE-2026-90919) for LightLLM through 1.2.0. Broad LightLLM model-serving context belongs upstream; this page owns the local model-serving control-plane deserialization boundary.

The CVE says the Config Server's unauthenticated `/visual_register` WebSocket endpoint passes the first client frame directly to `pickle.loads()`. An attacker who can reach the Config Server port can send a malicious serialized payload with `__reduce__` behavior and execute code with Config Server process privileges.

## Security Impact

- Threat: unauthenticated model-serving control-plane access can become arbitrary process-level code execution.
- Affected boundary: ModelTC LightLLM through 1.2.0, Config Server `/visual_register` WebSocket handling, and Python pickle deserialization.
- Exploit or incident status: public CVE, project issue, code-reference, and VulnCheck advisory evidence; no local exploitation incident is recorded.
- Mitigation state: block unauthenticated Config Server exposure, remove pickle deserialization from client-controlled frames, and monitor for a fixed LightLLM release.
- Confidence: high for the sink and affected version because the CVE names the endpoint and code reference; medium for remediation until an upstream fixed release is identified.
- Residual risk: model-serving infrastructure often runs with access to model files, accelerator hosts, or deployment secrets, so serving control planes should be treated as infrastructure authority, not UI-only surfaces.

## Authoritative Sources

- [September 14 topic collector source](../../../raw/processed/2026-09-14/ai-security-wiki-topic-news-collector-2026-09-14T233124Z.json)
- [CVE-2026-90919 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-90919)
- [LightLLM issue 1563](https://github.com/ModelTC/LightLLM/issues/1563)
- [LightLLM v1.2.0 pickle sink](https://github.com/ModelTC/LightLLM/blob/v1.2.0/lightllm/server/config_server/api_http.py#L79-L86)
- [VulnCheck LightLLM pickle RCE advisory](https://www.vulncheck.com/advisories/lightllm-through-1.2.0-unauthenticated-remote-code-execution-via-config-server-pickle-deserialization)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [Elasticsearch ML model artifact deserialization RCE](elasticsearch-ml-model-artifact-deserialization-rce.md)
- [ModelScope unsafe YAML loader RCE](modelscope-unsafe-yaml-loader-rce.md)

## Open Questions

- Which LightLLM release removes or authenticates the `/visual_register` pickle deserialization path?

## Maintenance Notes

- Created on 2026-09-15 from the [September 14 topic collector](../../../raw/processed/2026-09-14/ai-security-wiki-topic-news-collector-2026-09-14T233124Z.json) as a model-serving control-plane RCE leaf.
