if (!(Get-Module -ListAvailable TabExpansionPlusPlus)) {
    Install-Module TabExpansionPlusPlus
}

if(!(Get-Module -ListAvailable Pester)) {
    Install-Module Pester
}

Invoke-Pester (Join-Path $PSScriptRoot test macOSdefaultsCompleter.Tests.ps1)
