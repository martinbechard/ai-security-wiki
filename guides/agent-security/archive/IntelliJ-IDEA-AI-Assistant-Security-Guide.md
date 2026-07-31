# IntelliJ IDEA AI Assistant Security Guide

> Archived on July 31, 2026. Superseded by the [JetBrains AI Development Security Guide](../JetBrains-AI-Development-Security-Guide.md).

## An Opinionated Baseline for AI-Assisted Editing on Windows

This guide configures JetBrains AI Assistant in IntelliJ IDEA for a deliberately narrow role:

- provide inline code completion;
- read project files as context; and
- propose or apply project-file edits after the developer reviews them.

Every name enclosed in angle brackets, such as `<Developer Account>`, is a placeholder. Replace each placeholder with the approved local value before using a path or configuration example; do not include the angle brackets in the deployed value.

## 1. Developer context

This baseline is for developers building Java APIs with Quarkus on Windows and using Maven Wrapper, local Git, GitLab through `glab`, and local MySQL.

AI Assistant is used only for:

- inline completion while the developer types;
- explaining project code;
- generating a code snippet;
- proposing changes to the currently open project file; and
- creating a project file from a reviewed snippet when the developer selects the destination.

The developer:

- chooses the file or project context;
- reviews generated text and diffs;
- explicitly applies or accepts edits;
- builds and tests with `mvnw.cmd`;
- starts and calls Quarkus;
- operates Git and `glab`;
- operates MySQL; and
- performs any web research.

### 1.1 Processing boundary

IntelliJ IDEA reads and writes the local checkout. JetBrains AI Assistant sends prompts and the project context needed for the request to the selected JetBrains AI service.

This guide uses the JetBrains AI provider configured through the developer's JetBrains account.

