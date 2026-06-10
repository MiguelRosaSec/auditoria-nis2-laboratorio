CambiarNombre -> Rename-Computer -NewName "DC01" -Restart
Configurar red:
"Identificar adaptador" -> Get-NetAdapter 
"Configurar IP" -> New-NetIPAddress -InterfaceAlias "Ethernet0" -IPAddress 10.10.10.10 -PrefixLength 24 -DefaultGateway 10.10.10.1
"Configurar DNS" -> Set-DnsClientServerAddress -InterfaceAlias "Ethernet0" -ServerAddresses 10.10.10.10
"Instalar rol Active Directory Domain Services" -> Install-WindowsFeature AD-Domain-Services -IncludeManagementTools
"Verificar Instalacion" -> Get-WindowsFeature AD-Domain-Services

