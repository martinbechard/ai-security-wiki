---
type: "Topic"
title: "LobsterAI Provider-Key Export Cryptography"
description: "Security analysis for CVE-2026-112014 recoverable provider API keys in LobsterAI exports."
tags: ["data-and-privacy", "identity-and-access"]
---

# LobsterAI Provider-Key Export Cryptography

## Current Understanding

[CVE-2026-112014](https://nvd.nist.gov/vuln/detail/CVE-2026-112014) states that LobsterAI before 2026.10.16 encrypts exported provider API keys with a hard-coded password and salt. The [October 19 collector](../../../raw/processed/2026-10-19/ai-security-wiki-topic-news-collector-2026-10-19T140139-0400.json) links the remediation [commit](https://github.com/netease-youdao/LobsterAI/commit/1eb28c40d7e42d6cbade07874e6f6c068b6a9a64) and release; product context remains upstream-owned.

## Security Impact

- Threat: anyone holding an export can derive the AES-GCM key and recover third-party provider credentials.
- Affected boundary: provider-key backup exports from LobsterAI versions before 2026.10.16.
- Exploit or incident status: public CVE; active exploitation is not identified.
- Mitigation state: upgrade to 2026.10.16 or later, rotate exposed provider keys, and protect historical exports as compromised secrets.
- Confidence: high for the vulnerable export scheme and release boundary.
- Residual risk: old backups remain decryptable after upgrading unless they are revoked or re-encrypted.

## Authoritative Sources

- [October 19 collector source](../../../raw/processed/2026-10-19/ai-security-wiki-topic-news-collector-2026-10-19T140139-0400.json)
- [CVE-2026-112014](https://nvd.nist.gov/vuln/detail/CVE-2026-112014)
- [2026.10.16 release](https://github.com/netease-youdao/LobsterAI/releases/tag/2026.10.16)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [data and privacy](index.md)
- [identity and access](../identity-and-access/index.md)

## Open Questions

- What replacement key-management mechanism does the release use for new exports?

## Maintenance Notes

- Created on 2026-10-20 from the October 19 collector.
