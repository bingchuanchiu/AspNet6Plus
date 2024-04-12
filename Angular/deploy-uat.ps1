$currentWebAppDirectory = "//lfkqbwtweb02/c$/inetpub/wwwroot/JOCPaymentTracking-uat/"
$backupWebAppDirectory = "//lfkqbwtweb02/c$/inetpub/wwwroot/backup/JOCPaymentTracking-uat-backup/"
$temporaryDeployFolder = "//lfkqbwtweb02/c$/inetpub/wwwroot/deploy-JOCPaymentTracking-uat/"
## The $sourceTemporaryDeployFolder is the same as $temporaryDeployFolder except it has a '*' on the end.
$sourceTemporaryDeployFolder = "//lfkqbwtweb02/c$/inetpub/wwwroot/deploy-JOCPaymentTracking-uat/*"
$baseHref = "JOCPaymentTracking-uat"
$webConfig = "Web.uat.config"

## Build the project.
ng build --base-href=/$baseHref/ --env=uat
## Edit this --------------------------^

## Edit the contents above this line for your own environment.

## Copy contents of dist folder to the temporary deploy folder.
if (Test-Path $temporaryDeployFolder) {
    Remove-Item $temporaryDeployFolder
}

## Copy web.config over.
Copy-Item .\src\$webConfig -Destination .\dist\web.config

Copy-Item .\dist\assets -Destination $temporaryDeployFolder\assets

## Copy contents of dist folder to the temporary deploy folder.
Copy-Item -Path .\dist\* -Destination $temporaryDeployFolder -Recurse -Force

## Copy the current site to a backup folder then copy the contents of the new app from
## the temporary deploy folder to the current web app folder.
if (-not (Test-Path $currentWebAppDirectory)) {
    mkdir $currentWebAppDirectory
}

## If a backup folder already exists, delete it.
if (Test-Path $backupWebAppDirectory) {
    Remove-Item $backupWebAppDirectory -Recurse
}

## Make a backup of the current web application.
copy-item $currentWebAppDirectory $backupWebAppDirectory -Recurse

## Copy the contents of the new web app to the current web app folder.
## We first copied the new web app to the server and then copy it again from the 
## temp folder on the same server to the current directory because it should be 
## faster to copy the contents from a folder on the same server. If there
## are users on the site at the time this offers minimal interruption of their service.
Copy-Item -Force -Recurse -Verbose $sourceTemporaryDeployFolder -Destination $currentWebAppDirectory

## Remove deploy folder.
Remove-Item $temporaryDeployFolder -Recurse