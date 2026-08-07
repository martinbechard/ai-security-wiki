---
title: "AI Code Bugs Are Changing. The Old Playbook Won't Save You."
source: "https://www.linkedin.com/pulse/ai-code-bugs-changing-old-playbook-wont-save-you-kevin-normoyle-xqhgc/"
author:
published: 2001-08-02
created: 2026-08-06
description:
tags:
  - "clippings"
---
The bug landscape from AI-generated code in 2026 looks nothing like it did in 2023.

The volume is up. The types have shifted. Some categories are getting better — and a few are getting quietly, structurally worse. Understanding the trajectory matters more than understanding the snapshot, because the tools, models, and workflows your team uses today will be different in six months. Getting ahead of where this is going is the only way to stay in front of the risk.

---

### What the Data Actually Shows

Let's start with the honest picture, not the marketing one.

CodeRabbit analyzed 470 open-source GitHub pull requests in late 2025 — 320 AI-coauthored, 150 human-only — and found AI PRs averaged 1.7x more issues overall. Logic errors were 75% more common. Readability problems increased more than 3x. Security findings ran 1.5–2x higher, with XSS vulnerabilities appearing 2.74x more often in AI code.

Uplevel tracked ~800 developers before and after GitHub Copilot access and found a 41% increase in bug rate with no meaningful throughput gain.

DORA's 2024 report across 3,000 respondents found that every 25% increase in AI adoption correlated with a 7.2% decrease in delivery stability — not because AI code is garbage, but because AI enables larger batch sizes, and larger PRs are riskier deployments.

These aren't outliers. The pattern is consistent: AI accelerates output and amplifies certain classes of mistakes. What's changing is *which* classes, and *why*.

---

### The Shift That Already Happened: Syntax Is Solved, Semantics Isn't

In 2023, AI-generated code had meaningful syntax error rates. You'd get code that wouldn't compile, obvious type mismatches, import errors. Those are largely gone. Veracode's longitudinal testing across 100+ LLMs shows syntax correctness climbing from ~50% in 2023 to ~95% by 2026.

That's the good news. Here's the bad news that's buried in the same dataset: security pass rates have been flat at 45–55% across the same period. Models got dramatically better at writing code that compiles. They did not get better at writing code that is safe.

Veracode's own CTO: "Security performance has been largely unchanged over time, even as models get better at generating syntactically correct code." And this is the uncomfortable part: larger, newer models don't significantly outperform smaller, older ones on security tasks. The security failure isn't a capability gap that will scale away with the next model release. It appears to be structural.

The bug problem has migrated up the stack. We've solved the surface layer. The logic layer and the security layer remain.

---

### What's Getting Worse: The Maintainability Debt

GitClear has been tracking 623 million code changes from 2023 to 2026. The trend across all eight quality signals they measure is in the same direction:

- Refactoring is down 70% from pre-AI levels
- Long-term legacy code maintenance is down 74%
- Block duplication is up 81%
- Within-commit copy/paste is up 41%
- Error-masking constructs (bare except: pass, empty catch blocks) are up 47%
- Code churn — lines revised within two weeks of being written — doubled from a pre-AI baseline of ~3.3% to 7.1% in 2025

The mechanism GitClear CEO Bill Harding describes is precise: AI generates atomic, self-contained code — a happy-path implementation, a passing test, a closed ticket — while quietly skipping the reuse, consolidation, and error-surfacing that determine how expensive a codebase is to own in year three. "Every time you want something, AI creates a new package for it. That general approach to building has all sorts of consequences."

This is not a bug in the classical sense. No linter will flag it. No CI gate will catch it. But it is the debt accumulating underneath the velocity numbers, and it compounds.

---

### The New Bug Category Nobody Talked About in 2023: Slopsquatting

In 2023, hallucination meant a model confidently citing a fact that wasn't true. By 2026, it has a supply chain attack vector named after it.

A 2025 academic study (USENIX Security) generated 576,000 code samples across 16 LLMs and found that roughly 20% recommended packages that don't exist in any public registry. The hallucinated names aren't random — 43% of them appear consistently across multiple independent prompts, making them predictable and therefore targetable.

The attack is called slopsquatting. An attacker identifies which phantom package names AI models reliably suggest, registers those names on PyPI or npm with a malicious payload, and waits for developers to copy-paste the AI's install command.

It has already happened. Security researcher Bar Lanyado registered a hallucinated huggingface-cli package on PyPI as a proof-of-concept. It received over 30,000 downloads in three months. Alibaba had copy-pasted the wrong install command into a public repository README. In January 2026, a hallucinated react-codeshift package registered by Aikido Security researcher Charlie Eriksen spread to 237 GitHub repositories through agent-authored instructions before anyone noticed.

