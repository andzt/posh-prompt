$global:PoshPromptSettings = New-Object PSObject -Property @{
    # Defaults
    DefaultForegroundColor     = $Host.UI.RawUI.ForegroundColor

    # Global settings
    ShowUserLocationAsPrompt   = $true
    ShowUserLocationAsTitle    = $false
    ShowStatusWhenZero         = $false
    EnablePromptStatus         = $true
    EnableFileStatus           = $true
    AutoRefreshIndex           = $true
    
    # Debug
    Debug                      = $false
    
    # Tab expansion
    AllCommands                = $false
    
    # Before prompt
    BeforeText                 = ' ['
    BeforeForegroundColor      = [ConsoleColor]::Yellow
    BeforeBackgroundColor      = $Host.UI.RawUI.BackgroundColor
    
    # Delim
    DelimText                  = ' |'
    DelimForegroundColor       = [ConsoleColor]::Yellow
    DelimBackgroundColor       = $Host.UI.RawUI.BackgroundColor
    
    # After prompt
    AfterText                  = ']'
    AfterForegroundColor       = [ConsoleColor]::Yellow
    AfterBackgroundColor       = $Host.UI.RawUI.BackgroundColor
    
    # Current branch
    BranchForegroundColor      = [ConsoleColor]::Cyan
    BranchBackgroundColor      = $Host.UI.RawUI.BackgroundColor
    # Current branch when not updated
    Branch2ForegroundColor     = [ConsoleColor]::Red
    Branch2BackgroundColor     = $Host.UI.RawUI.BackgroundColor
    
    # Index
    BeforeIndexText            = ""
    BeforeIndexForegroundColor = [ConsoleColor]::Blue
    BeforeIndexBackgroundColor = $Host.UI.RawUI.BackgroundColor
    
    IndexForegroundColor       = [ConsoleColor]::Blue
    IndexBackgroundColor       = $Host.UI.RawUI.BackgroundColor
    
    # Working directory status
    WorkingForegroundColor     = [ConsoleColor]::Yellow
    WorkingBackgroundColor     = $Host.UI.RawUI.BackgroundColor
    
    # Untracked
    UntrackedText              = ' !'
    UntrackedForegroundColor   = [ConsoleColor]::Yellow
    UntrackedBackgroundColor   = $Host.UI.RawUI.BackgroundColor
    
    #Tag list
    ShowTags                   = $false
    BeforeTagText              = ' '
    TagForegroundColor         = [ConsoleColor]::DarkGray
    TagBackgroundColor         = $Host.UI.RawUI.BackgroundColor
    TagSeparator               = ", "
    TagSeparatorColor          = [ConsoleColor]::White
    
    #Status
    StatusAddedText            = 'A'
    StatusModifiedText         = 'M'
    StatusDeletedText          = 'D'
    StatusUntrackedText        = '?'
    StatusMissingText          = '!'
    StatusRenamedText          = 'R'
    
    StatusAdded                = [ConsoleColor]::Green
    StatusModified             = [ConsoleColor]::Yellow
    StatusDeleted              = [ConsoleColor]::Cyan
    StatusUntracked            = [ConsoleColor]::Red
    StatusMissing              = [ConsoleColor]::Magenta
    StatusRenamed              = [ConsoleColor]::White
    
    # MQ Integration
    ShowPatches                   = $false
    BeforePatchText               = ' patches: '
    UnappliedPatchForegroundColor = [ConsoleColor]::DarkGray
    UnappliedPatchBackgroundColor = $Host.UI.RawUI.BackgroundColor
    AppliedPatchForegroundColor   = [ConsoleColor]::DarkYellow
    AppliedPatchBackgroundColor   = $Host.UI.RawUI.BackgroundColor
    PatchSeparator                = ' › '
    PatchSeparatorColor           = [ConsoleColor]::White 
    
    # Tortoise
    TortoiseGitPath = ${env:ProgramFiles} + "\TortoiseGit\bin\TortoiseProc.exe"
}