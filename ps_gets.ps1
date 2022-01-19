<# 
    A simple set of get commands to query Active Directory and provide output
    
#>

#Run if not already installed
Import-Module ActiveDirectory

#Get members of AD group piped to csv
Get-ADGroupMember -Identity "ADGROUPNAME" | Export-Csv "Path_to_file.csv"

#Get all user attributes printed to terminal
Get-ADUser -Identity username -Properties *

#Get all users and properties of specified OU piped to csv
Get-ADUser -SearchBase "DN OF OU" -Filter * -Properties * | Export-Csv "Path_to_file.csv"

#Get all computer objects and properties from specified OU of targeted server/domain piped to csv
Get-ADComputer -Filter * -Properties * -Server FQDNOFDC -SearchBase "DN OF OU" | Export-Csv "Path_to_file.csv"

#Get where object attribute equals some value, e.g. employeeID equals null piped to csv
Get-ADUser -Filter * -SearchBase "DN OF OU" -Properties employeeID | where employeeID -eq $null | Export-Csv "Path_to_file.csv"

#Get all sub OUs of targeted OU selecting Name and DN attributes piped to csv
Get-ADOrganizationalUnit -Filter * -SearchBase "DN OF OU" | select Name,DistinguishedName | Export-csv -path "Path_to_file.csv" -NoTypeInformation

#Get all files in a directory piped to CSV
Get-ChildItem -Recurse -Directory "Path_to_GCI" | Export-Csv "Path_to_file.csv"




