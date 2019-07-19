# Implement your module commands in this script.

foreach ($file in Get-ChildItem $PSScriptRoot/*.ArgumentCompleters.ps1)
{
    . $file.FullName
}
