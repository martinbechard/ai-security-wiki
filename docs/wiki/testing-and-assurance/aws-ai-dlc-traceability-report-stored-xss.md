---
type: Topic
title: AWS AI-DLC Traceability Report Stored XSS
description: Untrusted AI-DLC artifact metadata can execute script in generated assurance reports.
tags: [testing-and-assurance]
---

# AWS AI-DLC Traceability Report Stored XSS

## Current Understanding

[CVE-2026-120497](https://nvd.nist.gov/vuln/detail/CVE-2026-120497) affects the AWS AI-DLC Workflows `aidlc-traceability` CLI before 2026-07-03. An actor able to edit artifact files can put script in titles or descriptions that runs when another user opens the generated HTML report. Assurance artifacts are untrusted-content rendering boundaries and need output encoding or safe rendering before review.

No exploitation is reported. Confidence is high: the in-window NVD record links to both AWS and maintainer evidence. The CLI was later removed from its repository; that is not by itself a substitute for upgrade or replacement guidance.

- Mitigation state: stop using vulnerable report generation or replace it with an output-encoding implementation.
- Residual risk: imported artifact metadata remains executable content for reviewers if legacy reports are opened unsafely.

## Authoritative Sources

- [November 3 collector source](../../../raw/processed/2026-11-03/ai-security-wiki-topic-news-collector-2026-11-03T002828Z.json)
- [NVD CVE-2026-120497](https://nvd.nist.gov/vuln/detail/CVE-2026-120497)
- [AWS security bulletin 2026-163](https://aws.amazon.com/security/security-bulletins/2026-163-aws/)
- [GitHub advisory GHSA-gjmq-52p3-7fh2](https://github.com/awslabs/aidlc-workflows/security/advisories/GHSA-gjmq-52p3-7fh2)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [Testing and assurance](index.md)

## Open Questions

- What replacement or removal guidance does AWS provide for users who still generate traceability reports?

## Maintenance Notes

- Created on 2026-11-03. AI-DLC product and development workflow context remains upstream-owned.
