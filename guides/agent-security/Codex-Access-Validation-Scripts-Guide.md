# Codex Access Validation Scripts

## Purpose

Copyright (c) 2026 Martin.Bechard@DevConsult.ca

This document contains the complete PowerShell program used to validate the Windows access controls from `Codex-Development-Security-Guide.md`.

The program generates three scripts with literal Windows paths:

| Generated file | Run by | Purpose |
| --- | --- | --- |
| `Setup-Codex-Access-Validation.ps1` | Developer | Creates synthetic files in the project, Documents, Desktop, and Downloads |
| `Test-Codex-Access-Validation.ps1` | Codex | Tests which files, tools, local ports, and network destinations Codex can access |
| `Cleanup-Codex-Access-Validation.ps1` | Developer | Removes the synthetic files created by setup and testing |

Every name enclosed in angle brackets, such as `<Developer Account>`, is a placeholder. Replace each placeholder with the approved local value before running the generator or any displayed command; do not include the angle brackets in the deployed value.

The setup and cleanup scripts run as the normal `<Developer Account>` Windows user. The test script runs through Codex without elevation so that it exercises the configured Codex sandbox.

## 1. Run from the project root

Copy the complete generator from section 5 into:

```text
C:\ProgramData\<Organization Name>\Codex\Validation\Generate-Codex-Access-Validation-Scripts.ps1
```

The generator does not require path editing. Run it from the root of the project being tested. It resolves:

| Path | Source used by the generator |
| --- | --- |
| Project root | Current PowerShell directory |
| Output directory | `tools\agent-access-validation` under the project root |
| Documents | Windows `MyDocuments` known-folder value |
| Desktop | Windows `DesktopDirectory` known-folder value |
| Downloads | `Downloads` under `$HOME` |
| Git and Java installations | `$env:ProgramFiles` |
| Managed Java configuration | `$env:ProgramData` |
| Controlled external database and GitLab test hosts | Values entered in the generator |

The generator substitutes the resolved values into the three generated files. The setup, test, and cleanup scripts therefore contain literal paths and do not resolve paths from their execution environment.

The generator stops if the Documents, Desktop, or Downloads path is empty. Use controlled non-production endpoints for the external database and GitLab host values.

## 2. Files created by setup

The setup script creates only these files:

```text
C:\Dev\Projects\<Project Folder Name>\.agent-access-validation\project-sentinel.txt
C:\Dev\Projects\<Project Folder Name>\.agent-access-validation\.env
C:\Dev\Projects\<Project Folder Name>\.agent-access-validation\.gitignore

C:\Users\<Developer Account>\Documents\AgentAccessValidation\sentinel.txt
C:\Users\<Developer Account>\Desktop\AgentAccessValidation\sentinel.txt
C:\Users\<Developer Account>\Downloads\AgentAccessValidation\sentinel.txt
```

The test script may also create:

```text
C:\Dev\Projects\<Project Folder Name>\.agent-access-validation\write-probe.txt
C:\Dev\Projects\<Project Folder Name>\.git\agent-access-probe.tmp
```

If a blocked write unexpectedly succeeds, it may create:

```text
C:\Users\<Developer Account>\Documents\AgentAccessValidation\write-probe.txt
C:\Users\<Developer Account>\Desktop\AgentAccessValidation\write-probe.txt
C:\Users\<Developer Account>\Downloads\AgentAccessValidation\write-probe.txt
```

The cleanup script names and removes each of these files explicitly.

## 3. Generate and review the scripts

Open PowerShell as `<Developer Account>`, change to the exact project root, and run the generator:

```powershell
Set-Location "C:\Dev\Projects\<Project Folder Name>"
powershell.exe -NoProfile -File "C:\ProgramData\<Organization Name>\Codex\Validation\Generate-Codex-Access-Validation-Scripts.ps1"
```

It creates:

```text
C:\Dev\Projects\<Project Folder Name>\tools\agent-access-validation\Setup-Codex-Access-Validation.ps1
C:\Dev\Projects\<Project Folder Name>\tools\agent-access-validation\Test-Codex-Access-Validation.ps1
C:\Dev\Projects\<Project Folder Name>\tools\agent-access-validation\Cleanup-Codex-Access-Validation.ps1
```

Open all three generated files and confirm that every path is correct before running them.

## 4. Run the validation

The developer first creates the synthetic files:

```powershell
powershell.exe -NoProfile -File "C:\Dev\Projects\<Project Folder Name>\tools\agent-access-validation\Setup-Codex-Access-Validation.ps1"
```

Ask Codex to run:

```powershell
powershell.exe -NoProfile -File "C:\Dev\Projects\<Project Folder Name>\tools\agent-access-validation\Test-Codex-Access-Validation.ps1"
```

