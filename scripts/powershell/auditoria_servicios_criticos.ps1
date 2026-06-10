# Auditoría de servicios críticos de AD
Get-Service NTDS,DNS,KDC,Netlogon,W32Time |
Select-Object Name,DisplayName,Status,StartType |
Out-File "C:\auditoria-ad-inicial\05_servicios\ad_critical_services_initial.txt"


# puertos escuchando
netstat -ano |
Out-File "C:\auditoria-ad-inicial\05_servicios\dc01_netstat_initial.txt"

# versión sistema

systeminfo |
Out-File "C:\auditoria-ad-inicial\05_servicios\dc01_systeminfo_initial.txt"
