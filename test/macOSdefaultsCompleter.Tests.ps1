$ModuleManifestName = 'macOSdefaultsCompleter.psd1'
$ModuleManifestPath = "$PSScriptRoot\..\$ModuleManifestName"

Import-Module $ModuleManifestPath

Describe 'Module Manifest Tests' {
    It 'Passes Test-ModuleManifest' {
        Test-ModuleManifest -Path $ModuleManifestPath | Should Not BeNullOrEmpty
        $? | Should Be $true
    }
    It 'defaults smoketest' {
        Test-ArgumentCompleter -NativeCommand "defaults" | Should -Not -BeNullOrEmpty
        Test-ArgumentCompleter -NativeCommand "defaults read" | Should -Not -BeNullOrEmpty
        Test-ArgumentCompleter -NativeCommand "defaults read-type" | Should -Not -BeNullOrEmpty
    }
}

