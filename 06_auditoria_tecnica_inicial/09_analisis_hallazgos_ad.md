# Análisis de hallazgos de Active Directory

## 1. Objetivo

Analizar las evidencias obtenidas durante la auditoría técnica inicial de Active Directory y cerrar el estado de los hallazgos identificados.

---

## 2. Evidencias revisadas

| Evidencia | Descripción |
|---|---|
| `ad_password_policy_summary_initial.txt` | Política inicial de contraseñas del dominio |
| `ad_lab_users_password_initial_evidence.txt` | Estado de usuarios de laboratorio |
| `ad_privileged_groups_initial.txt` | Revisión de grupos privilegiados |
| `ad_gpos_all_initial.csv` | GPOs existentes en el dominio |
| `ad_critical_services_initial.txt` | Servicios críticos de Active Directory |

---

## 3. Resumen técnico de evidencias

### Política de contraseñas

La política inicial del dominio presenta:

| Parámetro | Valor inicial | Evaluación |
|---|---:|---|
| Longitud mínima | 7 | Débil |
| Historial | 24 | Correcto |
| Vigencia máxima | 42 días | Correcto |
| Vigencia mínima | 1 día | Correcto |
| Complejidad | Activada | Correcto |
| Cifrado reversible | Desactivado | Correcto |
| Bloqueo de cuenta | 0 | Débil / no configurado |
| Duración bloqueo | 10 minutos | Sin efecto si threshold = 0 |
| Ventana observación | 10 minutos | Sin efecto si threshold = 0 |

Conclusión:

La política tiene controles positivos, como complejidad e historial, pero mantiene dos debilidades relevantes:

- Longitud mínima insuficiente.
- Ausencia de bloqueo de cuenta ante intentos fallidos.

---

### Usuarios de laboratorio

Los usuarios simulados presentan el mismo valor `PasswordLastSet`, lo que es coherente con una creación masiva o homogénea durante la construcción del laboratorio.

Además, el atributo `PasswordNeverExpires` aparece como `False`, lo cual es correcto.

Conclusión:

La evidencia refuerza la debilidad documentada de contraseña inicial común, aunque Active Directory no permite ver contraseñas en texto claro.

---

### Grupos privilegiados

Se ha realizado revisión formal de grupos privilegiados.

El fichero contiene encabezados para grupos críticos como:

- Domain Admins.
- Enterprise Admins.
- Schema Admins.
- Administrators.
- Account Operators.
- Server Operators.
- Backup Operators.
- Print Operators.
- DnsAdmins.
- Group Policy Creator Owners.

No se observan miembros listados en la evidencia exportada, por lo que se recomienda revisar visualmente la pertenencia de `Administrator` y validar que no existan usuarios operativos añadidos de forma indebida.

---

### GPOs

La evidencia de GPOs muestra únicamente:

- `Default Domain Policy`.
- `Default Domain Controllers Policy`.

No existe una GPO específica de hardening base, auditoría avanzada o seguridad corporativa.

Conclusión:

Se confirma la falta de una GPO de hardening específica.

---

### Servicios críticos

Los servicios principales del controlador de dominio se encuentran activos y configurados en inicio automático:

- DNS.
- KDC.
- Netlogon.
- NTDS.
- W32Time.

Conclusión:

DC01 está funcional como controlador de dominio y servidor DNS.

---

## 4. Estado final de hallazgos AD

| ID | Hallazgo | Severidad | Estado | Evidencia |
|---|---|---|---|---|
| AD-H01 | Servicios AD expuestos inicialmente a red AUDIT | Alta | Confirmado | Nmap inicial |
| AD-H02 | SMB/LDAP/Kerberos accesibles desde red no administrativa | Alta | Confirmado | Nmap inicial |
| AD-H03 | Usuarios con contraseña inicial común | Alta | Confirmado documental | Procedimiento + `PasswordLastSet` homogéneo |
| AD-H04 | Usuarios sin cambio obligatorio al primer inicio | Alta | Confirmado por diseño inicial | Procedimiento de creación inicial |
| AD-H05 | Política de contraseñas no endurecida | Alta | Confirmado | Longitud 7 y bloqueo 0 |
| AD-H06 | Ausencia de MFA | Media/Alta | Confirmado documental | Diseño actual |
| AD-H07 | Modelo de privilegios básico | Media | Confirmado | Sin modelo Tier inicial |
| AD-H08 | Falta de GPO de hardening base | Media/Alta | Confirmado | Solo GPOs por defecto |
| AD-H09 | Auditoría avanzada no configurada | Media | Confirmado/pendiente detalle GPO | Sin GPO específica |
| AD-H10 | Falta de revisión formal periódica de grupos privilegiados | Alta | Confirmado | Primera revisión realizada en auditoría |

---

## 5. Priorización

| Prioridad | Hallazgos |
|---|---|
| P1 | AD-H01, AD-H02, AD-H03, AD-H04, AD-H05 |
| P2 | AD-H08, AD-H09, AD-H10 |
| P3 | AD-H06, AD-H07 |

---

## 6. Recomendaciones principales

| Hallazgo | Recomendación |
|---|---|
| AD-H01 / AD-H02 | Mantener segmentación que impide exposición AD desde AUDIT |
| AD-H03 | Asignar contraseñas temporales únicas |
| AD-H04 | Forzar cambio de contraseña al primer inicio |
| AD-H05 | Elevar longitud mínima y activar bloqueo de cuenta |
| AD-H06 | Documentar e implantar estrategia MFA para accesos críticos |
| AD-H07 | Crear modelo Tier de administración |
| AD-H08 | Crear GPO base de hardening |
| AD-H09 | Activar auditoría de eventos críticos |
| AD-H10 | Formalizar revisión periódica de grupos privilegiados |

---

## 7. Conclusión

La auditoría inicial de Active Directory confirma debilidades relevantes en política de contraseñas, gestión inicial de cuentas, ausencia de GPO específica de hardening y modelo de privilegios inmaduro.

Estas debilidades justifican una fase inmediata de hardening de identidad y políticas de dominio.

