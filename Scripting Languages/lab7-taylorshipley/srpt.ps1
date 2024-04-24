#!/usr/bin/env pwsh
# Taylor Shipley
# Lab 7 - PowerShell Search and Report
# CS 3030 - Scripting Languages

# Usage statement
if ($args.length -ne 1){
	echo "Usage: srpt.ps1 FOLDER"
	exit 1
}

# Searches directory recursily for all files then assigns them to an array
$filesArray = Get-ChildItem -Recurse -Path $args[0]

# Initialize counts and total size
$dirCount = 0
$linkCount = 0
$fileCount = 0
$graphicsCount = 0
$oldFilesCount = 0
$executablesCount = 0
$largeFilesCount = 0
$tempFilesCount = 0
$totalSize = 0

# Loop to iterate through array
foreach ($Item in $filesArray) {
    if ($Item.PSIsContainer) {
        # Count directories
        $dirCount++
    } elseif ($Item.Attributes -band [System.IO.FileAttributes]::ReparsePoint) {
        # Count links
        $linkCount++
    } else {
        # Count files
        $fileCount++
        # Get file size
        $size = $Item.Length
        $totalSize += $size

        # Count graphic files
        if ($Item.Extension -match '\.(jpg|bmp|gif)$') {
            $graphicsCount++
        }

        # Count files modified over a year ago
        if ($Item.LastWriteTime -lt (Get-Date).AddYears(-1)) {
            $oldFilesCount++
        }

        # Count executable files
        if ($Item.Extension -eq ".exe" -or $Item.Extension -eq ".ps1"-or $Item.Extension -eq ".bat") {
            $executablesCount++
        }

        # Count large files
        if ($size -gt 500000) {
            $largeFilesCount++
        }

        # Count temporary files
        if ($Item.Extension -eq ".o") {
            $tempFilesCount++
        }
    }
}

# Format numbers with commas
$dirCountFormatted = "{0:n0}" -f $dirCount
$linkCountFormatted = "{0:n0}" -f $linkCount
$fileCountFormatted = "{0:n0}" -f $fileCount
$graphicsCountFormatted = "{0:n0}" -f $graphicsCount
$oldFilesCountFormatted = "{0:n0}" -f $oldFilesCount
$executablesCountFormatted = "{0:n0}" -f $executablesCount
$largeFilesCountFormatted = "{0:n0}" -f $largeFilesCount
$tempFilesCountFormatted = "{0:n0}" -f $tempFilesCount
$totalSizeFormatted = "{0:n0}" -f $totalSize

# Formats the header of the report
$hostname=$(cat /etc/hostname)
$searchReport = $searchReport = "SearchReport $($hostname) $($args[0]) $(Get-Date -Format 'MM/dd/yyyy HH:mm:ss')"

# Print report
Write-Host $searchReport
Write-Host "Directories $dirCountFormatted"
Write-Host "Files $fileCountFormatted"
Write-Host "Sym links $linkCountFormatted"
Write-Host "Old files $oldFilesCountFormatted"
Write-Host "Large files $largeFilesCountFormatted"
Write-Host "Graphics files $graphicsCountFormatted"
Write-Host "Temporary files $tempFilesCountFormatted"
Write-Host "Executable files $executablesCountFormatted"
Write-Host "TotalFileSize $totalSizeFormatted"

