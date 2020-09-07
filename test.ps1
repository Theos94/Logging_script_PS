# An example script to show how logging script would be used.

. ./logging.ps1


$ErrorActionPreference = "Stop"

$logPath = "./log.log"

Write-Log -MessageType Info -Message "Starting the Script" -LogPath $logPath
Write-Log -MessageType Warning -Message "This is a warning" -LogPath $logPath
Write-Log -MessageType Error -Message "Error happened " -LogPath $logPath


# try {
#    Get-Content "./DoesntExist"
# }
# catch {
#   Write-Log -MessageType Error -Message "Tried to get the contents of file" -LogPath $logPath
#   break
# }

function Get-User {
  param (
    [Parameter(Mandatory=$true)]$Username,
    [Parameter]$Testing
  )

  Write-Log -MessageType Info -Message "Attempting to retreive AD user $Username" -LogPath $logPath

  if ($PSBoundParameters.ContainsKey('Testing')) {
    Write-Log -MessageType Info -Message "Testing has been passed as a parameter" -LogPath $logPath
  } else {
    Write-Log -MessageType Warning -Message "Testing has not been passed as a parameter" -LogPath $logPath
  }

  try {
    Get-ADUser -Identity $Username
  }
  catch {
    Write-Log -MessageType Error -Message "Error while trying to get AD user $Username" -LogPath $logPath
    break
  }

}

Get-User -Username "Test"

