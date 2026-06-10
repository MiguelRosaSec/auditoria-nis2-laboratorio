# Hallazgos técnicos iniciales de Active Directory

## 1. Objetivo

Formalizar los hallazgos identificados durante la auditoría técnica inicial de Active Directory.

---

## 2. Resumen de hallazgos

| ID | Hallazgo | Severidad | Estado | Evidencia |
|---|---|---|---|---|
| AD-H01 | Servicios AD expuestos inicialmente a red AUDIT | Alta | Confirmado | Nmap inicial |
| AD-H02 | SMB/LDAP/Kerberos accesibles desde red no administrativa | Alta | Confirmado | Nmap inicial |
| AD-H03 | Usuarios con contraseña inicial común | Alta | Confirmado documental | Procedimiento + `PasswordLastSet` homogéneo |
| AD-H04 | Usuarios sin cambio obligatorio al primer inicio | Alta | Confirmado por diseño inicial | Script/procedimiento inicial |
| AD-H05 | Política de contraseñas no endurecida | Alta | Confirmado | `MinPasswordLength=7`, `LockoutThreshold=0` |
| AD-H06 | Ausencia de MFA | Media/Alta | Confirmado documental | Diseño actual |
| AD-H07 | Modelo de privilegios básico | Media | Confirmado | Sin modelo Tier inicial |
| AD-H08 | Falta de GPO de hardening base | Media/Alta | Confirmado | Solo GPOs por defecto |
| AD-H09 | Auditoría avanzada no configurada | Media | Confirmado/parcial | Sin GPO específica |
| AD-H10 | Falta de revisión formal periódica de grupos privilegiados | Alta | Confirmado | Primera revisión realizada |

---

# AD-H01 — Servicios AD expuestos inicialmente a red AUDIT

## Clasificación

| Campo | Valor |
|---|---|
| Severidad | Alta |
| Activo | DC01 |
| Riesgo | Enumeración y ataques sobre AD |
| Estado | Confirmado |

## Descripción

Durante la auditoría inicial de red se observó que DC01 exponía servicios críticos de Active Directory hacia la red AUDIT.

## Impacto

- Enumeración de dominio.
- Enumeración LDAP/SMB.
- Reconocimiento de superficie AD.
- Posible preparación de ataques contra identidad.
- Mayor riesgo de movimiento lateral.

## Recomendación

Restringir el acceso a servicios AD únicamente a redes y sistemas que lo requieran.

---

# AD-H03 — Usuarios con contraseña inicial común

## Clasificación

| Campo | Valor |
|---|---|
| Severidad | Alta |
| Activo | Usuarios AD |
| Riesgo | Compromiso masivo de cuentas |
| Estado | Confirmado documental |

## Descripción

Los usuarios simulados fueron creados inicialmente con una contraseña común para facilitar la fase de construcción del laboratorio.

## Impacto

- Compromiso simultáneo de múltiples cuentas.
- Password spraying efectivo.
- Acceso no autorizado.
- Incumplimiento de buenas prácticas de higiene cibernética.

## Recomendación

Asignar contraseñas temporales únicas y forzar cambio al primer inicio.

---

---

# AD-H04 — Usuarios sin cambio obligatorio al primer inicio

## Clasificación

| Campo | Valor |
|---|---|
| Severidad | Alta |
| Activo | Usuarios AD |
| Riesgo | Persistencia de credenciales débiles |
| Estado | Confirmado por diseño inicial |

## Descripción

Los usuarios del laboratorio fueron creados inicialmente sin una política madura de ciclo de vida de credenciales. La ausencia de cambio obligatorio en el primer inicio permite que contraseñas temporales o conocidas permanezcan activas más tiempo del necesario.

## Impacto

- Persistencia de credenciales iniciales.
- Mayor riesgo de reutilización de contraseñas.
- Riesgo de acceso no autorizado si la contraseña inicial es conocida.
- Debilidad relevante frente a auditorías de control de acceso.

## Recomendación

Configurar `ChangePasswordAtLogon = true` para usuarios creados con contraseña temporal.

---

# AD-H05 — Política de contraseñas no endurecida

## Clasificación

| Campo | Valor |
|---|---|
| Severidad | Alta |
| Activo | Dominio AD |
| Riesgo | Password spraying, fuerza bruta y credenciales débiles |
| Estado | Confirmado |

## Descripción

La política inicial del dominio establece una longitud mínima de contraseña de 7 caracteres y no aplica bloqueo de cuenta ante intentos fallidos, ya que `LockoutThreshold` está configurado a 0.

## Evidencia

- `MinPasswordLength: 7`
- `LockoutThreshold: 0`
- `ComplexityEnabled: True`
- `ReversibleEncryptionEnabled: False`

## Impacto

- Mayor viabilidad de ataques de fuerza bruta.
- Mayor exposición ante password spraying.
- Falta de control efectivo ante intentos repetidos de autenticación.
- Incumplimiento de buenas prácticas de higiene cibernética.

## Recomendación

Aplicar una política reforzada:

- Longitud mínima: 12 o superior.
- Bloqueo: 5 intentos fallidos.
- Duración de bloqueo: 15 minutos.
- Historial: 10 o superior.
- Complejidad: activada.
- Cifrado reversible: desactivado.

---

# AD-H06 — Falta de GPO de hardening base

## Clasificación

| Campo | Valor |
|---|---|
| Severidad | Media/Alta |
| Activo | Dominio AD |
| Riesgo | Configuración inconsistente o insuficiente |
| Estado | Confirmado |

## Descripción

La revisión inicial de GPOs muestra únicamente las políticas por defecto del dominio y de controladores de dominio. No existe una GPO específica de hardening corporativo.

## Impacto

- Falta de estandarización de controles.
- Auditoría de seguridad limitada.
- Configuraciones de seguridad no aplicadas de forma centralizada.
- Mayor dependencia de configuraciones manuales.

## Recomendación

Crear una GPO base de hardening con controles de auditoría, seguridad de inicio de sesión, NTLM, SMB signing y políticas de eventos.

---

# AD-H07 — Auditoría avanzada no configurada

## Clasificación

| Campo | Valor |
|---|---|
| Severidad | Media |
| Activo | DC01 / Dominio |
| Riesgo | Baja capacidad de detección |
| Estado | Confirmado/parcial |

## Descripción

No se evidencia una GPO específica de auditoría avanzada para eventos críticos de identidad y seguridad.

## Impacto

- Menor capacidad de investigación.
- Dificultad para detectar intentos fallidos, abuso de privilegios o cambios de cuentas.
- Menor preparación ante incidentes.

## Recomendación

Configurar auditoría de:

- Logon/logoff.
- Account logon.
- Account management.
- Directory service changes.
- Policy change.
- Privilege use.

# AD-H08 — Falta de revisión formal de grupos privilegiados

## Clasificación

| Campo | Valor |
|---|---|
| Severidad | Alta |
| Activo | Active Directory |
| Riesgo | Exceso de privilegios |
| Estado | Confirmado |

## Descripción

Antes de esta auditoría no existía una revisión formal documentada de grupos privilegiados del dominio.

## Recomendación

Revisar y documentar periódicamente grupos como Domain Admins, Enterprise Admins, Schema Admins, DnsAdmins y operadores administrativos.