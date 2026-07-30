# Codex Agent Security Guide

## An Opinionated Baseline for Java API Development on Windows

Status: Recommended baseline

Last reviewed: July 30, 2026

Codex security-behavior assertions in this guide carry an `OAI-*` evidence
marker. Each marker links to a short quotation from the current official OpenAI
explanation in [section 3.8](#38-official-openai-evidence-for-codex-security-behavior).

Every name enclosed in angle brackets, such as `<Organization Name>`, is a placeholder. Replace each placeholder with the approved local value before using a command or configuration example; do not include the angle brackets in the deployed value.

## 1. Developer context

This baseline is for developers using Codex locally on managed Windows 11 workstations to build Java APIs with Quarkus. Projects use Git, Maven or Gradle, and a local MySQL development database.

The developer signs in with an individual ChatGPT Pro account so local Codex usage can use the subscription entitlement. [OAI-AUTH](#oai-auth) [OAI-PLANS](#oai-plans)

The intended Codex tasks are:

- Inspect, create, and modify source code and project documentation.
- Run Java, Maven or Gradle, Quarkus, tests, formatters, and static analysis.
- Download dependencies through an organization-managed artifact proxy.
- Start a Quarkus API on loopback and call its endpoints.
- Run application and integration tests against local MySQL.
- Inspect Git state, create branches, stage changes, and create local commits.
- Use the GitLab CLI for remote GitLab operations only after developer approval.
- Consult public product documentation through cached web search. [OAI-SANDBOX](#oai-sandbox) [OAI-NETWORK](#oai-network) [OAI-WEB](#oai-web)

The examples assume Codex 0.138.0 or later because managed permission-profile allowlists require that release or later. OpenAI currently marks permission profiles as beta and subject to change, so revalidate this baseline against the live documentation before deployment. Replace example installation paths, artifact hosts, schema names, and ports with the deployment's actual values. [OAI-REQUIREMENTS](#oai-requirements) [OAI-PROFILES](#oai-profiles)

### 1.1 Local Codex only; no Codex cloud

Codex cloud executes a task remotely in a configured cloud environment and uses a container created for the task. It is a different execution surface from Codex commands running on the workstation. The local Windows sandbox and the local `requirements.toml` permission profile do not govern a cloud task. [OAI-MODES](#oai-modes) [OAI-CLOUD](#oai-cloud) [OAI-BOUNDARIES](#oai-boundaries)

The official Codex plan comparison lists Pro separately from Business and Enterprise. It places a dedicated workspace and essential admin controls under Business, and RBAC and other enterprise controls under Enterprise, not under Pro. [OAI-PLANS](#oai-plans)

This baseline uses ChatGPT sign-in so local Codex work is covered by the Pro subscription. OpenAI documents that Codex cloud also requires ChatGPT sign-in. Consequently, Codex cloud remains an available product surface for the Pro account even though this baseline does not use it. [OAI-AUTH](#oai-auth) [OAI-PLANS](#oai-plans)

For this Pro deployment, “no Codex cloud” is implemented as an operating restriction. In the official controls reviewed on July 30, 2026, OpenAI documents per-chat environment selection and cloud-environment configuration, but does not document a Pro account-level “local environments only” control. The relevant documented controls and checks are: [OAI-MODES](#oai-modes) [OAI-CLOUD](#oai-cloud) [OAI-REQUIREMENTS](#oai-requirements)

1. **Select where each chat runs in the desktop app.** Open the ChatGPT dropdown, select **Codex**, and start a new chat. In the new-chat composer, use the environment selector shown in OpenAI’s documentation. Codex environments: https://learn.chatgpt.com/docs/environments/modes. [OAI-MODES](#oai-modes)
   - Select **Local** to work directly in the current project directory; or
   - Select **Worktree** to use a Git worktree on the same Windows computer.
   - Do not select **Cloud**, which runs the chat remotely in a configured cloud environment. [OAI-MODES](#oai-modes)
2. **Do not create a Codex cloud environment.** Open Codex settings — Environments: https://chatgpt.com/codex/settings/environments. Confirm that no cloud environment exists for the project. This is the page OpenAI documents for configuring cloud environments; keeping it empty is an audit check, not an enforced “disable cloud” setting. [OAI-CLOUD](#oai-cloud)
3. **Before each task, check the composer selector.** The selected mode must read **Local** or **Worktree**, never **Cloud**.

These steps reduce accidental cloud use but do not stop the Pro account holder from deliberately configuring and starting a cloud task. The official `requirements.toml` schema reviewed on July 30, 2026 constrains supported local-client behavior and does not list a Codex-cloud disable setting. [OAI-BOUNDARIES](#oai-boundaries) [OAI-REQUIREMENTS](#oai-requirements)

**Stronger technical alternative:** authenticate the local Codex client only with an OpenAI API key and enforce `forced_login_method = "api"` through managed configuration. Codex cloud requires ChatGPT sign-in, so it is unavailable inside that API-authenticated local client. This alternative uses API organization policies and usage-based API billing rather than the ChatGPT Pro subscription. It also does not prevent the same person from separately signing in to ChatGPT on the web and using Codex cloud there. [OAI-AUTH](#oai-auth) [OAI-LOGIN-POLICY](#oai-login-policy)

If centrally enforced prohibition of Codex cloud is a requirement, an individual Pro subscription is not sufficient by itself. Use a managed Business or Enterprise workspace with the appropriate product-access controls, or add a separately assessed endpoint/network restriction. [OAI-PLANS](#oai-plans) [OAI-BOUNDARIES](#oai-boundaries)

See Codex authentication: https://learn.chatgpt.com/docs/auth. This page distinguishes ChatGPT subscription sign-in from API-key sign-in and states that Codex cloud requires ChatGPT sign-in. [OAI-AUTH](#oai-auth)

## 2. Accesses required for development

Each subsection defines one access grant, the development work it enables, the configuration that provides it, and the resulting security tradeoff.

### 2.1 Read and write the active project folder

**Enables**

- Read and search Java source, tests, configuration, and documentation.
- Create, edit, rename, and delete project files.
- Generate code and test fixtures.
- Write Quarkus, Maven, and Gradle build output.

**Configuration**

Use the organization-defined `project_dev_profile`, a managed permission profile for development within the active project. It is based on Codex’s built-in `:workspace` profile. [OAI-PROFILES](#oai-profiles) [OAI-REQUIREMENTS](#oai-requirements)

For local commands that Codex runs under this profile, filesystem access works as follows:

1. Access to the filesystem is denied by default. A sandboxed command cannot read or modify a file outside the project merely because the signed-in Windows developer can access it. [OAI-PROFILE-FILES](#oai-profile-files)
2. Codex re-enables read-only access to the Codex-defined set of operating-system and runtime locations represented by `:minimal`. Common tools need these locations to start and load required Windows components. This does not grant read access to the developer’s entire user profile. [OAI-PROFILE-FILES](#oai-profile-files)
3. The active project folder is granted read and write access. Codex can therefore inspect and modify the project and create build output there. [OAI-PROFILES](#oai-profiles) [OAI-PROFILE-FILES](#oai-profile-files)
4. Sensitive files inside the project, such as `.env` and `.env.*`, are explicitly denied. A narrower denial takes precedence over the broader project write grant. [OAI-PROFILE-FILES](#oai-profile-files)
5. Later sections add read-only access to specific development-tool, skill, and managed-configuration folders. Every other location remains unavailable to sandboxed commands unless a developer approves an escalation. [OAI-PROFILE-FILES](#oai-profile-files)

This restriction applies to local sandboxed command execution. It does not govern Codex cloud, MCP servers, connectors, browser tools, Computer Use, or a command that the developer explicitly approves to run outside the normal sandbox boundary. The other local product surfaces are separately disabled or controlled later in this guide. With ChatGPT Pro authentication, Codex cloud is an operating restriction rather than a locally enforced control. [OAI-SCOPE](#oai-scope)

The following configuration implements this behavior:

```toml
[permissions.project_dev_profile]
extends = ":workspace"

[permissions.project_dev_profile.filesystem]
":root" = "deny"
":minimal" = "read"

[permissions.project_dev_profile.filesystem.":workspace_roots"]
"." = "write"
".git" = "write"
"**/.env" = "deny"
"**/.env.*" = "deny"
```

In this configuration:

- `":root" = "deny"` establishes the default denial for the filesystem.
- `":minimal" = "read"` permits only the Codex-defined operating-system and runtime paths required by common tools.
- `"." = "write"` under `":workspace_roots"` makes each active project root readable and writable.
- The `.env` rules override the project write grant for matching files.
- Extending `:workspace` retains its built-in protection for project metadata. This baseline deliberately overrides that protection for `.git`, making it writable so Codex can create branches, stage files, and commit without separate approval. Project `.codex` and `.agents` directories remain read-only. [OAI-PROFILE-FILES](#oai-profile-files) [OAI-PROTECTED-PATHS](#oai-protected-paths)

**Tradeoff**

Codex can change any non-denied file in the project, including build scripts and code that a developer may later execute. Source control and diff review provide recovery and review; they do not reduce this write authority. [OAI-SCOPE](#oai-scope) [OAI-PROFILE-FILES](#oai-profile-files)

**Pertinent alternative**

Use `:read-only` for review or investigation tasks that do not need edits. Switching profiles by task is safer but adds operating friction. [OAI-PROFILES](#oai-profiles)

### 2.2 Read selected files outside the project

**Enables**

- Load user-installed Codex skills from `%USERPROFILE%\.codex\skills`.
- Load shared agent skills from `%USERPROFILE%\.agents\skills`, if the organization uses them.
- Read managed Java build configuration from `C:\ProgramData\<Organization Name>\Java`. [OAI-PROFILE-FILES](#oai-profile-files) [OAI-EXTENSIONS](#oai-extensions)

**Configuration**

Grant only the required directories:

```toml
[permissions.project_dev_profile.filesystem]
":root" = "deny"
":minimal" = "read"
'~\.codex\skills' = "read"
'~\.agents\skills' = "read"
'C:\ProgramData\<Organization Name>\Java' = "read"
'~\Documents' = "deny"
'~\Desktop' = "deny"
'~\Downloads' = "deny"
'~\.ssh' = "deny"
'~\.aws' = "deny"
'~\.azure' = "deny"
'~\.kube' = "deny"
'~\.docker' = "deny"
```

Remove either skill-directory grant if it is not used. Put organization-managed skills in one dedicated read-only directory instead of granting read access to the whole user profile.

The explicit user-folder denials are defense in depth. Because `:root` is denied, directories not reopened by a narrower rule are already inaccessible. [OAI-PROFILE-FILES](#oai-profile-files)

On native Windows, require the elevated sandbox in the administrator-controlled `requirements.toml`. It runs commands as dedicated lower-privilege sandbox users and applies filesystem permission boundaries. [OAI-WINDOWS](#oai-windows)

```toml
[windows]
allowed_sandbox_implementations = ["elevated"]
```

During administrator-approved setup of the elevated Windows sandbox, Codex creates two local Windows user accounts. [OAI-WINDOWS-DESIGN](#oai-windows-design)

- `CodexSandboxOffline` runs sandboxed commands that must not have outbound network access. Codex creates Windows Firewall rules that block outbound traffic for this account.
- `CodexSandboxOnline` runs sandboxed commands when the active permission profile permits network access. Network requests remain subject to the profile’s configured network policy and domain allowlist. [OAI-WINDOWS-DESIGN](#oai-windows-design) [OAI-NETWORK](#oai-network)

These are workstation-local service accounts created and managed for the Codex sandbox. They are not the developer’s account, ChatGPT accounts, domain accounts, or Codex cloud identities. Agent commands execute with the lower privileges of one of these accounts instead of executing directly as the signed-in developer. The administrator-approved sandbox setup creates the accounts, stores their credentials with Windows DPAPI, and installs the applicable firewall and filesystem controls. [OAI-WINDOWS](#oai-windows) [OAI-WINDOWS-DESIGN](#oai-windows-design)

The permission profile is the preferred way to exclude `Documents` and other user folders. The sandbox translates the selected policy into its Windows enforcement boundary. IT may also apply explicit Windows deny ACLs for `CodexSandboxOffline` and `CodexSandboxOnline` to especially sensitive folders, but this should be tested after sandbox setup and Codex upgrades. Manual ACLs can conflict with inherited permissions or product-managed sandbox ACLs. [OAI-WINDOWS](#oai-windows) [OAI-PROFILE-FILES](#oai-profile-files)

**Tradeoff**

Every readable skill can provide instructions or executable helper scripts to Codex. Read-only access prevents Codex from altering the skills, but does not make their content trustworthy. Limit these directories to reviewed, organization-approved skills. [OAI-EXTENSIONS](#oai-extensions)

**Pertinent alternative**

Keep all required project guidance in `PROJECT_ROOT\AGENTS.md` and do not grant either external skill directory. This is narrower but gives up reusable user-level skills.

### 2.3 Read and execute installed development tools

**Enables**

- Run PowerShell and standard Windows commands.
- Run Java and the checked-in Maven or Gradle wrapper.
- Run Git for status, diff, history, staging, and commits.
- Run the GitLab CLI after a developer approves the specific command.
- Execute Quarkus tests and development mode. [OAI-SANDBOX](#oai-sandbox) [OAI-RULES](#oai-rules)

**Configuration**

Codex’s `:minimal` access provides common runtime paths. Add read access for actual managed tool installations. [OAI-PROFILE-FILES](#oai-profile-files)

```toml
[permissions.project_dev_profile.filesystem]
":minimal" = "read"
'C:\Program Files\Git' = "read"
'C:\Program Files\Eclipse Adoptium' = "read"
'C:\Program Files\Apache\Maven' = "read"
'C:\Program Files\Gradle' = "read"
'C:\ProgramData\<Organization Name>\Tools\glab' = "read"
```

Confirm the paths before deployment:

```powershell
where.exe git
where.exe java
where.exe mvn
where.exe gradle
where.exe glab
```

The example assumes endpoint administration installs `glab.exe` in `C:\ProgramData\<Organization Name>\Tools\glab`. Replace that example with the directory returned by `where.exe glab`. If the project always uses a wrapper, remove the standalone Maven or Gradle path. Keep the installed tool directories read-only; Codex needs to execute the binaries, not update them. [OAI-PROFILE-FILES](#oai-profile-files)

**Tradeoff**

Tool execution includes arbitrary behavior implemented by build plugins, annotation processors, test code, and dependency installation hooks. Spawned tools inherit the same sandbox boundary, but the sandbox cannot make their code benign. [OAI-SANDBOX](#oai-sandbox)

**Pertinent alternative**

Run builds only in CI. This gives the workstation less execution exposure but prevents Codex from compiling and testing its changes locally.

### 2.4 Write build caches inside the project

**Enables**

- Resolve dependencies without making the whole user profile writable.
- Reuse downloaded dependencies between Codex build runs.
- Run clean builds, tests, Quarkus packaging, and development mode.

**Configuration**

The build runs from the project, but Maven and Gradle normally use caches in the user profile. Redirect those caches into the writable project.

For Maven:

```powershell
$env:MAVEN_USER_HOME = Join-Path $PWD ".agent-cache\maven-home"
.\mvnw.cmd `
  --settings "C:\ProgramData\<Organization Name>\Java\maven-settings.xml" `
  -Dmaven.repo.local="$PWD\.agent-cache\maven-repository" `
  clean verify
```

For Gradle:

```powershell
$env:GRADLE_USER_HOME = Join-Path $PWD ".agent-cache\gradle"
.\gradlew.bat test
```

Add this to `PROJECT_ROOT\.gitignore`:

```gitignore
.agent-cache/
target/
build/
```

Route wrapper downloads through the approved artifact proxy in:

- `PROJECT_ROOT\.mvn\wrapper\maven-wrapper.properties`
- `PROJECT_ROOT\gradle\wrapper\gradle-wrapper.properties`

**Tradeoff**

Each project has a separate cache, which consumes more disk space. The cache is writable by Codex, so it must not be shared as a trusted binary cache with other projects or users.

**Pertinent alternative**

Provision an administrator-managed, read-only pre-populated cache. This reduces downloads and cache tampering but requires an update process and may not contain newly approved dependencies.

### 2.5 Connect to the approved artifact repository

**Enables**

- Download Maven dependencies and plugins.
- Download Gradle dependencies, plugins, and wrapper distributions.
- Resolve Quarkus extensions.

**Configuration**

Allow only the organization’s artifact proxy. Permission-profile network rules constrain sandboxed command destinations through the network proxy. [OAI-NETWORK](#oai-network)

```toml
[permissions.project_dev_profile.network]
enabled = true

[permissions.project_dev_profile.network.domains]
"<Artifact Proxy Host>" = "allow"
```

Configure `C:\ProgramData\<Organization Name>\Java\maven-settings.xml`, Gradle repository declarations, and both wrapper property files to use this host. The proxy should provide the approved upstream repositories. Do not add Maven Central, the Gradle Plugin Portal, and arbitrary public hosts individually when the managed proxy can serve them.

**Tradeoff**

Any sandboxed code can send requests to the allowed host. The proxy controls what it serves, but an approved dependency can still contain vulnerable or malicious code. [OAI-NETWORK](#oai-network)

**Pertinent alternative**

Disable network access and use a pre-populated cache. This provides a smaller network boundary but prevents resolution of uncached dependencies.

### 2.6 Host a Quarkus server on localhost

**Enables**

- Run `quarkus:dev`.
- Start the API during integration or end-to-end tests.
- Exercise live reload and local debugging workflows.

**Configuration**

Bind Quarkus to loopback in `PROJECT_ROOT\src\main\resources\application.properties`:

```properties
%dev.quarkus.http.host=127.0.0.1
%test.quarkus.http.host=127.0.0.1
%dev.quarkus.http.port=8080
```

Keep Windows Firewall enabled. A loopback bind prevents other machines from reaching the service even if an inbound firewall rule is later broadened.

The Codex permission-profile network policy documents host patterns, not a listen-port allowlist. The Quarkus host and port settings are therefore the concrete restriction on the application server. [OAI-NETWORK](#oai-network)

**Tradeoff**

Codex-controlled code can open other loopback listeners while it runs. Those listeners remain local to the workstation but can be reached by other local processes. [OAI-SANDBOX](#oai-sandbox)

**Pertinent alternative**

Run only unit and integration tests that start short-lived test servers. This removes the persistent development server but gives up interactive Quarkus development mode.

### 2.7 Call services on localhost

**Enables**

- Call the Quarkus API from tests, PowerShell, or an HTTP client.
- Perform health checks and endpoint verification.
- Connect the application to local MySQL.

**Configuration**

Allow the literal loopback names and addresses:

```toml
[permissions.project_dev_profile.network]
enabled = true
allow_local_binding = false

[permissions.project_dev_profile.network.domains]
"localhost" = "allow"
"127.0.0.1" = "allow"
"::1" = "allow"
```

Literal loopback entries do not require `allow_local_binding = true`. Leave that setting false unless the workflow must use another hostname that resolves to a local or private address. [OAI-NETWORK](#oai-network)

**Tradeoff**

The permission profile allowlists host patterns and strips simple ports during normalization; it does not express a port-specific policy. Allowing loopback therefore permits connections to listening local ports, not only Quarkus on 8080 and MySQL on 3306. Do not run production tunnels or local administrative services during Codex tasks. [OAI-NETWORK](#oai-network)

**Pertinent alternative**

Run Quarkus and MySQL in a dedicated VM and allow only the VM address and required firewall ports. This provides stronger service isolation but adds image, networking, and file-sharing administration.

### 2.8 Use the local MySQL database through the application

**Enables**

- Generate and test Panache or Hibernate ORM persistence code.
- Run repository and API integration tests.
- Create, read, update, and delete development data through the API.
- Validate application-managed migrations when explicitly required.

**Configuration**

Bind MySQL to loopback in `C:\ProgramData\MySQL\MySQL Server 8.4\my.ini`:

```ini
[mysqld]
bind-address=127.0.0.1
mysqlx-bind-address=127.0.0.1
local-infile=0
```

Create a schema-scoped application identity:

```sql
CREATE DATABASE <Development Database Name>;
CREATE USER '<Application Database User>'@'127.0.0.1'
  IDENTIFIED BY '<Local Development Password>';
GRANT SELECT, INSERT, UPDATE, DELETE
  ON <Development Database Name>.*
  TO '<Application Database User>'@'127.0.0.1';
```

Reference runtime environment variables in `PROJECT_ROOT\src\main\resources\application.properties`:

```properties
quarkus.datasource.db-kind=mysql
quarkus.datasource.jdbc.url=${DEV_MYSQL_URL}
quarkus.datasource.username=${DEV_MYSQL_USER}
quarkus.datasource.password=${DEV_MYSQL_PASSWORD}
quarkus.hibernate-orm.schema-management.strategy=validate
```

Provision the environment variables outside the project before starting Codex. They grant access only to the disposable local development schema.

Codex does not need a MySQL MCP server for this workflow. It changes Java and configuration files, runs the application or tests, and observes their results.

If migrations are part of the task, create a separate migration identity with only the required DDL permissions. Do not add DDL rights to the normal application identity.

**Tradeoff**

Agent-generated Java and test code can exercise every permission granted to `<Application Database User>`. The schema must be disposable development data because DELETE and UPDATE are intentionally available.

Environment variables are visible to the process tree that runs the build. They narrow the credential’s authority; they do not hide it from Codex-controlled commands.

**Pertinent alternatives**

- Use a passwordless local MySQL development identity restricted to the dedicated Windows sandbox principal, if the selected MySQL authentication plugin and organization policy support it.
- Run persistence tests against an ephemeral database in a dedicated VM. This gives stronger cleanup and isolation but adds VM management.

### 2.9 Read and modify the local Git repository

**Enables**

- Inspect status, diffs, and history.
- Stage files and create local commits.
- Create local rollback points after coherent development steps.
- Create, switch, merge, and rebase local branches.
- Use Git worktrees when their directories are included in the active workspace roots.

**Configuration**

Codex’s built-in `:workspace` profile normally keeps `PROJECT_ROOT\.git` read-only. This baseline explicitly overrides that one subdirectory. [OAI-PROTECTED-PATHS](#oai-protected-paths)

```toml
[permissions.project_dev_profile.filesystem.":workspace_roots"]
"." = "write"
".git" = "write"
```

No command rules are required for local `git.exe` operations. Spawned Git commands inherit the same sandbox boundary as other development commands. [OAI-SANDBOX](#oai-sandbox)

The network allowlist does not include the Git remote host. Therefore: [OAI-NETWORK](#oai-network)

- Local operations such as `status`, `diff`, `add`, `commit`, `branch`, `switch`, `merge`, and `rebase` can run without approval.
- Network operations such as `fetch`, `pull`, and `push` cannot contact the remote from inside the normal sandbox.
- A developer can approve a specific network escalation when a remote operation is required.
- If the organization later adds the Git host to the network allowlist, remote operations will no longer be stopped by the network boundary. Add a command rule at that time if pushes should still require approval. [OAI-SANDBOX](#oai-sandbox) [OAI-NETWORK](#oai-network)

The GitLab CLI, `glab`, is separately configured to require approval for every invocation. [OAI-RULES](#oai-rules)

```toml
[rules]
prefix_rules = [
  { pattern = [{ any_of = ["glab", "glab.exe", "C:\\ProgramData\\<Organization Name>\\Tools\\glab\\glab.exe"] }], decision = "prompt", justification = "Review every GitLab remote operation before it runs." },
]
```

This rule applies even if the GitLab hostname is later added to the network allowlist. It covers all `glab` subcommands, including merge requests, issues, pipelines, releases, repository administration, and read-only queries. Requiring approval for every invocation is intentionally broader and easier to audit than maintaining a list of supposedly safe subcommands. [OAI-RULES](#oai-rules)

The rule applies only when the executable matches one of the listed names or paths. Confirm the installed path with `where.exe glab` and update the rule if necessary. [OAI-RULES](#oai-rules)

This `glab` rule does not control native Git commands. `git fetch`, `git pull`, and `git push` remain controlled by the network policy described above. [OAI-RULES](#oai-rules) [OAI-NETWORK](#oai-network)

**Tradeoff**

Allowing Codex to commit provides a practical safety mechanism during iterative development. After each coherent step, Codex can create a local commit. If a later change goes too far, breaks the code, or takes the implementation in the wrong direction, the developer can compare with or restore an earlier local commit without discarding the entire task. [OAI-PROTECTED-PATHS](#oai-protected-paths) [OAI-SANDBOX](#oai-sandbox)

The compromise is that the same write access lets Codex modify the index, branches, commits, configuration, hooks, and other local Git metadata. A mistaken reset, rebase, branch operation, or deletion could lose uncommitted work or commits that exist only locally. Recloning restores commits present on the remote, but it does not restore uncommitted changes or local-only commits. [OAI-PROTECTED-PATHS](#oai-protected-paths)

This baseline accepts that local-loss risk because frequent local commits normally improve recoverability during multi-step agent work.

Requiring approval for every `glab` command adds friction to GitLab lookups as well as mutations. The baseline accepts that smaller inconvenience because `glab` is fundamentally a remote-system tool and can affect merge requests, issues, pipelines, releases, and repository state. [OAI-RULES](#oai-rules)

**Pertinent alternative**

Keep `.git` read-only and require approval for each mutating Git command. This prevents Codex from changing local Git metadata without a developer’s explicit decision. [OAI-PROTECTED-PATHS](#oai-protected-paths) [OAI-RULES](#oai-rules)

The cost is not only additional prompts. During a task with several implementation and test iterations, approval friction may result in fewer intermediate commits. More work then remains in one uncommitted working tree, so a bad later edit, accidental deletion, or abandoned approach can cause the loss of the entire uncommitted iteration rather than allowing a rollback to the previous checkpoint.

### 2.10 Search public documentation

**Enables**

- Look up current Quarkus, Java, Maven, Gradle, MySQL, and Codex documentation.
- Verify version-sensitive technical claims.

**Configuration**

No project-specific download, local crawler, or advance cache population is required. In this setting, “cached” refers to an index maintained by OpenAI, not a cache stored in the project or on the Windows workstation. [OAI-WEB](#oai-web)

When Codex uses cached search: [OAI-WEB](#oai-web)

1. Codex sends the search query to OpenAI’s first-party web search tool. [OAI-WEB](#oai-web)
2. The tool searches content already present in OpenAI’s maintained index.
3. It returns relevant indexed results to Codex, including source links when available. [OAI-WEB](#oai-web)
4. It does not visit arbitrary external websites live to answer that request. [OAI-WEB](#oai-web)

Cached search is therefore different from both local-command network access and live web retrieval:

- It does not give PowerShell, Java, Maven, Gradle, `curl`, or project code access to the public internet.
- It does not use or populate `PROJECT_ROOT\.agent-cache`.
- It does not require public documentation domains to be added to the `project_dev_profile` network allowlist.
- It is an OpenAI product tool, so search activity is recorded with other tool calls rather than executed as a local Windows command. [OAI-WEB](#oai-web)

Permit only cached product web search in the administrator-managed `requirements.toml`. [OAI-REQUIREMENTS](#oai-requirements)

```toml
allowed_web_search_modes = ["cached"]
```

Select that allowed mode in `%USERPROFILE%\.codex\config.toml`:

```toml
web_search = "cached"
```

The available modes are documented as follows. [OAI-WEB](#oai-web)

| Mode | Behavior |
| --- | --- |
| `disabled` | Removes the web search tool. [OAI-WEB](#oai-web) |
| `cached` | Searches the OpenAI-maintained index without fetching arbitrary pages live. This is the selected baseline. |
| `indexed` | Permits external retrieval only when the OpenAI search index gates the request. |
| `live` | Permits unrestricted live retrieval by the search tool. |

The managed `allowed_web_search_modes = ["cached"]` setting prevents the developer from selecting `indexed` or `live`; `disabled` remains implicitly allowed. The user-level `web_search = "cached"` setting chooses the permitted mode. [OAI-REQUIREMENTS](#oai-requirements)

OpenAI documents this behavior in Web search: https://learn.chatgpt.com/docs/web-search and in the `web_search` configuration reference: https://learn.chatgpt.com/docs/config-file/config-reference.

**Tradeoff**

Because cached mode searches an existing index rather than fetching arbitrary pages live, a new page or recent update may not yet be represented. It may also return an indexed excerpt without enough context to answer a version-sensitive question conclusively. For important technical claims, Codex should provide the source link so the developer can inspect the current page independently. [OAI-WEB](#oai-web)

Live search would improve freshness, but it permits unrestricted live retrieval and increases exposure to untrusted web content. This baseline chooses the freshness limitation of cached search. [OAI-WEB](#oai-web)

### 2.11 Optional direct read-only database inspection

Direct database access is not required for normal Java API development. If developers need Codex to inspect data independently of the application, choose one of these explicit additions.

**Option A: approved MySQL client command**

Allow the MySQL client binary directory as read-only and prompt on `mysql.exe`:

```toml
prefix_rules = [
  { pattern = [{ any_of = ["mysql", "mysql.exe"] }], decision = "prompt", justification = "Review direct database access." },
]
```

Use a separate `<Read-Only Database User>@127.0.0.1` account with `SELECT` only.

**Option B: local read-only database MCP**

Run an organization-controlled MCP server on loopback, configure only safe read tools, and connect it in `%USERPROFILE%\.codex\config.toml`. The runtime MCP configuration uses `url` directly under the server table. [OAI-MCP-CONFIG](#oai-mcp-config)

```toml
[mcp_servers.mysql_readonly]
url = "http://127.0.0.1:7310/mcp"
```

The MCP server must authenticate to MySQL with a schema-scoped `SELECT` identity and enforce row limits and query timeouts. A user-facing tool named “read only” is not an authorization boundary; the MySQL grant and the MCP implementation are. [OAI-EXTENSIONS](#oai-extensions)

**Tradeoff**

Read-only database access can still disclose every value in the allowed schema. MCP also adds another local service and tool implementation to trust. [OAI-EXTENSIONS](#oai-extensions)

## 3. Complete security model and configuration

This section assembles the preceding access decisions into one deployable baseline.

### 3.1 Control model

| Layer | Concrete responsibility |
| --- | --- |
| ChatGPT Pro authentication and local-only operating rule | ChatGPT sign-in supplies the Pro subscription entitlement for local Codex. For each new desktop chat, the developer selects **Local** or **Worktree** in the composer and never selects **Cloud**. A designated reviewer periodically confirms that the Codex cloud environments page is empty. This is an operating and audit restriction, not a technical access control. [OAI-AUTH](#oai-auth) [OAI-MODES](#oai-modes) |
| `%ProgramData%\OpenAI\Codex\requirements.toml` | Fixes the available permission profile, approval policy, command rules, web mode, sandbox implementation, MCP allowlist, and disabled product features. [OAI-REQUIREMENTS](#oai-requirements) [OAI-FEATURES](#oai-features) [OAI-MCP-POLICY](#oai-mcp-policy) |
| `%ProgramData%\OpenAI\Codex\requirements.toml` setting `[windows] allowed_sandbox_implementations = ["elevated"]` | Requires the elevated Windows sandbox and prevents a developer or user-level configuration from selecting the weaker unelevated implementation. [OAI-WINDOWS](#oai-windows) |
| Administrator-approved Codex Windows sandbox setup | Creates and configures the local `CodexSandboxOffline` and `CodexSandboxOnline` accounts, protected local credentials, Windows Firewall rules, and filesystem permission boundaries. [OAI-WINDOWS-DESIGN](#oai-windows-design) |
| Remaining settings in `%USERPROFILE%\.codex\config.toml` | Select the managed permission profile and other local developer defaults. [OAI-LOCAL-CONFIG](#oai-local-config) |
| Project build configuration | Redirects caches into the project and routes downloads through the artifact proxy |
| Quarkus configuration | Binds the API to loopback and supplies the development datasource |
| MySQL configuration and grants | Binds MySQL to loopback and limits the application to one development schema |
| Human approval | Permits a specific `glab` invocation, network escalation for a remote Git operation, or direct database command. [OAI-SANDBOX](#oai-sandbox) [OAI-RULES](#oai-rules) |

The Windows sandbox is established by two related but distinct actions:

1. `requirements.toml` states that only the elevated sandbox implementation is permitted. OpenAI documents that this setting requires `elevated` and prevents fallback to `unelevated`; a duplicate `windows.sandbox = "elevated"` selection in the developer’s `config.toml` is unnecessary. [OAI-WINDOWS](#oai-windows)
2. Codex runs an administrator-approved Windows setup process. That setup makes the actual operating-system changes, including creating the two local sandbox accounts and configuring their firewall, credential, and filesystem controls. [OAI-WINDOWS-DESIGN](#oai-windows-design)

If the administrator-approved setup has not completed successfully, the configuration files alone do not create a functioning elevated sandbox. Because the managed requirements permit only `elevated`, Codex should not silently fall back to `unelevated`; the setup problem must be resolved before agent commands can use this baseline. [OAI-WINDOWS](#oai-windows)

The effective authority is intentionally useful but bounded:

- Codex can change and execute the active project.
- It can read only the named skill and tool locations outside the project.
- It can write project-local caches but not the Maven or Gradle user-profile caches.
- It can contact the artifact proxy and services listening on explicitly allowed loopback hosts.
- It can exercise every DML permission of the local application database identity.
- It can inspect and modify the local `.git` directory, including creating branches and commits.
- It cannot invoke `glab` without approval, even for a read-only GitLab query.
- It cannot select a full-access profile, browse the live web, control the desktop, use arbitrary MCP servers, or install workstation software.
- Codex cloud is not used, but it remains available to the ChatGPT Pro account; the local security configuration does not disable it. [OAI-PROFILE-FILES](#oai-profile-files) [OAI-NETWORK](#oai-network) [OAI-RULES](#oai-rules) [OAI-REQUIREMENTS](#oai-requirements) [OAI-MODES](#oai-modes)

The main compromises are also explicit: project code and build plugins execute; loopback access is not port-specific; the application credential is visible to the task’s process tree; and readable skills are trusted inputs. Local Git metadata is deliberately writable so Codex can create rollback checkpoints throughout an iterative task, with the corresponding risk that a mistaken Git operation could lose uncommitted work or local-only commits. [OAI-SANDBOX](#oai-sandbox) [OAI-NETWORK](#oai-network) [OAI-PROTECTED-PATHS](#oai-protected-paths)

### 3.2 Administrator-enforced `requirements.toml`

Deploy this file as:

```text
%ProgramData%\OpenAI\Codex\requirements.toml
```

Standard developers should not be able to modify it. OpenAI documents this Windows system path as the lowest-precedence administrator requirements layer. [OAI-REQUIREMENTS](#oai-requirements)

```toml
# %ProgramData%\OpenAI\Codex\requirements.toml

allowed_approval_policies = ["on-request"]
allowed_approvals_reviewers = ["user"]
allowed_web_search_modes = ["cached"]
allow_appshots = false
allow_remote_control = false
allow_managed_hooks_only = true

default_permissions = "project_dev_profile"

[allowed_permission_profiles]
":read-only" = true
project_dev_profile = true

[permissions.project_dev_profile]
description = "Develop and test a Java Quarkus API with controlled local services and artifact access."
extends = ":workspace"

[permissions.project_dev_profile.filesystem]
":root" = "deny"
":minimal" = "read"
glob_scan_max_depth = 5
'C:\Program Files\Git' = "read"
'C:\Program Files\Eclipse Adoptium' = "read"
'C:\Program Files\Apache\Maven' = "read"
'C:\Program Files\Gradle' = "read"
'C:\ProgramData\<Organization Name>\Java' = "read"
'C:\ProgramData\<Organization Name>\Tools\glab' = "read"
'~\.codex\skills' = "read"
'~\.agents\skills' = "read"
'~\Documents' = "deny"
'~\Desktop' = "deny"
'~\Downloads' = "deny"
'~\.ssh' = "deny"
'~\.aws' = "deny"
'~\.azure' = "deny"
'~\.kube' = "deny"
'~\.docker' = "deny"

[permissions.project_dev_profile.filesystem.":workspace_roots"]
"." = "write"
".git" = "write"
"**/.env" = "deny"
"**/.env.*" = "deny"

[permissions.project_dev_profile.network]
enabled = true
allow_local_binding = false

[permissions.project_dev_profile.network.domains]
"localhost" = "allow"
"127.0.0.1" = "allow"
"::1" = "allow"
"<Artifact Proxy Host>" = "allow"

[windows]
allowed_sandbox_implementations = ["elevated"]

[features]
apps = false
plugins = false
remote_plugin = false
browser_use = false
browser_use_external = false
browser_use_full_cdp_access = false
in_app_browser = false
computer_use = false
memories = false
hooks = false

[mcp_servers]

[rules]
prefix_rules = [
  { pattern = [{ any_of = ["glab", "glab.exe", "C:\\ProgramData\\<Organization Name>\\Tools\\glab\\glab.exe"] }], decision = "prompt", justification = "Review every GitLab remote operation before it runs." },
  { pattern = [{ any_of = ["winget", "winget.exe", "choco", "choco.exe", "scoop", "scoop.cmd"] }], decision = "forbidden", justification = "Workstation software is installed by endpoint administration." },
  { pattern = [{ any_of = ["docker", "docker.exe"] }], decision = "forbidden", justification = "Docker host control is outside this baseline." },
  { pattern = [{ any_of = ["mysql", "mysql.exe"] }], decision = "prompt", justification = "Review direct database access; prefer application tests." },
]
```

Remove unused tool and skill paths. Update executable paths in the rules if `where.exe` resolves different locations.

The enforced keys above are documented requirements: permission-profile and
web-search allowlists, the elevated Windows sandbox restriction, feature pins,
an empty MCP allowlist, and restrictive command rules. [OAI-REQUIREMENTS](#oai-requirements)
[OAI-WINDOWS](#oai-windows) [OAI-FEATURES](#oai-features)
[OAI-MCP-POLICY](#oai-mcp-policy) [OAI-RULES](#oai-rules)

### 3.3 Developer `config.toml`

Create the user-level Codex configuration file. [OAI-LOCAL-CONFIG](#oai-local-config)

```text
%USERPROFILE%\.codex\config.toml
```

```toml
# %USERPROFILE%\.codex\config.toml

approval_policy = "on-request"
approvals_reviewer = "user"
default_permissions = "project_dev_profile"
allow_login_shell = false
web_search = "cached"
history.persistence = "none"
cli_auth_credentials_store = "keyring"

[windows]
sandbox_private_desktop = true

[analytics]
enabled = false

[otel]
environment = "dev"
exporter = "none"
log_user_prompt = false
```

Do not add the older `sandbox_mode` or `sandbox_workspace_write` settings. They do not compose with permission profiles. The other settings above use documented controls for login-shell behavior, transcript persistence, credential storage, analytics, private-desktop isolation, and OpenTelemetry prompt/export behavior. [OAI-PROFILES](#oai-profiles) [OAI-LOCAL-CONFIG](#oai-local-config)

### 3.4 Project files

Create `PROJECT_ROOT\AGENTS.md`:

```markdown
# Project development

- Use Java 21 and the checked-in Maven or Gradle wrapper.
- Run Quarkus only with the dev or test profile.
- Maven commands:
  `$env:MAVEN_USER_HOME = Join-Path $PWD ".agent-cache\maven-home"`
  `.\mvnw.cmd --settings "C:\ProgramData\<Organization Name>\Java\maven-settings.xml" -Dmaven.repo.local="$PWD\.agent-cache\maven-repository" clean verify`
- Gradle commands:
  `$env:GRADLE_USER_HOME = Join-Path $PWD ".agent-cache\gradle"`
  `.\gradlew.bat test`
- Use only `<Development Database Name>` through the configured application identity.
- Direct MySQL client commands and destructive migrations require approval.
- Every `glab` command requires approval.
- Run focused tests for changed behavior and integration tests for persistence changes.
- Review `git diff` and create a local commit after each coherent, verified development step.
```

Add to `PROJECT_ROOT\.gitignore`:

```gitignore
.agent-cache/
.env
.env.*
target/
build/
```

Configure `PROJECT_ROOT\src\main\resources\application.properties`:

```properties
quarkus.datasource.db-kind=mysql
quarkus.datasource.jdbc.url=${DEV_MYSQL_URL}
quarkus.datasource.username=${DEV_MYSQL_USER}
quarkus.datasource.password=${DEV_MYSQL_PASSWORD}
quarkus.hibernate-orm.schema-management.strategy=validate
%dev.quarkus.http.host=127.0.0.1
%test.quarkus.http.host=127.0.0.1
%dev.quarkus.http.port=8080
```

### 3.5 Local MySQL

Configure `C:\ProgramData\MySQL\MySQL Server 8.4\my.ini`:

```ini
[mysqld]
bind-address=127.0.0.1
mysqlx-bind-address=127.0.0.1
local-infile=0
```

Provision the development schema and application identity:

```sql
CREATE DATABASE <Development Database Name>;
CREATE USER '<Application Database User>'@'127.0.0.1'
  IDENTIFIED BY '<Local Development Password>';
GRANT SELECT, INSERT, UPDATE, DELETE
  ON <Development Database Name>.*
  TO '<Application Database User>'@'127.0.0.1';
```

Inject these values into the developer session using the organization’s endpoint or secret-injection mechanism:

```text
DEV_MYSQL_URL=jdbc:mysql://127.0.0.1:3306/<Development Database Name>
DEV_MYSQL_USER=<Application Database User>
DEV_MYSQL_PASSWORD=<Local Development Password>
```

### 3.6 Deployment verification

Verify the effective controls with synthetic test files and a disposable schema:

1. Codex can edit a project file and write `.agent-cache`, `target`, or `build`. [OAI-PROFILE-FILES](#oai-profile-files)
2. Codex can read the approved skill directories and tool installations. [OAI-PROFILE-FILES](#oai-profile-files)
3. Codex cannot read test files in `Documents`, `Desktop`, `Downloads`, `.ssh`, or another project. [OAI-PROFILE-FILES](#oai-profile-files)
4. With `MAVEN_USER_HOME` and `maven.repo.local` redirected into `.agent-cache`, `.\mvnw.cmd clean verify` compiles the application, runs its tests, and resolves the wrapper and dependencies only through the artifact proxy.
5. Quarkus binds to `127.0.0.1:8080`, and Codex can call it. [OAI-NETWORK](#oai-network)
6. The application connects to `127.0.0.1:3306` with `<Application Database User>`.
7. The application identity can perform DML only in `<Development Database Name>` and cannot create schemas or users.
8. Local `git status`, `git diff`, `git add`, `git branch`, and `git commit` work without approval. [OAI-SANDBOX](#oai-sandbox) [OAI-PROTECTED-PATHS](#oai-protected-paths)
9. `git fetch`, `git pull`, and `git push` cannot reach the remote unless the developer approves a network escalation. [OAI-NETWORK](#oai-network) [OAI-SANDBOX](#oai-sandbox)
10. Every `glab` invocation requests approval, including read-only queries. [OAI-RULES](#oai-rules)
11. Docker and workstation package managers are blocked.
12. An arbitrary public host and an unapproved internal host are unreachable from sandboxed commands. [OAI-NETWORK](#oai-network)
13. Cached search returns indexed documentation results without granting public-internet access to local commands. [OAI-WEB](#oai-web)
14. Live browsing, Computer Use, plugins, apps, unapproved MCP servers, and full-access permission profiles are unavailable. [OAI-FEATURES](#oai-features) [OAI-MCP-POLICY](#oai-mcp-policy) [OAI-REQUIREMENTS](#oai-requirements)
15. In the desktop app’s new-chat composer, confirm that the task mode is **Local** or **Worktree**, not **Cloud**. [OAI-MODES](#oai-modes)
16. Open Codex settings — Environments: https://chatgpt.com/codex/settings/environments. Confirm that no cloud environment exists for the project. Record that checks 15–16 verify operating practice, not a Pro-account technical prohibition. [OAI-CLOUD](#oai-cloud)

Re-run this verification after Codex, Windows sandbox, authentication, permission-profile, Java toolchain, artifact proxy, or MySQL changes.

The complete generator, all generated script bodies, file locations, and run instructions are in:

```text
Codex-Access-Validation-Scripts-Guide.md
```

Copy the generator from that document into a `.ps1` file. Run it from the project root; it resolves the workstation paths once and writes their literal values into the generated setup, test, and cleanup scripts.

### 3.7 Product and platform references

- Codex permissions: https://learn.chatgpt.com/docs/permissions
- Codex managed configuration: https://learn.chatgpt.com/docs/enterprise/managed-configuration
- Codex configuration reference: https://learn.chatgpt.com/docs/config-file/config-reference
- Codex web search: https://learn.chatgpt.com/docs/web-search
- Codex command rules: https://learn.chatgpt.com/docs/agent-configuration/rules
- Codex Windows sandbox: https://learn.chatgpt.com/docs/windows/windows-sandbox
- OpenAI Windows sandbox architecture: https://openai.com/index/building-codex-windows-sandbox/
- Codex authentication: https://learn.chatgpt.com/docs/auth
- Codex environment modes — Local, Worktree, and Cloud: https://learn.chatgpt.com/docs/environments/modes
- Codex cloud setup: https://learn.chatgpt.com/docs/cloud
- Codex cloud environments: https://learn.chatgpt.com/docs/environments/cloud-environment
- Roles and workspace permissions: https://learn.chatgpt.com/docs/enterprise/roles-and-workspace-permissions
- Quarkus configuration reference: https://quarkus.io/guides/config-reference
- Quarkus datasource guide: https://quarkus.io/guides/datasource
- MySQL 8.4 Reference Manual: https://dev.mysql.com/doc/refman/8.4/en/

### 3.8 Official OpenAI evidence for Codex security behavior

The quotations below are intentionally short. They provide the official
explanation behind every `OAI-*` security-behavior marker in this guide.
Accessed July 30, 2026.

- <a id="oai-auth"></a>**OAI-AUTH — local and cloud authentication.**
  Authentication — https://learn.chatgpt.com/docs/auth: “The ChatGPT desktop
  app, Codex CLI, and IDE extension support both sign-in methods for local work.
  Codex cloud requires signing in with ChatGPT.”
- <a id="oai-plans"></a>**OAI-PLANS — plan boundaries.**
  Pricing — https://learn.chatgpt.com/docs/pricing: Business includes “a
  secure, dedicated workspace with essential admin controls”; Enterprise adds
  “role-based access control.”
- <a id="oai-modes"></a>**OAI-MODES — desktop execution location.**
  Codex environments — https://learn.chatgpt.com/docs/environments/modes:
  “Local: work directly in your current project directory”; “Worktree: isolate
  changes in a Git worktree”; “Cloud: run remotely.”
- <a id="oai-cloud"></a>**OAI-CLOUD — hosted task boundary.**
  Cloud environments — https://learn.chatgpt.com/docs/environments/cloud-environment:
  “Codex creates a container and checks out your repo at the selected branch or
  commit SHA.”
- <a id="oai-boundaries"></a>**OAI-BOUNDARIES — local policy is not cloud or
  workspace entitlement.** Roles and workspace permissions — https://learn.chatgpt.com/docs/enterprise/roles-and-workspace-permissions:
  “Local runtime policy constrains covered capabilities” but does not change a
  user’s “seat, workspace role, model entitlement.”
- <a id="oai-login-policy"></a>**OAI-LOGIN-POLICY — enforced sign-in method.**
  Authentication — https://learn.chatgpt.com/docs/auth#enforce-a-login-method-or-workspace:
  “If the active credentials don't match the configured restrictions, Codex
  logs the user out and exits.”
- <a id="oai-profiles"></a>**OAI-PROFILES — named least-privilege profiles.**
  Permissions — https://learn.chatgpt.com/docs/permissions: “Permission
  profiles let you apply least-privilege boundaries to local commands Codex
  runs on your behalf.” OpenAI also states: “Permission profiles are under
  active development and may change.”
- <a id="oai-profile-files"></a>**OAI-PROFILE-FILES — filesystem grants and
  denials.** Permissions — https://learn.chatgpt.com/docs/permissions#define-and-select-a-profile:
  “Inside an active profile, narrower deny rules stay in force even when a
  broader path is readable or writable.”
- <a id="oai-protected-paths"></a>**OAI-PROTECTED-PATHS — protected project
  metadata.** Agent approvals and security — https://learn.chatgpt.com/docs/agent-approvals-security#protected-paths-in-writable-roots:
  “`.git` is protected as read-only”; “`.agents` is protected as read-only”;
  “`.codex` is protected as read-only.”
- <a id="oai-scope"></a>**OAI-SCOPE — permission-profile scope.**
  Permissions — https://learn.chatgpt.com/docs/permissions#scope-and-enforcement:
  “Connectors, MCP servers, browser or computer-use surfaces, Codex cloud
  environment settings, and approved escalations use their own controls.”
- <a id="oai-windows"></a>**OAI-WINDOWS — elevated Windows enforcement.**
  Windows sandbox — https://learn.chatgpt.com/docs/windows/windows-sandbox:
  “`elevated` is the preferred native Windows sandbox. It uses dedicated
  lower-privilege sandbox users, filesystem permission boundaries, firewall
  rules.”
- <a id="oai-windows-design"></a>**OAI-WINDOWS-DESIGN — Windows sandbox
  principals and setup.** OpenAI Windows sandbox architecture — https://openai.com/index/building-codex-windows-sandbox/:
  the elevated sandbox uses “two local users created by Codex itself” and setup
  stores credentials with DPAPI and creates outbound-blocking firewall rules.
- <a id="oai-sandbox"></a>**OAI-SANDBOX — spawned-command inheritance.**
  Sandbox — https://learn.chatgpt.com/docs/sandboxing: “If the agent runs tools
  like `git`, package managers, or test runners, those commands inherit the same
  sandbox boundaries.”
- <a id="oai-network"></a>**OAI-NETWORK — local targets and host-scoped
  policy.** Permissions — https://learn.chatgpt.com/docs/permissions#scope-and-enforcement:
  “Local and private network targets are blocked by default.” The
  configuration spec — https://learn.chatgpt.com/docs/permissions#configuration-spec
  says host patterns are normalized by “stripping simple ports.”
- <a id="oai-rules"></a>**OAI-RULES — command-prefix decisions.**
  Rules — https://learn.chatgpt.com/docs/agent-configuration/rules: “Use rules
  to control which commands Codex can run outside the sandbox”; `prompt` means
  “Prompt before each matching invocation.”
- <a id="oai-web"></a>**OAI-WEB — cached, indexed, and live search.**
  Web search — https://learn.chatgpt.com/docs/web-search: “Cached mode uses an
  OpenAI-maintained index instead of fetching arbitrary pages live”; indexed
  mode gates external access through the index.
- <a id="oai-requirements"></a>**OAI-REQUIREMENTS — administrator
  enforcement.** Managed configuration — https://learn.chatgpt.com/docs/enterprise/managed-configuration#admin-enforced-requirements-requirementstoml:
  “Requirements constrain security-sensitive settings”; on Windows the system
  file is `%ProgramData%\OpenAI\Codex\requirements.toml`.
- <a id="oai-features"></a>**OAI-FEATURES — disabled local product surfaces.**
  Managed configuration — https://learn.chatgpt.com/docs/enterprise/managed-configuration#disable-codex-feature-surfaces:
  “`in_app_browser = false` disables the built-in browser pane” and
  “`computer_use = false` disables Computer Use.”
- <a id="oai-mcp-policy"></a>**OAI-MCP-POLICY — MCP allowlisting.**
  Managed configuration — https://learn.chatgpt.com/docs/enterprise/managed-configuration#admin-enforced-requirements-requirementstoml:
  “If `mcp_servers` is present but empty, the local client disables all MCP
  servers.”
- <a id="oai-mcp-config"></a>**OAI-MCP-CONFIG — HTTP MCP runtime
  configuration.** Configuration reference — https://learn.chatgpt.com/docs/config-file/config-reference#configtoml:
  `mcp_servers.<id>.url` is the “Endpoint for an MCP streamable HTTP server.”
- <a id="oai-local-config"></a>**OAI-LOCAL-CONFIG — local security and privacy
  settings.** Configuration reference — https://learn.chatgpt.com/docs/config-file/config-reference#configtoml:
  `history.persistence` controls saved transcripts;
  `cli_auth_credentials_store` selects file or OS-keychain storage; and
  `otel.log_user_prompt` opts in to exporting raw prompts.
- <a id="oai-extensions"></a>**OAI-EXTENSIONS — skills and MCP trust
  boundaries.** Plugins — https://learn.chatgpt.com/docs/plugins#use-plugins-from-a-supported-surface:
  skills provide “instructions” and “helper scripts”; MCP servers “define
  tools, enforce auth” and “perform actions against external systems.”
