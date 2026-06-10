Get-ADDomain | Select-Object DNSRoot,DomainMode,NetBIOSName,PDCEmulator,RIDMaster,InfrastructureMaster |
Out-File "C:\auditoria-ad-inicial\01_dominio\ad_domain_summary.txt"

Get-ADForest | Select-Object Name,ForestMode,SchemaMaster,DomainNamingMaster |
Out-File "C:\auditoria-ad-inicial\01_dominio\ad_forest_summary.txt"