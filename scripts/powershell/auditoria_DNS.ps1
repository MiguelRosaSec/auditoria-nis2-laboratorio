#dns zones
Get-DnsServerZone |
Out-File "C:\auditoria-ad-inicial\05_servicios\dns_zones_initial.txt"

# registros principales
Get-DnsServerResourceRecord -ZoneName "almerialogitech.local" |
Out-File "C:\auditoria-ad-inicial\05_servicios\dns_records_almerialogitech_initial.txt"

# reenviadores
Get-DnsServerForwarder |
Out-File "C:\auditoria-ad-inicial\05_servicios\dns_forwarders_initial.txt"

# resolucion externa

Resolve-DnsName archive.ubuntu.com |
Out-File "C:\auditoria-ad-inicial\05_servicios\dns_external_resolution_initial.txt"


