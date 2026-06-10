Get-ADDefaultDomainPasswordPolicy |
Select-Object `
MinPasswordLength,
PasswordHistoryCount,
MaxPasswordAge,
MinPasswordAge,
ComplexityEnabled,
ReversibleEncryptionEnabled,
LockoutThreshold,
LockoutDuration,
LockoutObservationWindow |
Format-List |
Out-File "C:\auditoria-ad-inicial\01_dominio\ad_password_policy_summary_initial.txt"