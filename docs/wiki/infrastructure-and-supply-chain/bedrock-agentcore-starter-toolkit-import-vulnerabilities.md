---
type: "Topic"
title: "Bedrock AgentCore Starter Toolkit Import Vulnerabilities"
description: "Security analysis for CVE-2026-105812 and CVE-2026-106032 import-time code generation and OpenAPI reference handling in bedrock-agentcore-starter-toolkit."
tags: ["infrastructure-and-supply-chain", "agent-and-tool-security"]
---

# Bedrock AgentCore Starter Toolkit Import Vulnerabilities

## Current Understanding

The [October 6 topic collector source](../../../raw/processed/2026-10-06/ai-security-wiki-topic-news-collector-2026-10-06T233203Z.json) records [CVE-2026-105812](https://nvd.nist.gov/vuln/detail/CVE-2026-105812) and [CVE-2026-106032](https://nvd.nist.gov/vuln/detail/CVE-2026-106032) for `bedrock-agentcore-starter-toolkit` before 0.3.14. Broad Amazon Bedrock and AgentCore product context belongs upstream; this page owns the local security boundary where agent import and code generation consume untrusted agent artifacts.

One CVE describes crafted agent-import configuration values being incorporated into generated Python source without safe literal encoding, causing code execution when the generated agent is imported, run, or deployed. The other describes crafted OpenAPI external references in an action group triggering outbound requests and local-file reads during import. AWS recommends upgrading to 0.3.14, re-importing affected generated agents, replacing generated artifacts, and migrating from the deprecated starter toolkit to the supported `@aws/agentcore` npm CLI.

## Security Impact

- Threat: untrusted agent definitions and OpenAPI action-group schemas can become generated source execution, SSRF, or local file reads during import.
- Affected boundary: `bedrock-agentcore-starter-toolkit` 0.1.4 through 0.3.13, Bedrock Agent configuration import, generated Python agent code, and OpenAPI external-reference processing.
- Exploit or incident status: public NVD CVE records with AWS bulletin and PyPI release references; no local exploitation incident is recorded.
- Mitigation state: upgrade to 0.3.14, re-import and replace generated agents created from affected inputs, avoid importing untrusted OpenAPI references without offline resolution controls, and migrate to the supported `@aws/agentcore` CLI when possible.
- Confidence: high for affected range and fixed package from NVD; medium for migration wording until the AWS bulletin is reconciled directly in a future source pass.
- Residual risk: agent importers and connector generators need the same trust boundary as compilers because they can turn data files into executable runtime code.

## Authoritative Sources

- [October 6 topic collector source](../../../raw/processed/2026-10-06/ai-security-wiki-topic-news-collector-2026-10-06T233203Z.json)
- [NVD CVE-2026-105812](https://nvd.nist.gov/vuln/detail/CVE-2026-105812)
- [NVD CVE-2026-106032](https://nvd.nist.gov/vuln/detail/CVE-2026-106032)
- [AWS security bulletin 2026-127](https://aws.amazon.com/security/security-bulletins/2026-127-aws/)
- [bedrock-agentcore-starter-toolkit 0.3.14 on PyPI](https://pypi.org/project/bedrock-agentcore-starter-toolkit/0.3.14/)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [agent and tool security](../agent-and-tool-security/index.md)
- [downstream agent authorization context](../identity-and-access/downstream-agent-authorization-context.md)

## Open Questions

- Which generated agents from affected starter-toolkit versions need replacement rather than only dependency upgrade?

## Maintenance Notes

- Created on 2026-10-07 from the [October 6 topic collector source](../../../raw/processed/2026-10-06/ai-security-wiki-topic-news-collector-2026-10-06T233203Z.json) as a generated-agent supply-chain leaf while routing broad Bedrock AgentCore context upstream.
