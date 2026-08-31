# Infrastructure And Supply Chain

## Current Understanding

This topic owns model, dataset, dependency, artifact, plugin, runtime, deployment, hardware, and service supply-chain security for AI systems.

## Leaf Pages

- [Network-AI environment restore path traversal](network-ai-environment-restore-path-traversal.md)
- [Agent tool filesystem path containment](agent-tool-filesystem-path-containment.md)
- [Network-AI AgentRuntime sandbox path traversal](network-ai-agentruntime-sandbox-path-traversal.md)
- [Network-AI backup manifest recursive delete](network-ai-backup-manifest-recursive-delete.md)
- [AI agent sandbox escape host file access](ai-agent-sandbox-escape-host-file-access.md)
- [MCP SDK transport header handling](mcp-sdk-transport-header-handling.md)
- [AI guardrail dependency compromise](ai-guardrail-dependency-compromise.md)
- [AI development workstation containment](ai-development-workstation-containment.md)
- [Agent build and dependency execution boundaries](agent-build-and-dependency-execution-boundaries.md)
- [Evaluation artifact repository agent coordination](evaluation-artifact-repository-agent-coordination.md)
- [Slopsquatting package hallucination risk](slopsquatting-package-hallucination-risk.md)
- [DB-GPT unauthenticated path traversal remote code execution](db-gpt-unauthenticated-path-traversal-rce.md)
- [LiteLLM supply-chain secret exposure](litellm-supply-chain-secret-exposure.md)
- [AI supply chain provenance credentialing](ai-supply-chain-provenance-credentialing.md)
- [MLflow 3.15.0 security advisory cluster](mlflow-3150-security-advisory-cluster.md)
- [MLflow webhook test SSRF](mlflow-webhook-test-ssrf.md)
- [MLflow dataset lineage authorization bypass](mlflow-dataset-lineage-authorization-bypass.md)
- [MLflow model artifact source validation bypass](mlflow-model-artifact-source-validation-bypass.md)
- [atomic-agents-stack cleartext MCP catalog RCE](atomic-agents-stack-cleartext-mcp-catalog-rce.md)
- [Ray browser-triggered AI compute RCE](ray-browser-triggered-ai-compute-rce.md)
- [Kiota AI host manifest file boundary disclosure](kiota-ai-host-manifest-file-boundary-disclosure.md)
- [Hugging Face Transformers checkpoint shard file read](huggingface-transformers-checkpoint-shard-file-read.md)
- [consciousness-explorer MCP state file write](consciousness-explorer-mcp-state-file-write.md)
- [MCP PHP SDK SSE memory exhaustion](mcp-php-sdk-sse-memory-exhaustion.md)
- [WordPress AI plugin advisory deferrals](wordpress-ai-plugin-advisory-deferrals.md)
- [Infracost template symlink file read](infracost-template-symlink-file-read.md)
- [Infracost Terraform token forwarding leak](infracost-terraform-token-forwarding-leak.md)
- [Headroom LLM proxy upstream SSRF](headroom-llm-proxy-upstream-ssrf.md)
- [TensorZero gateway object storage file read SSRF](tensorzero-gateway-object-storage-file-read-ssrf.md)
- [ONNX external data symlink file write](onnx-external-data-symlink-file-write.md)
- [NLTK transition parser model pickle RCE](nltk-transition-parser-model-pickle-rce.md)
- [Mage AI browser items file read](mage-ai-browser-items-file-read.md)
- [WordPress AI Engine plugin file read and query execution](wordpress-ai-engine-plugin-file-read-and-query-execution.md)

- [Spring AI PDF Document Reader recursion DoS](spring-ai-pdf-document-reader-recursion-dos.md)

- [Spring AI ONNX cache model substitution](spring-ai-onnx-cache-model-substitution.md)

- [Spring AI ResourceCache fragment file write](spring-ai-resource-cache-fragment-file-write.md)

- [ServiceNow AI platform code injection](servicenow-ai-platform-code-injection.md)
- [ServiceNow AI platform access-control escalation](servicenow-ai-platform-access-control-escalation.md)
- [ServiceNow AI platform SQL injection](servicenow-ai-platform-sql-injection.md)
- [Bifrost AI Gateway multimodal SSRF](bifrost-ai-gateway-multimodal-ssrf.md)
- [Portkey AI Gateway proxy SSRF](portkey-ai-gateway-proxy-ssrf.md)
- [gpt-crawler outputFileName file write](gpt-crawler-output-filename-file-write.md)
- [Bisheng workflow callback SSRF](bisheng-workflow-callback-ssrf.md)
- [browser-use web-ui artifact path containment](browser-use-web-ui-artifact-path-containment.md)
- [jina-ai Reader private-address SSRF](jina-ai-reader-private-address-ssrf.md)

## Authoritative Sources

- [federation.md](../federation.md)
- [schema.md](../schema.md)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](../agent-and-tool-security/index.md)
- [testing and assurance](../testing-and-assurance/index.md)

## Open Questions

- No open topic questions are recorded.

## Maintenance Notes

- Updated on 2026-08-29 with Bifrost and Portkey AI gateway SSRF, gpt-crawler file-write, Bisheng callback SSRF, and watcher/topic-source provenance for Spring AI and ServiceNow.
- Updated on 2026-08-30 with browser-use web-ui artifact path containment and jina-ai Reader private-address SSRF leaves.
- Updated on 2026-08-28 with Spring AI PDF, ONNX, and ResourceCache leaves plus split ServiceNow AI platform code-injection, access-control, and SQL-injection leaves.
- Record provenance, affected component, trust boundary, deployment surface, and remediation status.
- Updated on 2026-08-17 with MLflow, atomic-agents-stack, Ray, and Kiota AI infrastructure and supply-chain advisory leaves.
- Updated on 2026-08-19 with the Hugging Face Transformers checkpoint shard file-read leaf and watcher enrichments for MLflow, atomic-agents-stack, Ray, and Kiota.
- Updated on 2026-08-19 after verifier correction split MLflow webhook SSRF, dataset-lineage authorization, and model-artifact source-validation advisories into separate leaves.
- Updated on 2026-08-22 with Infracost, TensorZero, ONNX, and NLTK supply-chain advisory leaves.
- Updated on 2026-08-26 with consciousness-explorer MCP state file-write, MCP PHP SDK SSE memory-exhaustion, WordPress AI plugin advisory deferrals, OpenAI pacing, and slopsquatting research enrichments.
- Updated on 2026-08-27 with Mage AI project-browser path confinement and AI Engine WordPress plugin advisory-family leaves.
