function DefaultsCompletion {
    param($wordToComplete, $commandAst)

    $commandTree = Get-CompletionPrivateData -Key MacOSDefaultsCompletionCommandTree
    if ($null -eq $commandTree)
    {
        #region Helpers

        Set-Alias -Name nct -Value New-CommandTree
        function DomainCompleter {
            param (
                [scriptblock]
                $SubCommand
            )
            $domains = (defaults domains) -split ", "
            $domains += "-globalDomain"
            $domains | ForEach-Object {
                if($_) {
                    if($SubCommand) {
                        New-CommandTree $_ $_ $SubCommand
                    } else {
                        New-CommandTree $_ $_
                    }
                }
            }
        }

        $KeyCompleter = {
            nct {
                param($wordToComplete, $commandAst)

                # Sort circuit tab completion after we've completed the key.
                # TODO I should figure out how to do this properly...
                if($commandAst.CommandElements.Count -gt 4 -or
                    (!$wordToComplete -and $commandAst.CommandElements.Count -ge 4)) { return }

                # Gotta love XML APIs
                $xml = [xml](defaults export $commandAst.CommandElements[2].Value -)

                $escapedWordToComplete = [regex]::Escape($wordToComplete.Trim('"').Trim("'"))
                $xml.plist.dict.key |
                    Where-Object { $_ -match "^$escapedWordToComplete" } |
                    New-CompletionResult
            }
        }

        #endregion

        # Grab help messages
        Import-LocalizedData -BindingVariable msgTable -FileName defaults.Messages.psd1

        $commandTree = & {
            nct 'read' $msgTable.defaults_read {
                DomainCompleter -SubCommand $KeyCompleter
            }

            nct 'read-type' $msgTable.defaults_read_type {
                DomainCompleter -SubCommand $KeyCompleter
            }

            nct 'write' $msgTable.defaults_write {
                DomainCompleter
            }

            nct 'rename' $msgTable.defaults_rename {
                DomainCompleter -SubCommand $KeyCompleter
            }

            nct 'delete' $msgTable.defaults_delete {
                DomainCompleter -SubCommand $KeyCompleter
            }

            nct 'import' $msgTable.defaults_import {
                DomainCompleter
            }

            nct 'export' $msgTable.defaults_export {
                DomainCompleter
            }

            nct 'domains' $msgTable.defaults_domains
            nct 'find' $msgTable.defaults_find
            nct 'help' $msgTable.defaults_help
        }

        Set-CompletionPrivateData -Key MacOSDefaultsCompletionCommandTree -Value $commandTree
    }

    Get-CommandTreeCompletion $wordToComplete $commandAst $commandTree
}

Register-ArgumentCompleter `
    -Command 'defaults' `
    -Native `
    -Description 'Complete parameters and arguments to the macOS `defaults` utility' `
    -ScriptBlock $function:DefaultsCompletion
