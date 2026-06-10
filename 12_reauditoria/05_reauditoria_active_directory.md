# Reauditoría de Active Directory DC01

## 1. Objetivo

Verificar la eficacia de las medidas de hardening aplicadas sobre Active Directory y DC01 tras la auditoría técnica inicial.

---

## 2. Sistema reauditorado

| Elemento | Valor |
|---|---|
| Servidor | DC01 |
| IP | 10.10.10.10 |
| Dominio | almerialogitech.local |
| Rol | Controlador de dominio / DNS |
| Zona | LAN |

---

## 3. Hallazgos revalidados

| ID | Hallazgo | Resultado esperado |
|---|---|---|
| AD-H01 | Servicios AD expuestos inicialmente a AUDIT | Filtrados por firewall |
| AD-H02 | SMB/LDAP/Kerberos accesibles desde red no administrativa | Filtrados por firewall |
| AD-H03 | Usuarios con contraseña inicial común | Contraseñas temporales únicas |
| AD-H04 | Usuarios sin cambio obligatorio | Cambio obligatorio activado |
| AD-H05 | Política de contraseñas débil | Política reforzada |
| AD-H06 | Ausencia de MFA | Estrategia documentada |
| AD-H07 | Modelo de privilegios básico | Grupos Tier creados |
| AD-H08 | Falta de GPO hardening base | GPO creada |
| AD-H09 | Auditoría avanzada no configurada | Auditoría configurada |
| AD-H10 | Falta revisión grupos privilegiados | Revisión documentada |

---

## 4. Política de contraseñas posterior

Se valida la política posterior mediante:

```powershell
Get-ADDefaultDomainPasswordPolicy
```

| Parámetro           | Valor esperado |
| ------------------- | -------------- |
| Longitud mínima     | 12             |
| Complejidad         | Activada       |
| Cifrado reversible  | Desactivado    |
| Bloqueo de cuenta   | 5 intentos     |
| Duración bloqueo    | 15 minutos     |
| Ventana observación | 15 minutos     |


## 5. Usuarios

Se valida que los usuarios de laboratorio tienen:

| Control               | Resultado esperado     |
| --------------------- | ---------------------- |
| PasswordNeverExpires  | False                  |
| ChangePasswordAtLogon | True                   |
| PasswordLastSet       | Actualizado tras reset |

## 6. Grupos Tier

Se valida la creación de:

| Grupo                       | Finalidad                    |
| --------------------------- | ---------------------------- |
| GG_AD_Admins_Tier0          | Administración de identidad  |
| GG_Server_Admins_Tier1      | Administración de servidores |
| GG_Workstation_Admins_Tier2 | Administración de estaciones |


## 7. GPO de hardening

Se valida la existencia y aplicación de:

GPO_Hardening_Base_Dominio

Controles revisados:

Auditoría de logon.
Auditoría de gestión de cuentas.
Auditoría de cambios de política.
Auditoría Kerberos.
Auditoría de cambios en directorio.
NTLMv2.
Firma SMB.
No mostrar último usuario.
Cuenta Guest deshabilitada.

## 8. Auditoría de eventos

Se revisa la configuración mediante:

auditpol /get /category:*

Áreas esperadas:

Account Logon.
Account Management.
Logon/Logoff.
Policy Change.
Directory Service Access.

## 9. Servicios críticos

Se valida que permanecen activos:

| Servicio | Estado esperado |
| -------- | --------------- |
| DNS      | Running         |
| KDC      | Running         |
| Netlogon | Running         |
| NTDS     | Running         |
| W32Time  | Running         |


## 10. Exposición desde AUDIT

Desde KALI01 se repite escaneo contra DC01:

sudo nmap -sS -Pn -p 53,88,135,139,389,445,464,593,636,3268,3269 10.10.10.10

Resultado esperado:

DNS permitido o filtrado según decisión.
Kerberos, LDAP, SMB, RPC y Global Catalog filtrados desde AUDIT.

## 11. Evidencias generadas

| Evidencia                             | Descripción                 |
| ------------------------------------- | --------------------------- |
| `ad_password_policy_reaudit.txt`      | Política posterior          |
| `ad_users_password_state_reaudit.csv` | Estado de usuarios          |
| `ad_tier_groups_reaudit.csv`          | Grupos Tier                 |
| `ad_privileged_groups_reaudit.txt`    | Grupos privilegiados        |
| `gpo_hardening_base_reaudit.html`     | Reporte GPO hardening       |
| `dc01_gpresult_reaudit.txt`           | Resultado de aplicación GPO |
| `auditpol_reaudit.txt`                | Auditoría configurada       |
| `ad_critical_services_reaudit.txt`    | Servicios críticos          |
| `dcdiag_reaudit.txt`                  | Diagnóstico DC              |
| `dc01_ad_ports_reaudit.nmap`          | Exposición AD desde AUDIT   |

## 12. Estado de cierre

| Hallazgo | Estado tras reauditoría |
| -------- | ----------------------- |
| AD-H01   | Mitigado                |
| AD-H02   | Mitigado                |
| AD-H03   | Mitigado                |
| AD-H04   | Mitigado                |
| AD-H05   | Mitigado                |
| AD-H06   | Parcial/documental      |
| AD-H07   | Parcialmente mitigado   |
| AD-H08   | Mitigado                |
| AD-H09   | Mitigado/parcial        |
| AD-H10   | Mitigado/parcial        |

## 13. Riesgo residual

| Riesgo residual                                    | Estado                  |
| -------------------------------------------------- | ----------------------- |
| MFA no implantado técnicamente                     | Pendiente               |
| Modelo Tier no delegado completamente              | Pendiente               |
| Monitorización centralizada AD                     | Pendiente               |
| Auditoría avanzada con herramientas especializadas | Pendiente               |
| Revisión periódica formal de privilegios           | Pendiente procedimental |

## 14. Relación con NIS2

La reauditoría evidencia mejoras en:

Control de acceso.
Gestión de identidades.
Higiene cibernética.
Seguridad de sistemas críticos.
Evaluación de eficacia de medidas.
Auditoría y detección.
Gestión de riesgos.

## 15. Conclusión

La reauditoría confirma que Active Directory ha mejorado significativamente su postura de seguridad inicial.

Los riesgos críticos relacionados con política de contraseñas, exposición de servicios y cuentas iniciales se reducen, quedando pendientes medidas de madurez como MFA, monitorización centralizada y administración Tier completa.

