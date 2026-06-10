# Hardening inicial de Active Directory DC01

## 1. Objetivo

Aplicar medidas iniciales de hardening sobre DC01 y Active Directory para corregir debilidades detectadas durante la auditoría técnica inicial.

---

## 2. Hallazgos tratados

| ID | Hallazgo | Acción aplicada |
|---|---|---|
| AD-H03 | Usuarios con contraseña inicial común | Contraseñas temporales únicas |
| AD-H04 | Usuarios sin cambio obligatorio al primer inicio | `ChangePasswordAtLogon = true` |
| AD-H05 | Política de contraseñas no endurecida | Longitud 12 y bloqueo de cuenta |
| AD-H06 | Sin MFA | Estrategia MFA documentada |
| AD-H07 | Modelo de privilegios básico | Grupos Tier creados |
| AD-H08 | Falta de GPO hardening base | GPO base creada |
| AD-H09 | Auditoría avanzada no configurada | Auditoría configurada por GPO |
| AD-H10 | Falta revisión grupos privilegiados | Revisión formal exportada |

---

## 3. Snapshot previo

Antes de aplicar cambios se crea snapshot:

- pre_hardening_active_directory

## 4. Política de contraseñas reforzada

Se modifica la política del dominio:
| Parámetro           |       Antes |     Después |
| ------------------- | ----------: | ----------: |
| Longitud mínima     |           7 |          12 |
| Historial           |          24 |          10 |
| Complejidad         |    Activada |    Activada |
| Cifrado reversible  | Desactivado | Desactivado |
| Bloqueo de cuenta   |           0 |           5 |
| Duración bloqueo    |      10 min |      15 min |
| Ventana observación |      10 min |      15 min |
| Vigencia máxima     |     42 días |     90 días |
| Vigencia mínima     |       1 día |       1 día |

## 5. Usuarios

Se asignan contraseñas temporales diferenciadas y se fuerza cambio al primer inicio.

## 6. Modelo Tier

Se crean grupos:
| Grupo                       | Finalidad                    |
| --------------------------- | ---------------------------- |
| GG_AD_Admins_Tier0          | Administración de identidad  |
| GG_Server_Admins_Tier1      | Administración de servidores |
| GG_Workstation_Admins_Tier2 | Administración de estaciones |

## 7. Revisión de grupos privilegiados

Se revisan:

Domain Admins.
Enterprise Admins.
Schema Admins.
Administrators.
Account Operators.
Server Operators.
Backup Operators.
Print Operators.
DnsAdmins.
Group Policy Creator Owners.

## 8. GPO base de hardening

Se crea:

GPO_Hardening_Base_Dominio

Controles incluidos:

Auditoría de logon.
Auditoría de gestión de cuentas.
Auditoría de cambios de política.
Auditoría de Kerberos.
Auditoría de cambios en directorio.
Deshabilitación de cuenta Guest.
No mostrar último usuario.
NTLMv2 obligatorio.
Firma SMB.

## 9. MFA

Se documenta estrategia MFA como control pendiente de madurez.

## 10. Evidencias generadas

| Evidencia                          | Descripción                    |
| ---------------------------------- | ------------------------------ |
| `ad_password_policy_post.txt`      | Política posterior             |
| `ad_users_password_state_post.csv` | Estado usuarios posterior      |
| `ad_tier_groups_post.csv`          | Grupos Tier creados            |
| `ad_privileged_groups_post.txt`    | Grupos privilegiados revisados |
| `dc01_gpresult_post.txt`           | Resultado GPO                  |
| `gpo_hardening_base_post.html`     | Reporte de GPO                 |
| `ad_critical_services_post.txt`    | Servicios críticos activos     |
| `dcdiag_post.txt`                  | Diagnóstico DC                 |

## 11. Estado tras remediación

| Hallazgo | Estado                |
| -------- | --------------------- |
| AD-H03   | Mitigado              |
| AD-H04   | Mitigado              |
| AD-H05   | Mitigado              |
| AD-H06   | Parcial/documental    |
| AD-H07   | Parcialmente mitigado |
| AD-H08   | Mitigado              |
| AD-H09   | Mitigado/parcial      |
| AD-H10   | Mitigado/parcial      |

## 12. Riesgo residual

Queda pendiente:

Implantación real de MFA.
Auditoría avanzada con herramientas específicas.
Delegación granular.
Modelo Tier completamente aplicado.
Monitorización centralizada de eventos AD.

## 13. Relación con NIS2

Esta remediación mejora controles relacionados con:

Control de acceso.
Gestión de identidades.
Higiene cibernética.
Gestión de privilegios.
Monitorización.
Gestión de incidentes.
Evaluación de eficacia de medidas técnicas.