Start local Quarkus and MySQL first. From the developer account, also confirm that both controlled external test endpoints are reachable; otherwise a failed sandbox connection would not prove that Codex blocked it.

Each test prints `ALLOW` or `BLOCK` before the operation:

- An `ALLOW` operation should succeed.
- A `BLOCK` operation should report an access or network denial.
- `Test-NetConnection` can run successfully while reporting that a port is closed. For the Quarkus and MySQL checks, inspect `TcpTestSucceeded`.
- For the external database and GitLab checks, `TcpTestSucceeded` must be `False`.

The wrapper tests sandboxed filesystem and network access. It does not prove settings and command rules that apply before a wrapper starts. Separately confirm:

- **Local** mode, `project_dev_profile`, and the elevated Windows sandbox;
- the approved Maven build, project-local cache, and artifact proxy;
- disabled browser, web-search, app, plugin, and MCP features; and
- forbidden `glab`, `mysql`, and remote Git commands plus permitted local checkpoint commits.

After reviewing the results, the developer runs:

```powershell
powershell.exe -NoProfile -File "C:\Dev\Projects\<Project Folder Name>\tools\agent-access-validation\Cleanup-Codex-Access-Validation.ps1"
```

## 5. Complete PowerShell generator

```powershell
# Copyright (c) 2026 Martin.Bechard@DevConsult.ca
# AI attribution: Generated with AI assistance.
# Generates reviewable Codex access-validation scripts containing literal Windows paths.
# Governing design: guides/agent-security/Codex-Development-Security-Guide.md

$ErrorActionPreference = 'Stop'

# Run the generator from the project root. It resolves paths once and writes
# their literal values into the generated setup, test, and cleanup scripts.
$ProjectRoot = (Get-Location).Path
$OutputDirectory = Join-Path $ProjectRoot 'tools\agent-access-validation'
$DocumentsRoot = [Environment]::GetFolderPath('MyDocuments')
$DesktopRoot = [Environment]::GetFolderPath('DesktopDirectory')
$DownloadsRoot = Join-Path $HOME 'Downloads'
$GitInstallRoot = Join-Path $env:ProgramFiles 'Git'
$JavaInstallRoot = Join-Path $env:ProgramFiles 'Eclipse Adoptium'
$ManagedJavaRoot = Join-Path $env:ProgramData '<Organization Name>\Java'
$ExternalDatabaseTestHost = '<Controlled External Database Test Host>'
$GitLabTestHost = '<GitLab Test Host>'

if ($ManagedJavaRoot -match '<[^>]+>' -or
    $ExternalDatabaseTestHost -match '<[^>]+>' -or
    $GitLabTestHost -match '<[^>]+>') {
    throw 'Replace every <...> placeholder in the generator before running it.'
}

if ([string]::IsNullOrWhiteSpace($DocumentsRoot)) { throw 'Windows returned an empty Documents path.' }
if ([string]::IsNullOrWhiteSpace($DesktopRoot)) { throw 'Windows returned an empty Desktop path.' }
if ([string]::IsNullOrWhiteSpace($DownloadsRoot)) { throw 'Windows returned an empty Downloads path.' }

New-Item -ItemType Directory -Path $OutputDirectory -Force | Out-Null

$SetupScript = @'
# Copyright (c) 2026 Martin.Bechard@DevConsult.ca
# AI attribution: Generated with AI assistance.
# Creates only the access-validation files named below. Run as <Developer Account>.
# Governing design: guides/agent-security/Codex-Development-Security-Guide.md

$ErrorActionPreference = 'Stop'

New-Item -ItemType Directory -Path '@@PROJECT_ROOT@@\.agent-access-validation' -Force | Out-Null
Set-Content -Path '@@PROJECT_ROOT@@\.agent-access-validation\project-sentinel.txt' -Value 'Agent access test sentinel.'
Set-Content -Path '@@PROJECT_ROOT@@\.agent-access-validation\.env' -Value 'Agent access test sentinel.'
Set-Content -Path '@@PROJECT_ROOT@@\.agent-access-validation\.gitignore' -Value '*'

New-Item -ItemType Directory -Path '@@DOCUMENTS_ROOT@@\AgentAccessValidation' -Force | Out-Null
Set-Content -Path '@@DOCUMENTS_ROOT@@\AgentAccessValidation\sentinel.txt' -Value 'Agent access test sentinel.'

New-Item -ItemType Directory -Path '@@DESKTOP_ROOT@@\AgentAccessValidation' -Force | Out-Null
Set-Content -Path '@@DESKTOP_ROOT@@\AgentAccessValidation\sentinel.txt' -Value 'Agent access test sentinel.'

New-Item -ItemType Directory -Path '@@DOWNLOADS_ROOT@@\AgentAccessValidation' -Force | Out-Null
Set-Content -Path '@@DOWNLOADS_ROOT@@\AgentAccessValidation\sentinel.txt' -Value 'Agent access test sentinel.'

Write-Host 'Setup complete.'
'@

$SetupScript = $SetupScript.Replace('@@PROJECT_ROOT@@', $ProjectRoot)
$SetupScript = $SetupScript.Replace('@@DOCUMENTS_ROOT@@', $DocumentsRoot)
$SetupScript = $SetupScript.Replace('@@DESKTOP_ROOT@@', $DesktopRoot)
$SetupScript = $SetupScript.Replace('@@DOWNLOADS_ROOT@@', $DownloadsRoot)

$TestScript = @'
# Copyright (c) 2026 Martin.Bechard@DevConsult.ca
# AI attribution: Generated with AI assistance.
# Exercises Codex sandbox access through visible, unrolled commands and literal paths.
# Governing design: guides/agent-security/Codex-Development-Security-Guide.md
#
# Run this script through Codex without elevation.
# ALLOW means the command should succeed.
# BLOCK means the command should display an access-denied or network-denied error.

$ErrorActionPreference = 'Continue'

Write-Host "`nALLOW - read an ordinary project file"
Get-Content '@@PROJECT_ROOT@@\.agent-access-validation\project-sentinel.txt'

