#@announce-stderr

Feature: Output file contains correct information

	Scenario: Script outputs the correct number of records
		Given a file named "smallcmd" with:
			"""
			# A single string
			STRING "testing 1 2 3\n"
			"""
		When I run `filemaker.ps1 smallcmd smalloutput 3`
        And OUTPUT is printed
		Then the file "smalloutput" should contain:
			"""
			testing 1 2 3
			testing 1 2 3
			testing 1 2 3
			"""
		Then 30 points are awarded

	Scenario: Script supports the HEADER command
		Given a file named "headercmd" with:
			"""
			HEADER "This is a header	with an imbedded tab character\n"
			STRING "just a string\n"
			"""
		When I run `filemaker.ps1 headercmd headeroutput 2`
        And OUTPUT is printed
		Then the file "headeroutput" should contain:
			"""
			This is a header	with an imbedded tab character
			just a string
			just a string
			"""
		Then 30 points are awarded

	Scenario: Script supports the STRING command
		Given a file named "anotherstringcmd" with:
			"""
			# A single string
			STRING "yet another string\n"
			"""
		When I run `filemaker.ps1 anotherstringcmd anotherstringoutput 3`
        And OUTPUT is printed
		Then the file "anotherstringoutput" should contain:
			"""
			yet another string
			"""
		Then 40 points are awarded

	Scenario: Script supports the WORD command
		Given a file named "filewordcmd" with:
			"""
			# A file word command
			WORD filelabel "words"
			"""
		Given a file named "words" with:
			"""
			one
			two
			three
			four
			five

			"""
		When I run `filemaker.ps1 filewordcmd filewordoutput 1`
        And OUTPUT is printed
		Then the file "filewordoutput" should match /one|two|three|four|five/
		Then 20 points are awarded

	Scenario: Script supports the WORD command with true randomness
		Given a file named "randomfilewordcmd" with:
			"""
			WORD filelabel "randomwords"
			STRING "\n"
			"""
		Given a file named "randomwords" with:
			"""
			your
			lack
			of
			faith
			is
			disturbing

			"""
		When I run `filemaker.ps1 randomfilewordcmd randomfilewordoutput 5`
        And OUTPUT is printed
		Then the file "randomfilewordoutput" should not match /(\w+)\n\1\n\1\n\1\n\1\n/
		Then 20 points are awarded

	Scenario: Script supports the INTEGER command
		Given a file named "numbercmd" with:
			"""
			INTEGER numlabel 1 1999
			STRING "\n"
			"""
		When I run `filemaker.ps1 numbercmd numberoutput 3`
        And OUTPUT is printed
		Then the file "numberoutput" should match /^\d+\n\d+\n\d+/
		Then 20 points are awarded

	Scenario: Script supports the INTEGER command with true randomness
		Given a file named "randomnumbercmd" with:
			"""
			INTEGER numlabel 1 1999
			STRING "\n"
			"""
		When I run `filemaker.ps1 randomnumbercmd randomnumberoutput 5`
        And OUTPUT is printed
		Then the file "randomnumberoutput" should not match /(\d+)\n\1\n\1\n\1\n\1\n/
		Then 20 points are awarded

	Scenario: Script supports the REFER command to a label on a WORD command
		Given a file named "morewords" with:
			"""
			this
			is
			a
			test

			"""
		Given a file named "referfilewordcmd" with:
			"""
			WORD flabel "morewords"
			STRING " and "
			REFER flabel
			STRING " and "
			REFER flabel
			"""
		When I run `filemaker.ps1 referfilewordcmd referfilewordoutput 1`
        And OUTPUT is printed
		Then the file "referfilewordoutput" should match /^(\w+) and \1 and \1$/
		Then 30 points are awarded

	Scenario: Script supports the REFER command to a label on a INTEGER command
		Given a file named "refernumbercmd" with:
			"""
			INTEGER numlabel 1 99999
			STRING " I said "
			REFER numlabel
			STRING " I said "
			REFER numlabel
			"""
		When I run `filemaker.ps1 refernumbercmd refernumberoutput 1`
        And OUTPUT is printed
		Then the file "refernumberoutput" should match /^(\d+) I said \1 I said \1$/
		Then 30 points are awarded

