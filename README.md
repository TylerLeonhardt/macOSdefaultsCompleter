# Argument completer for macOS's `defaults` utility

[![Build Status](https://dev.azure.com/TylerLeonhardt/macOSdefaultsCompleter/_apis/build/status/TylerLeonhardt.macOSdefaultsCompleter?branchName=master)](https://dev.azure.com/TylerLeonhardt/macOSdefaultsCompleter/_build/latest?definitionId=5&branchName=master)
[![PowerShell Gallery](https://img.shields.io/powershellgallery/v/macOSdefaultsCompleter.svg)](https://www.powershellgallery.com/packages/macOSdefaultsCompleter)
[![PowerShell Gallery](https://img.shields.io/powershellgallery/dt/macOSdefaultsCompleter.svg)](https://www.powershellgallery.com/packages/macOSdefaultsCompleter)
[![PowerShell Gallery](https://img.shields.io/powershellgallery/p/macOSdefaultsCompleter.svg)](https://www.powershellgallery.com/packages/macOSdefaultsCompleter)

Powered by [TabExpansionPlusPlus](https://github.com/lzybkr/TabExpansionPlusPlus). Works in PowerShell 6 and up.

Grab it from the PowerShell Gallery:

```pwsh
Install-Module macOSdefaultsCompleter
```

If you don't have PowerShell already, grab the cross-platform version of it [from GitHub](https://github.com/PowerShell/PowerShell)!

## What's inside

> All you have to do is hit TAB 😎

### Completion of sub-commands with docs

![Completion of sub-commands with docs](https://user-images.githubusercontent.com/2644648/61571200-abe73600-aa46-11e9-9364-d2b965fd4db0.png)

NOTE: to get this view, bind `MenuComplete` to something like `Alt+Spacebar`!:

```pwsh
Set-PSReadLineKeyHandler Alt+Spacebar -Function MenuComplete
```

### Completion of `domains`

![Completion of domains](https://user-images.githubusercontent.com/2644648/61571250-f10b6800-aa46-11e9-8fe7-bc991dd34cc2.png)

### Completion of keys within `domains`

![Completion of keys within domains](https://user-images.githubusercontent.com/2644648/61571287-18623500-aa47-11e9-830c-338e8fa475e4.png)

And more!
