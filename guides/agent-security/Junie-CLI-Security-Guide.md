# Junie CLI Security Guide

## An Opinionated Baseline for Local Java API Development on Windows

This guide configures Junie CLI for interactive development and local headless tasks with Quarkus, Maven Wrapper, local Git, GitLab through `glab`, and MySQL on the same Windows workstation.

Under this baseline, Junie CLI operates on the local checkout and runs local commands through its terminal interface. ([1] JetBrains, Junie CLI quickstart, <https://junie.jetbrains.com/docs/junie-cli.html>) Model requests use the JetBrains AI provider selected by Junie authentication because this baseline does not configure BYOK, a custom model, or a proxy. ([2] JetBrains, Junie CLI model selection, <https://junie.jetbrains.com/docs/junie-cli-model-selection.html>) Both interactive and headless use covered by this guide run on the configured local Windows workstation; headless mode removes the interactive UI rather than moving the task to a hosted execution environment. ([3] JetBrains, Junie CLI headless mode, <https://junie.jetbrains.com/docs/junie-headless.html>)

Every assertion about Junie CLI product behavior carries a numbered inline reference that prints the official publisher, document title, and literal source URL. Section 3.11 repeats each number with the supporting direct quotation, so the evidence remains complete in a printed copy. Statements labeled as requirements, recommendations, tradeoffs, or baseline choices are this guide's security policy rather than claims that Junie enforces them.

Every name enclosed in angle brackets, such as `<Developer Account>`, is a placeholder. Replace each placeholder with the approved local value before using a command or configuration example; do not include the angle brackets in the deployed value.

## 1. Developer context

The CLI is expected to:

- inspect, create, edit, and refactor project files;
- add and update tests;
- run approved Maven Wrapper build and test commands;
- start Quarkus on `127.0.0.1`;
- call the local API;
- let the application connect to a disposable local MySQL schema;
- inspect local Git state; and
- stage and commit local changes.

The developer remains responsible for:

- reviewing every change;
- approving commands outside the exact allowlist;
- approving every remote Git or `glab` operation;
- protecting credentials and production data; and
- deciding whether project source may be sent to the selected model provider.

### 1.1 Local execution boundary

Under this baseline, project files, commands, builds, tests, Quarkus, Git, and MySQL remain on the Windows workstation because Junie uses its local terminal interface. ([1] JetBrains, Junie CLI quickstart, <https://junie.jetbrains.com/docs/junie-cli.html>) Prompts and relevant project context are processed by the selected JetBrains AI provider. ([2] JetBrains, Junie CLI model selection, <https://junie.jetbrains.com/docs/junie-cli-model-selection.html>) ([4] JetBrains, JetBrains AI Terms of Service, <https://www.jetbrains.com/legal/docs/terms/jetbrains-ai-service/>)

Junie CLI can launch terminal commands after applying its approval controls. ([5] JetBrains, Junie CLI Action Allowlist, <https://junie.jetbrains.com/docs/action-allowlist-junie-cli.html>) Windows then gives each launched process the security context of the associated user account. ([6] Microsoft, Windows access tokens, <https://learn.microsoft.com/en-us/windows/win32/secauthz/access-tokens>) Therefore, Junie approval prompts are not an operating-system sandbox: after the developer approves a shell or script, that process can exercise the rights held by the Windows account. ([5] JetBrains, Junie CLI Action Allowlist, <https://junie.jetbrains.com/docs/action-allowlist-junie-cli.html>) ([6] Microsoft, Windows access tokens, <https://learn.microsoft.com/en-us/windows/win32/secauthz/access-tokens>)

Use a dedicated Windows account created by the endpoint administrator:

```text
Account name: <Developer Account>
Account type: Standard User
Local Administrators membership: No
```

Keep personal files, files from unrelated projects, production credentials, and production data in another Windows profile. Do not run Junie CLI, Maven, Git, or a terminal as Administrator.

### 1.2 Approval posture

Use:

- the managed interactive launcher for developer-led work;
- the same managed options for local headless tasks;
- exact-project trust, never parent-directory trust; ([7] JetBrains, Junie CLI configuration and project trust, <https://junie.jetbrains.com/docs/junie-cli-configuration.html>)
- Plan mode for read-only planning; ([8] JetBrains, Junie CLI Plan mode, <https://junie.jetbrains.com/docs/junie-cli-plan-mode.html>)
- Brave mode **Off**; ([9] JetBrains, Junie CLI quickstart — Brave mode, <https://junie.jetbrains.com/docs/junie-cli.html>)
- `defaultBehavior: ask`; ([5] JetBrains, Junie CLI Action Allowlist, <https://junie.jetbrains.com/docs/action-allowlist-junie-cli.html>)
- exact command patterns instead of executable prefixes; ([5] JetBrains, Junie CLI Action Allowlist, <https://junie.jetbrains.com/docs/action-allowlist-junie-cli.html>) and
- a managed launcher that disables default configuration, model, MCP, command, agent, and skill discovery. ([10] JetBrains, Junie CLI parameters, <https://junie.jetbrains.com/docs/parameters.html>) ([11] JetBrains, Junie CLI configuration — discovery controls, <https://junie.jetbrains.com/docs/junie-cli-configuration.html>)

Do not approve an unfamiliar script merely to avoid several individual approvals. Junie approves the terminal command as one `executables` action; operations subsequently performed inside that launched process are governed by the Windows process token, not by separate Junie approvals. ([5] JetBrains, Junie CLI Action Allowlist, <https://junie.jetbrains.com/docs/action-allowlist-junie-cli.html>) ([6] Microsoft, Windows access tokens, <https://learn.microsoft.com/en-us/windows/win32/secauthz/access-tokens>)

When this guide launches both modes from the same account with the same options, interactive and headless execution have the same Windows account, filesystem, process, network, and credential boundaries. JetBrains defines headless mode as operation without an interactive UI. ([3] JetBrains, Junie CLI headless mode, <https://junie.jetbrains.com/docs/junie-headless.html>) Because nobody is present to answer an approval prompt in that mode, a local headless task should be limited to actions already permitted by the reviewed Action Allowlist. ([3] JetBrains, Junie CLI headless mode, <https://junie.jetbrains.com/docs/junie-headless.html>) An `allow` action executes automatically without user approval. ([5] JetBrains, Junie CLI Action Allowlist, <https://junie.jetbrains.com/docs/action-allowlist-junie-cli.html>) Do not broaden the allowlist merely to make an unattended task finish.

## 2. Accesses required for development

### 2.1 Read and write the active project folder

**Development activities enabled**

- read and edit Java, Quarkus, test, configuration, and documentation files;
- create new project files;
- write build output and project-local caches; and
- update local Git metadata.

**Configuration**

Start the managed launcher from the exact repository root:

```powershell
Set-Location C:\Dev\Projects\<Project Folder Name>
C:\ProgramData\<Organization Name>\Junie\Start-Project-Junie.cmd
```

An interactive launch with no valid stored trust marker asks for a trust decision. ([7] JetBrains, Junie CLI configuration and project trust, <https://junie.jetbrains.com/docs/junie-cli-configuration.html>) Select:

```text
Trust this project
```

Do not select trust for `C:\Dev\Projects` or another parent directory.

**Security tradeoff**

Junie can modify project files and run terminal commands under this baseline. ([1] JetBrains, Junie CLI quickstart, <https://junie.jetbrains.com/docs/junie-cli.html>) Those capabilities can damage or delete local project work. ([1] JetBrains, Junie CLI quickstart, <https://junie.jetbrains.com/docs/junie-cli.html>) ([5] JetBrains, Junie CLI Action Allowlist, <https://junie.jetbrains.com/docs/action-allowlist-junie-cli.html>) Local checkpoint commits make recovery easier, but uncommitted work can still be lost.

### 2.2 Read selected files outside the project

**Development activities enabled**

- load the administrator-managed Junie profile;
- load reviewed CLI skills;
- execute installed Java and Git tools; and
- use managed Maven settings.

**Configuration**

The launcher explicitly loads:

```text
C:\ProgramData\<Organization Name>\Junie\project_dev_profile.json
C:\ProgramData\<Organization Name>\Junie\skills\
```

Approved Maven commands explicitly name:

```text
C:\ProgramData\<Organization Name>\Java\maven-settings.xml
```

The CLI allowlist leaves `readOutsideProject` empty. Junie classifies reading outside the current project as a distinct allowlist action, so unmatched outside reads follow `defaultBehavior: ask` in this baseline. ([5] JetBrains, Junie CLI Action Allowlist, <https://junie.jetbrains.com/docs/action-allowlist-junie-cli.html>)

Windows ACLs grant `<Developer Account>` read and execute access to the managed files and grant write access only to Administrators and the deployment process.

**Security tradeoff**

An executable that Junie is allowed to launch runs under the Windows account's process security context. ([6] Microsoft, Windows access tokens, <https://learn.microsoft.com/en-us/windows/win32/secauthz/access-tokens>) It can therefore read any file available to `<Developer Account>`, even when Junie did not receive a separate `readOutsideProject` approval. ([5] JetBrains, Junie CLI Action Allowlist, <https://junie.jetbrains.com/docs/action-allowlist-junie-cli.html>) ([6] Microsoft, Windows access tokens, <https://learn.microsoft.com/en-us/windows/win32/secauthz/access-tokens>) The separate Windows account is the enforceable filesystem boundary.

### 2.3 Read and execute installed development tools

**Development activities enabled**

- compile Java;
- run unit and integration tests;
- run Quarkus verification; and
- start the local Quarkus development server.

**Configuration**

Install tools in administrator-controlled locations:

```text
C:\Program Files\Eclipse Adoptium\
C:\Program Files\Git\
C:\ProgramData\<Organization Name>\Tools\glab\
C:\ProgramData\<Organization Name>\Java\
```

Allow only the complete Maven Wrapper commands in section 3. Do not allowlist broad prefixes such as:

```text
java
cmd
powershell
pwsh
git
glab
```

Keep changes to `pom.xml`, `.mvn\`, and the Maven Wrapper approval-gated.

**Security tradeoff**

Maven plugins, annotation processors, tests, and application code execute with `<Developer Account>` rights under the Windows process model. ([6] Microsoft, Windows access tokens, <https://learn.microsoft.com/en-us/windows/win32/secauthz/access-tokens>) Because Junie can modify code and launch an allowlisted build action, ([1] JetBrains, Junie CLI quickstart, <https://junie.jetbrains.com/docs/junie-cli.html>) ([5] JetBrains, Junie CLI Action Allowlist, <https://junie.jetbrains.com/docs/action-allowlist-junie-cli.html>) build permission is also permission to execute the resulting project code.

### 2.4 Write build caches inside the project

**Development activities enabled**

- cache Maven dependencies without granting a writable user-wide Maven repository; and
- isolate Junie CLI caches by project. ([10] JetBrains, Junie CLI parameters, <https://junie.jetbrains.com/docs/parameters.html>)

**Configuration**

Use:

```text
C:\Dev\Projects\<Project Folder Name>\.agent-cache\maven-repository\
C:\Dev\Projects\<Project Folder Name>\.agent-cache\junie\
```

Every Maven command specifies:

```text
-Dmaven.repo.local=.agent-cache\maven-repository
```

The launcher specifies:

```text
--cache-dir "C:\Dev\Projects\<Project Folder Name>\.agent-cache\junie"
```

Add `.agent-cache/` to `.gitignore`.

**Security tradeoff**

The project-local cache path is a baseline choice enabled by Junie's `--cache-dir` option. ([10] JetBrains, Junie CLI parameters, <https://junie.jetbrains.com/docs/parameters.html>) The cache is writable and may contain executable plugins, compiled code, or diagnostic data. Treat it as disposable.

### 2.5 Connect to the approved artifact repository

**Development activities enabled**

- download Maven Wrapper files, dependencies, and plugins required by approved builds.

**Configuration**

Route Maven through the organization-managed artifact proxy with:

```text
C:\ProgramData\<Organization Name>\Java\maven-settings.xml
```

Use a download-only artifact identity. Permit outbound HTTPS from the Maven process only to the approved proxy. Do not grant Junie general-purpose public network access.

**Security tradeoff**

Dependency and plugin code executes during the build. The proxy reduces uncontrolled sources but does not make every artifact trustworthy.

### 2.6 Host a Quarkus server on localhost

**Development activities enabled**

- run `quarkus:dev`; and
- exercise the API locally.

**Configuration**

Bind Quarkus to:

```properties
quarkus.http.host=127.0.0.1
quarkus.http.port=8080
```

Allowlist only the exact `quarkus:dev` Maven Wrapper command.

**Security tradeoff**

The application executes code that Junie may have modified before launching the approved build command. ([1] JetBrains, Junie CLI quickstart, <https://junie.jetbrains.com/docs/junie-cli.html>) ([5] JetBrains, Junie CLI Action Allowlist, <https://junie.jetbrains.com/docs/action-allowlist-junie-cli.html>) It may expose development endpoints. Loopback binding prevents direct access from other machines but not from other processes on the workstation.

### 2.7 Call services on localhost

**Development activities enabled**

- call the Quarkus health endpoint; and
- let the application connect to MySQL.

**Configuration**

Allow only:

```text
curl.exe --fail http://127.0.0.1:8080/q/health
```

The application uses:

```text
jdbc:mysql://127.0.0.1:3306/<Development Database Name>
```

Do not allowlist arbitrary `curl.exe`, `Invoke-WebRequest`, or a general shell.

**Security tradeoff**

Loopback services are reachable by other local processes. Use development-only data and credentials.

### 2.8 Use the local MySQL database through the application

**Development activities enabled**

- exercise persistence through Quarkus tests and local API calls; and
- run application migrations against a disposable development schema.

**Configuration**

Bind MySQL to `127.0.0.1`. Use the dedicated `<Development Database Name>` schema and `<Application Database User>` identity from section 3.

Do not allowlist `mysql.exe` and do not configure a database MCP server.

**Security tradeoff**

The application identity can change all data in the development schema. Junie can indirectly cause those changes because this baseline permits it to modify project code and launch approved application or build commands. ([1] JetBrains, Junie CLI quickstart, <https://junie.jetbrains.com/docs/junie-cli.html>) ([5] JetBrains, Junie CLI Action Allowlist, <https://junie.jetbrains.com/docs/action-allowlist-junie-cli.html>)

### 2.9 Read and modify the local Git repository

**Development activities enabled**

- inspect status and diffs;
- stage changes; and
- create checkpoint commits.

**Configuration**

Allow only:

```text
git status --short --branch
git diff --check
git diff --cached --check
git add -A
git commit -m junie-checkpoint
```

Do not allowlist `git` as a prefix. Every remote Git and every `glab` command requires approval under this baseline because no matching `allow` rule exists and `defaultBehavior` is `ask`. ([5] JetBrains, Junie CLI Action Allowlist, <https://junie.jetbrains.com/docs/action-allowlist-junie-cli.html>)

**Security tradeoff**

Allowing local commits improves rollback during iterative work. Junie's documented code-modification and terminal-command capabilities mean it can still stage the wrong files, rewrite working files, or damage local Git metadata when the corresponding actions are allowed. ([1] JetBrains, Junie CLI quickstart, <https://junie.jetbrains.com/docs/junie-cli.html>) ([5] JetBrains, Junie CLI Action Allowlist, <https://junie.jetbrains.com/docs/action-allowlist-junie-cli.html>) Remote operations remain approval-gated under this baseline because they affect shared systems.

### 2.10 Search public documentation

**Development activities enabled**

- use current framework and library documentation supplied through the approved model service or by the developer.

**Configuration**

Do not allowlist a general browser, `curl.exe`, `Invoke-WebRequest`, or package-manager search. The developer may supply a reviewed URL or copied documentation when current information is required.

**Security tradeoff**

This is less convenient than unrestricted browsing but prevents arbitrary local command egress and reduces the chance that untrusted web content becomes executable instructions.

### 2.11 Optional direct read-only database inspection

**Development activities enabled**

- inspect a small amount of disposable local development data when application-level diagnostics are insufficient.

**Configuration**

Create a MySQL identity restricted to `SELECT` on the development schema. Store its connection file outside the project:

```text
C:\ProgramData\<Organization Name>\MySQL\junie-readonly.cnf
```

Do not add `mysql.exe` to the allowlist. Approve each complete, bounded query separately.

Do not configure a database MCP server.

**Security tradeoff**

Returned rows enter terminal output and may enter model context. Junie retains prompt and agent-response context for recent sessions, so treat any diagnostic data shown or discussed in a task as potentially retained in local session history. ([4] JetBrains, JetBrains AI Terms of Service, <https://www.jetbrains.com/legal/docs/terms/jetbrains-ai-service/>) ([12] JetBrains, Junie CLI quickstart — session history, <https://junie.jetbrains.com/docs/junie-cli.html>) Use only disposable development data.

### 2.12 Run a local headless task

**Development activities enabled**

- run a bounded one-shot task without the interactive terminal interface; ([3] JetBrains, Junie CLI headless mode, <https://junie.jetbrains.com/docs/junie-headless.html>)
- run an approved build, test, or local code-review task from local automation; and
- use the same project files, tools, localhost services, and local Git permissions as an interactive Junie session when both modes run under this baseline's account and managed options.

**Configuration**

Run Junie from the `<Developer Account>` account with the same hardcoded project, managed configuration, disabled discovery locations, cache directory, and Action Allowlist used for interactive work. Junie accepts a headless prompt as a positional argument and the CLI reference also defines `--task` for the task description. ([3] JetBrains, Junie CLI headless mode, <https://junie.jetbrains.com/docs/junie-headless.html>) ([10] JetBrains, Junie CLI parameters, <https://junie.jetbrains.com/docs/parameters.html>)

Headless mode requires a Junie authentication token. ([3] JetBrains, Junie CLI headless mode, <https://junie.jetbrains.com/docs/junie-headless.html>) Supply `JUNIE_API_KEY` through the approved local secret-management mechanism. Do not store it in the project, a committed script, `project_dev_profile.json`, or `allowlist.json`.

Before using headless mode for a project, launch Junie interactively once and select `Trust this project`. JetBrains currently documents that non-interactive trust-marker enforcement is controlled by a rollout toggle and is disabled. ([3] JetBrains, Junie CLI headless mode, <https://junie.jetbrains.com/docs/junie-headless.html>) Establishing exact-project trust creates the marker that the documented future enforcement path will use when the rollout is enabled. ([3] JetBrains, Junie CLI headless mode, <https://junie.jetbrains.com/docs/junie-headless.html>) ([7] JetBrains, Junie CLI configuration and project trust, <https://junie.jetbrains.com/docs/junie-cli-configuration.html>) Explicit managed configuration paths remain enabled even for an untrusted project because the user supplied them deliberately. ([7] JetBrains, Junie CLI configuration and project trust, <https://junie.jetbrains.com/docs/junie-cli-configuration.html>)

**Security tradeoff**

For this baseline, headless mode does not add filesystem access or higher privileges because it is launched under the same Windows account and managed options; JetBrains defines the mode by the absence of interactive UI. ([3] JetBrains, Junie CLI headless mode, <https://junie.jetbrains.com/docs/junie-headless.html>) That absence removes the developer's opportunity to approve or reject an action while the task is running. The task can automatically perform actions whose matching allowlist rule has action `allow`. ([5] JetBrains, Junie CLI Action Allowlist, <https://junie.jetbrains.com/docs/action-allowlist-junie-cli.html>) An action that still requires approval cannot rely on a person being present, so unattended tasks must be designed to complete using only the existing narrow allowlist. The authentication token is available to the Junie process through `--auth` and must be protected as a credential. ([3] JetBrains, Junie CLI headless mode, <https://junie.jetbrains.com/docs/junie-headless.html>)

## 3. Complete security model and configuration

### 3.1 Control model

The complete model has five layers:

1. **Windows account:** This baseline launches Junie as the standard `<Developer Account>` account.
2. **Project selection:** `--project` names the exact repository and exact-project trust is selected. ([10] JetBrains, Junie CLI parameters, <https://junie.jetbrains.com/docs/parameters.html>) ([7] JetBrains, Junie CLI configuration and project trust, <https://junie.jetbrains.com/docs/junie-cli-configuration.html>)
3. **Configuration discovery:** default configuration, model, MCP, command, agent, and skill locations are disabled by the managed CLI options. ([10] JetBrains, Junie CLI parameters, <https://junie.jetbrains.com/docs/parameters.html>) ([11] JetBrains, Junie CLI configuration — discovery controls, <https://junie.jetbrains.com/docs/junie-cli-configuration.html>)
4. **Action approval:** Brave mode is off and only exact reviewed commands are allowlisted. ([9] JetBrains, Junie CLI quickstart — Brave mode, <https://junie.jetbrains.com/docs/junie-cli.html>) ([5] JetBrains, Junie CLI Action Allowlist, <https://junie.jetbrains.com/docs/action-allowlist-junie-cli.html>)
5. **Service identity:** artifact, MySQL, and GitLab identities have only development authority; remote operations require approval under this baseline's allowlist. ([5] JetBrains, Junie CLI Action Allowlist, <https://junie.jetbrains.com/docs/action-allowlist-junie-cli.html>)

The main residual risk is approved code execution. Junie can modify project code and run an allowlisted build or test action. ([1] JetBrains, Junie CLI quickstart, <https://junie.jetbrains.com/docs/junie-cli.html>) ([5] JetBrains, Junie CLI Action Allowlist, <https://junie.jetbrains.com/docs/action-allowlist-junie-cli.html>) Windows runs that process in `<Developer Account>`'s security context. ([6] Microsoft, Windows access tokens, <https://learn.microsoft.com/en-us/windows/win32/secauthz/access-tokens>)

### 3.2 Windows workstation

Use:

```text
<Developer Account>
  Standard User
  Not a member of Administrators
```

Store projects under:

```text
C:\Dev\Projects\
```

Store managed configuration under:

```text
C:\ProgramData\<Organization Name>\Java\
C:\ProgramData\<Organization Name>\Junie\
C:\ProgramData\<Organization Name>\MySQL\
```

### 3.3 Project files

#### Complete `<project>\.junie\AGENTS.md`

Junie CLI reads project guidelines from `.junie/AGENTS.md` and adds them to each task's context. ([13] JetBrains, Junie CLI guidelines and memory, <https://junie.jetbrains.com/docs/guidelines-and-memory.html>)

```markdown
# Project development

This repository contains a Java API built with Quarkus and Maven Wrapper on Windows.

## Allowed work

- Read and edit files inside this repository.
- Use only the approved Maven Wrapper, localhost health, and local Git commands.
- Use `.agent-cache\maven-repository` as the Maven local repository.
- Bind development HTTP services to `127.0.0.1`.
- Exercise MySQL through the Quarkus application and tests.

## Approval required

- Ask before changing `pom.xml`, `.mvn\`, or Maven Wrapper files.
- Ask before using `mysql.exe`.
- Ask before remote Git, `glab`, reset, restore, checkout, cleanup, or another destructive operation.
- Ask before an outside-project file access or unapproved network operation.

## Prohibited for this profile

- Do not enable Brave mode.
- Do not add allowlist entries.
- Do not use MCP, extensions, remote mode, custom commands, or custom agents.

## Completion

- Review the complete diff.
- Run the approved Maven verify command.
- Report changed files, test results, and operations that still require approval.
```

#### Complete `<project>\.gitignore` additions

```gitignore
.agent-cache/
.env
.env.*
!.env.example
```

### 3.4 Managed Junie CLI profile

File:

```text
C:\ProgramData\<Organization Name>\Junie\project_dev_profile.json
```

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

The false `*-default-location` settings disable the corresponding default discovery locations, while `--skill-location` in the launcher adds only the managed skill folder. ([10] JetBrains, Junie CLI parameters, <https://junie.jetbrains.com/docs/parameters.html>) ([11] JetBrains, Junie CLI configuration — discovery controls, <https://junie.jetbrains.com/docs/junie-cli-configuration.html>) Disabling custom model-profile discovery does not itself select a provider; the Junie login or Junie API key supplies the JetBrains AI provider for this baseline. ([2] JetBrains, Junie CLI model selection, <https://junie.jetbrains.com/docs/junie-cli-model-selection.html>)

### 3.5 Managed interactive launcher

File:

```text
C:\ProgramData\<Organization Name>\Junie\Start-Project-Junie.cmd
```

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

The launcher hardcodes the project and managed locations using Junie's documented project, configuration, cache, and discovery-location options. ([10] JetBrains, Junie CLI parameters, <https://junie.jetbrains.com/docs/parameters.html>) Use a separate reviewed launcher for another project.

Junie's account interface supports authentication through a JetBrains Account or Junie API key. ([2] JetBrains, Junie CLI model selection, <https://junie.jetbrains.com/docs/junie-cli-model-selection.html>) Authenticate interactively:

```text
/account
  Junie Account
  Log in with JetBrains Account
```

Do not place a token or provider API key in the project, launcher, profile, or allowlist.

### 3.5.1 Local headless invocation

Use the same managed options for a bounded one-shot task:

```powershell
junie `
  --project "C:\Dev\Projects\<Project Folder Name>" `
  --config-default-locations false `
  --config-location "C:\ProgramData\<Organization Name>\Junie\project_dev_profile.json" `
  --model-default-locations false `
  --mcp-default-locations false `
  --skill-default-locations false `
  --skill-location "C:\ProgramData\<Organization Name>\Junie\skills" `
  --command-default-locations false `
  --agent-default-location false `
  --cache-dir "C:\Dev\Projects\<Project Folder Name>\.agent-cache\junie" `
  --skip-update-check `
  --auth "$env:JUNIE_API_KEY" `
  --task "Run the approved Maven verify command and report the result"
```

The `--auth` option supplies a Junie API key to authenticate Junie CLI. ([10] JetBrains, Junie CLI parameters, <https://junie.jetbrains.com/docs/parameters.html>) The administrator or developer supplies `JUNIE_API_KEY` through the approved local secret-management process before this command runs and removes it from the process environment afterward. Use the same Action Allowlist as interactive Junie CLI. Do not create a broader headless allowlist.

### 3.6 Junie CLI Action Allowlist

Junie stores allowed commands and patterns in `~/.junie/allowlist.json`; rules can cover file editing, executables, MCP tools, and reads outside the project. ([5] JetBrains, Junie CLI Action Allowlist, <https://junie.jetbrains.com/docs/action-allowlist-junie-cli.html>) This baseline uses only exact executable patterns with no wildcard characters and leaves the other action arrays empty.

File:

```text
C:\Users\<Developer Account>\.junie\allowlist.json
```

```json
{
  "defaultBehavior": "ask",
  "allowReadonlyCommands": false,
  "rules": {
    "fileEditing": {
      "rules": []
    },
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
        {
          "pattern": "git status --short --branch",
          "action": "allow"
        },
        {
          "pattern": "git diff --check",
          "action": "allow"
        },
        {
          "pattern": "git diff --cached --check",
          "action": "allow"
        },
        {
          "pattern": "git add -A",
          "action": "allow"
        },
        {
          "pattern": "git commit -m junie-checkpoint",
          "action": "allow"
        }
      ]
    },
    "mcpTools": {
      "rules": []
    },
    "readOutsideProject": {
      "rules": []
    }
  }
}
```

After review, Administrators may make the file read-only to `<Developer Account>`:

```powershell
icacls "C:\Users\<Developer Account>\.junie\allowlist.json" /inheritance:r
icacls "C:\Users\<Developer Account>\.junie\allowlist.json" /grant:r "<Developer Account>:(R)" "Administrators:(F)" "SYSTEM:(F)"
```

### 3.7 Maven configuration

File:

```text
C:\ProgramData\<Organization Name>\Java\maven-settings.xml
```

```xml
<?xml version="1.0" encoding="UTF-8"?>
<settings xmlns="http://maven.apache.org/SETTINGS/1.2.0"
          xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
          xsi:schemaLocation="http://maven.apache.org/SETTINGS/1.2.0 https://maven.apache.org/xsd/settings-1.2.0.xsd">
  <mirrors>
    <mirror>
      <id>customer-maven</id>
      <name><Organization Name> Maven proxy</name>
      <url>https://<Artifact Proxy Host>/repository/maven-public/</url>
      <mirrorOf>*</mirrorOf>
    </mirror>
  </mirrors>
  <servers>
    <server>
      <id>customer-maven</id>
      <username>${env.CUSTOMER_MAVEN_USERNAME}</username>
      <password>${env.CUSTOMER_MAVEN_PASSWORD}</password>
    </server>
  </servers>
</settings>
```

Replace the example URL. The account must be download-only.

### 3.8 Quarkus and MySQL configuration

Quarkus:

```properties
quarkus.http.host=127.0.0.1
quarkus.http.port=8080

quarkus.datasource.db-kind=mysql
quarkus.datasource.jdbc.url=${QUARKUS_DATASOURCE_JDBC_URL:jdbc:mysql://127.0.0.1:3306/<Development Database Name>}
quarkus.datasource.username=${QUARKUS_DATASOURCE_USERNAME:<Application Database User>}
quarkus.datasource.password=${QUARKUS_DATASOURCE_PASSWORD}
```

MySQL `my.ini`:

```ini
[mysqld]
bind-address=127.0.0.1
port=3306
```

Development database:

```sql
CREATE DATABASE <Development Database Name>;

CREATE USER '<Application Database User>'@'127.0.0.1'
  IDENTIFIED BY '<Local Development Password>';

GRANT ALL PRIVILEGES
  ON <Development Database Name>.*
  TO '<Application Database User>'@'127.0.0.1';
```

### 3.9 Deployment verification

Test Junie approvals one command at a time. Junie evaluates command and action patterns through the Action Allowlist, and an `allow` match executes without user approval. ([5] JetBrains, Junie CLI Action Allowlist, <https://junie.jetbrains.com/docs/action-allowlist-junie-cli.html>) Do not approve a wrapper script containing all tests.

| Request made through Junie CLI | Expected result |
| --- | --- |
| Read and edit `C:\Dev\Projects\<Project Folder Name>\src\main\java\...\Example.java` | Allowed by project scope and this baseline's empty `fileEditing` rules ([5] JetBrains, Junie CLI Action Allowlist, <https://junie.jetbrains.com/docs/action-allowlist-junie-cli.html>) |
| Read `C:\Users\<Developer Account>\Documents\AgentAccessValidation\sentinel.txt` | Approval required by `defaultBehavior: ask` because no `readOutsideProject` rule matches ([5] JetBrains, Junie CLI Action Allowlist, <https://junie.jetbrains.com/docs/action-allowlist-junie-cli.html>) |
| Write `C:\Users\<Developer Account>\Desktop\AgentAccessValidation\write-probe.txt` | Approval required by `defaultBehavior: ask` because no `fileEditing` rule matches ([5] JetBrains, Junie CLI Action Allowlist, <https://junie.jetbrains.com/docs/action-allowlist-junie-cli.html>) |
| Approved Maven `test`, `verify`, or `quarkus:dev` command | Allowed by an exact `executables` pattern ([5] JetBrains, Junie CLI Action Allowlist, <https://junie.jetbrains.com/docs/action-allowlist-junie-cli.html>) |
| `curl.exe --fail http://127.0.0.1:8080/q/health` | Allowed by an exact `executables` pattern ([5] JetBrains, Junie CLI Action Allowlist, <https://junie.jetbrains.com/docs/action-allowlist-junie-cli.html>) |
| `curl.exe https://example.com/` | Approval required by `defaultBehavior: ask` because no `executables` rule matches ([5] JetBrains, Junie CLI Action Allowlist, <https://junie.jetbrains.com/docs/action-allowlist-junie-cli.html>) |
| `git status --short --branch` | Allowed by an exact `executables` pattern ([5] JetBrains, Junie CLI Action Allowlist, <https://junie.jetbrains.com/docs/action-allowlist-junie-cli.html>) |
| `git push` | Approval required by `defaultBehavior: ask` because no `executables` rule matches ([5] JetBrains, Junie CLI Action Allowlist, <https://junie.jetbrains.com/docs/action-allowlist-junie-cli.html>) |
| Any `glab` command | Approval required by `defaultBehavior: ask` because no `executables` rule matches ([5] JetBrains, Junie CLI Action Allowlist, <https://junie.jetbrains.com/docs/action-allowlist-junie-cli.html>) |
| Any `mysql.exe` command | Approval required by `defaultBehavior: ask` because no `executables` rule matches ([5] JetBrains, Junie CLI Action Allowlist, <https://junie.jetbrains.com/docs/action-allowlist-junie-cli.html>) |
| MCP tool | No MCP server should be discovered under the managed discovery options; any sensitive MCP action would otherwise be approval-controlled ([10] JetBrains, Junie CLI parameters, <https://junie.jetbrains.com/docs/parameters.html>) ([11] JetBrains, Junie CLI configuration — discovery controls, <https://junie.jetbrains.com/docs/junie-cli-configuration.html>) ([5] JetBrains, Junie CLI Action Allowlist, <https://junie.jetbrains.com/docs/action-allowlist-junie-cli.html>) |
| Local headless task using the managed options and existing Action Allowlist | Can run without interactive UI ([3] JetBrains, Junie CLI headless mode, <https://junie.jetbrains.com/docs/junie-headless.html>) |
| Headless task attempts an action outside the Action Allowlist | Cannot rely on interactive approval; the task must not require that action ([3] JetBrains, Junie CLI headless mode, <https://junie.jetbrains.com/docs/junie-headless.html>) ([5] JetBrains, Junie CLI Action Allowlist, <https://junie.jetbrains.com/docs/action-allowlist-junie-cli.html>) |
Also confirm:

- Brave mode reports **Off**; ([9] JetBrains, Junie CLI quickstart — Brave mode, <https://junie.jetbrains.com/docs/junie-cli.html>)
- the startup header shows the exact project selected with `--project`; ([10] JetBrains, Junie CLI parameters, <https://junie.jetbrains.com/docs/parameters.html>)
- the managed `project_dev_profile.json` is loaded from the explicit `--config-location`; ([7] JetBrains, Junie CLI configuration and project trust, <https://junie.jetbrains.com/docs/junie-cli-configuration.html>) ([10] JetBrains, Junie CLI parameters, <https://junie.jetbrains.com/docs/parameters.html>)
- only the reviewed `allowlist.json` rules exist; ([5] JetBrains, Junie CLI Action Allowlist, <https://junie.jetbrains.com/docs/action-allowlist-junie-cli.html>) and
- no default MCP, custom command, custom agent, custom model, or unreviewed skill locations load under the managed discovery options. ([10] JetBrains, Junie CLI parameters, <https://junie.jetbrains.com/docs/parameters.html>) ([11] JetBrains, Junie CLI configuration — discovery controls, <https://junie.jetbrains.com/docs/junie-cli-configuration.html>)

### 3.10 Product and platform references

- Junie CLI quickstart and approvals: https://junie.jetbrains.com/docs/junie-cli.html
- Junie CLI parameters: https://junie.jetbrains.com/docs/parameters.html
- Junie CLI headless mode: https://junie.jetbrains.com/docs/junie-headless.html
- Junie CLI configuration and project trust: https://junie.jetbrains.com/docs/junie-cli-configuration.html
- Junie CLI Action Allowlist: https://junie.jetbrains.com/docs/action-allowlist-junie-cli.html
- Junie CLI Plan mode: https://junie.jetbrains.com/docs/junie-cli-plan-mode.html
- Junie CLI guidelines and memory: https://junie.jetbrains.com/docs/guidelines-and-memory.html
- Junie CLI model selection: https://junie.jetbrains.com/docs/junie-cli-model-selection.html
- JetBrains AI Terms of Service: https://www.jetbrains.com/legal/docs/terms/jetbrains-ai-service/
- Windows access tokens: https://learn.microsoft.com/en-us/windows/win32/secauthz/access-tokens
- Maven settings: https://maven.apache.org/settings.html
- Maven Wrapper: https://maven.apache.org/tools/wrapper/
- Quarkus configuration: https://quarkus.io/guides/config-reference
- Quarkus datasource: https://quarkus.io/guides/datasource
- MySQL account management: https://dev.mysql.com/doc/refman/8.4/en/access-control.html
- MySQL server variables: https://dev.mysql.com/doc/refman/8.4/en/server-system-variables.html

### 3.11 Numbered quoted references

The quotations were checked against the printed URLs on 2026-07-30.

1. **JetBrains, Junie CLI quickstart.** “review, write, and modify code”; “Run shell commands.” https://junie.jetbrains.com/docs/junie-cli.html
2. **JetBrains, Junie CLI model selection.** “models accessed through a JetBrains AI subscription, by means of a Junie login or a JetBrains AI API key.” https://junie.jetbrains.com/docs/junie-cli-model-selection.html
3. **JetBrains, Junie CLI headless mode.** “without interactive UI”; “requires an authentication token to run”; trust-marker enforcement “is controlled by a build rollout toggle and is currently disabled.” https://junie.jetbrains.com/docs/junie-headless.html
4. **JetBrains, JetBrains AI Terms of Service.** JetBrains AI may “automatically select, read, and process some of Your Data” to understand the context for a response. https://www.jetbrains.com/legal/docs/terms/jetbrains-ai-service/
5. **JetBrains, Junie CLI Action Allowlist.** “editing the `~/.junie/allowlist.json` file”; “`allow` – Execute automatically without user approval”; “`pattern`” uses “Glob syntax”; “`fileEditing`”; “`executables`”; “`mcpTools`”; “`readOutsideProject`”; “first match takes precedence”; `"defaultBehavior": "ask"`. https://junie.jetbrains.com/docs/action-allowlist-junie-cli.html
6. **Microsoft, Windows access tokens.** “Every process executed on behalf of this user has a copy of this access token.” https://learn.microsoft.com/en-us/windows/win32/secauthz/access-tokens
7. **JetBrains, Junie CLI configuration and project trust.** “trust only the canonical project directory”; explicit locations are “loaded even when the CLI project is untrusted”; the “startup header explains” restricted-project behavior. https://junie.jetbrains.com/docs/junie-cli-configuration.html
8. **JetBrains, Junie CLI Plan mode.** “Junie CLI analyzes the codebase with read-only operations and produces a design document for the task.” https://junie.jetbrains.com/docs/junie-cli-plan-mode.html
9. **JetBrains, Junie CLI quickstart — Brave mode.** Brave mode Off “asks for approval for every potentially sensitive action.” https://junie.jetbrains.com/docs/junie-cli.html
10. **JetBrains, Junie CLI parameters.** `--project` can “Specify the path to the project directory where Junie will run”; `--cache-dir` specifies “a custom path”; `--config-default-locations` can “disable loading configuration from the default locations.” https://junie.jetbrains.com/docs/parameters.html
11. **JetBrains, Junie CLI configuration — discovery controls.** The documented fields include “`mcp-default-locations`”; “`skill-default-locations`”; “`command-default-locations`”; “`agent-default-location`”; “`model-default-locations`.” https://junie.jetbrains.com/docs/junie-cli-configuration.html
12. **JetBrains, Junie CLI quickstart — session history.** Junie “stores the full session context” for “the last 10 sessions.” https://junie.jetbrains.com/docs/junie-cli.html
13. **JetBrains, Junie CLI guidelines and memory.** “Junie CLI reads guidelines from the `AGENTS.md` file and adds this context to every task it works on.” https://junie.jetbrains.com/docs/guidelines-and-memory.html
