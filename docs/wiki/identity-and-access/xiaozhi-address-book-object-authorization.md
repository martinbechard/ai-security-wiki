---
type: "Topic"
title: "Xiaozhi Address-Book Object Authorization"
description: "Security analysis for CVE-2026-116017 cross-device address-book disclosure in xiaozhi-esp32-server."
tags: ["identity-and-access", "data-and-privacy"]
---

# Xiaozhi Address-Book Object Authorization

## Current Understanding

The [October 25 topic collector source](../../../raw/processed/2026-10-25/ai-security-wiki-topic-news-collector-2026-10-25T232906Z.json) records [CVE-2026-116017](https://nvd.nist.gov/vuln/detail/CVE-2026-116017): before 0.9.8, an authenticated ordinary or self-registered caller could pass another device MAC to `DeviceController.getAddressBook` and receive contact MACs, aliases, calling permissions, and owner IDs. Broad Xiaozhi product coverage belongs upstream; this page owns the cross-user device-contact authorization boundary.

## Security Impact

- Threat: authenticated callers can select an object identifier they do not own and obtain contact and device metadata.
- Affected boundary: xiaozhi-esp32-server before 0.9.8, `manager-api` `DeviceController.getAddressBook`.
- Exploit or incident status: public CVE disclosure; no local exploitation incident is recorded.
- Mitigation state: upgrade to 0.9.8 or later, review cross-device lookup logs, and apply object-ownership checks to adjacent device operations.
- Confidence: high; the linked fixing commit explicitly adds device-ownership checks for address-book access.
- Residual risk: adjacent endpoints that accept device MACs may have independently incomplete ownership checks.

## Authoritative Sources

- [October 25 topic collector source](../../../raw/processed/2026-10-25/ai-security-wiki-topic-news-collector-2026-10-25T232906Z.json)
- [CVE-2026-116017](https://nvd.nist.gov/vuln/detail/CVE-2026-116017)
- [fixing commit](https://github.com/xinnan-tech/xiaozhi-esp32-server/commit/d4ff9c5c17cbd82ec98a2a6bb4f82a07c1be0f03)
- [0.9.8 release](https://github.com/xinnan-tech/xiaozhi-esp32-server/releases/tag/v0.9.8)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [Xiaozhi device WebSocket token compromise](xiaozhi-device-websocket-token-compromise.md)

## Open Questions

- Which related device lookup, alias, permission, and unbind operations have object-ownership regression coverage in deployed versions?

## Maintenance Notes

- Created on 2026-10-25 from CVE-2026-116017 as a separate object-authorization boundary from device-token issuance.
