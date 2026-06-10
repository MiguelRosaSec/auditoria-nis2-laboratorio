# Matriz inicial de hallazgos técnicos

## 1. Objetivo

Consolidar los hallazgos técnicos identificados durante la auditoría inicial del laboratorio de AlmeriaLogiTech S.L.

Esta matriz servirá como base para el análisis de riesgos, el mapeo contra NIS2 y el plan de remediación.

---

## 2. Escala de severidad

| Severidad | Criterio |
|---|---|
| Crítica | Permite compromiso directo, acceso no autorizado o impacto grave sobre sistemas críticos |
| Alta | Riesgo relevante sobre confidencialidad, integridad o disponibilidad |
| Media | Debilidad significativa con impacto moderado o mitigantes |
| Baja | Riesgo limitado o mejora técnica |
| Informativa | Información útil para endurecimiento o contexto |

---

## 3. Hallazgos de red y segmentación

| ID | Hallazgo | Activo/Zona | Severidad | Evidencia | Estado |
|---|---|---|---|---|---|
| NET-H01 | Red AUDIT con acceso amplio a LAN y DMZ | pfSense / AUDIT-50 | Alta | Reglas temporales pfSense + Nmap | Confirmado |
| NET-H02 | Segmentación inicial permisiva entre zonas | pfSense | Alta | Reglas temporales LAN/DMZ/AUDIT | Confirmado |
| NET-H03 | Servicios internos accesibles desde red de auditoría | LAN / DMZ | Alta | `resumen_puertos_abiertos.txt` | Confirmado |
| NET-H04 | WebGUI/DNS de pfSense visibles en varias interfaces | FW01 | Media/Alta | Nmap pfSense | Confirmado |

---

## 4. Hallazgos de WEB01

| ID | Hallazgo | Activo | Severidad | Evidencia | Estado |
|---|---|---|---|---|---|
| WEB-H01 | Servicio HTTP sin HTTPS | WEB01 | Alta | `web01_headers.txt`, Nmap | Confirmado |
| WEB-H02 | Ausencia de cabeceras de seguridad HTTP | WEB01 | Media | `web01_nikto.txt` | Confirmado |
| WEB-H03 | Cookie `PHPSESSID` sin atributos de seguridad | WEB01 | Alta | `web01_headers.txt`, `web01_nikto.txt` | Confirmado |
| WEB-H04 | Divulgación de versión Apache | WEB01 | Media | `web01_whatweb.txt` | Confirmado |
| WEB-H05 | Apache potencialmente desactualizado | WEB01 | Media | `web01_nikto.txt` | Confirmado por herramienta |
| WEB-H06 | Directory indexing en `/includes/` | WEB01 | Alta | `web01_nikto.txt`, Gobuster | Confirmado |
| WEB-H07 | Exposición de rutas sensibles o internas | WEB01 | Media | Gobuster | Confirmado |
| WEB-H08 | Portal de autenticación accesible | WEB01 | Informativa/Media | Nikto/Gobuster | Confirmado |
| WEB-H09 | Superficie web ampliada por rutas PHP detectables | WEB01 | Media | Gobuster | Confirmado |
| WEB-H10 | Falta de hardening general del servidor web | WEB01 | Alta | Nikto/WhatWeb/Cabeceras | Confirmado |
| WEB-H11 | SQL Injection en login | WEB01 | Crítica | `audit_ini_web_sql_injection.jpg` | Confirmado |
| WEB-H12 | SQL Injection en buscador | WEB01 | Crítica | `audit_ini_web_sql_injection_navegador.jpg` | Confirmado |
| WEB-H13 | XSS reflejado en contacto | WEB01 | Alta | `audit_ini_web_xss_reflejado_navegador.jpg` | Confirmado |

---

## 5. Hallazgos de DB01

| ID | Hallazgo | Activo | Severidad | Evidencia | Estado |
|---|---|---|---|---|---|
| DB-H01 | MariaDB accesible por red en `0.0.0.0:3306` | DB01 | Alta | Nmap, `ss -tulpen` | Confirmado |
| DB-H02 | Usuario `appuser` permitido desde cualquier origen `%` | DB01 | Alta | `SHOW GRANTS` | Confirmado |
| DB-H03 | Usuario de aplicación con privilegios excesivos | DB01 | Alta | `SHOW GRANTS` | Confirmado |
| DB-H04 | Conexión a base de datos sin TLS | DB01/WEB01 | Alta | Configuración MariaDB/app | Confirmado |
| DB-H05 | Sin backup configurado inicialmente | DB01 | Alta | Revisión configuración | Confirmado |
| DB-H06 | Firewall local UFW inactivo | DB01 | Media | `ufw status` | Confirmado |
| DB-H07 | SSH accesible desde red AUDIT | DB01 | Media | Nmap | Confirmado |