Write-Host "`nALLOW - write an ordinary project file"
Set-Content '@@PROJECT_ROOT@@\.agent-access-validation\write-probe.txt' 'write test'

Write-Host "`nALLOW - read local Git metadata"
Get-ChildItem '@@PROJECT_ROOT@@\.git' -Force | Select-Object -First 1

Write-Host "`nALLOW - write local Git metadata"
Set-Content '@@PROJECT_ROOT@@\.git\agent-access-probe.tmp' 'write test'

Write-Host "`nBLOCK - read the project .env file"
Get-Content '@@PROJECT_ROOT@@\.agent-access-validation\.env'

Write-Host "`nBLOCK - write the project .env file"
Set-Content '@@PROJECT_ROOT@@\.agent-access-validation\.env' 'write test'

Write-Host "`nBLOCK - read Documents"
Get-Content '@@DOCUMENTS_ROOT@@\AgentAccessValidation\sentinel.txt'

Write-Host "`nBLOCK - write Documents"
Set-Content '@@DOCUMENTS_ROOT@@\AgentAccessValidation\write-probe.txt' 'write test'

Write-Host "`nBLOCK - read Desktop"
Get-Content '@@DESKTOP_ROOT@@\AgentAccessValidation\sentinel.txt'

Write-Host "`nBLOCK - write Desktop"
Set-Content '@@DESKTOP_ROOT@@\AgentAccessValidation\write-probe.txt' 'write test'

Write-Host "`nBLOCK - read Downloads"
Get-Content '@@DOWNLOADS_ROOT@@\AgentAccessValidation\sentinel.txt'

Write-Host "`nBLOCK - write Downloads"
Set-Content '@@DOWNLOADS_ROOT@@\AgentAccessValidation\write-probe.txt' 'write test'

Write-Host "`nALLOW - read the Git installation"
Get-ChildItem '@@GIT_INSTALL_ROOT@@' -Force | Select-Object -First 1

Write-Host "`nALLOW - read the Java installation"
Get-ChildItem '@@JAVA_INSTALL_ROOT@@' -Force | Select-Object -First 1

Write-Host "`nALLOW - read the managed Java configuration"
Get-ChildItem '@@MANAGED_JAVA_ROOT@@' -Force | Select-Object -First 1

Write-Host "`nALLOW - bind a temporary server to loopback"
$Listener = [Net.Sockets.TcpListener]::new([Net.IPAddress]::Loopback, 0)
$Listener.Start()
$Listener.LocalEndpoint
$Listener.Stop()

Write-Host "`nALLOW - connect to Quarkus on 127.0.0.1:8080"
Test-NetConnection 127.0.0.1 -Port 8080 -InformationLevel Detailed

Write-Host "`nALLOW - connect to MySQL on 127.0.0.1:3306"
Test-NetConnection 127.0.0.1 -Port 3306 -InformationLevel Detailed

Write-Host "`nBLOCK - connect to a controlled non-local database endpoint"
Test-NetConnection '@@EXTERNAL_DATABASE_TEST_HOST@@' -Port 3306 -InformationLevel Detailed

Write-Host "`nBLOCK - connect to a controlled GitLab endpoint"
Test-NetConnection '@@GITLAB_TEST_HOST@@' -Port 443 -InformationLevel Detailed

