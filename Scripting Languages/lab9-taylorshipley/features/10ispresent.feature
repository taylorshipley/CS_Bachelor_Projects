#@announce-output

Feature: Script must be named "filemaker.ps1", present and be marked as executable
	Scenario: filemaker must be found
		When I run `getfile` 
		Then a file named "../../bin/filemaker.ps1" should exist
		Then 5 points are awarded

	Scenario: filemaker must be executable
		When I run `filemaker.ps1`
        And OUTPUT is printed
		Then 5 points are awarded
