#--------------------install Maven----------------------------------

function installmaven($url,$destination,$unzip_destination) {
   
    # Installing Maven    
    Write-host "downloading started"
    Invoke-WebRequest -uri $url -OutFile $destination
    Write-Host "ready to extract"
    Write-Host "extracting files...."
    Expand-Archive -Path $destination -DestinationPath $unzip_destination 
    Write-Verbose "Apache Maven Installed Successfully"

    #Setting Environment variables
    [Environment]::SetEnvironmentVariable("MAVEN_HOME", $unzipped, "machine")
    [Environment]::SetEnvironmentVariable("Path", $env:Path + ";$unzipped\bin", "Machine")
}

$path= "C:\Users\user\OneDrive\Documents\JAVA\tomcat.properties"
$output= Get-content $path| ConvertFrom-StringData

#variables
$url=$output.url
$destination=$output.destination
$unzip_destination=$output.unzip_destination

installmaven $url $destination $unzip_destination
 
$VerbosePreference= "continue"