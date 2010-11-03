$global:PoshHgSettings = New-Object PSObject -Property @{
    #Global settings
    ShowUserLocationAsPrompt  = $true
    ShowUserLocationAsTitle   = $false

    #Before prompt
    BeforeText                = ' ['
    BeforeForegroundColor     = [ConsoleColor]::Yellow
    BeforeBackgroundColor     = $Host.UI.RawUI.BackgroundColor
    
    #After prompt
    AfterText                 = ']'
    AfterForegroundColor      = [ConsoleColor]::Yellow
    AfterBackgroundColor      = $Host.UI.RawUI.BackgroundColor
    
    # Current branch
    BranchForegroundColor    = [ConsoleColor]::Cyan
    BranchBackgroundColor    = $Host.UI.RawUI.BackgroundColor
    # Current branch when not updated
    Branch2ForegroundColor   = [ConsoleColor]::Red
    Branch2BackgroundColor   = $host.UI.RawUI.BackgroundColor
    
    # Working directory status
    WorkingForegroundColor    = [ConsoleColor]::Yellow
    WorkingBackgroundColor    = $Host.UI.RawUI.BackgroundColor
    
    #Tag list
    ShowTags                  = $false
    BeforeTagText             = ' '
    TagForegroundColor        = [ConsoleColor]::DarkGray
    TagBackgroundColor        = $Host.UI.RawUI.BackgroundColor
    TagSeparator              = ", "
    TagSeparatorColor         = [ConsoleColor]::White
    
    #Status
    StatusAdded               = [ConsoleColor]::Green
    StatusModified            = [ConsoleColor]::Yellow
    StatusDeleted             = [ConsoleColor]::Cyan
    StatusUntracked           = [ConsoleColor]::Red
    StatusMissing             = [ConsoleColor]::Magenta
    StatusRenamed             = [ConsoleColor]::White
    
    # MQ Integration
    ShowPatches                   = $false
    BeforePatchText               = ' patches: '
    UnappliedPatchForegroundColor = [ConsoleColor]::DarkGray
    UnappliedPatchBackgroundColor = $Host.UI.RawUI.BackgroundColor
    AppliedPatchForegroundColor   = [ConsoleColor]::DarkYellow
    AppliedPatchBackgroundColor   = $Host.UI.RawUI.BackgroundColor
    PatchSeparator                = ' › '
    PatchSeparatorColor           = [ConsoleColor]::White    
}