The 2026 re-evaluation shows frontier models are improving — per-model hallucination rates are down to 4.6%–6.1% from ~20% for older models. But the same study found 127 package names that five different frontier models all invented identically. Those 127 names are the highest-value targets: anyone who registers them catches users of multiple AI assistants simultaneously.

And with agentic workflows, the last human checkpoint is gone. Traditional slopsquatting required a developer to read an AI suggestion, decide to run it, and type a command. Autonomous agents install packages without any human in the loop.

---

### The Confidence Problem Is Real, and It's Getting Documented

A Stanford study by Perry et al. in 2023 found something that has been confirmed multiple times since: developers using AI assistance write more vulnerable code than those without it — and rate their code as *more* secure.

This isn't just about the code. It's about the review. If AI tools cause developers to over-trust their output, they submit less-scrutinized code for review, and reviewers inherit that confidence bias when reading well-structured AI-generated code. The code looks intentional. It compiles. The style is consistent. The tests pass.

METR's 2025 RCT found a 39-point perception gap in productivity: developers thought AI made them 20% faster; it made them 19% slower (in that specific context). The direction — AI tools making people more confident than the evidence warrants — is consistent across studies.

Sonar's 2026 developer survey found fewer than half of developers review AI-generated code before committing it. That behavioral pattern is what confidence miscalibration looks like at scale.

---

### What's Actually Changing for the Better

The picture isn't uniformly bad. A few things are genuinely improving.

**Syntax is largely solved.** If you're still seeing syntax errors from AI code reach human review, your CI gate isn't working — not the AI. This category should cost your team zero review attention.

**Security tooling is catching up.** Pattern-based security vulnerabilities — XSS, SQL injection, insecure deserialization, hardcoded credentials — are now reliably caught by mature AI-powered SAST tools. CodeRabbit, Snyk Code, and Semgrep are genuinely effective at this layer. The multipliers in CodeRabbit's data are for PRs without AI review, not with it.

**The 2026 METR update is more optimistic.** The July 2025 finding of 19% slowdown for experienced developers was alarming. The February 2026 update with a larger cohort and newer models found only a -4% slowdown (CI: -15% to +9%) and concluded "AI likely provides productivity benefits in early 2026." The models are getting better at helping with complex, familiar codebases — where they were previously most harmful.

**The echo chamber problem has clear boundaries.** Research from Zietsman (2026) found that AI code review fails specifically on *domain-opaque* bugs — ones that are only wrong relative to a convention not inferable from the code itself. Classic boundary conditions, well-known security patterns, standard algorithms: AI review catches these reliably. What it misses are bugs where the correct behavior requires domain knowledge that isn't in the training data: financial calculation conventions, industry-specific regulatory rules, internal architectural decisions. That's a bounded problem, and knowing the boundary is more useful than being vaguely worried about everything.

---

### What Changes the Trajectory: The Spec Gate

The most important structural shift in AI code quality isn't happening in the models. It's happening in the workflow upstream.

Research by Zietsman (2026) put executable specifications against AI review directly. The finding: BDD-style specs caught domain-convention bugs deterministically — 5/5, every time — while AI review ranged from 0% to 100% depending on whether the convention was in training data. An ICD-10-CM external cause code rule was missed by all four AI reviewer models tested (Claude, Codex, Gemini, Amazon Q), across all 20 runs combined. BDD caught it in every run.

The spec doesn't compete with AI review. It makes AI review non-circular. Without a spec, the AI reviewer checks the code against itself — the generator and reviewer share the same training distribution, so they share the same blind spots. With a spec, the reviewer checks the code against an external ground truth that exists independent of what either model knows.

Spec-driven development (SDD) is now shipping in major tools: GitHub Spec Kit, AWS Kiro, Claude Code's planning mode, Cursor's spec workflows. A BMW industrial case study found LLM-generated Gherkin scenarios saved roughly a full developer-day per feature. A quasi-experiment on legal/regulatory spec generation found 91.7% of developer ratings on time-saved fell in the top two categories.

The vibe coding playbook that dominated 2024–2025 is revealing its wall: fast to prototype, expensive to maintain, catastrophic when it hits the three-month maintainability cliff. The teams converging on a synthesis — vibe code to discover requirements, formalize into a spec, spec-drive the production version — are the ones who will be able to scale AI coding without the compounding debt.

---

### Where This Is Going: Five Predictions

**1\. Security failure rates will stay stubbornly flat for general-purpose models, but security-specialized fine-tunes will start to matter.** The structural problem (models learn insecure patterns from insecure training data) won't be solved by scaling. It will be addressed by security-specific fine-tuning, targeted RLHF on security tasks, and mandatory security scanning as a CI gate. Teams that treat security scanning as optional will keep seeing the 45% failure rate; teams with hard gates won't.

