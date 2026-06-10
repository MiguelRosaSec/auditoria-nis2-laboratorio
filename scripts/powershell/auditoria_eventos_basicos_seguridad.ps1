# exportar eventos recientes
Get-WinEvent -FilterHashtable @{LogName='Security'; StartTime=(Get-Date).AddDays(-1)} -MaxEvents 200 |
Select-Object TimeCreated,Id,ProviderName,LevelDisplayName,Message |
Out-File "C:\auditoria-ad-inicial\06_eventos\security_events_last_24h_initial.txt"

# eventos de inicio de sesion fallidos

Get-WinEvent -FilterHashtable @{LogName='Security'; Id=4625; StartTime=(Get-Date).AddDays(-7)} -ErrorAction SilentlyContinue |
Select-Object TimeCreated,Id,ProviderName,Message |
Out-File "C:\auditoria-ad-inicial\06_eventos\failed_logons_4625_initial.txt"

# eventos de creacion/modificacion de cuentas
Get-WinEvent -FilterHashtable @{LogName='Security'; Id=4720,4722,4723,4724,4725,4726,4738; StartTime=(Get-Date).AddDays(-7)} -ErrorAction SilentlyContinue |
Select-Object TimeCreated,Id,ProviderName,Message |
Out-File "C:\auditoria-ad-inicial\06_eventos\account_management_events_initial.txt"


