if (Get-Module posh-prompt) { return }

Push-Location $psScriptRoot
.\CheckVersion.ps1 > $null

. ./Settings.ps1
. ./Utils.ps1
. ./git/GitUtils.ps1
. ./git/GitPrompt.ps1
. ./git/GitTabExpansion.ps1
. ./git/TortoiseGit.ps1
. ./hg/HgUtils.ps1
. ./hg/HgPrompt.ps1
. ./hg/HgTabExpansion.ps1
Pop-Location

if (!$Env:HOME) { $Env:HOME = "$Env:HOMEDRIVE$Env:HOMEPATH" }
if (!$Env:HOME) { $Env:HOME = "$Env:USERPROFILE" }

Export-ModuleMember -Function @(
  'Write-GitStatus', 
  'Get-GitStatus', 
  'Enable-GitColors', 
  'Get-GitDirectory',
  'GitTabExpansion',
  'Get-AliasPattern',
  'Start-SshAgent',
  'Stop-SshAgent',
  'Add-SshKey',
  'tgit',
  'Write-HgStatus',
  'Get-HgStatus',
  'HgTabExpansion',
  'Get-MqPatches',
  'PopulateHgCommands',
  'IsHgOrGitDirectory')