[E1 — JetBrains data handling and external model processing](#14-evidence-and-assurance-model) supports the external-processing statement. [E10 — JetBrains AI provider configuration](#14-evidence-and-assurance-model) shows that JetBrains AI-only provider selection is a configuration decision that must be verified, not a universal product default.
### 1.2 Interaction mode

Use:

```text
AI Chat
  Chat
```

Do not select:

```text
Junie
Codex
Claude Agent
another coding agent
```

In Chat mode, AI Assistant returns explanations, snippets, and edit suggestions. The developer reviews and applies them. It can assist with limited multi-step development tasks, but its intended use is to help write code and tests.

Use the editor's **Accept All**, **Apply**, **Insert Snippet at Caret**, or **Create File from Snippet** actions only after reviewing the proposed content and destination.

[E5 — JetBrains Chat versus coding agents](#14-evidence-and-assurance-model) supports the Chat-versus-agent distinction and the review-before-apply control.

### 1.3 Windows account

Run IntelliJ IDEA as the developer's normal Windows account:

```text
Account name: <Developer Account>
Account type: Standard User
Local Administrators membership: No
```

IntelliJ IDEA and JetBrains AI do not create a separate Windows sandbox identity. AI Assistant shares the access available to IntelliJ IDEA under `<Developer Account>`.

Do not run IntelliJ IDEA as Administrator. Keep production credentials and production data out of the project, and do not open or attach unrelated files as AI Chat context.

[E11 — inferred Windows identity boundary](#14-evidence-and-assurance-model) labels the shared-account conclusion as an inference that must be validated in the deployed IDE rather than a quoted JetBrains guarantee.

### 1.4 Evidence and assurance model

This guide distinguishes JetBrains-documented behavior from local control decisions and inferences. A local control decision is not presented as a product-enforced guarantee.

| ID | Security assumption | Official evidence and short quote | Assurance status |
| --- | --- | --- | --- |
| E1 | Prompts and selected code context leave the workstation for model processing. | JetBrains data handling — https://www.jetbrains.com/help/ai-assistant/how-we-handle-your-code-and-data.html: “send your requests and pieces of your code to the LLM provider.” | Documented product behavior. |
| E2 | Chat context can be gathered automatically from the project or added manually. | JetBrains Chat context — https://www.jetbrains.com/help/ai-assistant/chat-mode.html: “AI Assistant uses context from your project.” | Documented product behavior. |
| E3 | `.aiignore` reduces processing but is not an absolute security boundary. | JetBrains restriction guidance — https://www.jetbrains.com/help/ai-assistant/disable-ai-assistant.html: “ignored files may still be processed due to unforeseen issues.” | Documented limitation. |
| E4 | Explicit UI context can override an ignore-file restriction. | JetBrains Chat context — https://www.jetbrains.com/help/ai-assistant/chat-mode.html: “Adding them as context bypasses this restriction.” | Documented limitation. |
| E5 | Chat suggestions are reviewable, while coding agents have broader autonomous authority. | JetBrains AI Chat — https://www.jetbrains.com/help/ai-assistant/ai-chat.html: “suggestions or code snippets that you can review and apply”; JetBrains agents — https://www.jetbrains.com/help/ai-assistant/agents.html: “edit files, run commands and tests, use external tools.” | Documented product distinction. |
| E6 | Chat mode still exposes actions and context sources that this baseline prohibits. | JetBrains Chat actions — https://www.jetbrains.com/help/ai-assistant/chat-mode.html: “Run Snippet – execute the generated command or code.” The same page documents `/web`, terminal/UI context, database-object attachments, local changes, commits, files, and folders. | Documented capability; prohibition is a local operating control. |
| E7 | Project rules influence responses but are not access controls. | JetBrains project rules — https://www.jetbrains.com/help/ai-assistant/configure-project-rules.html: “help AI Assistant better understand your code.” | Documented purpose; non-enforcement is a security inference from that purpose. |
| E8 | Detailed code-related collection is optional, and request logs contain sent prompts. | JetBrains data handling — https://www.jetbrains.com/help/ai-assistant/how-we-handle-your-code-and-data.html: “logs prompts that are sent to the LLM provider.” | Documented product behavior. |
| E9 | Inline completion can use a cloud model. | JetBrains code completion — https://www.jetbrains.com/help/ai-assistant/code-completion.html: “Cloud completion powered by AI Assistant.” | Documented product behavior. |
| E10 | Provider selection can include JetBrains, third-party, and local models. | JetBrains provider configuration — https://www.jetbrains.com/help/ai-assistant/use-custom-models.html documents third-party API keys, OpenAI-compatible endpoints, and local providers. | Documented capability; JetBrains AI-only is a local configuration decision. |
| E11 | AI Assistant does not have a separate Windows filesystem identity in this profile. | The reviewed JetBrains documentation describes IDE context, Chat, agents, and tools but does not claim a separate Chat sandbox or Windows account. | Explicit inference. Validate effective access in the deployed IDE and treat `<Developer Account>` permissions as the OS boundary. |

## 2. Accesses required for development

### 2.1 Read and write the active project folder

**Development activities enabled**

- use project code as AI context;
- provide inline completion;
- explain and refactor selected code;
- apply reviewed changes to an open project file; and
- create a reviewed project file from a generated snippet.

**Configuration**

Open only the intended repository as the IntelliJ IDEA project:

```text
C:\Dev\Projects\<Project Folder Name>
```

Enable AI Assistant for this project:

```text
Settings
  Tools
    AI Assistant
      Project Settings
        Enable AI Assistant for this project = selected
        Enable .aiignore = selected
```

Use Chat mode, not an agent. Leave Codebase Mode enabled when project-wide context is needed; otherwise disable it and attach only the current file or selected files.

This is supported by [E2 — JetBrains Chat project context](#14-evidence-and-assurance-model), [E3 — JetBrains `.aiignore` limitation](#14-evidence-and-assurance-model), and [E5 — JetBrains Chat versus coding agents](#14-evidence-and-assurance-model). JetBrains documents that the AI Chat tool window may open with an agent selected, so verify that the selector reads **Chat** for each new conversation.

**Security tradeoff**

Relevant project code is sent to JetBrains AI. AI-generated changes can be incorrect or insecure, but the developer reviews and accepts each edit before it becomes part of the project.

### 2.2 Read selected files outside the project

**Development activities enabled**

None. This profile does not require AI Assistant to read files outside the active project.

**Configuration**

Do not attach outside-project files or folders to AI Chat. Keep project rules inside:

```text
C:\Dev\Projects\<Project Folder Name>\.aiassistant\rules\
```

Do not use an outside rules path.

**Security tradeoff**

IntelliJ IDEA runs with `<Developer Account>` rights, so the operating system does not stop the IDE from reading other files available to that account. In this non-agent profile, AI Assistant receives context from the opened project, selected files, editor context, Codebase Mode, or explicit attachments. A user can still open or attach an outside file, so project selection, `.aiignore`, context review, and the absence of agent tools are the relevant AI-context controls.

[E2 — JetBrains Chat project context](#14-evidence-and-assurance-model), [E3 — JetBrains `.aiignore` limitation](#14-evidence-and-assurance-model), [E4 — JetBrains explicit-context bypass](#14-evidence-and-assurance-model), and [E11 — inferred Windows identity boundary](#14-evidence-and-assurance-model) justify this boundary. Because JetBrains documents an explicit-attachment bypass, never attach UI, terminal, console, file, folder, database, commit, or local-change context without reviewing its data class.

### 2.3 Read and execute installed development tools

**Development activities enabled**

None for AI Assistant. The developer uses IntelliJ IDEA and Maven Wrapper directly.

**Configuration**

Do not activate a coding agent. Do not use **Run Snippet** from AI Chat. Do not ask AI Assistant to execute a generated terminal command.

[E5 — JetBrains Chat versus coding agents](#14-evidence-and-assurance-model) and [E6 — JetBrains Chat actions and context sources](#14-evidence-and-assurance-model) show that this is a selected operating profile, not removal of executable features from the installed product.

The developer may separately run:

```text
.\mvnw.cmd test
.\mvnw.cmd verify
```

Those commands are outside AI Assistant's authority.

**Security tradeoff**

The developer retains the operational burden of running and reviewing builds and tests. Within this selected Chat profile, AI Assistant cannot independently verify its proposed code because the baseline does not activate an agent or use **Run Snippet**. [E5 — JetBrains Chat versus coding agents](#14-evidence-and-assurance-model) and [E6 — JetBrains Chat actions and context sources](#14-evidence-and-assurance-model) identify the broader product capabilities that remain available.

### 2.4 Write build caches inside the project

**Development activities enabled**

None for AI Assistant.

**Configuration**

The developer's Maven process may use the project-local cache defined in the managed workstation configuration:

```text
C:\Dev\Projects\<Project Folder Name>\.agent-cache\maven-repository\
```

This baseline does not activate an agent or use **Run Snippet**, so Maven and its cache remain developer-operated. [E6 — JetBrains Chat actions and context sources](#14-evidence-and-assurance-model) makes this an operating-profile statement rather than a claim that the product lacks execution features.

**Security tradeoff**

No additional AI authority is granted. Normal IntelliJ IDEA and Maven cache risks remain under developer control.

### 2.5 Connect to the approved artifact repository

**Development activities enabled**

None for AI Assistant.

**Configuration**

The developer runs Maven with the organization-managed settings and artifact proxy. Do not attach artifact credentials as context or configure an agent or execution action that can use them. Under this profile, dependency downloads remain developer-operated.

**Security tradeoff**

Dependency resolution remains a user-controlled build operation.

### 2.6 Host a Quarkus server on localhost

**Development activities enabled**

None for AI Assistant.

**Configuration**

The developer starts Quarkus through IntelliJ IDEA or:

```text
.\mvnw.cmd quarkus:dev
```

The baseline does not activate an agent or use **Run Snippet**, so starting and stopping Quarkus remains developer-operated. This boundary depends on the operating choices in [E5 — JetBrains Chat versus coding agents](#14-evidence-and-assurance-model) and [E6 — JetBrains Chat actions and context sources](#14-evidence-and-assurance-model).

**Security tradeoff**

The developer must verify that generated code is appropriate before running it.

### 2.7 Call services on localhost

**Development activities enabled**

None for AI Assistant.

**Configuration**

The developer calls the API through IntelliJ IDEA's HTTP client, a browser, or a terminal. Do not attach the HTTP client, terminal, console, or localhost output to Chat and do not configure an agent or MCP tool that can call the service.

**Security tradeoff**

Within this selected Chat profile, AI Assistant cannot independently test runtime behavior because agent tools, **Run Snippet**, and runtime-output attachments are not used. The developer performs the checks. [E6 — JetBrains Chat actions and context sources](#14-evidence-and-assurance-model) records that these are available product surfaces being deliberately excluded.

### 2.8 Use the local MySQL database through the application

**Development activities enabled**

AI Assistant may generate Java persistence code or configuration text inside reviewed project files. This profile does not attach database objects or schemas and does not configure a database, MCP, or execution tool, so database access remains developer-operated.

**Configuration**

Do not provide a database tool, database MCP server, JDBC console, schema attachment, database-object attachment, or MySQL credential to AI Assistant. Keep **Allow attaching database schemas to AI Assistant chat** cleared. The developer runs the application and database tools.

Keep real credentials out of the project and list local credential files in `.aiignore`.

**Security tradeoff**

Generated application code can affect the development database after the developer builds and runs it. The developer must review migrations, SQL, and persistence changes before execution.

[E6 — JetBrains Chat actions and context sources](#14-evidence-and-assurance-model) documents that database objects can be attached to Chat and therefore supports treating “no database context” as an explicit baseline choice rather than a default guarantee.

### 2.9 Read and modify the local Git repository

**Development activities enabled**

AI Assistant may use ordinary project files and, when the developer attaches it, local-change or commit context to explain or suggest code changes. This baseline prohibits those Git-context attachments and does not activate an agent or **Run Snippet**, so Git execution remains developer-operated. [E6 — JetBrains Chat actions and context sources](#14-evidence-and-assurance-model) documents the context and execution features being excluded.

**Configuration**

The developer performs all:

```text
git status
git diff
git add
git commit
git push
glab
```

Do not activate a coding agent for Git work.

**Security tradeoff**

Remote and repository state changes remain entirely user-controlled. AI Assistant can still propose an incorrect edit that the developer later commits.

### 2.10 Search public documentation

**Development activities enabled**

AI Assistant may answer from the selected model and supplied project context. JetBrains documents a `/web` command that searches the internet, so this baseline requires the developer not to invoke `/web` or connect a browser or retrieval tool.

**Configuration**

The developer performs current documentation research in a browser and supplies reviewed excerpts or links when needed.

**Security tradeoff**

The model may provide stale information. The developer verifies time-sensitive framework and library claims against official documentation. [E6 — JetBrains Chat actions and context sources](#14-evidence-and-assurance-model) makes clear that avoiding `/web` is an operating restriction, not a documented administrator-enforced removal.

## 3. Complete security model and configuration

### 3.1 Control model

The complete model has five layers:

1. **Feature boundary:** use AI Assistant Chat and inline completion; do not activate a coding agent.
2. **Project boundary:** open the exact repository and use `.aiignore` for project files that AI Assistant must not process.
3. **User-action boundary:** the developer reviews and explicitly applies every proposed edit.
4. **Tool and context boundary:** the baseline does not select an agent, invoke **Run Snippet** or `/web`, pass MCP tools, or attach terminal, database, Git, browser, localhost, or outside-project context. These capabilities exist in the product, so this is an operating and configuration boundary.
5. **Windows boundary:** IntelliJ IDEA and AI Assistant share the standard `<Developer Account>` account; this limits administrator privilege but does not create a separate AI filesystem identity.

This profile deliberately favors reviewability over autonomous task completion.

### 3.2 IntelliJ IDEA settings

Configure:

| Setting | Value |
| --- | --- |
| `Settings > Tools > AI Assistant > Project Settings > Enable AI Assistant for this project` | Selected |
| `Settings > Tools > AI Assistant > Project Settings > Enable .aiignore` | Selected |
| `Settings > Tools > AI Assistant > Providers & API keys` | JetBrains AI account only; no custom provider key |
| `Settings > Tools > AI Assistant > Agents > Pass custom MCP servers` | Cleared |
| `Settings > Tools > AI Assistant > Allow attaching database schemas to AI Assistant chat` | Cleared |
| `Settings > Tools > AI Assistant > Rules > project-editing.md > Rule type` | `Always` |
| `Settings > Appearance & Behavior > System Settings > Data Sharing > Send detailed code-related data` | Cleared |
| AI Chat selector | `Chat` |
| AI Chat Codebase Mode | Enabled only when project-wide context is required |
| `Settings > Editor > General > Code Completion > Inline > Enable inline completion using language models` | Selected |
| Inline completion model location | `Cloud` |
| Inline completion policy | `Focused` |
| Suggestions in code comments using cloud models | Cleared unless explicitly required |

Do not activate or select Junie, Codex, Claude Agent, another built-in agent, or a custom ACP agent.

The selected settings implement [E3 — JetBrains `.aiignore` limitation](#14-evidence-and-assurance-model), [E5 — JetBrains Chat versus coding agents](#14-evidence-and-assurance-model), [E6 — JetBrains Chat actions and context sources](#14-evidence-and-assurance-model), [E8 — JetBrains request logs and data collection](#14-evidence-and-assurance-model), [E9 — JetBrains cloud code completion](#14-evidence-and-assurance-model), and [E10 — JetBrains AI provider configuration](#14-evidence-and-assurance-model). Verify the labels against the deployed IDE version because JetBrains settings and default agent selection can change.

### 3.3 Complete project `.aiignore`

File:

```text
C:\Dev\Projects\<Project Folder Name>\.aiignore
```

```gitignore
# Environment files and local secrets
.env
.env.*
!.env.example
secrets/

# Private keys and credential containers
**/*.pem
**/*.key
**/*.p12
**/*.pfx
**/*.jks

# IDE-local database details
.idea/dataSources/
.idea/dataSources.local.xml
.idea/dbnavigator.xml

# Runtime and diagnostic data
logs/
**/*.log
**/*.hprof

# Generated build and cache content
target/
.agent-cache/
```

`.aiignore` limits processing by AI Assistant, but [E3 — JetBrains `.aiignore` limitation](#14-evidence-and-assurance-model) and [E4 — JetBrains explicit-context bypass](#14-evidence-and-assurance-model) show that it is not an absolute boundary. Keep real secrets and sensitive data outside the project, and do not explicitly attach ignored content.

### 3.4 Complete AI Assistant project rule

File:

```text
C:\Dev\Projects\<Project Folder Name>\.aiassistant\rules\project-editing.md
```

```markdown
# Project editing

- Work only with files in this project.
- Provide explanations, code completion, snippets, and project-file edits.
- Do not propose running terminal commands through AI Assistant.
- Do not use a coding agent, MCP tool, database tool, browser tool, or external system.
- The developer runs builds, tests, Quarkus, Git, GitLab, MySQL, and web research.
- Keep credentials and production data out of generated content.
- Ask the developer to review security-sensitive configuration, migrations, and authentication changes.
```

Project rules guide Chat behavior; [E7 — JetBrains project rules](#14-evidence-and-assurance-model) supports treating them as response guidance rather than an operating-system access control. The opened project, selected context, non-use of agent and execution features, `.aiignore`, and user review provide the AI-context boundary. The standard Windows account limits process privilege but does not isolate AI Assistant from IntelliJ IDEA.

### 3.5 Data handling and request review

Keep:

```text
Settings
  Appearance & Behavior
    System Settings
      Data Sharing
        Send detailed code-related data = cleared
```

Review AI requests when needed:

```text
Shift twice
Open AI Assistant Requests Log in Editor
```

The request log is sensitive because it may contain prompts and code context.

[E1 — JetBrains data handling and external model processing](#14-evidence-and-assurance-model) and [E8 — JetBrains request logs and data collection](#14-evidence-and-assurance-model) support treating prompts, code fragments, and the requests log as external-processing and local-evidence surfaces.

### 3.6 Deployment verification

Verify:

1. AI Chat shows **Chat**, not a coding agent.
2. Inline completion appears for an ordinary Java file.
3. AI Chat can explain an allowed project file.
4. AI Chat refuses or omits a file listed in `.aiignore`.
5. A generated edit is shown for review and changes the file only after the developer selects **Apply** or **Accept All**.
6. **Create File from Snippet** creates a file only in the folder selected by the developer.
7. No MCP server is passed to AI Assistant.
8. No custom provider key or custom agent is configured.
9. **Run Snippet**, `/web`, database-schema attachment, database-object attachment, and UI/terminal context attachment are not used.
10. The developer—not AI Assistant—runs Maven, tests, Quarkus, Git, `glab`, MySQL, localhost calls, and browsers.
11. Detailed code-related data sharing remains cleared, and the AI Assistant requests log contains only expected project context.

No PowerShell access-test script is run through AI Assistant. Command execution is outside this product profile.

### 3.7 Product references

- AI Assistant overview: https://www.jetbrains.com/help/ai-assistant/about-ai-assistant.html
- AI Chat and Chat versus Agents: https://www.jetbrains.com/help/ai-assistant/ai-chat.html
- Coding agents and tool authority: https://www.jetbrains.com/help/ai-assistant/agents.html
- Chat context and applying suggestions: https://www.jetbrains.com/help/ai-assistant/chat-mode.html
- In-editor code generation: https://www.jetbrains.com/help/ai-assistant/code-generation.html
- AI code completion: https://www.jetbrains.com/help/ai-assistant/code-completion.html
- Restrict or disable AI Assistant and `.aiignore`: https://www.jetbrains.com/help/ai-assistant/disable-ai-assistant.html
- AI Assistant project settings: https://www.jetbrains.com/help/ai-assistant/settings-reference-project-settings.html
- AI Assistant project rules: https://www.jetbrains.com/help/ai-assistant/configure-project-rules.html
- AI provider configuration: https://www.jetbrains.com/help/ai-assistant/use-custom-models.html
- JetBrains AI data handling: https://www.jetbrains.com/help/ai-assistant/how-we-handle-your-code-and-data.html
