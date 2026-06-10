# Configura las políticas de seguridad para domínio "almerialogitech.local"

Import-Module ActiveDirectory

Set-ADDefaultDomainPasswordPolicy `
    -Identity "almerialogitech.local" `
    -MinPasswordLength 12 `
    -PasswordHistoryCount 10 `
    -MaxPasswordAge (New-TimeSpan -Days 90) `
    -MinPasswordAge (New-TimeSpan -Days 1) `
    -LockoutThreshold 5 `
    -LockoutDuration (New-TimeSpan -Minutes 15) `
    -LockoutObservationWindow (New-TimeSpan -Minutes 15) `
    -ComplexityEnabled $true `
    -ReversibleEncryptionEnabled $false

# cambiar contraseñas
$usuarios = @(
    @{Sam="laura.direccion"; Password="Tmp-LaD!2026-01"},
    @{Sam="carlos.it"; Password="Tmp-CaI!2026-02"},
    @{Sam="ana.operaciones"; Password="Tmp-AnO!2026-03"},
    @{Sam="miguel.finanzas"; Password="Tmp-MiF!2026-04"},
    @{Sam="marta.rrhh"; Password="Tmp-MaR!2026-05"},
    @{Sam="pedro.clientes"; Password="Tmp-PeC!2026-06"}
)

foreach ($u in $usuarios) {
    $securePassword = ConvertTo-SecureString $u.Password -AsPlainText -Force

    Set-ADAccountPassword `
        -Identity $u.Sam `
        -NewPassword $securePassword `
        -Reset

    Set-ADUser `
        -Identity $u.Sam `
        -ChangePasswordAtLogon $true `
        -PasswordNeverExpires $false
}