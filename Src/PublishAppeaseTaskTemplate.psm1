# halt immediately on any errors which occur in this module
$ErrorActionPreference = 'Stop'

New-Alias -Name Invoke -Value Appease.Client\Publish-AppeaseTaskTemplate

Export-ModuleMember -Alias Invoke

