param(
    [Parameter()]
    [switch]
    $Test,

    [Parameter()]
    [switch]
    $Package
)

if (!(Get-Module -ListAvailable TabExpansionPlusPlus)) {
    Install-Module TabExpansionPlusPlus
}

if(!(Get-Module -ListAvailable Pester)) {
    Install-Module Pester
}

if ($Test) {
    Push-Location $PSScriptRoot\test
    try {
        $res = Invoke-Pester -OutputFormat NUnitXml -OutputFile TestsResults.xml -PassThru
        if ($res.FailedCount -gt 0) { throw "$($res.FailedCount) tests failed."}
    }
    finally {
        Pop-Location
    }
}
