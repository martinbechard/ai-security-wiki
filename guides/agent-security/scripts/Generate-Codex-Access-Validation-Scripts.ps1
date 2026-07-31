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
