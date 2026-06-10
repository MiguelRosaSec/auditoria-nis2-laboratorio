# 11. Auditoría de GPOs existentes

Get-GPO -All |
Select-Object DisplayName,Owner,CreationTime,ModificationTime,GpoStatus |
Export-Csv "C:\auditoria-ad-inicial\04_gpo\ad_gpos_all_initial.csv" -NoTypeInformation -Encoding UTF8

# Genera reporte HTML de GPOs:

Get-GPOReport -All -ReportType Html -Path "C:\auditoria-ad-inicial\04_gpo\ad_gpo_report_all_initial.html"

# Genera reporte XML:

Get-GPOReport -All -ReportType Xml -Path "C:\auditoria-ad-inicial\04_gpo\ad_gpo_report_all_initial.xml"
