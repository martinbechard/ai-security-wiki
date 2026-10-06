---
type: "Topic"
title: "Docling Plugin Entrypoint Import Policy Bypass"
description: "Security analysis for CVE-2026-105745 import-time execution before Docling external-plugin filtering."
tags: ["infrastructure-and-supply-chain"]
---

# Docling Plugin Entrypoint Import Policy Bypass

## Current Understanding

The [October 5 topic collector source](../../../raw/processed/2026-10-05/ai-security-wiki-topic-news-collector-2026-10-05T233142Z.json) records [CVE-2026-105745](https://nvd.nist.gov/vuln/detail/CVE-2026-105745) for Docling 2.27.0 until 2.131.0. Broad Docling context belongs upstream; this page owns plugin import and dependency trust during AI document processing.

The NVD record says Docling plugin factories call `load_setuptools_entrypoints()` before applying `allow_external_plugins`, so every module registered in the Docling entry-point group is imported even when external plugins are disabled. Installed third-party or compromised packages can therefore execute import-time code while later filtering misleadingly reports the plugin was not loaded.

## Security Impact

- Threat: dependency or plugin packages can execute import-time code despite an external-plugin policy set to disabled.
- Affected boundary: Docling 2.27.0 until 2.131.0; setuptools entry points; `allow_external_plugins` filtering; document-conversion process startup.
- Exploit or incident status: public NVD record; no local exploitation incident is recorded.
- Mitigation state: update to Docling 2.131.0 or later and treat installed plugin packages as execution authority even when plugin loading is disabled.
- Confidence: high for affected version and fix from NVD.
- Residual risk: conversion worker dependency sets can silently become code-execution surfaces in AI ingestion pipelines.

## Authoritative Sources

- [October 5 topic collector source](../../../raw/processed/2026-10-05/ai-security-wiki-topic-news-collector-2026-10-05T233142Z.json)
- [NVD CVE-2026-105745](https://nvd.nist.gov/vuln/detail/CVE-2026-105745)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [agent build and dependency execution boundaries](agent-build-and-dependency-execution-boundaries.md)

## Open Questions

- Which Docling deployments install third-party entry-point packages while relying on `allow_external_plugins=false`?

## Maintenance Notes

- Created on 2026-10-06 from the [October 5 topic collector source](../../../raw/processed/2026-10-05/ai-security-wiki-topic-news-collector-2026-10-05T233142Z.json) after verifier correction split the Docling cluster by independent boundary.
