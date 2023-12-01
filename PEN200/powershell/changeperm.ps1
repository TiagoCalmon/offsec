$Object = 'C:\Users\daveadmin'
$ACL = get-acl $Object
# pay attention to first property, the username
$Permission = "dave2", "FullControl", "ContainerInherit,ObjectInherit", "None" , "Allow"
$AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule $Permission
$acl.SetAccessRule($AccessRule)
$ACL | Set-Acl $Object
