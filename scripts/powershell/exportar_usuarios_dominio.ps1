# exportar usuarios 

Get-ADUser -Filter * -Properties * |
Select-Object `
Name,
SamAccountName,
UserPrincipalName,
Enabled,
DistinguishedName,
PasswordLastSet,
PasswordNeverExpires,
CannotChangePassword,
LastLogonDate,
Created,
Modified |
Export-Csv "C:\auditoria-ad-inicial\02_usuarios\ad_users_all_initial.csv" -NoTypeInformation -Encoding UTF8

# usuarios habilitados
Get-ADUser -Filter 'Enabled -eq $true' -Properties PasswordLastSet,PasswordNeverExpires,LastLogonDate |
Select-Object Name,SamAccountName,PasswordLastSet,PasswordNeverExpires,LastLogonDate |
Export-Csv "C:\auditoria-ad-inicial\02_usuarios\ad_users_enabled_initial.csv" -NoTypeInformation -Encoding UTF8

# usuarios con contraseñas que nunca expiran
Get-ADUser -Filter * -Properties PasswordNeverExpires |
Where-Object {$_.PasswordNeverExpires -eq $true} |
Select-Object Name,SamAccountName,Enabled,PasswordNeverExpires |
Export-Csv "C:\auditoria-ad-inicial\02_usuarios\ad_users_password_never_expires_initial.csv" -NoTypeInformation -Encoding UTF8

# Usuarios sin contraseña establecida o con estado anómalo
Get-ADUser -Filter * -Properties PasswordLastSet |
Where-Object {$_.PasswordLastSet -eq $null} |
Select-Object Name,SamAccountName,Enabled,PasswordLastSet |
Export-Csv "C:\auditoria-ad-inicial\02_usuarios\ad_users_password_never_set_initial.csv" -NoTypeInformation -Encoding UTF8


