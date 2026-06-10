Install-ADDSForest `
  -DomainName "almerialogitech.local" `
  -DomainNetbiosName "ALMERIALOGITECH" `
  -InstallDNS `
  -SafeModeAdministratorPassword (Read-Host -AsSecureString "Introduce la contraseña DSRM") `
  -Force

Crear estructura Inicial de OUs

Import-Module ActiveDirectory
