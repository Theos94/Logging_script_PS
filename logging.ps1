# Made by Uros Dragicevic
function Write-Log {
  param (
    [Parameter(Mandatory=$true)][string]$Message,
    [ValidateSet("Info", "Warning", "Error")][string]$MessageType,
    [Parameter(Mandatory=$true)][string]$LogPath
  )

  $date = Get-Date -Format "dd/MM/yyyy-HH:mm:ss"

  $stack = @()
  $line = 0
  $trace = Get-PSCallStack

  foreach ($frame in $trace) {
    $frameName = $frame.Command
    $stack += $frameName
  }

  # $callStack = $stack[-1..-($stack.Length - 1 )]
  $callStack = $stack[1..($stack.Length -1)]
  $functionCall = ""

  foreach ($frame in $callStack) {
    if($frame -ne "Write-Log") {
      $functionCall += $frame + "|"
    }
  }

  $lineArray = $trace.ScriptLineNumber -split " "
  $lineArray = $lineArray | Select-Object -Skip 1 | Select-Object -SkipLast 1
  $line = $lineArray -join ":"

  $functionCall = $functionCall.SubString(0, $functionCall.Length -1)

  $output = "[$date];[$MessageType];[$functionCall];[$line];[$Message]"

  $output | Tee-Object -FilePath $LogPath -Append | Write-Verbose
}
