New-ADGroup -Name "GG_AD_Admins_Tier0" `
    -GroupScope Global `
    -GroupCategory Security `
    -Path "OU=Grupos,OU=AlmeriaLogiTech,DC=almerialogitech,DC=local" `
    -Description "Administradores Tier 0 de Active Directory" `
    -ErrorAction SilentlyContinue

New-ADGroup -Name "GG_Server_Admins_Tier1" `
    -GroupScope Global `
    -GroupCategory Security `
    -Path "OU=Grupos,OU=AlmeriaLogiTech,DC=almerialogitech,DC=local" `
    -Description "Administradores de servidores Tier 1" `
    -ErrorAction SilentlyContinue

New-ADGroup -Name "GG_Workstation_Admins_Tier2" `
    -GroupScope Global `
    -GroupCategory Security `
    -Path "OU=Grupos,OU=AlmeriaLogiTech,DC=almerialogitech,DC=local" `
    -Description "Administradores de estaciones Tier 2" `
    -ErrorAction SilentlyContinue
    