function uninstallMaven($path){

Write-Verbose "Uninstalling maven"
Get-ChildItem $path | Remove-Item -Force -Recurse -confirm:$false 

    [Environment]::SetEnvironmentVariable("MAVEN_HOME", "$null ", "machine")
    [Environment]::SetEnvironmentVariable("Path", $env:Path + " " , "Machine")

Write-Verbose "Successfully uninstalled"

}

uninstallMaven "C:\Program Files\maven"