# For backwards compatibility
$global:HgPromptSettings = $global:PoshHgSettings

function Write-HgStatus($status = (get-hgStatus)) {
    if ($status) {
        $s = $global:PoshHgSettings
       
        $branchFg = $s.BranchForegroundColor
        $branchBg = $s.BranchBackgroundColor
        
        if($status.Behind) {
          $branchFg = $s.Branch2ForegroundColor
          $branchBg = $s.Branch2BackgroundColor
        }
       
        Write-Host $s.BeforeText -NoNewline -BackgroundColor $s.BeforeBackgroundColor -ForegroundColor $s.BeforeForegroundColor
        Write-Host $status.Branch -NoNewline -BackgroundColor $branchBg -ForegroundColor $branchFg
        
        if($status.Added) {
          Write-Host " A$($status.Added)" -NoNewline -BackgroundColor $s.WorkingBackgroundColor -ForegroundColor $s.StatusAdded
        }
        if($status.Modified) {
          Write-Host " M$($status.Modified)" -NoNewline -BackgroundColor $s.WorkingBackgroundColor -ForegroundColor $s.StatusModified
        }
        if($status.Deleted) {
          Write-Host " D$($status.Deleted)" -NoNewline -BackgroundColor $s.WorkingBackgroundColor -ForegroundColor $s.StatusDeleted
        }
        
        if ($status.Untracked) {
          Write-Host " ?$($status.Untracked)" -NoNewline -BackgroundColor $s.WorkingBackgroundColor -ForegroundColor $s.StatusUntracked
        }
        
        if($status.Missing) {
           Write-Host " !$($status.Missing)" -NoNewline -BackgroundColor $s.WorkingBackgroundColor -ForegroundColor $s.StatusMissing
        }

        if($status.Renamed) {
           Write-Host " R$($status.Renamed)" -NoNewline -BackgroundColor $s.WorkingBackgroundColor -ForegroundColor $s.StatusRenamed
        }

        if($s.ShowTags -and $status.Tags.Length) {
          write-host $s.BeforeTagText -NoNewLine
          
          $tagCounter=0
          $status.Tags | % {
              write-host $_ -NoNewLine -ForegroundColor $s.TagForegroundColor -BackgroundColor $s.TagBackgroundColor 
              if($tagCounter -lt ($status.Tags.Length -1)) {
                write-host ", " -NoNewLine -ForegroundColor $s.TagSeparatorColor -BackgroundColor $s.TagBackgroundColor
              }
              $tagCounter++;
          }        
        }
        
        if($s.ShowPatches) {
          $patches = Get-MqPatches
          if($patches.All.Length) {
            write-host $s.BeforePatchText -NoNewLine
  
            $patchCounter = 0
            
            $patches.Applied | % {
              write-host $_ -NoNewLine -ForegroundColor $s.AppliedPatchForegroundColor -BackgroundColor $s.AppliedPatchBackgroundColor
              if($patchCounter -lt ($patches.All.Length -1)) {
                write-host $s.PatchSeparator -NoNewLine -ForegroundColor $s.PatchSeparatorColor
              }
              $patchCounter++;
            }
            
            $patches.Unapplied | % {
               write-host $_ -NoNewLine -ForegroundColor $s.UnappliedPatchForegroundColor -BackgroundColor $s.UnappliedPatchBackgroundColor
               if($patchCounter -lt ($patches.All.Length -1)) {
                  write-host $s.PatchSeparator -NoNewLine -ForegroundColor $s.PatchSeparatorColor
               }
               $patchCounter++;
            }
          }
        }
        
       Write-Host $s.AfterText -NoNewline -BackgroundColor $s.AfterBackgroundColor -ForegroundColor $s.AfterForegroundColor
    }
}