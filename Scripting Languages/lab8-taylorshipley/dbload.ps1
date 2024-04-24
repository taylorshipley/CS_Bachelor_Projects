#!/usr/bin/env pwsh
# Taylor Shipley
# Lab 8 - PowerShell Database Loader
# CS 3030 - Scripting Languages

# Prints Usage statement if the number of arguements passed doesn't equal 2
if ($args.length -ne 2){
    echo "Usage: ./dbload.ps1 INPUTCSV OUTPUTDB"
    exit 1
}

# Processes the CSV file and saves each line into array $csv
try {
    $csv = import-csv $args[0] -delimiter "," 
}
# Prints error if there is a problem processing CSV file
catch {
    echo "Error opening CSV file: $_"
    exit 1
}

# Adds SQLite3 functionality to Powershell script
try {
	Add-Type -Path "./dlls/System.Data.SQLite.dll"   
	$con = New-Object -TypeName System.Data.SQLite.SQLiteConnection
	$con.ConnectionString = "Data Source=$($args[1])" 
	$con.Open()
}
catch {
	echo "Error opening database file: $_" 
	exit 1
}

# Establishes connection to database
$transaction = $con.BeginTransaction("create")

# Drops table people if already exists
$sql = $con.CreateCommand()
$sql.CommandText = 'DROP table if exists people'
[void]$sql.ExecuteNonQuery()

# Drops table courses if already exists
$sql = $con.CreateCommand()
$sql.CommandText = 'DROP table if exists courses'
[void]$sql.ExecuteNonQuery()

# Creates table courses
$sql.CommandText = 'CREATE table courses 
    (id text, subjcode text, coursenumber text, termcode text);'
    [void]$sql.ExecuteNonQuery()

# Creates table people
$sql = $con.CreateCommand()
$sql.CommandText = 'CREATE table people (id text primary key unique,
  lastname text, firstname text, major text,
  email text, city text, state text, zip text);'

# Executes SQL Command and saves changes
[void]$sql.ExecuteNonQuery()
[void]$transaction.Commit()

foreach ($row in $csv) 
{
   
    # Adds records to the table People
    $transaction = $con.BeginTransaction("addpersontransaction") 
    $sql.CommandText = "INSERT or REPLACE into people
    (id,firstname,lastname,email,major,city,state,zip)
    values(@id,@firstname,@lastname,@email,@major,@city,@state,@zip);" 
    [void]$sql.Parameters.AddWithValue("@id", $row.wnumber)   
    [void]$sql.Parameters.AddWithValue("@firstname", $row.firstname)
    [void]$sql.Parameters.AddWithValue("@lastname", $row.lastname)
    [void]$sql.Parameters.AddWithValue("@email", $row.email)
    [void]$sql.Parameters.AddWithValue("@major", $row.major)
    [void]$sql.Parameters.AddWithValue("@city", $row.city)
    [void]$sql.Parameters.AddWithValue("@state", $row.state)
    [void]$sql.Parameters.AddWithValue("@zip", $row.zip)
    
    # Executes SQL Command and saves changes
    [void]$sql.ExecuteNonQuery() 
    [void]$transaction.Commit() 

    # Separates the subject code from the course number
    $s = $row.course.split(" ")

    # Adds records to the table Courses
    $transaction = $con.BeginTransaction("addpersontransaction") 
    $sql.CommandText = "INSERT into courses
    (id,subjcode,coursenumber,termcode)
    values(@id,@subjcode,@coursenumber,@termcode);" 
    [void]$sql.Parameters.AddWithValue("@id", $row.wnumber)   
    [void]$sql.Parameters.AddWithValue("@subjcode", $s[0])
    [void]$sql.Parameters.AddWithValue("@coursenumber", $s[1])
    [void]$sql.Parameters.AddWithValue("@termcode", $row.termcode)

    # Executes SQL Command and saves changes
    [void]$sql.ExecuteNonQuery() 
    [void]$transaction.Commit() 
}
