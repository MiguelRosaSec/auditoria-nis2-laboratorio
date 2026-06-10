$Password = ConvertTo-SecureString "Password123!" -AsPlainText -Force

New-ADUser -Name "Laura Direccion" `
  -GivenName "Laura" `
  -Surname "Direccion" `
  -SamAccountName "laura.direccion" `
  -UserPrincipalName "laura.direccion@almerialogitech.local" `
  -Path "OU=Direccion,OU=Usuarios,OU=AlmeriaLogiTech,DC=almerialogitech,DC=local" `
  -AccountPassword $Password `
  -Enabled $true `
  -ChangePasswordAtLogon $false

New-ADUser -Name "Carlos IT" `
  -GivenName "Carlos" `
  -Surname "IT" `
  -SamAccountName "carlos.it" `
  -UserPrincipalName "carlos.it@almerialogitech.local" `
  -Path "OU=IT,OU=Usuarios,OU=AlmeriaLogiTech,DC=almerialogitech,DC=local" `
  -AccountPassword $Password `
  -Enabled $true `
  -ChangePasswordAtLogon $false

New-ADUser -Name "Ana Operaciones" `
  -GivenName "Ana" `
  -Surname "Operaciones" `
  -SamAccountName "ana.operaciones" `
  -UserPrincipalName "ana.operaciones@almerialogitech.local" `
  -Path "OU=Operaciones,OU=Usuarios,OU=AlmeriaLogiTech,DC=almerialogitech,DC=local" `
  -AccountPassword $Password `
  -Enabled $true `
  -ChangePasswordAtLogon $false

New-ADUser -Name "Miguel Finanzas" `
  -GivenName "Miguel" `
  -Surname "Finanzas" `
  -SamAccountName "miguel.finanzas" `
  -UserPrincipalName "miguel.finanzas@almerialogitech.local" `
  -Path "OU=Finanzas,OU=Usuarios,OU=AlmeriaLogiTech,DC=almerialogitech,DC=local" `
  -AccountPassword $Password `
  -Enabled $true `
  -ChangePasswordAtLogon $false

New-ADUser -Name "Marta RRHH" `
  -GivenName "Marta" `
  -Surname "RRHH" `
  -SamAccountName "marta.rrhh" `
  -UserPrincipalName "marta.rrhh@almerialogitech.local" `
  -Path "OU=RRHH,OU=Usuarios,OU=AlmeriaLogiTech,DC=almerialogitech,DC=local" `
  -AccountPassword $Password `
  -Enabled $true `
  -ChangePasswordAtLogon $false

New-ADUser -Name "Pedro Clientes" `
  -GivenName "Pedro" `
  -Surname "Clientes" `
  -SamAccountName "pedro.clientes" `
  -UserPrincipalName "pedro.clientes@almerialogitech.local" `
  -Path "OU=AtencionClientes,OU=Usuarios,OU=AlmeriaLogiTech,DC=almerialogitech,DC=local" `
  -AccountPassword $Password `
  -Enabled $true `
  -ChangePasswordAtLogon $false

# Asignar usuarios a grupos

Add-ADGroupMember -Identity "GG_Direccion" -Members "laura.direccion"
Add-ADGroupMember -Identity "GG_IT_Admins" -Members "carlos.it"
Add-ADGroupMember -Identity "GG_Operaciones" -Members "ana.operaciones"
Add-ADGroupMember -Identity "GG_Finanzas" -Members "miguel.finanzas"
Add-ADGroupMember -Identity "GG_RRHH" -Members "marta.rrhh"
Add-ADGroupMember -Identity "GG_AtencionClientes" -Members "pedro.clientes"

# Comprobar usuarios de cada grupo

Get-ADGroupMember "GG_IT_Admins"

