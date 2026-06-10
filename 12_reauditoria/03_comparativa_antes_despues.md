# Comparativa antes/después - WEB01

## 1. Objetivo

Comparar el estado de WEB01 antes y después de la remediación técnica.

---

## 2. Comparativa de hallazgos

| Hallazgo | Antes | Después | Estado |
|---|---|---|---|
| SQL Injection en login | Payload permitía acceso | Payload no autentica | Mitigado |
| SQL Injection en buscador | Payload alteraba consulta | Payload tratado como texto | Mitigado |
| XSS reflejado | JavaScript ejecutado | Payload escapado | Mitigado |
| Cookie PHPSESSID | Sin HttpOnly/SameSite | Con HttpOnly/SameSite | Parcialmente mitigado |
| Cookie Secure | No presente | Pendiente de HTTPS | Pendiente |
| HTTP sin HTTPS | Solo HTTP | Pendiente de activar HTTPS | Pendiente |
| Directory indexing `/includes/` | Indexado detectado | 403 Forbidden | Mitigado |
| Cabeceras seguridad | Ausentes | Presentes | Mitigado |
| Versión Apache | Apache/2.4.52 Ubuntu | Reducida o pendiente validar | Mitigado/parcial |
| Hardening general | No aplicado | Baseline inicial aplicado | Parcialmente mitigado |

---

## 3. Riesgo residual

| Área | Riesgo residual |
|---|---|
| HTTPS | Pendiente de activar TLS |
| Cookie Secure | Depende de HTTPS |
| Apache/PHP | Pendiente validar actualizaciones |
| DB | Pendiente restringir MariaDB y usuario |
| Firewall | Pendiente endurecer reglas interzona |
| AD | Pendiente hardening de identidad |

---

## 4. Conclusión

La remediación de WEB01 reduce significativamente el riesgo de compromiso directo de la aplicación, especialmente en SQL Injection y XSS.

No obstante, permanecen riesgos residuales relacionados con HTTPS, base de datos, firewall y Active Directory, que serán tratados en fases posteriores.

## 5. Comparativa DB01

| Hallazgo | Antes | Después | Estado |
|---|---|---|---|
| MariaDB expuesto | `0.0.0.0:3306` | `10.10.10.30:3306` + UFW | Mitigado |
| Usuario appuser | Permitido desde `%` | Permitido solo desde `10.10.20.10` | Mitigado |
| Privilegios appuser | `ALL PRIVILEGES` | `SELECT` | Mitigado |
| UFW | Inactivo | Activo y restrictivo | Mitigado |
| Backup | No configurado | Backup operativo | Mitigado |
| Restore | No probado | Restauración validada | Mitigado |
| Acceso desde AUDIT | 3306 abierto | 3306 filtrado/no accesible | Mitigado |

## 6. Comparativa segmentación y firewall

| Hallazgo | Antes | Después | Estado |
|---|---|---|---|
| AUDIT hacia LAN | Permitido ampliamente | Bloqueado salvo excepciones | Mitigado |
| AUDIT hacia DB01 3306 | Abierto | Filtrado/bloqueado | Mitigado |
| AUDIT hacia DC01 AD | Puertos visibles | Puertos filtrados | Mitigado |
| DMZ hacia LAN | Permisiva | Solo DNS y DB autorizados | Mitigado |
| WEB01 hacia DB01 | Permitido amplio | Permitido específico 3306 | Mitigado |
| pfSense WebGUI | Visible desde varias interfaces | Restringida a ADM01 | Mitigado/parcial |
| Logs firewall | No priorizados | Activados en bloqueos críticos | Mejorado |

## 7. Comparativa Active Directory

| Hallazgo | Antes | Después | Estado |
|---|---|---|---|
| Servicios AD desde AUDIT | Puertos críticos visibles | Puertos filtrados por firewall | Mitigado |
| Contraseña inicial común | Usuarios creados homogéneamente | Contraseñas temporales únicas | Mitigado |
| Cambio al primer inicio | No aplicado inicialmente | `ChangePasswordAtLogon=True` | Mitigado |
| Longitud contraseña | 7 | 12 | Mitigado |
| Bloqueo de cuenta | 0 | 5 intentos | Mitigado |
| GPO hardening | No existía | GPO creada | Mitigado |
| Auditoría avanzada | No específica | Configurada por GPO | Mitigado/parcial |
| Modelo Tier | No existía | Grupos Tier creados | Parcial |
| MFA | No implantado | Estrategia documentada | Parcial/documental |