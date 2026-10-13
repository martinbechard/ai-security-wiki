---
type: "Topic"
title: "Repeat-After-Me Tool-Call Authorization Bypass"
description: "Security analysis for public reporting that Repeat-After-Me prompts can make multiple agent frameworks execute attacker-controlled tool calls."
tags: ["agent-and-tool-security", "model-and-prompt-security"]
---

# Repeat-After-Me Tool-Call Authorization Bypass

## Current Understanding

The [October 12 topic collector source](../../../raw/processed/2026-10-12/ai-security-wiki-topic-news-collector-2026-10-12T233447Z.json) records [CSO Online reporting](https://www.csoonline.com/article/4233811/researchers-bypass-6-ai-agent-frameworks-with-a-simple-repeat-after-me-prompt.html) that researchers from Pennsylvania State University, Universite Montpellier, and Dartmouth College used a Repeat-After-Me prompt technique to make six agent frameworks execute attacker-controlled tool calls. Broad framework pages for [LangGraph](../../../upstream-ai-wiki/agentic-frameworks/langgraph.md), [Microsoft Agent Framework](../../../upstream-ai-wiki/agentic-frameworks/microsoft-agent-framework.md), [AutoGen](../../../upstream-ai-wiki/agentic-frameworks/autogen-status.md), [Google ADK](../../../upstream-ai-wiki/agentic-frameworks/google-adk.md), [Strands Agents](../../../upstream-ai-wiki/agentic-frameworks/strands-agents.md), and [CrewAI](../../../upstream-ai-wiki/agentic-frameworks/crewai.md) belong upstream; this page owns the local tool-call authority lesson.

The reported security distinction is that model refusal and orchestrator authorization are not the same control. If an agent framework executes syntactically valid tool calls before or despite refusal text, a prompt technique can cross from generated text into tool authority unless the orchestrator independently authorizes every action.

## Security Impact

- Threat: prompt-shaped model output can trigger attacker-controlled tool calls across agent frameworks.
- Affected boundary: secondary reporting names LangGraph 1.2.0 with Llama 3.1 8B via Ollama and says the technique was reproduced across Microsoft Agent Framework, AutoGen, Google ADK 2.0, AWS Strands Agents, and CrewAI.
- Exploit or incident status: public research reporting; primary paper or project page is not captured in local evidence.
- Mitigation state: require framework-level tool authorization, typed action validation, and policy checks independent of refusal text.
- Confidence: moderate because the source is a reputable dated report, but primary research evidence is still missing locally.
- Residual risk: agent frameworks that delegate execution decisions to model text can fail even when the model appears to refuse harmful content.

## Control Implications

- Authorize tool calls at the orchestrator boundary after model output is parsed.
- Treat refusal text as advisory; the executable action graph needs separate policy evaluation.
- Regression-test prompt techniques that coerce repeated strings, copied tool calls, and mixed refusal/action outputs.

## Authoritative Sources

- [October 12 topic collector source](../../../raw/processed/2026-10-12/ai-security-wiki-topic-news-collector-2026-10-12T233447Z.json)
- [CSO Online Repeat-After-Me report](https://www.csoonline.com/article/4233811/researchers-bypass-6-ai-agent-frameworks-with-a-simple-repeat-after-me-prompt.html)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [cross-agent MCP prompt propagation](../threats-and-attacks/cross-agent-mcp-prompt-propagation.md)
- [ToFu MCP server security findings](../testing-and-assurance/tofu-mcp-server-security-findings.md)

## Open Questions

- Where is the primary Repeat-After-Me paper or project page, and which exact framework versions besides LangGraph 1.2.0 were tested?

## Maintenance Notes

- Created on 2026-10-13 from secondary October 12 reporting, with framework catalog context routed upstream and primary-paper capture left open.
