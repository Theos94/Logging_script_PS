## Logging Script

This is a simple script that you can dot source into any other script and use Write-Log to record some stuff and write to a log file.

-------

### Config

The default log file path is defined at the top of the script and can be changed.


    $defaultLogPath = "./log.log"


The Default however will only be used if the -LogPath isnt passed as an argument to Write-Log, meaning that you can have a separate file for error writes and you can setup monitoring on it etc.

---------
### Usage

After dot sourcing the script at the top, for example like this:

    . ./logging.ps1

You would just then need to write Write-Log statements where you would like instead the Write-Output etc.

    Write-Log -MessageType Info -Message "Hello There" -LogPath "./log.log"

We can see that in total there are 3 arguments that the script can take with 2 of them being mandatory.

    -MessageType : Can only be Info | Warning | Error
    -Message:      Can be a string
    -LogPath:      Not Mandatory and is a path to a log file.

With that you can write your own Write-Logs now anywhere in the script.

In the test.ps1 i have demonstrated how i use it , with ErrorActionPreference being to Stop and then using Write-Log followed by Break in my Catch blocks so that it stops the script.


### Seeing how it looks and works
For that you can just run the test.ps1 and it will write to the log.log file.  🥳
