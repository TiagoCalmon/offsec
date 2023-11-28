# Store the domain object in the $domainObj variable
$domainObj = [System.DirectoryServices.ActiveDirectory.Domain]::GetCurrentDomain()

# Print the variable
#$domainObj

# Store the PdcRoleOwner name to the $PDC variable
$PDC = $domainObj.PdcRoleOwner.Name
# Print the $PDC variable
#$PDC

$DN = ([adsi]'').distinguishedName

# Print the $DN variable
#$DN

$LDAP = "LDAP://$PDC/$DN"
#$LDAP
$direntry = New-Object System.DirectoryServices.DirectoryEntry($LDAP)

$dirsearcher = New-Object System.DirectoryServices.DirectorySearcher($direntry)
#$dirsearcher.filter="samAccountType=805306368"
$dirsearcher.filter="name=jeffadmin"
$result =  $dirsearcher.FindAll()

Foreach($obj in $result)
{
    Foreach($prop in $obj.Properties)
    {
        #$prop
	$prop.memberof
    }

    Write-Host "-------------------------------"
}
