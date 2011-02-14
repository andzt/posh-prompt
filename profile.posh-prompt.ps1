Push-Location (Split-Path -Path $MyInvocation.MyCommand.Definition -Parent)

# Load posh-prompt module from current directory
Import-Module .\posh-prompt

# If module is installed in a default location ($env:PSModulePath),
# use this instead (see about_Modules for more information):
# Import-Module posh-hg


# Set up a simple prompt, adding the hg prompt parts inside hg repos
function prompt {
    $s = $global:PoshPromptSettings
    
    # Reset color, which can be messed up by Enable-GitColors
    $Host.UI.RawUI.ForegroundColor = $s.DefaultForegroundColor
    
    # Show location
    if ($s.ShowUserLocationAsPrompt) {
        $path = ""
        $pathbits = ([string]$pwd).split("\", [System.StringSplitOptions]::RemoveEmptyEntries)
        if($pathbits.length -eq 1) {
            $path = $pathbits[0] + "\"
        } else {
            $path = $pathbits[$pathbits.length - 1]
        }
        
        $userLocation = '@ ' + $path
        
        if ($s.ShowUserLocationAsTitle) {
            $Host.UI.RawUi.WindowTitle = $userLocation
        }
        
        Write-Host($userLocation) -nonewline -foregroundcolor Green
    } else {
        Write-Host($pwd) -nonewline
    }
    
    # Check current folder type
    #  0: Not a repository
    #  1: Git repository
    #  2: Mercurial repository
    $folderType = IsHgOrGitDirectory

    switch ($folderType) {
    default {}
    
    # Git prompt
    1 {
        Enable-GitColors
        $Global:GitStatus = Get-GitStatus
        Write-GitStatus $GitStatus
      }
    
    # Mercurial Prompt
    2 {
        $Global:HgStatus = Get-HgStatus
        Write-HgStatus $HgStatus
      }
    }

    return "> "
}

if(-not (Test-Path Function:\DefaultTabExpansion)) {
    Rename-Item Function:\TabExpansion DefaultTabExpansion
}

# Set up tab expansion and include hg & git expansions
function TabExpansion($line, $lastWord) {
    $lastBlock = [regex]::Split($line, '[|;]')[-1]
    
    switch -regex ($lastBlock) {
        # mercurial and tortoisehg tab expansion
        '(hg|thg) (.*)' { HgTabExpansion($lastBlock) }
        # git tab expansion for all git-related commands
        'git (.*)' { GitTabExpansion($lastBlock) }
        # Fall back on existing tab expansion
        default { DefaultTabExpansion $line $lastWord }
    }
}


Pop-Location
