# Inspired by Mark Embling
# http://www.markembling.info/view/my-ideal-powershell-prompt-with-git-integration

function Write-GitStatus($status) {
    $s = $global:PoshPromptSettings
    if ($status -and $s) {
        $currentBranch = $status.Branch
        
        Write-Host $s.BeforeText -NoNewline -BackgroundColor $s.BeforeBackgroundColor -ForegroundColor $s.BeforeForegroundColor
        if ($status.AheadBy -eq 0) {
            # We are not ahead of origin
            Write-Host $currentBranch -NoNewline -BackgroundColor $s.BranchBackgroundColor -ForegroundColor $s.BranchForegroundColor
        } else {
            # We are ahead of origin
            Write-Host $currentBranch -NoNewline -BackgroundColor $s.Branch2BackgroundColor -ForegroundColor $s.Branch2ForegroundColor
        }
        
        if($s.EnableFileStatus -and $status.HasIndex) {
            write-host $s.BeforeIndexText -NoNewLine -BackgroundColor $s.BeforeIndexBackgroundColor -ForegroundColor $s.BeforeIndexForegroundColor
            
            if($s.ShowStatusWhenZero -or $status.Index.Added) {
              Write-Host " $($s.StatusAddedText)$($status.Index.Added.Count)" -NoNewline -BackgroundColor $s.IndexBackgroundColor -ForegroundColor $s.StatusAdded
            }
            if($s.ShowStatusWhenZero -or $status.Index.Modified) {
              Write-Host " $($s.StatusModifiedText)$($status.Index.Modified.Count)" -NoNewline -BackgroundColor $s.IndexBackgroundColor -ForegroundColor $s.StatusModified
            }
            if($s.ShowStatusWhenZero -or $status.Index.Deleted) {
              Write-Host " $($s.StatusDeletedText)$($status.Index.Deleted.Count)" -NoNewline -BackgroundColor $s.IndexBackgroundColor -ForegroundColor $s.StatusDeleted
            }

            if ($status.Index.Unmerged) {
                Write-Host " !$($status.Index.Unmerged.Count)" -NoNewline -BackgroundColor $s.IndexBackgroundColor -ForegroundColor $s.IndexForegroundColor
            }

            if($status.HasWorking) {
                Write-Host $s.DelimText -NoNewline -BackgroundColor $s.DelimBackgroundColor -ForegroundColor $s.DelimForegroundColor
            }
        }
        
        if($s.EnableFileStatus -and $status.HasWorking) {
            if($s.ShowStatusWhenZero -or $status.Working.Added) {
              Write-Host " $($s.StatusAddedText)$($status.Working.Added.Count)" -NoNewline -BackgroundColor $s.WorkingBackgroundColor -ForegroundColor $s.StatusAdded
            }
            if($s.ShowStatusWhenZero -or $status.Working.Modified) {
              Write-Host " $($s.StatusModifiedText)$($status.Working.Modified.Count)" -NoNewline -BackgroundColor $s.WorkingBackgroundColor -ForegroundColor $s.StatusModified
            }
            if($s.ShowStatusWhenZero -or $status.Working.Deleted) {
              Write-Host " $($s.StatusDeletedText)$($status.Working.Deleted.Count)" -NoNewline -BackgroundColor $s.WorkingBackgroundColor -ForegroundColor $s.StatusDeleted
            }

            if ($status.Working.Unmerged) {
                Write-Host " !$($status.Working.Unmerged.Count)" -NoNewline -BackgroundColor $s.WorkingBackgroundColor -ForegroundColor $s.WorkingForegroundColor
            }
        }
        
        if ($status.HasUntracked) {
            Write-Host $s.UntrackedText -NoNewline -BackgroundColor $s.UntrackedBackgroundColor -ForegroundColor $s.StatusUntracked
        }
        
        Write-Host $s.AfterText -NoNewline -BackgroundColor $s.AfterBackgroundColor -ForegroundColor $s.AfterForegroundColor
    }
}
