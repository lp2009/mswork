param
(  
    [string]$Driver,
    [string]$Folder,
    [string]$Filename
)

$filepath = $driver+ ":\"+ $folder + "\" + $filename
if (!(Test-Path $filepath)) 
{
    try
    {
        new-item -ItemType file $filepath -Force | Out-Null
    }
    catch
    {
        $ErrorMessage = $_.Exception.Message
        Write-host "Error: $ErrorMessage. Exiting the script."
        Break
    }
    Write-Host "The file $filepath was not there, successfully create it"
}
else
{
    Write-Host "The file $filepath exists"
}

