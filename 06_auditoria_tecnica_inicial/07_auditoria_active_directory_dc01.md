# Auditoría técnica inicial de Active Directory DC01

## 1. Objetivo

Realizar una auditoría técnica inicial de Active Directory antes de aplicar medidas de hardening sobre DC01.

El objetivo es obtener evidencias del estado inicial de identidad, autenticación, políticas, grupos privilegiados y exposición de servicios.

---

## 2. Sistema auditado

| Elemento | Valor |
|---|---|
| Servidor | DC01 |
| IP | 10.10.10.10 |
| Dominio | almerialogitech.local |
| Rol | Controlador de dominio / DNS |
| Zona | LAN |
| Sistema | Windows Server |

---

## 3. Alcance

La auditoría incluye:

- Información del dominio.
- Política de contraseñas.
- Usuarios.
- Grupos.
- Grupos privilegiados.
- GPOs.
- Servicios críticos.
- DNS.
- Eventos de seguridad.
- Exposición de servicios AD desde red AUDIT.

---

## 4. Evidencias generadas

| Evidencia | Descripción |
|---|---|
| `ad_domain_info.txt` | Información del dominio |
| `ad_forest_info.txt` | Información del bosque |
| `ad_password_policy_initial.txt` | Política de contraseñas inicial |
| `ad_users_all_initial.csv` | Usuarios del dominio |
| `ad_users_enabled_initial.csv` | Usuarios habilitados |
| `ad_users_password_never_expires_initial.csv` | Usuarios con contraseña que no expira |
| `ad_lab_users_password_initial_evidence.txt` | Evidencia indirecta de usuarios de laboratorio |
| `ad_common_initial_password_audit_note.txt` | Nota de auditoría sobre contraseña común |
| `ad_groups_all_initial.csv` | Grupos del dominio |
| `ad_privileged_groups_initial.txt` | Miembros de grupos privilegiados |
| `ad_gpos_all_initial.csv` | GPOs existentes |
| `ad_gpo_report_all_initial.html` | Reporte completo de GPOs |
| `ad_critical_services_initial.txt` | Servicios críticos |
| `dns_forwarders_initial.txt` | Reenviadores DNS |
| `security_events_last_24h_initial.txt` | Eventos recientes |
| `audit_ini_ad_dc01_ports_open_from_audit.png` | Puertos AD visibles desde AUDIT en estado inicial |

---

## 5. Comandos principales ejecutados

```powershell
Get-ADDomain
Get-ADForest
Get-ADDefaultDomainPasswordPolicy
Get-ADUser -Filter * -Properties *
Get-ADGroup -Filter *
Get-GPO -All
Get-GPOReport -All
Get-Service NTDS,DNS,KDC,Netlogon,W32Time
Get-DnsServerForwarder
Get-WinEvent
```

## 6. Revisión de política de contraseñas

Se revisa la política inicial del dominio mediante:

- Get-ADDefaultDomainPasswordPolicy

Aspectos evaluados:

Control	Evaluación
Longitud mínima	Pendiente de analizar según evidencia
Complejidad	Pendiente de analizar según evidencia
Historial	Pendiente de analizar según evidencia
Bloqueo de cuenta	Pendiente de analizar según evidencia
Cifrado reversible	Pendiente de analizar según evidencia

## 7. Revisión de usuarios

Se exportan los usuarios del dominio y sus atributos relevantes:

Estado habilitado.
PasswordLastSet.
PasswordNeverExpires.
CannotChangePassword.
Último inicio de sesión.
Ubicación en OU.

## 8. Contraseña inicial común

Durante la fase de construcción del laboratorio, los usuarios simulados fueron creados con una contraseña inicial común.

Esta condición se documenta como debilidad controlada para su posterior remediación.

Limitación técnica:

Active Directory no permite recuperar contraseñas en texto claro. La evidencia se basa en el procedimiento documentado de creación de usuarios y en la revisión del estado de las cuentas.

## 9. Revisión de grupos privilegiados

Se revisan los siguientes grupos:

Domain Admins.
Enterprise Admins.
Schema Admins.
Administrators.
Account Operators.
Server Operators.
Backup Operators.
DnsAdmins.
Group Policy Creator Owners.

El objetivo es identificar exceso de privilegios o miembros no justificados.

## 10. Revisión de GPOs

Se exportan las GPOs existentes y se genera reporte HTML/XML.

Objetivo:

Identificar si existe una GPO de hardening.
Revisar políticas de seguridad aplicadas.
Verificar si hay configuraciones de auditoría.
Verificar políticas de contraseña y bloqueo.


## 11. Exposición inicial de servicios AD

Durante la auditoría inicial de red se evidenció que DC01 exponía servicios críticos hacia la red AUDIT, incluyendo:

DNS.
Kerberos.
MSRPC.
NetBIOS.
LDAP.
SMB.
LDAPS.
Global Catalog.

Esta exposición fue tratada posteriormente mediante hardening de pfSense y segmentación.

## 12. Hallazgos preliminares

| ID     | Hallazgo                                                 | Severidad  | Estado                      |
| ------ | -------------------------------------------------------- | ---------- | --------------------------- |
| AD-H01 | Servicios AD expuestos inicialmente a AUDIT              | Alta       | Confirmado                  |
| AD-H02 | SMB/LDAP/Kerberos accesibles desde red no administrativa | Alta       | Confirmado                  |
| AD-H03 | Usuarios con contraseña inicial común                    | Alta       | Confirmado documental       |
| AD-H04 | Usuarios sin cambio obligatorio al primer inicio         | Alta       | Pendiente validar evidencia |
| AD-H05 | Política de contraseñas inicial no endurecida            | Media/Alta | Pendiente validar evidencia |
| AD-H06 | Ausencia de MFA                                          | Media/Alta | Confirmado documental       |
| AD-H07 | Modelo de privilegios inicial básico                     | Media      | Confirmado documental       |
| AD-H08 | Falta de GPO de hardening base                           | Media/Alta | Pendiente validar evidencia |
| AD-H09 | Falta de auditoría avanzada                              | Media      | Pendiente validar evidencia |
| AD-H10 | Falta de revisión formal de grupos privilegiados         | Alta       | Confirmado                  |


## 13. Relación con NIS2

Esta auditoría permite evaluar medidas relacionadas con:

Control de acceso.
Gestión de identidades.
Gestión de privilegios.
Higiene cibernética.
Seguridad de sistemas críticos.
Monitorización y auditoría.
Gestión de riesgos.
Evaluación de eficacia de controles.

## 14. Resultado

La auditoría técnica inicial de Active Directory establece la línea base previa al hardening y permite justificar las acciones de remediación posteriores.

