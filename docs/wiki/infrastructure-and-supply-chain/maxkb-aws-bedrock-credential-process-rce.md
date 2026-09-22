---
type: "Topic"
title: "MaxKB AWS Bedrock Credential Process RCE"
description: "Security analysis for CVE-2026-79916 AWS credential_process command execution in MaxKB Bedrock model credentials."
tags: ["infrastructure-and-supply-chain", "data-and-privacy"]
---

# MaxKB AWS Bedrock Credential Process RCE

## Current Understanding

The [September 21 topic collector source](../../../raw/processed/2026-09-21/ai-security-wiki-topic-news-collector-2026-09-21T233156Z.json) records [CVE-2026-79916](https://cveawg.mitre.org/api/cve/CVE-2026-79916) for MaxKB before 2.10.5-lts. Broad MaxKB and Bedrock product context belongs upstream; this page owns the model-provider credential file and command-execution boundary.

Authenticated workspace members can inject control characters into AWS Bedrock `access_key_id` and `secret_access_key` fields that `_update_aws_credentials` writes to `/root/.aws/credentials` without safe parsing. The attacker can append a new AWS profile containing `credential_process`, then select that profile during a later model-validation request so botocore executes an attacker-controlled command as root. Version 2.10.5-lts fixes the issue.

## Security Impact

- Threat: model-provider credential fields can become local configuration injection and root command execution.
- Affected boundary: MaxKB before 2.10.5-lts; AWS Bedrock credential update and model-validation profile selection.
- Exploit or incident status: public GitHub advisory with PR, commit, and release references; no local in-the-wild incident is recorded.
- Mitigation state: upgrade to 2.10.5-lts or later, sanitize credential-file fields, reject control characters, and isolate model-provider credential writes from root-owned shared profiles.
- Confidence: high because the CVE record includes the injection primitive, execution path, patch, and fixed release.
- Residual risk: LLM provider credential stores are supply-chain and execution boundaries when SDK configuration files support helper commands such as `credential_process`.

## Authoritative Sources

- [September 21 topic collector source](../../../raw/processed/2026-09-21/ai-security-wiki-topic-news-collector-2026-09-21T233156Z.json)
- [CVE-2026-79916 JSON](https://cveawg.mitre.org/api/cve/CVE-2026-79916)
- [NVD CVE-2026-79916](https://nvd.nist.gov/vuln/detail/CVE-2026-79916)
- [GitHub advisory GHSA-2324-7xjr-9qxg](https://github.com/1Panel-dev/MaxKB/security/advisories/GHSA-2324-7xjr-9qxg)
- [MaxKB 2.10.5-lts release](https://github.com/1Panel-dev/MaxKB/releases/tag/v2.10.5-lts)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [data and privacy](../data-and-privacy/index.md)
- [MaxKB prompt-injectable shell execution](../agent-and-tool-security/maxkb-prompt-injectable-shell-execution.md)

## Open Questions

- No open wiki questions are recorded for this topic.

## Maintenance Notes

- Created on 2026-09-21 from the [September 21 topic collector source](../../../raw/processed/2026-09-21/ai-security-wiki-topic-news-collector-2026-09-21T233156Z.json); split from the larger MaxKB advisory cluster because provider credential files and SDK helper commands have a separate supply-chain boundary.