Write-Host "`nTest complete. Compare every result with its ALLOW or BLOCK label."
'@

$TestScript = $TestScript.Replace('@@PROJECT_ROOT@@', $ProjectRoot)
$TestScript = $TestScript.Replace('@@DOCUMENTS_ROOT@@', $DocumentsRoot)
$TestScript = $TestScript.Replace('@@DESKTOP_ROOT@@', $DesktopRoot)
$TestScript = $TestScript.Replace('@@DOWNLOADS_ROOT@@', $DownloadsRoot)
$TestScript = $TestScript.Replace('@@GIT_INSTALL_ROOT@@', $GitInstallRoot)
$TestScript = $TestScript.Replace('@@JAVA_INSTALL_ROOT@@', $JavaInstallRoot)
$TestScript = $TestScript.Replace('@@MANAGED_JAVA_ROOT@@', $ManagedJavaRoot)
$TestScript = $TestScript.Replace('@@EXTERNAL_DATABASE_TEST_HOST@@', $ExternalDatabaseTestHost)
$TestScript = $TestScript.Replace('@@GITLAB_TEST_HOST@@', $GitLabTestHost)

$CleanupScript = @'
# Copyright (c) 2026 Martin.Bechard@DevConsult.ca
# AI attribution: Generated with AI assistance.
# Removes only the exact access-validation files and directories named below. Run as <Developer Account>.
# Governing design: guides/agent-security/Codex-Development-Security-Guide.md

Remove-Item '@@DOCUMENTS_ROOT@@\AgentAccessValidation\sentinel.txt' -Force -ErrorAction SilentlyContinue
Remove-Item '@@DOCUMENTS_ROOT@@\AgentAccessValidation\write-probe.txt' -Force -ErrorAction SilentlyContinue
Remove-Item '@@DOCUMENTS_ROOT@@\AgentAccessValidation' -ErrorAction SilentlyContinue

Remove-Item '@@DESKTOP_ROOT@@\AgentAccessValidation\sentinel.txt' -Force -ErrorAction SilentlyContinue
Remove-Item '@@DESKTOP_ROOT@@\AgentAccessValidation\write-probe.txt' -Force -ErrorAction SilentlyContinue
Remove-Item '@@DESKTOP_ROOT@@\AgentAccessValidation' -ErrorAction SilentlyContinue

Remove-Item '@@DOWNLOADS_ROOT@@\AgentAccessValidation\sentinel.txt' -Force -ErrorAction SilentlyContinue
Remove-Item '@@DOWNLOADS_ROOT@@\AgentAccessValidation\write-probe.txt' -Force -ErrorAction SilentlyContinue
Remove-Item '@@DOWNLOADS_ROOT@@\AgentAccessValidation' -ErrorAction SilentlyContinue

Remove-Item '@@PROJECT_ROOT@@\.agent-access-validation\project-sentinel.txt' -Force -ErrorAction SilentlyContinue
Remove-Item '@@PROJECT_ROOT@@\.agent-access-validation\.env' -Force -ErrorAction SilentlyContinue
Remove-Item '@@PROJECT_ROOT@@\.agent-access-validation\.gitignore' -Force -ErrorAction SilentlyContinue
Remove-Item '@@PROJECT_ROOT@@\.agent-access-validation\write-probe.txt' -Force -ErrorAction SilentlyContinue
Remove-Item '@@PROJECT_ROOT@@\.agent-access-validation' -ErrorAction SilentlyContinue

Remove-Item '@@PROJECT_ROOT@@\.git\agent-access-probe.tmp' -Force -ErrorAction SilentlyContinue

Write-Host 'Cleanup complete.'
'@

$CleanupScript = $CleanupScript.Replace('@@PROJECT_ROOT@@', $ProjectRoot)
$CleanupScript = $CleanupScript.Replace('@@DOCUMENTS_ROOT@@', $DocumentsRoot)
$CleanupScript = $CleanupScript.Replace('@@DESKTOP_ROOT@@', $DesktopRoot)
$CleanupScript = $CleanupScript.Replace('@@DOWNLOADS_ROOT@@', $DownloadsRoot)

Set-Content -Path "$OutputDirectory\Setup-Codex-Access-Validation.ps1" -Value $SetupScript -Encoding UTF8
Set-Content -Path "$OutputDirectory\Test-Codex-Access-Validation.ps1" -Value $TestScript -Encoding UTF8
Set-Content -Path "$OutputDirectory\Cleanup-Codex-Access-Validation.ps1" -Value $CleanupScript -Encoding UTF8

Write-Host "Generated scripts in $OutputDirectory"
```
