# JetBrains AI Development Security Guide

## Combined baseline for IntelliJ IDEA AI Assistant and Junie CLI on Windows

Copyright (c) 2026 Martin.Bechard@DevConsult.ca

This guide defines two approved ways to assist development of a local Java API built with Quarkus, Maven Wrapper, Git, GitLab through `glab`, and a MySQL instance bound to the same workstation:

1. **AI Assistant profile:** IntelliJ IDEA AI Assistant provides completion, explanations, snippets, and reviewed file edits. The developer operates every tool.
2. **Junie profile:** Junie CLI may edit project files and run only exact, reviewed commands.

Select one profile for a task. Do not activate a coding agent while claiming to operate under the AI Assistant profile.

Every product-behavior assertion has a visible numbered reference containing the publisher, title, and literal URL. Section 5 repeats each reference with supporting quoted evidence for printed copies. Requirements and prohibitions stated as this baseline's choices are security policy, not claims that JetBrains enforces them.

Replace every angle-bracket placeholder, such as `<Developer Account>` or `<Junie Account>`, with an approved local value before deployment.

## 1. Security model

### 1.1 Profile boundary

| Boundary | AI Assistant profile | Junie profile |
| --- | --- | --- |
| AI authority | Suggest and apply developer-reviewed edits. JetBrains distinguishes reviewable Chat suggestions from agents that can edit files, run commands, and use tools. ([14] JetBrains, AI Chat, <https://www.jetbrains.com/help/ai-assistant/ai-chat.html>) ([15] JetBrains, Use AI agents, <https://www.jetbrains.com/help/ai-assistant/agents.html>) | Edit project files and run terminal commands subject to Junie approvals. ([1] JetBrains, Junie CLI quickstart, <https://junie.jetbrains.com/docs/junie-cli.html>) |
| Operational authority | The developer runs Maven, Quarkus, Git, `glab`, MySQL, localhost calls, and web research. Do not use a coding agent, **Run Snippet**, `/web`, MCP, or tool attachments. JetBrains documents these as available Chat or agent capabilities, so their exclusion is an operating restriction. ([15] JetBrains, Use AI agents, <https://www.jetbrains.com/help/ai-assistant/agents.html>) ([16] JetBrains, AI Chat mode, <https://www.jetbrains.com/help/ai-assistant/chat-mode.html>) | Exact allowlisted commands run automatically; unmatched actions ask for approval. ([5] JetBrains, Junie CLI Action Allowlist, <https://junie.jetbrains.com/docs/action-allowlist-junie-cli.html>) |
| Human gate | The developer reviews and explicitly applies every edit. ([14] JetBrains, AI Chat, <https://www.jetbrains.com/help/ai-assistant/ai-chat.html>) | Junie makes ordinary project-file changes without per-edit review. ([1] JetBrains, Junie CLI quickstart, <https://junie.jetbrains.com/docs/junie-cli.html>) ([5] JetBrains, Junie CLI Action Allowlist, <https://junie.jetbrains.com/docs/action-allowlist-junie-cli.html>) The developer reviews all changes after the task. Only actions outside the baseline remain approval-gated. |
| Main residual risk | The developer accepts unsafe code and later executes it. | Junie modifies code and then launches an allowed build, test, or application process with the developer account's rights. ([1] JetBrains, Junie CLI quickstart, <https://junie.jetbrains.com/docs/junie-cli.html>) ([5] JetBrains, Junie CLI Action Allowlist, <https://junie.jetbrains.com/docs/action-allowlist-junie-cli.html>) ([6] Microsoft, Access tokens, <https://learn.microsoft.com/en-us/windows/win32/secauthz/access-tokens>) |

### 1.2 Shared boundaries

- The default baseline uses one standard `<Developer Account>` for normal development, IntelliJ IDEA, Junie CLI, Maven, Git, and terminals. Never run them as Administrator.
- With one account, every process launched by that account receives its Windows access token and can exercise the account's permissions. ([6] Microsoft, Access tokens, <https://learn.microsoft.com/en-us/windows/win32/secauthz/access-tokens>) IntelliJ IDEA can therefore access files available to the developer account, and a command launched through Junie can read, modify, transmit, or delete them after the command is approved or allowlisted. Junie's approval and project controls reduce accidental access but do not constrain the approved process to the project.
- AI Assistant does not automatically receive every file available to IntelliJ IDEA. Its model-facing exposure is the prompts and context gathered or attached for a request. ([13] JetBrains, How we handle your code and data, <https://www.jetbrains.com/help/ai-assistant/how-we-handle-your-code-and-data.html>) ([16] JetBrains, AI Chat mode, <https://www.jetbrains.com/help/ai-assistant/chat-mode.html>) The shared account nevertheless increases the chance that an unrelated file is opened or attached by mistake.
- On a one-account workstation, keep production credentials and production data out of the project and model context, minimize locally stored secrets, review every attachment and command, and record the account-wide filesystem exposure as accepted residual risk.
- Open or trust only `C:\Dev\Projects\<Project Folder Name>`, not its parent.
- Use the JetBrains AI provider configured through the approved JetBrains account. AI Assistant sends requests and code context for model processing. ([13] JetBrains, How we handle your code and data, <https://www.jetbrains.com/help/ai-assistant/how-we-handle-your-code-and-data.html>) Junie models are accessed through a Junie login or JetBrains AI API key, and JetBrains AI may automatically select and process data to form a response. ([2] JetBrains, Junie CLI model selection, <https://junie.jetbrains.com/docs/junie-cli-model-selection.html>) ([4] JetBrains, JetBrains AI Terms of Service, <https://www.jetbrains.com/legal/docs/terms/jetbrains-ai-service/>)
- Treat the Windows account as the enforceable filesystem and process boundary. Windows gives processes launched for a user copies of that user's access token. ([6] Microsoft, Access tokens, <https://learn.microsoft.com/en-us/windows/win32/secauthz/access-tokens>) Neither approval prompts, project rules, nor ignore files create an operating-system sandbox.
- Bind Quarkus and MySQL to `127.0.0.1`; route Maven through the approved artifact proxy; use only disposable development data and development-only identities.
- Keep secrets outside the repository, prompts, generated content, request logs, session history, configuration profiles, and allowlists. Junie stores the full context of recent sessions. ([12] JetBrains, Junie CLI quickstart — session history, <https://junie.jetbrains.com/docs/junie-cli.html>)

### 1.3 Optional Junie isolation with a second Windows account

A second computer is not required. The optional profile uses a second standard Windows user named `<Junie Account>`. Windows creates a separate profile with per-user documents, application data, and settings. Microsoft documents that profile folders are stored per user and that one user's profile settings are not accessible to other standard users by default. ([19] Microsoft, About User Profiles, <https://learn.microsoft.com/en-us/windows/win32/shell/about-user-profiles>)

The security gain is reduced account-level exposure:

- PowerShell, Junie CLI, and every child process run with `<Junie Account>`'s token rather than `<Developer Account>`'s token.
- Personal files, unrelated repositories, browser sessions, credential stores, SSH keys, and production tools in `<Developer Account>`'s profile are not normally available to `<Junie Account>`.
- A harmful approved command is limited to resources accessible to `<Junie Account>`.

This remains same-machine isolation. Administrators, device-wide malware, kernel compromise, deliberately shared folders, permissive ACLs, synchronized cloud folders, and services available to both accounts can cross the boundary. Windows ACLs decide which account may access each file or folder. ([20] Microsoft, Access control overview, <https://learn.microsoft.com/en-us/windows/security/identity-protection/access-control/access-control>) A separate machine provides a stronger device boundary, but it is not required for this baseline.

Configure and use `<Junie Account>` as follows:

1. An endpoint administrator opens **Settings > Accounts > Other users > Add account** and creates `<Junie Account>` as an approved local or organization-managed account. Microsoft documents the same path and the **Add a user without a Microsoft account** option for a local account. ([21] Microsoft, Manage User Accounts in Windows, <https://support.microsoft.com/en-US/Windows/Security/Identity-Signin/manage-user-accounts-in-windows>)
2. Keep `<Junie Account>` a **Standard User**. Sign in to its desktop once so Windows creates the profile and applies its initial user policy.
3. Install or make the approved development tools available without granting `<Junie Account>` administrator membership. Grant it only the required access to the project, managed Junie files, development credentials, and project-local caches.
4. From `<Developer Account>`'s terminal, open a separate Windows PowerShell process under `<Junie Account>`:

   ```powershell
   runas.exe /profile /user:".\<Junie Account>" "powershell.exe -NoLogo"
   ```

   Enter `<Junie Account>`'s password when Windows prompts. Do not use `/savecred`. Windows starts a separate process under the alternate credentials; `runas` does not reprocess Group Policy for that account. ([23] Microsoft, Group Policy is not applied for RunAs, <https://learn.microsoft.com/en-us/troubleshoot/windows-client/group-policy/group-policy-not-applied-user-account-runas>)
5. In the new PowerShell window, verify the effective identity and profile before starting Junie:

   ```powershell
   whoami
   $env:USERPROFILE
   ```

   Require results identifying `<Junie Account>` and `C:\Users\<Junie Account>`. Stop if either value identifies `<Developer Account>`.
6. Start Junie only from that PowerShell window:

   ```powershell
   Set-Location "C:\Dev\Projects\<Project Folder Name>"
   & "C:\ProgramData\<Organization Name>\Junie\Start-Project-Junie.cmd"
   ```

   Junie, Maven, Git, Quarkus, and other child processes launched from this window inherit `<Junie Account>`'s Windows security context. ([6] Microsoft, Access tokens, <https://learn.microsoft.com/en-us/windows/win32/secauthz/access-tokens>)
7. Close the Junie PowerShell window when the task finishes. Use **Switch user** and sign in to `<Junie Account>` directly whenever its Group Policy has changed or the organization requires a complete interactive sign-in. Windows permits switching accounts without signing out the existing session. ([22] Microsoft, User Account Access in Windows, <https://support.microsoft.com/en-US/accounts-billing/security/user-account-access-in-windows>)
8. Do not copy personal or production credentials into `<Junie Account>` or grant it access to `<Developer Account>`'s profile. Otherwise, the additional account provides little isolation.

### 1.4 Example Junie task workflow

This workflow gives Junie enough autonomy to implement, build, and test an API without asking the developer to approve each ordinary code edit:

1. **Prepare:** The developer starts with a clean worktree, creates a dedicated local task branch, and records its starting commit as `<Review Base Commit>`:

   ```powershell
   git switch -c "junie/<Task Slug>"
   git rev-parse HEAD
   ```

   The developer then gives Junie a bounded API-development task.
2. **Implement:** Junie may create, edit, and delete ordinary source, test, configuration, and documentation files inside the exact project. JetBrains classifies outside-project edits and build-script edits as sensitive `fileEditing` actions. ([5] JetBrains, Junie CLI Action Allowlist, <https://junie.jetbrains.com/docs/action-allowlist-junie-cli.html>) Changes to `pom.xml`, `.mvn\`, Maven Wrapper files, hooks, agent configuration, or the allowlist are outside this workflow and must stop the task for a separate developer decision.
3. **Build and API-test:** Junie may run only the exact Maven build and test commands in the managed allowlist. Those commands may compile, run unit tests, run API integration tests, package the application, and exercise the application against the local MySQL development instance.
4. **No browser testing:** Junie must not run a browser, browser driver, Playwright, Selenium, UI test, browser MCP tool, or public-web search. Before deployment, the developer must confirm that the allowlisted Maven commands do not include browser tests. API behavior is tested through Maven-managed API tests and the exact allowlisted localhost health request.
5. **Local MySQL only:** Application and test code may connect only to MySQL on `127.0.0.1` using the development schema and application identity. Junie receives no `mysql.exe`, database console, database MCP, schema attachment, or direct-query access.
6. **Create local checkpoints:** After each coherent milestone, Junie may run only the exact allowlisted `git add -A` and `git commit -m junie-checkpoint` commands. A commit records the staged contents in the local repository; it does not update a remote repository. ([24] Git, git-commit Documentation, <https://git-scm.com/docs/git-commit>) Junie must not reset, restore, checkout, switch, clean, amend, rebase, push, fetch, pull, or run `glab`.
7. **Review once:** After Junie stops, the developer reviews the checkpoint series, the complete change range, and any residual uncommitted files:

   ```powershell
   git log --oneline <Review Base Commit>..HEAD
   git diff --stat <Review Base Commit>..HEAD
   git diff <Review Base Commit>..HEAD
   git status --short
   ```

   The developer reruns the required tests and then decides whether to keep, revise, squash, or discard the local commits. A Junie checkpoint is an unreviewed recovery and review unit, not approval of its contents.

An unexpected approval request is not part of the normal workflow. Do not approve it merely to let the task finish; first determine whether the task has crossed one of the boundaries above.

### 1.5 Protection against using non-local database credentials

Assume Junie receives a valid external database URL, username, and password through a prompt or a readable project file:

1. Keep database clients and direct-query commands out of the Junie action allowlist. An unmatched action requires approval rather than running automatically. ([5] JetBrains, Junie CLI Action Allowlist, <https://junie.jetbrains.com/docs/action-allowlist-junie-cli.html>)
2. This command restriction does not prevent Junie-modified application code, tests, plugins, or scripts from opening a JDBC or other network connection inside an allowlisted Maven command. The child process runs with `<Junie Account>`'s authority. ([1] JetBrains, Junie CLI quickstart, <https://junie.jetbrains.com/docs/junie-cli.html>) ([6] Microsoft, Access tokens, <https://learn.microsoft.com/en-us/windows/win32/secauthz/access-tokens>)
3. Windows permits outbound traffic by default, so the process can reach the external database unless an administrator-enforced network rule denies the destination. ([26] Microsoft, Configure firewall rules with Group Policy, <https://learn.microsoft.com/en-us/windows/security/operating-system-security/network-security/windows-firewall/configure>)
4. Deploy the default-deny network lockdown in section 1.7 for the complete Junie process tree. Permit only loopback and `<Artifact Proxy Host>` for builds and application tests; the external database connection then fails even when the process has valid credentials.

Do not provide an indirect route through a local tunnel, `<Artifact Proxy Host>`, or a general forwarding proxy. The lockdown prevents use of the credentials against the external database, but it does not prevent credentials pasted into a prompt from entering model and session context.

### 1.6 Protection against using GitLab credentials

Assume Junie receives a valid GitLab token or SSH key and can locate `glab.exe` or `git.exe`:

1. Keep direct `glab` use and remote Git commands out of the Junie action allowlist. An unmatched action requires approval rather than running automatically. ([5] JetBrains, Junie CLI Action Allowlist, <https://junie.jetbrains.com/docs/action-allowlist-junie-cli.html>)
2. This command restriction is not a complete network control. Junie-modified application code, tests, plugins, or scripts running inside an allowlisted Maven command can call the GitLab API or launch another executable with `<Junie Account>`'s authority. ([1] JetBrains, Junie CLI quickstart, <https://junie.jetbrains.com/docs/junie-cli.html>) ([6] Microsoft, Access tokens, <https://learn.microsoft.com/en-us/windows/win32/secauthz/access-tokens>)
3. Without an outbound network restriction, the indirect process can reach GitLab and use the credential even though Junie did not issue a direct `glab` or `git push` action.
4. Deploy the default-deny network lockdown in section 1.7 to deny the entire Junie process tree access to GitLab. The connection then fails even when the process has a valid credential or launches `glab.exe`.

Do not allow GitLab through the endpoint policy, a local tunnel, `<Artifact Proxy Host>`, or a general forwarding proxy. The lockdown prevents remote use of the credential, but it does not prevent Junie from exposing a credential that has already entered model or project context.

### 1.7 Optional Junie network lockdown

Use this profile when Junie-modified builds, tests, and applications must be technically unable to contact an external database or arbitrary Internet host. A second Windows account limits identity and filesystem access, but it does not by itself restrict outbound network access. Windows Firewall allows outbound traffic by default unless a blocking rule applies. ([26] Microsoft, Configure firewall rules with Group Policy, <https://learn.microsoft.com/en-us/windows/security/operating-system-security/network-security/windows-firewall/configure>)

An endpoint administrator implements the lockdown:

1. Place `<Junie Account>` and every process it launches in an administrator-managed, default-deny outbound policy. Use an endpoint firewall that can cover the account or process tree, or run the Junie account in an isolated VM with default-deny egress. A rule covering only `java.exe` is insufficient because modified code can start another executable.
2. Allow the Junie executable to reach only the approved JetBrains authentication and AI service destinations.
3. Allow Maven and Java processes to reach only `127.0.0.1` and the approved artifact proxy. Permit DNS only through the managed resolver when hostname resolution is required.
4. Do not allow direct public package repositories, external database addresses, remote Git, public web destinations, or a general forward proxy.
5. From `<Junie Account>`, verify that local MySQL and the artifact proxy remain reachable and that controlled non-loopback database and GitLab test endpoints are unreachable. Do not test with production credentials or production infrastructure.

If the workstation firewall cannot express a default-deny policy for the Junie account or its full process tree without affecting other users, use the isolated VM option or treat non-loopback network access as residual risk. This lockdown prevents a pasted external database URL from being called, but it does not prevent the pasted URL or embedded credentials from entering model and session context.

## 2. Accesses required for development

The profile columns describe what each product may do. **How to** gives the steps required to limit that access. **Risks** states what can still go wrong after those steps are followed. If the **How to** steps cannot be implemented, do not enable or use the access.

| Access | AI Assistant profile | Junie profile | How to | Risks |
| --- | --- | --- | --- | --- |
| Active project files | Use selected project context and offer file edits for the developer to apply. | Read, create, modify, or delete ordinary files in the exact trusted project without per-edit approval. | Keep secrets and unrelated data outside the project. Start Junie on a clean, dedicated local branch and record `<Review Base Commit>`. Review the entire base-to-HEAD range and every residual uncommitted file after Junie finishes. | Either product can propose unsafe or incorrect code. Junie can damage project files before the developer's end-of-task review; checkpoint commits reduce loss and divide the review but do not make the changes safe. |
| Files outside the project | Do not open or attach outside files. Explicit context can bypass an ignore restriction. ([16] JetBrains, AI Chat mode, <https://www.jetbrains.com/help/ai-assistant/chat-mode.html>) | Leave `readOutsideProject` rules empty so unmatched direct reads ask for approval. ([5] JetBrains, Junie CLI Action Allowlist, <https://junie.jetbrains.com/docs/action-allowlist-junie-cli.html>) | Keep sensitive files outside the runtime account where practical. Use `<Junie Account>` and Windows ACLs when stronger separation is required. Review every attachment and deny unexpected outside-project requests. | The Windows account may read any file its permissions allow. Approving a program or script allows it to run commands that are limited by the Windows account, not by separate Junie approvals. ([6] Microsoft, Access tokens, <https://learn.microsoft.com/en-us/windows/win32/secauthz/access-tokens>) |
| Maven and installed tools | The developer runs builds and tests; AI Assistant does not execute tools. | Run only the complete Maven Wrapper build and API-test commands in the managed allowlist. | The developer pre-reviews and protects `pom.xml`, `.mvn\`, the wrapper, and the Maven test configuration from Junie changes. Confirm the commands exclude browser tests. Restrict build and application egress to the artifact proxy and loopback services. Never allow broad `java`, shell, `git`, or `glab` prefixes. | Builds, plugins, tests, and application code execute before the developer reviews Junie's changes and with the runtime account's permissions. Exact command approval does not restrict the file or network operations performed inside Maven; the Windows account and endpoint network policy do. ([1] JetBrains, Junie CLI quickstart, <https://junie.jetbrains.com/docs/junie-cli.html>) ([5] JetBrains, Junie CLI Action Allowlist, <https://junie.jetbrains.com/docs/action-allowlist-junie-cli.html>) ([6] Microsoft, Access tokens, <https://learn.microsoft.com/en-us/windows/win32/secauthz/access-tokens>) |
| Build cache and dependencies | The developer operates the cache and dependency download. | Exact Maven commands use the approved cache and artifact proxy. | Use `.agent-cache\maven-repository`, route Maven through the approved artifact proxy, and give the artifact identity download-only access. | The writable cache can contain executable plugins or compromised dependencies that later run with the runtime account's permissions. |
| Quarkus and localhost | The developer starts and calls Quarkus. | Exact `quarkus:dev` and localhost health commands may be allowed for API testing. | Bind Quarkus to `127.0.0.1`. Use only development credentials and disposable data. Permit only reviewed localhost requests. | The application executes Junie-modified code before developer review. Loopback blocks other computers, but other processes on the workstation can still reach the service. |
| Local MySQL | Do not provide a database tool, MCP server, schema attachment, object attachment, JDBC console, or credential as AI context. | Access only the MySQL instance on `127.0.0.1` through the Quarkus application or Maven-managed tests. Direct queries are prohibited. | Use the protection in section 1.5. Use a disposable local schema and a development-only application identity. Inject the loopback JDBC URL and credential outside the repository. Deploy section 1.7 when an external database must remain unreachable even if Junie obtains its credentials. Do not provide `mysql.exe`, a database console, database MCP, schema attachment, or direct-query command. | Without the network lockdown, Junie-modified application or test code can use an allowlisted Maven command to connect to any network destination reachable by the runtime account, including a database URL pasted into chat. With lockdown, local data remains modifiable and pasted URLs or credentials still enter model and session context. |
| Local Git | The developer stages, commits, discards, and performs every remote or destructive Git operation. | On a developer-created task branch, run exact status and validation commands plus `git add -A` and a fixed-message local checkpoint commit. No remote or history-rewriting command is allowed. | Use the protection in section 1.6. Record `<Review Base Commit>` before Junie starts. Keep `git push` and all `glab` commands out of the allowlist. For authentication isolation, use `<Junie Account>` without a GitLab token, SSH key, embedded remote credential, credential-helper entry, or authenticated `glab` session. Deploy section 1.7 when GitLab must remain unreachable even if Junie obtains a credential. Pre-review and protect repository Git hooks. At the end, review `<Review Base Commit>..HEAD` and residual files before any developer-run push. | `git add -A` can capture an unintended file, and a commit can run configured Git hooks with the runtime account's rights. Checkpoint commits remain unreviewed. Without the network lockdown, a credential could be used from inside an allowlisted process even when direct `glab` and remote Git actions are not allowed. Git documents that push updates remote references and sends necessary data. ([25] Git, git-push Documentation, <https://git-scm.com/docs/git-push>) |
| Browser and public web | The developer performs browser testing and public documentation research. Do not invoke `/web`. | No browser testing, browser driver, browser MCP, Playwright, Selenium, or general public-network access. | Test APIs through Maven-managed unit and integration tests plus exact localhost requests. The developer performs any browser work and supplies reviewed official-source excerpts when needed. | Model knowledge may be stale. API-only testing does not verify browser behavior, and local HTTP testing does not detect browser-specific defects. |
| Headless work | Not applicable. | Run with the same account, project, configuration, cache, and allowlist as interactive Junie. Headless mode removes the interactive UI and requires a token. ([3] JetBrains, Junie CLI headless mode, <https://junie.jetbrains.com/docs/junie-headless.html>) | Design the task to finish using only the existing narrow allowlist. Protect `JUNIE_API_KEY`; never broaden permissions merely to make an unattended task finish. | No developer is present to reject an action. Allowed actions execute automatically, and compromise of the token permits authenticated Junie use. |

## 3. Required configuration

### 3.1 Shared workstation and application configuration

```text
<Developer Account>
  Standard User
  Local Administrators membership: No

Optional <Junie Account>
  Standard User
  Local Administrators membership: No

C:\Dev\Projects\<Project Folder Name>\
C:\Dev\Projects\<Project Folder Name>\.agent-cache\maven-repository\
```

In the one-account baseline, Junie runs as `<Developer Account>`. When the optional isolation profile is deployed, only PowerShell, Junie, and its child processes run as `<Junie Account>`.

Add to `.gitignore`:

```gitignore
.agent-cache/
.env
.env.*
!.env.example
```

Configure Quarkus:

```properties
quarkus.http.host=127.0.0.1
quarkus.http.port=8080
quarkus.datasource.db-kind=mysql
quarkus.datasource.jdbc.url=${QUARKUS_DATASOURCE_JDBC_URL:jdbc:mysql://127.0.0.1:3306/<Development Database Name>}
quarkus.datasource.username=${QUARKUS_DATASOURCE_USERNAME:<Application Database User>}
quarkus.datasource.password=${QUARKUS_DATASOURCE_PASSWORD}
```

Configure MySQL with `bind-address=127.0.0.1`. Grant `<Application Database User>` authority only over `<Development Database Name>`. Store credentials outside the project and supply them through the approved local secret mechanism.

Configure `C:\ProgramData\<Organization Name>\Java\maven-settings.xml` so `<Artifact Proxy Host>` mirrors all repositories. Use a download-only identity supplied through environment variables.

### 3.2 AI Assistant profile

Configure:

| Setting | Required value |
| --- | --- |
| Enable AI Assistant for this project | Selected |
| Enable `.aiignore` | Selected |
| Providers and API keys | JetBrains AI account only |
| Pass custom MCP servers | Cleared |
| Allow database-schema attachments | Cleared |
| Send detailed code-related data | Cleared |
| AI Chat selector | `Chat` |
| Codebase Mode | Only when project-wide context is necessary |
| Inline completion model | Approved cloud model |

Do not select Junie, Codex, Claude Agent, another built-in agent, or a custom ACP agent. JetBrains currently opens AI Chat with an agent selected by default; switch to **Chat** for every new deployment and verify the retained selection. Chat provides reviewable suggestions, whereas agents may edit files, run commands and tests, and use external tools. ([14] JetBrains, AI Chat, <https://www.jetbrains.com/help/ai-assistant/ai-chat.html>) ([15] JetBrains, Use AI agents, <https://www.jetbrains.com/help/ai-assistant/agents.html>)

Create `<project>\.aiignore`:

```gitignore
.env
.env.*
!.env.example
secrets/
**/*.pem
**/*.key
**/*.p12
**/*.pfx
**/*.jks
.idea/dataSources/
.idea/dataSources.local.xml
.idea/dbnavigator.xml
logs/
**/*.log
**/*.hprof
target/
.agent-cache/
```

`.aiignore` reduces processing but is not absolute: JetBrains warns that ignored files may still be processed, and manually added context can bypass the restriction. ([17] JetBrains, Restrict or disable AI Assistant, <https://www.jetbrains.com/help/ai-assistant/disable-ai-assistant.html>) ([16] JetBrains, AI Chat mode, <https://www.jetbrains.com/help/ai-assistant/chat-mode.html>) Keep secrets outside the project and review every attachment.

Create `<project>\.aiassistant\rules\project-editing.md`:

```markdown
# Project editing

- Work only with reviewed context from this project.
- Provide completion, explanations, snippets, and reviewed file edits.
- Do not use agents, Run Snippet, /web, MCP, database, browser, or external tools.
- The developer operates Maven, Quarkus, Git, GitLab, MySQL, and browsers.
- Keep credentials and production data out of model context.
```

Project rules help AI Assistant understand the code; they are guidance, not an access-control boundary. ([18] JetBrains, Configure project rules, <https://www.jetbrains.com/help/ai-assistant/configure-project-rules.html>)

### 3.3 Junie profile

Use exact-project trust, Plan mode for read-only planning, Brave mode **Off**, `defaultBehavior: ask`, and exact command patterns. JetBrains documents exact-project trust, read-only Plan mode, Brave-mode approvals, and allowlist behavior. ([7] JetBrains, Junie CLI configuration and project trust, <https://junie.jetbrains.com/docs/junie-cli-configuration.html>) ([8] JetBrains, Junie CLI Plan mode, <https://junie.jetbrains.com/docs/junie-cli-plan-mode.html>) ([9] JetBrains, Junie CLI quickstart — Brave mode, <https://junie.jetbrains.com/docs/junie-cli.html>) ([5] JetBrains, Junie CLI Action Allowlist, <https://junie.jetbrains.com/docs/action-allowlist-junie-cli.html>)

The paths below show the optional two-account profile. For the one-account baseline, substitute `<Developer Account>` for `<Junie Account>`.

Create the administrator-managed profile:

```json
{
  "brave": false,
  "mcp-default-locations": false,
  "model-default-locations": false,
  "skill-default-locations": false,
  "command-default-locations": false,
  "agent-default-location": false,
  "auto-update": false,
  "time-limit": 3600
}
```

Launch from a reviewed script:

```batch
@echo off
junie ^
  --project "C:\Dev\Projects\<Project Folder Name>" ^
  --config-default-locations false ^
  --config-location "C:\ProgramData\<Organization Name>\Junie\project_dev_profile.json" ^
  --model-default-locations false ^
  --mcp-default-locations false ^
  --skill-default-locations false ^
  --skill-location "C:\ProgramData\<Organization Name>\Junie\skills" ^
  --command-default-locations false ^
  --agent-default-location false ^
  --cache-dir "C:\Dev\Projects\<Project Folder Name>\.agent-cache\junie" ^
  --skip-update-check
```

The options hardcode the project and managed locations while disabling default discovery. ([10] JetBrains, Junie CLI parameters, <https://junie.jetbrains.com/docs/parameters.html>) ([11] JetBrains, Junie CLI configuration — discovery controls, <https://junie.jetbrains.com/docs/junie-cli-configuration.html>)

Create `C:\Users\<Junie Account>\.junie\allowlist.json`:

```json
{
  "defaultBehavior": "ask",
  "allowReadonlyCommands": false,
  "rules": {
    "fileEditing": { "rules": [] },
    "executables": {
      "rules": [
        {
          "pattern": ".\\mvnw.cmd --settings C:\\ProgramData\\<Organization Name>\\Java\\maven-settings.xml -Dmaven.repo.local=.agent-cache\\maven-repository test",
          "action": "allow"
        },
        {
          "pattern": ".\\mvnw.cmd --settings C:\\ProgramData\\<Organization Name>\\Java\\maven-settings.xml -Dmaven.repo.local=.agent-cache\\maven-repository verify",
          "action": "allow"
        },
        {
          "pattern": ".\\mvnw.cmd --settings C:\\ProgramData\\<Organization Name>\\Java\\maven-settings.xml -Dmaven.repo.local=.agent-cache\\maven-repository quarkus:dev",
          "action": "allow"
        },
        {
          "pattern": "curl.exe --fail http://127.0.0.1:8080/q/health",
          "action": "allow"
        },
        { "pattern": "git status --short --branch", "action": "allow" },
        { "pattern": "git diff --check", "action": "allow" },
        { "pattern": "git diff --cached --check", "action": "allow" },
        { "pattern": "git add -A", "action": "allow" },
        { "pattern": "git commit -m junie-checkpoint", "action": "allow" }
      ]
    },
    "mcpTools": { "rules": [] },
    "readOutsideProject": { "rules": [] }
  }
}
```

Before deploying this allowlist, the developer must confirm that `test` and `verify` execute API-focused tests but no browser, browser-driver, Playwright, Selenium, or UI tests. If the project binds browser tests to either lifecycle, replace that entry with an exact reviewed Maven profile or test-selection command that excludes them.

The fixed checkpoint message is intentional: it permits local recovery points without allowing arbitrary Git command options. Do not add `git push`, another remote Git command, `glab`, history rewriting, or a broad `git` pattern. In the one-account baseline, deny every unexpected remote-command approval request; any Git credentials stored for `<Developer Account>` remain accessible to processes running as that account. For an authentication barrier, run Junie as `<Junie Account>` without GitLab credentials, SSH keys, stored Git credentials, or an authenticated `glab` session, and ensure the repository remote URL contains no embedded credential. The developer may rename or squash the checkpoint commits only after reviewing the complete change range.

Junie stores rules in `~/.junie/allowlist.json`; `allow` executes without approval, patterns use glob syntax, first match wins, and unmatched actions follow `defaultBehavior`. ([5] JetBrains, Junie CLI Action Allowlist, <https://junie.jetbrains.com/docs/action-allowlist-junie-cli.html>) Protect the reviewed file from `<Junie Account>` modification with Windows ACLs.

For local headless tasks, use the same launcher options and add only:

```powershell
--auth "$env:JUNIE_API_KEY" --task "<Bounded Task>"
```

Supply `JUNIE_API_KEY` through approved secret management. Do not store it in the project, launcher, profile, or allowlist. Headless mode lacks an interactive UI, requires a token, and currently documents trust-marker enforcement as controlled by a disabled rollout toggle. ([3] JetBrains, Junie CLI headless mode, <https://junie.jetbrains.com/docs/junie-headless.html>) Establish exact-project trust interactively before using headless mode.

## 4. Deployment verification

### 4.1 Shared checks

- Confirm the process runs as the intended standard account: `<Developer Account>` for the one-account baseline or `<Junie Account>` for the isolated Junie profile.
- Confirm only the intended repository is open or trusted.
- Confirm Quarkus and MySQL listen only on `127.0.0.1`.
- Confirm Maven resolves through the approved proxy and writes only to the project cache.
- Confirm no production credential, production data, or unrelated file enters the project or model context.
- Before Junie starts, confirm a dedicated local task branch is checked out and record `<Review Base Commit>`.
- After Junie finishes, inspect `git log --oneline <Review Base Commit>..HEAD`, `git diff <Review Base Commit>..HEAD`, `git status --short`, and every residual untracked file; rerun the required tests before accepting or publishing the work.
- When the optional network lockdown is selected, confirm the Junie process tree is under default-deny outbound policy, the approved JetBrains services and artifact proxy remain reachable, and controlled non-loopback database and GitLab test endpoints are unreachable.

### 4.2 AI Assistant checks

- AI Chat shows **Chat**, not an agent.
- An edit changes a file only after the developer selects **Apply**, **Accept**, or an equivalent review action.
- No MCP server, custom provider key, custom agent, database attachment, **Run Snippet**, `/web`, or terminal attachment is used.
- The developer performs Maven, Quarkus, Git, `glab`, MySQL, localhost, and browser operations.
- Review the AI Assistant request log; JetBrains documents that it logs prompts sent to the model provider. ([13] JetBrains, How we handle your code and data, <https://www.jetbrains.com/help/ai-assistant/how-we-handle-your-code-and-data.html>)

### 4.3 Junie checks

Test one request at a time:

| Request | Expected result |
| --- | --- |
| Approved Maven build, API-test, localhost health, read-only Git command, `git add -A`, or fixed-message checkpoint commit | Runs only on an exact allowlist match. |
| Outside-project read or write | Approval required. |
| Any other staging or commit form, `git push`, remote Git, destructive or history-rewriting Git, or any `glab` command | Approval required; deny it. |
| `mysql.exe`, database console, database MCP, schema attachment, or direct query | Unavailable or approval required; deny it. |
| Browser, browser driver, Playwright, Selenium, UI test, `/web`, or public-network request | Unavailable or approval required; deny it. |
| MCP action | No MCP server discovered. |
| Headless action outside the existing allowlist | Task must fail rather than wait for unavailable interactive approval. |

For the optional two-account profile, confirm `whoami` identifies `<Junie Account>`, `$env:USERPROFILE` is `C:\Users\<Junie Account>`, and Junie reads the allowlist from that profile. Stop if Junie or an approved child process runs as `<Developer Account>`.

Also confirm:

- Brave mode is **Off**;
- the startup header shows the exact project;
- the managed profile and reviewed allowlist are the only active Junie configuration;
- no default MCP, model, command, agent, or unreviewed skill location is loaded;
- the task runs on the developer-created local task branch and `<Review Base Commit>` is recorded;
- `<Junie Account>` has no GitLab token, SSH key, stored Git credential, embedded remote credential, or authenticated `glab` session;
- the allowlisted Maven commands run API tests but no browser tests;
- application and test database connections target only MySQL on `127.0.0.1`; and
- Junie finishes with small local checkpoint commits, any residual uncommitted changes, and a report for developer review.

The startup header, project option, and discovery controls are documented Junie behavior. ([7] JetBrains, Junie CLI configuration and project trust, <https://junie.jetbrains.com/docs/junie-cli-configuration.html>) ([10] JetBrains, Junie CLI parameters, <https://junie.jetbrains.com/docs/parameters.html>) ([11] JetBrains, Junie CLI configuration — discovery controls, <https://junie.jetbrains.com/docs/junie-cli-configuration.html>)

## 5. Numbered quoted references

The quotations were checked against the printed URLs on 2026-07-30.

1. **JetBrains, Junie CLI quickstart.** “review, write, and modify code”; “Run shell commands.” https://junie.jetbrains.com/docs/junie-cli.html
2. **JetBrains, Junie CLI model selection.** “models accessed through a JetBrains AI subscription, by means of a Junie login or a JetBrains AI API key.” https://junie.jetbrains.com/docs/junie-cli-model-selection.html
3. **JetBrains, Junie CLI headless mode.** “without interactive UI”; “requires an authentication token to run”; trust-marker enforcement “is controlled by a build rollout toggle and is currently disabled.” https://junie.jetbrains.com/docs/junie-headless.html
4. **JetBrains, JetBrains AI Terms of Service.** JetBrains AI may “automatically select, read, and process some of Your Data” to understand the context for a response. https://www.jetbrains.com/legal/docs/terms/jetbrains-ai-service/
5. **JetBrains, Junie CLI Action Allowlist.** `fileEditing` includes “editing files outside the project directory” and “editing build scripts outside or inside the project directory”; “`allow` – Execute automatically without user approval”; “`pattern`” uses “Glob syntax”; “first match takes precedence”; `"defaultBehavior": "ask"`. https://junie.jetbrains.com/docs/action-allowlist-junie-cli.html
6. **Microsoft, Access tokens.** “Every process executed on behalf of this user has a copy of this access token.” https://learn.microsoft.com/en-us/windows/win32/secauthz/access-tokens
7. **JetBrains, Junie CLI configuration and project trust.** “trust only the canonical project directory”; explicit locations are “loaded even when the CLI project is untrusted”; the “startup header explains” restricted-project behavior. https://junie.jetbrains.com/docs/junie-cli-configuration.html
8. **JetBrains, Junie CLI Plan mode.** “analyzes the codebase with read-only operations.” https://junie.jetbrains.com/docs/junie-cli-plan-mode.html
9. **JetBrains, Junie CLI quickstart — Brave mode.** Brave mode Off “asks for approval for every potentially sensitive action.” https://junie.jetbrains.com/docs/junie-cli.html
10. **JetBrains, Junie CLI parameters.** `--project` can “Specify the path to the project directory where Junie will run”; `--cache-dir` specifies “a custom path”; `--config-default-locations` can “Enable or disable loading configuration from the default locations.” https://junie.jetbrains.com/docs/parameters.html
11. **JetBrains, Junie CLI configuration — discovery controls.** The documented fields include “`mcp-default-locations`”; “`skill-default-locations`”; “`command-default-locations`”; “`agent-default-location`”; “`model-default-locations`.” https://junie.jetbrains.com/docs/junie-cli-configuration.html
12. **JetBrains, Junie CLI quickstart — session history.** Junie “stores the full session context” for “the last 10 sessions.” https://junie.jetbrains.com/docs/junie-cli.html
13. **JetBrains, How we handle your code and data.** AI Assistant may “send your requests and pieces of your code to the LLM provider”; the requests log “logs prompts that are sent to the LLM provider.” https://www.jetbrains.com/help/ai-assistant/how-we-handle-your-code-and-data.html
14. **JetBrains, AI Chat.** Chat provides “suggestions or code snippets that you can review and apply”; “By default, AI Chat opens with an agent selected rather than Chat mode.” https://www.jetbrains.com/help/ai-assistant/ai-chat.html
15. **JetBrains, Use AI agents.** Agents can “edit files, run commands and tests, use external tools.” https://www.jetbrains.com/help/ai-assistant/agents.html
16. **JetBrains, AI Chat mode.** The page documents “Run Snippet – execute the generated command or code,” `/web`, terminal context, database objects, local changes, commits, files, and folders; adding explicit context “bypasses this restriction.” https://www.jetbrains.com/help/ai-assistant/chat-mode.html
17. **JetBrains, Restrict or disable AI Assistant.** “ignored files may still be processed due to unforeseen issues.” https://www.jetbrains.com/help/ai-assistant/disable-ai-assistant.html
18. **JetBrains, Configure project rules.** Project rules “help AI Assistant better understand your code.” https://www.jetbrains.com/help/ai-assistant/configure-project-rules.html
19. **Microsoft, About User Profiles.** “User-profile files are stored in the Profiles directory, on a folder per-user basis”; profile settings “cannot be accessed by other users.” https://learn.microsoft.com/en-us/windows/win32/shell/about-user-profiles
20. **Microsoft, Access control overview.** Windows permissions determine “which security principals can access the resource and how they can access it.” https://learn.microsoft.com/en-us/windows/security/identity-protection/access-control/access-control
21. **Microsoft, Manage User Accounts in Windows.** Open “Accounts > Other user,” select “Add account,” and use “Add a user without a Microsoft account” when a local account is required. https://support.microsoft.com/en-US/Windows/Security/Identity-Signin/manage-user-accounts-in-windows
22. **Microsoft, User Account Access in Windows.** Switching accounts works “without signing out completely”; when signing out, “any open applications are closed.” https://support.microsoft.com/en-US/accounts-billing/security/user-account-access-in-windows
23. **Microsoft, Group Policy is not applied for RunAs.** `Runas.exe` “starts a separate process that runs under the alternate credentials”; the operation “does not trigger Group Policy processing.” https://learn.microsoft.com/en-us/troubleshoot/windows-client/group-policy/group-policy-not-applied-user-account-runas
24. **Git, git-commit Documentation.** “Create a new commit containing the current contents of the index”; “the branch is updated to point to it.” https://git-scm.com/docs/git-commit
25. **Git, git-push Documentation.** “Updates one or more branches, tags, or other references in one or more remote repositories from your local repository, and sends all necessary data.” https://git-scm.com/docs/git-push
26. **Microsoft, Configure firewall rules with Group Policy.** “By default, Windows Firewall allows all outbound network traffic, unless it matches a rule that prohibits the traffic”; a custom outbound program rule can select “This program path.” https://learn.microsoft.com/en-us/windows/security/operating-system-security/network-security/windows-firewall/configure
