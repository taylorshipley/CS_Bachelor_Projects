#!/usr/bin/env pwsh
# Taylor Shipley
# Lab 9 - PowerShell Filemaker
# CS 3030 - Scripting Languages


# Prints Usage statement if the number of arguements passed doesn't equal 3
if ($args.length -ne 3) {
    write-host ("Usage: ./filemaker.ps1 <commandfile> <outputfile> <recordcount>")
    exit 1
}

$outputFilePath = $args[1]

try {
    New-Item -path ./$outputFilePath -ItemType File -ErrorAction Stop
}
catch [System.IO.IOException] {
        Write-Error "Error $outputFilePath already exists. Try again"
        exit 1
}

$storedValues = @{}

# Check if output file exists and has write permission
if (Test-Path $outputFilePath -PathType Leaf) {
    if ((Get-Item $outputFilePath).IsReadOnly) {
        Write-Error "Error: Cannot write to output file because file is read-only"
        exit 1
    }
}

# Parse record count to int and check if it is non-negative
try {
	$recordCnt = $args[2]
    $recordNum = [int]$recordCnt
    if ($recordNum -lt 0) 
    {
        throw "RecordCount non-numeric or negative"
    }
} catch {
    Write-Host "Error RecordCount is either negative or non-numeric"
    exit 1
}

# Reads the entire file named by $args[0] into array $inputCommands
try {
    $inputCommands = Get-Content -path $args[0] -erroraction stop
}
catch {
    Write-Error ("Error opening or reading command file: $($_)") 
    exit 1
}

# Creates file named by $outputFilePath
try {
    New-Item -path ./$outputFilePath -ItemType File
}
catch {
    Write-Error ("Error opening output file: $($_)") 
    exit 1
}

function writeToFile ($outputString) { 
    $outputString = $outputString -replace [regex]::escape("\t"), "`t" 
    $outputString = $outputString -replace [regex]::escape("\n"), "`n" 
    try {
        Add-Content -Path $outputFilePath -Value $outputString -nonewline 
    }
    catch {
        Write-Error "Write failed to file $($args[1]): $_"
        exit 1
    }
}

function RandWord($fileName) {
    $s = Get-Content $fileName
    $allText = [string]::join(' ', $s)
    $words = $allText.split(' ')
    return $words | Get-Random
}

try 
{
    foreach ($command in $inputCommands) 
    {
        # Search the $command variable for “HEADER” followed by whitespace followed by something in double-quote marks.
    	if ($command -match '^HEADER\s+"(.*)"$') 
    	{
	    	 writeToFile($matches.1)
    	}
    }

    for ($x = 0; $x -lt $recordNum; $x++) 
    {
        $bufferString = ""
        foreach ($command in $inputCommands) 
        {
        	# Skip empty lines
    		if ([string]::IsNullOrWhiteSpace($command)) {
        		continue
    		}
            elseif($command -match '^STRING\s+"(.*)"$' -or $command -match "^STRING\s+'(.*)'$" ) 
            {
                $stringValue = $matches.1 
                $bufferString += $stringValue
            }
            elseif($command -match '^WORD\s+(.*)\s+"(.*)"$') 
            {
          		$WORDLabel = $matches.1 
	    		$WORDFilename = $matches.2 
                $rand = RandWord $WORDFilename
                $storedValues[$WORDLabel] = $rand
                $bufferString += $rand
            }
            elseif($command -match '^INTEGER\s+(\w+)\s+(\d+)\s+(\d+)$') 
            { 
            	    $integerLabel = $matches.1 
	    			$integerMin = $($matches.2).toInt32($null) 
	    			$integerMax = $($matches.3).toInt32($null) 
                	$ranNum = Get-Random -Minimum $integerMin -Maximum $integerMax
                	$bufferString += $ranNum.ToString()
                    $storedValues[$integerLabel] = $ranNum.ToString()
            }
            
			# Match the REFER command and extract the label using a regular expression.
			elseif($command -match '^REFER\s+(\w+)$' ) 
			{ 
				$referLabel = $matches.1 
                $bufferString += $storedValues[$referLabel]
            }
            elseif($command[0] -eq "HEADER") 
            {
                continue
            }           
        }
        writeToFile ($bufferString)
    }
}
catch 
{
    write-host "An error occurred: $_"
    exit 1
}

