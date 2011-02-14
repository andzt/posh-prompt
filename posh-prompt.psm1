Push-Location $psScriptRoot
.\git\CheckVersion.ps1 > $null

. ./Settings.ps1
. ./git/GitUtils.ps1
. ./git/GitPrompt.ps1
. ./git/GitTabExpansion.ps1
. ./git/TortoiseGit.ps1
. ./git/Utils.ps1
. ./hg/HgUtils.ps1
. ./hg/HgPrompt.ps1
. ./hg/HgTabExpansion.ps1
Pop-Location

Export-ModuleMember -Function @(
  'Write-GitStatus', 
  'Get-GitStatus', 
  'Enable-GitColors', 
  'Get-GitDirectory',
  'GitTabExpansion',
  'tgit'
  'Write-HgStatus',
  'Get-HgStatus',
  'HgTabExpansion',
  'Get-MqPatches',
  'PopulateHgCommands'
 )