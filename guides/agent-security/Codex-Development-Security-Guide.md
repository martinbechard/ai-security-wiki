# Codex Development Security Guide

## Baseline for local Java API development on Windows

Copyright (c) 2026 Martin.Bechard@DevConsult.ca

This guide defines one approved profile: Codex runs locally on a managed Windows 11 workstation to develop a Quarkus API with Maven, Git, and MySQL bound to the same workstation. Codex may edit the project, build and test the API, and create small local Git commits. It must not perform browser testing, query MySQL directly, contact an external database, push to a remote repository, or use Codex cloud.

Every Codex-behavior assertion has a visible numbered reference containing the publisher, title, and literal URL. Section 5 repeats each reference with supporting quoted evidence for printed copies. Requirements and prohibitions stated as this baseline's choices are security policy, not claims that OpenAI enforces them by default.

Replace every angle-bracket placeholder, such as `<Developer Account>` or `<Artifact Proxy Host>`, with an approved local value before deployment.

## 1. Security model

### 1.1 Control layers

| Layer | Baseline |
| --- | --- |
| Execution surface | Use Codex CLI interactively or Codex in the ChatGPT desktop app with **Local** selected. Do not select **Cloud**. OpenAI documents that Local works in the current project and Cloud runs remotely. ([6] OpenAI, Codex environments, <https://learn.chatgpt.com/docs/environments/modes>) |
| Local authority | Codex uses a named permission profile combining filesystem and network rules. Permission profiles apply least-privilege boundaries to local commands. ([2] OpenAI, Permissions, <https://learn.chatgpt.com/docs/permissions>) |
| Windows enforcement | Require the elevated native Windows sandbox. It uses dedicated lower-privilege sandbox users, filesystem boundaries, and firewall rules. ([4] OpenAI, Windows sandbox, <https://learn.chatgpt.com/docs/windows/windows-sandbox>) |
| Approval behavior | Codex works automatically inside the permission profile and asks the developer before leaving that boundary. The sandbox determines technical access; the approval policy determines when Codex pauses. ([1] OpenAI, Agent approvals & security, <https://learn.chatgpt.com/docs/agent-approvals-security>) |
| Administrative policy | `%ProgramData%\OpenAI\Codex\requirements.toml` restricts permission profiles, approvals, features, command rules, web search, and MCP servers. ([3] OpenAI, Managed configuration, <https://learn.chatgpt.com/docs/enterprise/managed-configuration>) |
| Human gate | Codex makes ordinary project edits and local checkpoint commits without per-change approval. The developer reviews the complete task range after Codex finishes. |

### 1.2 Account, processing, and filesystem boundaries

- The default baseline uses one standard `<Developer Account>` for Codex and normal development. Never run Codex as Administrator.
- Model requests use the authenticated OpenAI service. Codex supports ChatGPT sign-in for subscription access and API-key sign-in for usage-based access. ([5] OpenAI, Authentication, <https://learn.chatgpt.com/docs/auth>)
- The elevated Windows sandbox creates a separate lower-privilege execution boundary for local commands. A second interactive Windows account is not required for this baseline. ([4] OpenAI, Windows sandbox, <https://learn.chatgpt.com/docs/windows/windows-sandbox>)
- The permission profile governs local sandboxed command execution. Connectors, MCP servers, browsers, Computer Use, Codex cloud, and approved escalations have separate controls, so this baseline disables those surfaces. ([2] OpenAI, Permissions, <https://learn.chatgpt.com/docs/permissions>)
- Treat prompts, selected project context, command output, and attached files as model-facing data. Keep production credentials, production data, personal information, and unrelated company information out of the project and every Codex prompt.
- Keep credentials outside the repository. Deny sandbox reads of `.env` files and common credential folders, and store Codex authentication in the Windows credential store.
- Local command network access is separate from the Codex client's connection to OpenAI. The project permission profile restricts spawned commands; it does not stop the authenticated Codex client from sending prompts and selected context to OpenAI. ([2] OpenAI, Permissions, <https://learn.chatgpt.com/docs/permissions>)

### 1.3 Local-only use and data controls

This baseline uses local execution only:

1. In the ChatGPT desktop app, select **Codex** and **Local** before starting the task. Do not select **Cloud**. ([6] OpenAI, Codex environments, <https://learn.chatgpt.com/docs/environments/modes>)
2. Do not configure a Codex cloud environment or delegate the task to cloud execution.
3. In the CLI, work from the exact project directory under the managed local permission profile.
4. Treat local-only use as an operating restriction. Local `requirements.toml` controls supported local-client behavior; it does not remove Codex cloud entitlement from an individual ChatGPT account. ([3] OpenAI, Managed configuration, <https://learn.chatgpt.com/docs/enterprise/managed-configuration>)

For an individual ChatGPT account:

1. Open **Settings > Data Controls** and turn off **Improve the model for everyone**. OpenAI states that the setting applies across the account. ([10] OpenAI, Data Controls FAQ, <https://help.openai.com/en/articles/7730893>)
2. Submit **Do not train on my content** through the OpenAI Privacy Portal when the organization requires a durable opt-out record. OpenAI states that new conversations are permanently not used for training after opt-out. ([9] OpenAI, How your data is used to improve model performance, <https://help.openai.com/en/articles/5722486>)
3. Keep every separately displayed Codex full-environment training control off. OpenAI documents that full-environment controls are separate from ChatGPT and Privacy Portal settings. ([9] OpenAI, How your data is used to improve model performance, <https://help.openai.com/en/articles/5722486>)
4. Do not submit product feedback from a sensitive task. OpenAI states that a conversation associated with feedback may be used for training even after opt-out. ([9] OpenAI, How your data is used to improve model performance, <https://help.openai.com/en/articles/5722486>)

### 1.4 Example Code task workflow

This workflow lets Codex implement, build, test, and checkpoint an API task without asking the developer to approve each ordinary edit:

1. **Prepare:** The developer starts with a clean worktree, creates a dedicated local task branch, and records its starting commit as `<Review Base Commit>`:

   ```powershell
   git switch -c "codex/<Task Slug>"
   git rev-parse HEAD
   ```

2. **Start locally:** Open the exact project directory in Codex and confirm that `project_dev_profile`, manual approvals, and the elevated Windows sandbox are active.
3. **Implement:** Codex may create, edit, and delete ordinary source, test, configuration, and documentation files. The managed profile keeps `AGENTS.md`, `.gitignore`, `.codex`, `.agents`, Maven build controls, Git configuration, and Git hooks read-only.
4. **Build and API-test:** Codex may run the checked-in Maven Wrapper, unit tests, API integration tests, packaging, Quarkus development mode, and exact localhost API checks.
5. **No browser testing:** Codex must not use a browser, browser driver, Playwright, Selenium, Computer Use, a browser MCP server, or public-web search. The developer performs browser testing separately.
6. **Local MySQL only:** Application and test code may connect only to MySQL on `127.0.0.1` using the disposable development schema and application identity. Codex receives no MySQL client, database MCP server, schema attachment, or direct-query tool.
7. **Create local checkpoints:** After each coherent, tested milestone, Codex stages only the intended files and creates a local commit. A commit records the staged contents in the local repository. ([12] Git, git-commit Documentation, <https://git-scm.com/docs/git-commit>) Codex must not push, fetch, pull, rewrite history, switch branches, or run `glab`.
8. **Review once:** After Codex stops, the developer reviews the checkpoint series, the complete change range, and residual files:

   ```powershell
   git log --oneline <Review Base Commit>..HEAD
   git diff --stat <Review Base Commit>..HEAD
   git diff <Review Base Commit>..HEAD
   git status --short
   ```

   The developer reruns the required tests and decides whether to keep, revise, squash, or discard the local commits. A Codex checkpoint is an unreviewed recovery and review unit, not approval of its contents.

Do not approve an unexpected request merely to let the task finish. First determine why Codex needs access outside the managed profile.

### 1.5 Protection against using non-local database credentials

Assume Codex receives a valid external database URL, username, and password through a prompt or a readable project file. Possessing those values does not give a sandboxed process a network route to the database:

1. Codex may pass the values to modified application code, a test, Java, or another allowed local command.
2. Every process launched by that command inherits the same sandbox. ([8] OpenAI, Sandbox, <https://learn.chatgpt.com/docs/sandboxing>)
3. The required `project_dev_profile` permits network destinations only at `localhost`, `127.0.0.1`, `::1`, and `<Artifact Proxy Host>`. An external database hostname or IP address is absent from that allowlist, so the connection is denied. ([2] OpenAI, Permissions, <https://learn.chatgpt.com/docs/permissions>)
4. The elevated Windows sandbox enforces the network boundary with Windows firewall rules. ([4] OpenAI, Windows sandbox, <https://learn.chatgpt.com/docs/windows/windows-sandbox>)

This protection applies while the process remains inside the Codex sandbox. It can be bypassed if the developer approves execution outside the managed profile, if a permitted local service forwards traffic, or if `<Artifact Proxy Host>` permits arbitrary tunnelling. Do not run a local forward proxy, SSH tunnel, or database tunnel during a Codex task, and configure the artifact proxy to reject arbitrary forwarding and HTTP `CONNECT` tunnelling.

Use the optional whole-environment lockdown in section 1.7 when an accidental approval must not restore a route to an external database. The lockdown prevents use of the credentials against that database; it does not prevent credentials pasted into a prompt from entering model context.

### 1.6 Protection against using GitLab credentials

Assume Codex receives a valid GitLab token or SSH key and can locate `glab.exe` or `git.exe`:

1. Managed command rules forbid direct `glab` use and direct `git push`, `git fetch`, and `git pull` requests. ([7] OpenAI, Rules, <https://learn.chatgpt.com/docs/agent-configuration/rules>)
2. Modified code or an allowed build could invoke a Git client, GitLab API client, or other executable indirectly. Command rules are therefore not the primary protection.
3. The indirect process inherits the Codex sandbox. ([8] OpenAI, Sandbox, <https://learn.chatgpt.com/docs/sandboxing>)
4. The required `project_dev_profile` does not allow the GitLab hostname or IP address, so the sandbox denies the connection even when the process has a valid credential. ([2] OpenAI, Permissions, <https://learn.chatgpt.com/docs/permissions>)

The connection could succeed after an approved out-of-sandbox execution or through an allowed local tunnel or forwarding proxy. Keep GitLab outside the destination allowlist, do not run a local Git or GitLab tunnel during the task, and ensure `<Artifact Proxy Host>` cannot forward traffic to GitLab.

Use the optional whole-environment lockdown in section 1.7 when an accidental approval must not restore GitLab connectivity. The lockdown prevents remote use of the credential, but it does not prevent Codex from exposing a credential that has already entered model or project context.

### 1.7 Optional whole-environment network lockdown

The required Codex permission profile already limits sandboxed commands to loopback and `<Artifact Proxy Host>`. Use this optional layer when an accidental approval must not give the Codex process tree broader network access.

An endpoint administrator:

1. Places the Codex local execution environment and sandbox accounts under a default-deny outbound endpoint policy.
2. Allows the Codex client to reach only the approved OpenAI authentication and model-service destinations.
3. Allows sandboxed Maven and Java traffic only to `127.0.0.1`, `::1`, and `<Artifact Proxy Host>`.
4. Blocks remote Git, external databases, direct public repositories, public web destinations, and general forward proxies.
5. Verifies from a disposable task that local MySQL and the artifact proxy work while a controlled non-loopback database endpoint and Git remote remain unreachable.

If endpoint policy cannot distinguish the Codex client from agent-launched processes, use an isolated VM with default-deny egress. The outer lockdown does not prevent prompts, selected code, or pasted credentials from being sent through the allowed Codex model connection.

## 2. Accesses required for development

**How to** gives the steps required to limit the access. **Risks** states what can still go wrong after those steps are followed. If the **How to** steps cannot be implemented, do not enable the access.

| Access | Codex profile | How to | Risks |
| --- | --- | --- | --- |
| Active project files | Read, create, modify, or delete ordinary files in the exact project without per-edit approval. | Use the managed `project_dev_profile`. Keep instruction, build-control, secret, and Git-control files read-only. Start on a clean dedicated branch and record `<Review Base Commit>`. | Codex can damage project files before end-of-task review. Source control improves recovery but does not make changes safe. |
| Files outside the project | Read only Codex's minimal runtime paths and named managed tool directories. | Deny `:root`, reopen only `:minimal` and exact tool paths, and explicitly deny common personal and credential folders. | The Codex host still processes prompts and explicit attachments outside the command sandbox. An approved escalation uses a separate authority path. ([2] OpenAI, Permissions, <https://learn.chatgpt.com/docs/permissions>) |
| Maven and installed tools | Run the Maven Wrapper, Java, Git, PowerShell, tests, and the application inside the sandbox. | Keep Maven Wrapper and build configuration read-only. Route dependencies through the approved proxy and keep package managers, Docker, `glab`, and direct MySQL tools forbidden. | This workflow deliberately runs builds and tests before developer review. That tradeoff is shared with Junie and other agents that can execute modified code; it is not a Codex-specific sandbox weakness. Spawned processes remain confined to the Codex sandbox boundary. ([8] OpenAI, Sandbox, <https://learn.chatgpt.com/docs/sandboxing>) |
| Build cache and dependencies | Write project-local Maven caches and download only through `<Artifact Proxy Host>`. | Use `.agent-cache\maven-repository`, an administrator-managed Maven settings file, and a download-only artifact identity. | The writable cache can contain executable or compromised dependencies. The allowed proxy is still a destination to which sandboxed code can send requests. |
| Quarkus and localhost | Start Quarkus and call local API endpoints. | Bind Quarkus to `127.0.0.1`. Allow only literal loopback hosts in the permission profile. | Codex-controlled code can open or call other loopback services. Codex host rules are not port-specific, so permitting `127.0.0.1` permits every listening local port. ([2] OpenAI, Permissions, <https://learn.chatgpt.com/docs/permissions>) |
| Local MySQL | Reach MySQL only through the Quarkus application or Maven-managed tests. | Bind MySQL to `127.0.0.1`, use a disposable schema and DML-only application identity, and forbid database clients and MCP servers. Use the protection in section 1.5 and deploy section 1.7 when approvals must not restore external connectivity. | Codex-modified code can use every database permission granted to the application identity. A pasted loopback URL could reach another local service; a non-loopback URL is blocked by the network profile unless the developer approves an escalation. |
| Local Git | Read Git state, stage intended files, and create small local commits on the developer-created task branch. | Make `.git` writable but keep `.git\config` and `.git\hooks` read-only. Forbid push, fetch, pull, destructive Git, history rewriting, and `glab`. Keep remote hosts out of the network allowlist. | Git staging can capture unintended files. Commits run configured Git hooks. Command rules govern Codex command requests, not arbitrary behavior inside Maven, tests, hooks, or other child code; because `.git` is writable, such code could damage local Git metadata. The developer must review the complete base-to-HEAD range. |
| Remote Git | None. | Use the protection in section 1.6: forbid common remote Git and `glab` entry points, omit remote hosts from the sandbox network policy, and store no GitLab credential for sandbox users. Deploy section 1.7 when approvals must not restore remote connectivity. The developer performs any later push outside the Codex task. Ensure `<Artifact Proxy Host>` is not also a Git remote and cannot tunnel arbitrary destinations. | Command rules do not recognize every possible wrapper or alias. The destination allowlist is the stronger control for sandboxed commands; an approved out-of-sandbox wrapper could regain developer authority. Git documents that push updates remote references and sends data. ([13] Git, git-push Documentation, <https://git-scm.com/docs/git-push>) |
| Browser and public web | None. | Disable web search, Browser Use, the in-app browser, external browser control, full CDP access, Computer Use, Apps, plugins, and MCP servers through managed requirements. | Model knowledge may be stale. API-only tests do not verify browser behavior. |
| Codex cloud and unattended work | Not approved. | Use interactive local tasks only, select **Local**, and keep cloud environments unconfigured. | An individual ChatGPT account may still have Codex cloud entitlement outside the local runtime policy. Local requirements do not remove that product entitlement. ([3] OpenAI, Managed configuration, <https://learn.chatgpt.com/docs/enterprise/managed-configuration>) |

## 3. Required configuration

### 3.1 Workstation and application configuration

```text
<Developer Account>
  Standard User
  Local Administrators membership: No

C:\Dev\Projects\<Project Folder Name>\
C:\Dev\Projects\<Project Folder Name>\.agent-cache\maven-repository\
```

Add to `.gitignore` before the Codex task:

```gitignore
.agent-cache/
.env
.env.*
!.env.example
target/
```

Configure Quarkus:

```properties
quarkus.http.host=127.0.0.1
quarkus.http.port=8080
quarkus.datasource.db-kind=mysql
quarkus.datasource.jdbc.url=${DEV_MYSQL_URL:jdbc:mysql://127.0.0.1:3306/<Development Database Name>}
quarkus.datasource.username=${DEV_MYSQL_USER:<Application Database User>}
quarkus.datasource.password=${DEV_MYSQL_PASSWORD}
quarkus.hibernate-orm.schema-management.strategy=validate
```

Configure MySQL with `bind-address=127.0.0.1` and `mysqlx-bind-address=127.0.0.1`. Grant `<Application Database User>` only `SELECT`, `INSERT`, `UPDATE`, and `DELETE` on `<Development Database Name>`. Store the password outside the project and inject `DEV_MYSQL_URL`, `DEV_MYSQL_USER`, and `DEV_MYSQL_PASSWORD` through the approved local secret mechanism.

Configure `C:\ProgramData\<Organization Name>\Java\maven-settings.xml` so `<Artifact Proxy Host>` mirrors every Maven repository. Use a download-only artifact identity.

Before allowing local commits, configure a reviewed Git hook directory outside the project:

```powershell
git config --local core.hooksPath "C:/ProgramData/<Organization Name>/Git/hooks"
```

The developer runs this command before Codex starts. The managed profile keeps `.git\config`, `.git\hooks`, and the managed hook directory read-only.

### 3.2 Administrator-enforced Codex requirements

Codex 0.138.0 or later is required for managed permission-profile allowlists. OpenAI marks permission profiles as beta, so revalidate the schema before deployment. ([2] OpenAI, Permissions, <https://learn.chatgpt.com/docs/permissions>) Deploy this administrator-controlled file:

```text
%ProgramData%\OpenAI\Codex\requirements.toml
```

```toml
allowed_approval_policies = ["on-request"]
allowed_approvals_reviewers = ["user"]
allowed_web_search_modes = []
allow_appshots = false
allow_remote_control = false
allow_managed_hooks_only = true

default_permissions = "project_dev_profile"

[allowed_permission_profiles]
":read-only" = true
project_dev_profile = true

[permissions.project_dev_profile]
description = "Develop and test one local Java API with controlled tools and destinations."
extends = ":workspace"

[permissions.project_dev_profile.filesystem]
":root" = "deny"
":minimal" = "read"
glob_scan_max_depth = 5
'C:\Program Files\Git' = "read"
'C:\Program Files\Eclipse Adoptium' = "read"
'C:\ProgramData\<Organization Name>\Java' = "read"
'C:\ProgramData\<Organization Name>\Git\hooks' = "read"
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
".git/config" = "read"
".git/hooks" = "read"
".codex" = "read"
".agents" = "read"
"AGENTS.md" = "read"
".gitignore" = "read"
"pom.xml" = "read"
".mvn" = "read"
"mvnw" = "read"
"mvnw.cmd" = "read"
".env" = "deny"
".env.*" = "deny"
"**/.env" = "deny"
"**/.env.*" = "deny"

[permissions.project_dev_profile.network]
enabled = true
allow_local_binding = true
allow_upstream_proxy = false

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
multi_agent = false
hooks = false

[mcp_servers]

[rules]
prefix_rules = [
  { pattern = [{ any_of = ["git", "git.exe"] }, { any_of = ["push", "fetch", "pull"] }], decision = "forbidden", justification = "Remote Git is performed by the developer after review." },
  { pattern = [{ any_of = ["git", "git.exe"] }, { any_of = ["reset", "restore", "checkout", "switch", "clean", "rebase"] }], decision = "forbidden", justification = "Codex must not discard work, switch branches, or rewrite task history." },
  { pattern = [{ any_of = ["git", "git.exe"] }, { token = "commit" }, { token = "--amend" }], decision = "forbidden", justification = "Checkpoint history is reviewed before any developer rewrite." },
  { pattern = [{ any_of = ["glab", "glab.exe"] }], decision = "forbidden", justification = "GitLab operations are outside the Codex task." },
  { pattern = [{ any_of = ["mysql", "mysql.exe"] }], decision = "forbidden", justification = "Database access occurs only through application code and tests." },
  { pattern = [{ any_of = ["docker", "docker.exe", "winget", "winget.exe", "choco", "choco.exe", "scoop", "scoop.cmd"] }], decision = "forbidden", justification = "Container control and workstation software installation are outside this baseline." },
]
```

Managed requirements constrain supported local settings and disable an MCP server whose name and identity are not approved; an empty MCP allowlist disables all MCP servers. ([3] OpenAI, Managed configuration, <https://learn.chatgpt.com/docs/enterprise/managed-configuration>) Requirements command rules may require a prompt or forbid a prefix, and the most restrictive matching rule wins. ([7] OpenAI, Rules, <https://learn.chatgpt.com/docs/agent-configuration/rules>)

The Git rules cover direct common forms; they are not a complete parser for aliases, shells, wrapper scripts, or Git operations started inside other executable code. The permission profile's destination allowlist is the primary barrier to external databases and remote repositories. Writable `.git` access remains an accepted local-loss risk because it is required for checkpoint commits.

### 3.3 Developer configuration and project instructions

Create `%USERPROFILE%\.codex\config.toml`:

```toml
approval_policy = "on-request"
approvals_reviewer = "user"
default_permissions = "project_dev_profile"
allow_login_shell = false
web_search = "disabled"
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

Codex can store authentication in the operating-system credential store instead of plaintext `auth.json`; `history.persistence` controls transcript persistence. ([5] OpenAI, Authentication, <https://learn.chatgpt.com/docs/auth>) ([11] OpenAI, Configuration Reference, <https://learn.chatgpt.com/docs/config-file/config-reference>)

Do not add `sandbox_mode`, `sandbox_workspace_write`, or a CLI `--sandbox` override. OpenAI documents that permission profiles and the older sandbox settings do not compose. ([2] OpenAI, Permissions, <https://learn.chatgpt.com/docs/permissions>)

Create `PROJECT_ROOT\AGENTS.md` before the task:

```markdown
# Local API development

- Work only inside this project.
- Do not edit AGENTS.md, .gitignore, pom.xml, .mvn, Maven Wrapper files, .codex, .agents, Git configuration, or Git hooks.
- Use Java 21 and the checked-in Maven Wrapper.
- Build and test with:
  `$env:MAVEN_USER_HOME = Join-Path $PWD ".agent-cache\maven-home"`
  `.\mvnw.cmd --settings "C:\ProgramData\<Organization Name>\Java\maven-settings.xml" -Dmaven.repo.local="$PWD\.agent-cache\maven-repository" clean verify`
- Build and test APIs only. Do not run browser or UI tests.
- Use only MySQL at 127.0.0.1 through the application or Maven-managed tests.
- Do not run a database client, direct query, Docker, package manager, web search, remote Git command, or glab.
- After each coherent milestone, run focused tests, stage only intended files, and create a local checkpoint commit.
- Do not reset, restore, switch branches, rewrite history, or push.
- At completion, report commits, residual changes, tests, and unfinished work.
```

`AGENTS.md` provides durable instructions; the permission profile and managed requirements remain the enforcement boundaries.

## 4. Deployment verification

### 4.1 Identity and policy

- Confirm `<Developer Account>` is a standard user.
- Confirm Codex reports `project_dev_profile`, `approval_policy = "on-request"`, and `approvals_reviewer = "user"`.
- Confirm the elevated Windows sandbox completed administrator-approved setup. Stop if Codex falls back to the weaker unelevated sandbox. ([4] OpenAI, Windows sandbox, <https://learn.chatgpt.com/docs/windows/windows-sandbox>)
- Confirm the task uses **Local**, not **Cloud**, and the exact project directory.
- Confirm `.codex`, `.agents`, `AGENTS.md`, `.gitignore`, Maven controls, `.git\config`, `.git\hooks`, and `.env` files cannot be changed by sandboxed commands.
- Confirm Documents, Desktop, Downloads, credential folders, and another repository cannot be read.

### 4.2 Development workflow

- Confirm Codex can edit ordinary source and test files.
- Confirm the Maven build and API tests use `.agent-cache` and `<Artifact Proxy Host>`.
- Confirm Quarkus and MySQL listen only on `127.0.0.1`.
- Confirm application and test database connections target only `jdbc:mysql://127.0.0.1`.
- Confirm a controlled non-loopback database endpoint is unreachable from application or test code.
- Confirm browser, Computer Use, Apps, plugins, web search, MCP, Appshots, remote control, Docker, package managers, `mysql.exe`, and `glab` are unavailable.

### 4.3 Git and review

- Before Codex starts, confirm the dedicated local branch and record `<Review Base Commit>`.
- Confirm ordinary `git status`, `git diff`, `git add`, and local `git commit` work without approval.
- Confirm direct push, fetch, pull, destructive Git, history rewriting, and `glab` are forbidden.
- Confirm the Git remote host is absent from the network allowlist and unreachable from sandboxed commands.
- After Codex finishes, review:

  ```powershell
  git log --oneline <Review Base Commit>..HEAD
  git diff --stat <Review Base Commit>..HEAD
  git diff <Review Base Commit>..HEAD
  git status --short
  ```

- Rerun the complete required test set before accepting, squashing, or publishing the work.

Revalidate the baseline after any Codex client, permission-profile schema, Windows sandbox, managed-policy, Java toolchain, artifact proxy, Git, or MySQL change.

## 5. Numbered quoted references

The quotations were checked against the printed URLs on 2026-07-31.

1. **OpenAI, Agent approvals & security.** “the agent runs with network access turned off”; local Codex uses “an OS-enforced sandbox” and an approval policy. https://learn.chatgpt.com/docs/agent-approvals-security
2. **OpenAI, Permissions.** Permission profiles “apply least-privilege boundaries to local commands”; they combine filesystem and network rules, are “under active development,” and “setting `allow_local_binding = true` explicitly opens access to local services.” https://learn.chatgpt.com/docs/permissions
3. **OpenAI, Managed configuration.** “Requirements constrain security-sensitive settings”; Windows loads the system file from `%ProgramData%\OpenAI\Codex\requirements.toml`; an empty `mcp_servers` allowlist “disables all MCP servers.” https://learn.chatgpt.com/docs/enterprise/managed-configuration
4. **OpenAI, Windows sandbox.** The elevated sandbox uses “dedicated lower-privilege sandbox users, filesystem permission boundaries, firewall rules.” https://learn.chatgpt.com/docs/windows/windows-sandbox
5. **OpenAI, Authentication.** Codex supports “Sign in with ChatGPT for subscription access” and API-key sign-in; `keyring` uses the operating-system credential store. https://learn.chatgpt.com/docs/auth
6. **OpenAI, Codex environments.** “Local: work directly in your current project directory”; “Cloud: run remotely.” https://learn.chatgpt.com/docs/environments/modes
7. **OpenAI, Rules.** Rules control commands Codex can run outside the sandbox; `forbidden` means “Block the command without prompting.” https://learn.chatgpt.com/docs/agent-configuration/rules
8. **OpenAI, Sandbox.** When Codex runs Git, package managers, or test runners, those commands “inherit the same sandbox boundaries.” https://learn.chatgpt.com/docs/sandboxing
9. **OpenAI, How your data is used to improve model performance.** “Once you opt out, new conversations will not be used to train our models”; feedback may include the associated conversation. https://help.openai.com/en/articles/5722486
10. **OpenAI, Data Controls FAQ.** Turn off “Improve the model for everyone”; the setting “applies to your entire account.” https://help.openai.com/en/articles/7730893
11. **OpenAI, Configuration Reference.** `history.persistence` controls transcript persistence; `otel.log_user_prompt` controls prompt export; `analytics.enabled` controls analytics. https://learn.chatgpt.com/docs/config-file/config-reference
12. **Git, git-commit Documentation.** “Create a new commit containing the current contents of the index”; “the branch is updated to point to it.” https://git-scm.com/docs/git-commit
13. **Git, git-push Documentation.** Push “updates one or more branches, tags, or other references” in remote repositories and sends necessary data. https://git-scm.com/docs/git-push
