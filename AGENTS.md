# Agent Instructions

## Project Wiki Workflow

- Use the project-wiki-query skill for wiki-backed questions and lightweight project knowledge lookups.
- Use the project-wiki-research skill for ad-hoc topic research when docs/wiki and both upstream wikis do not already answer the request; save any sourced report under raw for later ingest.
- Check docs/wiki first when answering questions about this project, then verify against authoritative project files and upstream sources before replying. The wiki is a synthesis layer, not the source of truth.
- When reviewing project files reveals durable project knowledge that is not captured in the wiki, create a raw wiki fragment under raw before synthesizing it into docs/wiki.
- Raw wiki fragments must name the source file, record the extracted facts, and identify the local wiki page or upstream owner that should receive the synthesis.
- Respect federation boundaries. Keep broad AI ecosystem entities in ai-wiki, AI-assisted development practices in ai-dev-wiki, and AI security-specific threats, controls, assurance, governance, and incident knowledge in this wiki.
- Search both upstream topic indexes before creating a local durable leaf. Link upstream leaves at the point of use and do not duplicate their general analysis.
- Keep fragments out of raw/processed until the knowledge has been synthesized or routed, wiki lint has passed, and all local source links remain portable.
- After wiki edits, raw research, raw ingest, or workflow guidance updates are verified, commit the coherent wiki work before finishing unless the user explicitly says not to commit.
