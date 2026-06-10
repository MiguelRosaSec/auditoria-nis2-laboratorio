# Exportar todos los grupos

Get-ADGroup -Filter * -Properties Description,GroupScope,GroupCategory |
Select-Object Name,SamAccountName,GroupScope,GroupCategory,Description,DistinguishedName |
Export-Csv "C:\auditoria-ad-inicial\03_grupos\ad_groups_all_initial.csv" -NoTypeInformation -Encoding UTF8

# Grupos creados en el laboratorio

Get-ADGroup -Filter 'Name -like "GG_*"' -Properties Description,GroupScope,GroupCategory |
Select-Object Name,SamAccountName,GroupScope,GroupCategory,Description |
Export-Csv "C:\auditoria-ad-inicial\03_grupos\ad_groups_lab_initial.csv" -NoTypeInformation -Encoding UTF8

# Miembros de grupos de laboratorio

$groups = Get-ADGroup -Filter 'Name -like "GG_*"'

foreach ($g in $groups) {
    "===== $($g.Name) =====" | Out-File "C:\auditoria-ad-inicial\03_grupos\ad_groups_lab_members_initial.txt" -Append

    Get-ADGroupMember $g.Name -ErrorAction SilentlyContinue |
    Select-Object Name,SamAccountName,objectClass |
    Out-File "C:\auditoria-ad-inicial\03_grupos\ad_groups_lab_members_initial.txt" -Append
}