---

## 6. Hallazgos de DC01 / Active Directory

| ID | Hallazgo | Activo | Severidad | Evidencia | Estado |
|---|---|---|---|---|---|
| AD-H01 | Servicios AD accesibles desde red AUDIT | DC01 | Alta | Nmap DC01 | Confirmado |
| AD-H02 | SMB/LDAP/Kerberos expuestos fuera de LAN administrativa | DC01 | Alta | Nmap DC01 | Confirmado |
| AD-H03 | Usuarios creados con contraseña inicial común | DC01 | Alta | Configuración AD | Confirmado |
| AD-H04 | Usuarios sin obligación de cambio de contraseña al primer inicio | DC01 | Alta | Script creación usuarios | Confirmado |
| AD-H05 | Política de contraseñas no endurecida inicialmente | DC01 | Media/Alta | Configuración inicial AD | Pendiente de evidenciar |
| AD-H06 | Sin MFA en accesos internos | Identidad | Media/Alta | Diseño actual | Confirmado documental |
| AD-H07 | Modelo de privilegios inicial básico no maduro | AD | Media | Grupos iniciales | Confirmado documental |

---

## 7. Hallazgos de pfSense / Firewall

| ID | Hallazgo | Activo | Severidad | Evidencia | Estado |
|---|---|---|---|---|---|
| FW-H01 | Reglas temporales excesivamente permisivas | FW01 | Alta | Configuración pfSense | Confirmado |
| FW-H02 | AUDIT net hacia Any | FW01 | Alta | Reglas pfSense | Confirmado |
| FW-H03 | DMZ con salida amplia durante fase inicial | FW01 | Media/Alta | Reglas pfSense | Confirmado |
| FW-H04 | NAT saliente automático para múltiples redes | FW01 | Media | Configuración NAT | Confirmado |
| FW-H05 | DNS/WebGUI visibles en varias interfaces | FW01 | Media/Alta | Nmap | Confirmado |

---

## 8. Priorización global inicial

| Prioridad | Hallazgos |
|---|---|
| P1 - Crítica | WEB-H11, WEB-H12 |
| P2 - Alta | WEB-H01, WEB-H03, WEB-H06, WEB-H10, WEB-H13, DB-H01, DB-H02, DB-H03, DB-H04, DB-H05, AD-H01, AD-H02, AD-H03, AD-H04, FW-H01, FW-H02, NET-H01, NET-H02, NET-H03 |
| P3 - Media | WEB-H02, WEB-H04, WEB-H05, WEB-H07, WEB-H09, DB-H06, DB-H07, AD-H05, AD-H06, AD-H07, FW-H03, FW-H04, FW-H05, NET-H04 |
| P4 - Informativa | WEB-H08 |

---

## 9. Conclusión inicial

La auditoría técnica inicial evidencia un entorno funcional pero con múltiples debilidades críticas y altas. Las áreas más críticas son:

- Seguridad de aplicación web.
- Control de acceso.
- Segmentación de red.
- Exposición de base de datos.
- Configuración inicial de Active Directory.
- Endurecimiento del firewall.
- Gestión de sesiones.
- Cifrado de comunicaciones.

Estos hallazgos serán mapeados contra NIS2 y tratados posteriormente en el plan de remediación.

## 10. Estado tras remediación DB01

| ID | Hallazgo | Estado tras remediación | Evidencia |
|---|---|---|---|
| DB-H01 | MariaDB accesible en `0.0.0.0:3306` | Mitigado | `db01_3306_bind_post.txt` |
| DB-H02 | `appuser` permitido desde `%` | Mitigado | `db01_appuser_hosts_post.txt` |
| DB-H03 | Usuario con privilegios excesivos | Mitigado | `db01_appuser_grants_post.txt` |
| DB-H05 | Sin backup configurado | Mitigado | `db01_backup_files_post.txt` |
| DB-H06 | UFW inactivo | Mitigado | `db01_ufw_status_post.txt` |
| DB-H07 | SSH accesible desde AUDIT | Mitigado/parcial | `db01_ssh_post.nmap` |