# Acciones técnicas de remediación

## 1. Objetivo

Definir las acciones técnicas necesarias para corregir los hallazgos identificados durante la auditoría inicial.

---

## 2. Aplicación web WEB01

| ID Acción | Acción | Hallazgos tratados | Evidencia de cierre |
|---|---|---|---|
| REM-001 | Sustituir consultas concatenadas en login por prepared statements | WEB-H11 | Prueba SQLi login fallida |
| REM-002 | Sustituir consulta vulnerable de buscador por prepared statements | WEB-H12 | Prueba SQLi buscador fallida |
| REM-003 | Aplicar `htmlspecialchars()` en salidas HTML | WEB-H13 | Payload XSS renderizado como texto |
| REM-005 | Endurecer cookies PHP | WEB-H03 | Cabecera Set-Cookie con HttpOnly/SameSite/Secure |
| REM-016 | Añadir cabeceras HTTP seguras | WEB-H02 | curl/Nikto sin alerta de cabeceras |
| REM-017 | Ocultar versión Apache | WEB-H04 | Server header sin versión |
| REM-018 | Validar actualizaciones Apache/PHP | WEB-H05 | `apt list --upgradable` limpio o justificado |

---

## 3. Servidor web Apache

| ID Acción | Acción | Comando/Configuración | Evidencia |
|---|---|---|---|
| REM-004 | Activar HTTPS | Configurar SSL en Apache | Acceso por HTTPS |
| REM-012 | Desactivar directory indexing | `Options -Indexes` | `/includes/` devuelve 403 |
| REM-016 | Cabeceras de seguridad | `mod_headers` | `curl -I` muestra cabeceras |
| REM-017 | Ocultar versión | `ServerTokens Prod`, `ServerSignature Off` | Cabecera Server reducida |

---

## 4. Base de datos DB01

| ID Acción | Acción | Hallazgos tratados | Evidencia |
|---|---|---|---|
| REM-006 | Restringir MariaDB a interfaz/origen necesario | DB-H01 | Nmap desde AUDIT sin 3306 accesible |
| REM-007 | Cambiar `appuser` de `%` a origen autorizado | DB-H02 | SHOW GRANTS actualizado |
| REM-008 | Reducir privilegios de `appuser` | DB-H03 | Solo SELECT/INSERT/UPDATE mínimos |
| REM-013 | Implantar backups | DB-H05 | Backup generado y restaurado |
| REM-019 | Evaluar TLS MariaDB | DB-H04 | Configuración TLS o justificación compensatoria |
| REM-022 | Activar UFW restrictivo | DB-H06 | UFW activo y limitado |
| REM-023 | Restringir SSH | DB-H07 | SSH solo desde red/admin autorizada |

---

## 5. Firewall pfSense

| ID Acción | Acción | Hallazgos tratados | Evidencia |
|---|---|---|---|
| REM-009 | Restringir AUDIT net | NET-H01/FW-H02 | Reglas AUDIT limitadas |
| REM-014 | Deny-by-default interzona | NET-H02/FW-H01 | Reglas pfSense actualizadas |
| REM-023 | Limitar SSH por origen | DB-H07/WEB-Hxx | Nmap desde AUDIT muestra filtrado |
| REM-010-FW | Restringir WebGUI pfSense | FW-H05 | WebGUI accesible solo desde ADM01/LAN admin |

---

## 6. Active Directory DC01

| ID Acción | Acción | Hallazgos tratados | Evidencia |
|---|---|---|---|
| REM-010 | Cambiar contraseñas comunes | AD-H03 | Usuarios con claves únicas |
| REM-011 | Forzar cambio al primer inicio | AD-H04 | Propiedad AD activada |
| REM-015 | Endurecer política de contraseñas | AD-H05 | GPO aplicada |
| REM-024 | Definir MFA | AD-H06 | Estrategia documentada |
| REM-AD-01 | Limitar exposición AD desde AUDIT | AD-H01/AD-H02 | Nmap desde AUDIT filtrado |

---

## 7. Monitorización

| ID Acción | Acción | Evidencia |
|---|---|---|
| REM-021 | Desplegar monitorización inicial | Agentes/logs visibles |
| REM-020 | Crear procedimiento IRP | Documento aprobado |
| REM-MON-01 | Centralizar logs críticos | Eventos WEB01/DB01/DC01 recogidos |