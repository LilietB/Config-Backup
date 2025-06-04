$currentPath = (Get-Location).path
Write-Output $currentPath

$realOutputFolder = "ConfigBackup"
$outputFolder = ".ConfigBackup"
$targetFileName = "config.json"
[string]$exclude = '.*' + $realOutputFolder + '.*'

if(-not(Test-Path -Path $outputFolder)) {
	New-Item -Path $outputFolder -ItemType Directory
}

Write-Output $exclude
$fullPaths = Get-Childitem -Include $targetFileName -File -Recurse -ErrorAction SilentlyContinue | Select-Object -ExpandProperty FullName
$truncatedPaths = New-Object System.Collections.ArrayList
foreach ($path in $fullPaths)
{if (!($path -match $exclude)) { 
	#Write-Output $path
	$truncatedPath = $path.Substring($currentPath.Length+1, $path.Length-$currentPath.Length-1)
	#Write-Output $truncatedPath
	[void]$truncatedPaths.Add($truncatedPath)
	$destination = $outputFolder + '/' + $truncatedPath
	$destinationAddress = $destination.Substring(0, ($destination.Length - $targetFileName.length))
	New-Item -ItemType Directory -Force -Path $destinationAddress
	Copy-Item -Destination $destination	-LiteralPath $truncatedPath -Container
}}

Out-File -InputObject $truncatedPaths -FilePath .\ConfigList.txt

if(Test-Path -Path $realOutputFolder) {
	Remove-Item -Path $realOutputFolder -Recurse -Force
}
Rename-Item -Path $outputFolder -NewName $realOutputFolder