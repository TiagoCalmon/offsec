function LDAPSearch {
    param (
        [string]$LDAPQuery
    )

    $PDC = [System.DirectoryServices.ActiveDirectory.Domain]::GetCurrentDomain().PdcRoleOwner.Name
    $DistinguishedName = ([adsi]'').distinguishedName

    $DirectoryEntry = New-Object System.DirectoryServices.DirectoryEntry("LDAP://$PDC/$DistinguishedName")

    $DirectorySearcher = New-Object System.DirectoryServices.DirectorySearcher($DirectoryEntry, $LDAPQuery)

    return $DirectorySearcher.FindAll()

}

# Import-Module .\function.ps1
# ex. LDAPSearch -LDAPQuery "(samAccountType=805306368)"
#     LDAPSearch -LDAPQuery "(objectclass=group)"

#     foreach ($group in $(LDAPSearch -LDAPQuery "(objectCategory=group)")) { $group.properties | select {$_.cn}, {$_.member}  }

#     $sales = LDAPSearch -LDAPQuery "(&(objectCategory=group)(cn=Sales Department))"
#     $sales.properties.member

#     $group = LDAPSearch -LDAPQuery "(&(objectCategory=group)(cn=Development Department*))"
#     $group.properties.member

#     $group = LDAPSearch -LDAPQuery "(&(objectCategory=group)(cn=Management Department*))"
#     $group.properties.member