**2\. Slopsquatting will become a standard attack vector for agentic workflows within 12 months.** The prerequisites are all in place. The 127 shared hallucinated names across five frontier models represent a known, stable, high-value attack surface. Package registries are building detection tooling, but attackers don't need to win every time. The agentic variant — agents installing packages autonomously — is the highest-risk variant and will drive the first large-scale exploitation.

**3\. Coverage metrics will stop being used as quality gates for AI-heavy teams.** The research is now clear: when AI generates both code and tests, coverage tells you how thoroughly the tests execute the AI's specific implementation — not whether that implementation is correct. Mutation testing, spec-grounded verification, and behavior-based coverage metrics will replace line coverage as the meaningful signal. This shift will be driven by postmortems where 90% coverage didn't catch the bug.

**4\. Spec-driven development will become the default workflow for production code.** Not because it's theoretically elegant, but because the three-month maintainability wall is hitting enough teams that they need an alternative to vibe coding. The tooling is now good enough that writing a spec before implementation is cheaper than the rework it prevents. Teams that adopt this earliest will have the most maintainable AI-assisted codebases by 2027.

**5\. The confidence miscalibration problem will produce a high-profile breach that becomes an industry inflection point.** The ingredient list is complete: AI tools make developers overconfident, less than half review AI code before committing it, accountability is diffuse (Aikido's survey: 53% blame security teams, 45% blame the developer, 42% blame whoever merged). A breach that gets clearly attributed to unreviewed AI-generated code — at sufficient scale and visibility — will do for AI code review what Log4Shell did for dependency scanning. It will shift from a best practice to a hard requirement overnight.

---

The bug problem from AI-generated code is not going away. But it is changing shape in ways that matter. Syntax is solved. Security is stubbornly broken. Maintainability is quietly compounding. Hallucination has grown a supply chain attack vector. And the research is starting to show where the fixes actually come from — not better models alone, but better process upstream of the models.

The teams winning this aren't the ones generating the most code. They're the ones who figured out how to make AI code trustworthy.

---

### References

**Primary research: bug taxonomy and survey**

- Gao et al. (2024). *A Survey of Bugs in AI-Generated Code* (72 peer-reviewed studies, Massey/Wuhan/Polytechnique Montréal) [https://arxiv.org/html/2512.05239v1](https://arxiv.org/html/2512.05239v1)

**Production bug rate data**

- CodeRabbit: *State of AI vs Human Code Generation* (December 2025, 470 PRs) [https://www.coderabbit.ai/blog/state-of-ai-vs-human-code-generation-report](https://www.coderabbit.ai/blog/state-of-ai-vs-human-code-generation-report)
- The Register coverage of CodeRabbit report: [https://www.theregister.com/2025/12/17/ai\_code\_bugs/](https://www.theregister.com/2025/12/17/ai_code_bugs/)
- Uplevel: *Can Generative AI Improve Developer Productivity?* (2024, ~800 developers) [https://uplevelteam.com/blog/ai-for-developer-productivity](https://uplevelteam.com/blog/ai-for-developer-productivity)
- Shiplight AI: *AI-Generated Code Has 1.7x More Bugs* [https://www.shiplight.ai/blog/ai-generated-code-has-more-bugs](https://www.shiplight.ai/blog/ai-generated-code-has-more-bugs)

**Security research**

- Veracode: *2025 GenAI Code Security Report* (100+ LLMs, 80 tasks) [https://www.veracode.com/resources/analyst-reports/2025-genai-code-security-report/](https://www.veracode.com/resources/analyst-reports/2025-genai-code-security-report/)
- Veracode Spring 2026 update (flat security rates): [https://www.veracode.com/blog/spring-2026-genai-code-security/](https://www.veracode.com/blog/spring-2026-genai-code-security/)
- Perry et al. Stanford (2023): *Do Users Write More Insecure Code with AI Assistants?* [https://arxiv.org/html/2211.03622v3](https://arxiv.org/html/2211.03622v3)

**Maintainability and technical debt**

- GitClear: *AI Copilot Code Quality 2025* (211M lines) [https://www.gitclear.com/ai\_assistant\_code\_quality\_2025\_research](https://www.gitclear.com/ai_assistant_code_quality_2025_research)
- GitClear: *The Maintainability Gap: 2026* (623M commits) [https://www.gitclear.com/the\_ai\_code\_quality\_maintainability\_gap](https://www.gitclear.com/the_ai_code_quality_maintainability_gap)
- LeadDev: *Code Maintainability Plummets in the AI Coding Era* [https://leaddev.com/ai/code-maintainability-plummets-in-the-ai-coding-era](https://leaddev.com/ai/code-maintainability-plummets-in-the-ai-coding-era)

**Slopsquatting / package hallucination**

- USENIX Security 2025 coverage (BleepingComputer): *AI-hallucinated code dependencies become new supply chain risk* [https://www.bleepingcomputer.com/news/security/ai-hallucinated-code-dependencies-become-new-supply-chain-risk/](https://www.bleepingcomputer.com/news/security/ai-hallucinated-code-dependencies-become-new-supply-chain-risk/)
- Aikido Security: *Slopsquatting: The AI Package Hallucination Attack Already Happening* (confirmed incidents) [https://www.aikido.dev/blog/slopsquatting-ai-package-hallucination-attacks](https://www.aikido.dev/blog/slopsquatting-ai-package-hallucination-attacks)
- Cloud Security Alliance (April 2026): *Slopsquatting: AI Code Hallucinations Fuel Supply Chain Attacks* [https://labs.cloudsecurityalliance.org/research/csa-research-note-slopsquatting-ai-supply-chain-20260419-csa/](https://labs.cloudsecurityalliance.org/research/csa-research-note-slopsquatting-ai-supply-chain-20260419-csa/)
- arXiv: *The Range Shrinks, the Threat Remains* (2026 frontier model re-evaluation) [https://arxiv.org/pdf/2605.17062](https://arxiv.org/pdf/2605.17062)

**Productivity and delivery**

- METR (July 2025): *Measuring the Impact of Early-2025 AI on Experienced Developer Productivity* (19% slowdown) [https://metr.org/blog/2025-07-10-early-2025-ai-experienced-os-dev-study/](https://metr.org/blog/2025-07-10-early-2025-ai-experienced-os-dev-study/)
- METR February 2026 update: [https://metr.org/blog/2026-02-24-uplift-update/](https://metr.org/blog/2026-02-24-uplift-update/)
- DORA 2024 report: [https://dora.dev/research/2024/dora-report/](https://dora.dev/research/2024/dora-report/)
- DORA 2025 coverage (TechTarget): [https://www.techtarget.com/searchsoftwarequality/news/366631712/Google-DORA-Software-delivery-caught-up-to-AI-coding-tools](https://www.techtarget.com/searchsoftwarequality/news/366631712/Google-DORA-Software-delivery-caught-up-to-AI-coding-tools)

**Echo chamber / spec gate research**

- Zietsman (March 2026): *The Specification as Quality Gate: Three Hypotheses on AI-Assisted Code Review* (cross-model experiments) [https://arxiv.org/html/2603.25773v1](https://arxiv.org/html/2603.25773v1)
- Wang et al. (2025): *SGCR: A Specification-Grounded Framework for Trustworthy LLM Code Review* [https://arxiv.org/abs/2512.17540](https://arxiv.org/abs/2512.17540)

**Test coverage and mutation**

- Zhao et al. (ISSTA 2026): *Do Coverage and Mutation Scores of LLM-Generated Test Suites Correlate with Their Effectiveness?* [https://arxiv.org/html/2607.22880v1](https://arxiv.org/html/2607.22880v1)

**Spec-driven development**

- Thoughtworks: *Spec-Driven Development: Unpacking One of 2025's Key New Engineering Practices* [https://www.thoughtworks.com/en-us/insights/blog/agile-engineering-practices/spec-driven-development-unpacking-2025-new-engineering-practices](https://www.thoughtworks.com/en-us/insights/blog/agile-engineering-practices/spec-driven-development-unpacking-2025-new-engineering-practices)
- BCMS: *Spec-Driven Development (SDD): The Definitive 2026 Guide* [https://www.thebcms.com/blog/spec-driven-development/](https://www.thebcms.com/blog/spec-driven-development/)
- Augment Code: *Vibe Coding vs Spec-Driven Development (2026)* [https://www.augmentcode.com/guides/vibe-coding-vs-spec-driven-development](https://www.augmentcode.com/guides/vibe-coding-vs-spec-driven-development)

**Accountability**

- AI Journal: *AI Now Writes the Code. Who's Accountable When It Breaks?* [https://aijourn.com/ai-now-writes-the-code-whos-accountable-when-it-breaks/](https://aijourn.com/ai-now-writes-the-code-whos-accountable-when-it-breaks/)
- Growexx: *The AI Code Security Crisis of 2026* (Aikido blame survey data) [https://www.growexx.com/blog/ai-code-security-crisis-2026-cto-guide/](https://www.growexx.com/blog/ai-code-security-crisis-2026-cto-guide/)