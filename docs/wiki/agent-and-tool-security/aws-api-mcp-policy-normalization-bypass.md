---
type: "Topic"
title: "AWS API MCP Server Policy Normalization Bypass"
description: "Security analysis for CVE-2026-125271, an authorization-policy comparison bypass in AWS API MCP Server."
tags: ["agent-and-tool-security", "identity-and-access"]
---

# AWS API MCP Server Policy Normalization Bypass

## Current Understanding

[CVE-2026-125271](https://github.com/awslabs/mcp/security/advisories/GHSA-4wq9-grf3-qg2p), captured in the [November 11 collector source](../../../raw/processed/2026-11-11/ai-security-wiki-topic-news-collector-2026-11-11T193154-0500.json), reports incorrect normalization of AWS API operation names containing consecutive capitals. Broad AWS and AWS API MCP Server product coverage belongs upstream; this page owns the security-policy enforcement boundary.

The advisory says a locally run server with a custom policy can fail to enforce a matching `denyList` or `elicitList` entry. AWS states the remote offering, `READ_OPERATIONS_ONLY`, and `REQUIRE_MUTATION_CONSENT` are not affected.

## Security Impact

- Threat: an AI assistant can request an AWS operation that the operator configured to deny or require elicitation.
- Affected boundary: `awslabs.aws-api-mcp-server` versions >= 0.2.13 and < 1.5.1 with a custom security policy.
- Exploit or incident status: public coordinated disclosure; no active-exploitation incident is recorded.
- Mitigation state: upgrade to 1.5.1 or later and patch forks or derivatives; AWS states no workaround exists.
- Confidence: high, based on the vendor-hosted advisory and package release assertion.
- Residual risk: tool-level consent policy is ineffective when its operation-name representation differs from the API dispatcher.

## Authoritative Sources

- [November 11 collector source](../../../raw/processed/2026-11-11/ai-security-wiki-topic-news-collector-2026-11-11T193154-0500.json)
- [GHSA-4wq9-grf3-qg2p](https://github.com/awslabs/mcp/security/advisories/GHSA-4wq9-grf3-qg2p)
- [CVE-2026-125271](https://www.cve.org/CVERecord?id=CVE-2026-125271)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [approval metadata access control](approval-metadata-access-control.md)

## Open Questions

- Which deployed forks retain the vulnerable operation-name normalization?

## Maintenance Notes

- Created on 2026-11-11 from the November 11 collector source.
