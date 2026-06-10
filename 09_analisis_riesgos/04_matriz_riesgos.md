# Matriz inicial de riesgos

## 1. Objetivo

Evaluar los riesgos derivados de los hallazgos técnicos identificados durante la auditoría inicial.

---

## 2. Matriz de riesgos

| ID Riesgo | Activo | Amenaza | Vulnerabilidad / Hallazgo relacionado | Prob. | Impacto | Riesgo | Nivel | Tratamiento |
|---|---|---|---|---:|---:|---:|---|---|
| R-001 | WEB01 / Portal | Acceso no autorizado | WEB-H11 SQL Injection en login | 5 | 5 | 25 | Crítico | Reducir |
| R-002 | DB01 / Datos clientes | Inyección SQL | WEB-H12 SQL Injection en buscador | 5 | 5 | 25 | Crítico | Reducir |
| R-003 | WEB01 / Sesiones | XSS / robo de sesión | WEB-H13 XSS reflejado + cookie sin HttpOnly | 4 | 4 | 16 | Crítico | Reducir |
| R-004 | WEB01 | Interceptación de comunicaciones | WEB-H01 HTTP sin HTTPS | 4 | 4 | 16 | Crítico | Reducir |
| R-005 | DB01 | Acceso no autorizado a BD | DB-H01 MariaDB expuesto + DB-H02 usuario desde `%` | 4 | 5 | 20 | Crítico | Reducir |
| R-006 | DB01 | Abuso de privilegios | DB-H03 appuser con ALL PRIVILEGES | 4 | 5 | 20 | Crítico | Reducir |
| R-007 | DC01 | Enumeración/ataque AD | AD-H01/AD-H02 servicios AD accesibles desde AUDIT | 4 | 5 | 20 | Crítico | Reducir |
| R-008 | Identidades | Compromiso masivo de cuentas | AD-H03 contraseña común inicial | 4 | 5 | 20 | Crítico | Reducir |
| R-009 | Redes internas | Movimiento lateral | NET-H01/NET-H02 segmentación permisiva | 4 | 5 | 20 | Crítico | Reducir |
| R-010 | FW01 | Administración expuesta | FW-H05 WebGUI visible en varias interfaces | 3 | 5 | 15 | Alto | Reducir |
| R-011 | WEB01 | Exposición de información | WEB-H06 directory indexing en `/includes/` | 4 | 4 | 16 | Crítico | Reducir |
| R-012 | WEB01 | Ataques web client-side | WEB-H02 ausencia de cabeceras de seguridad | 3 | 3 | 9 | Medio | Reducir |
| R-013 | DB01 | Pérdida de datos | DB-H05 sin backup inicial | 3 | 5 | 15 | Alto | Reducir |
| R-014 | WEB01 / DB01 | Interceptación interna | DB-H04 conexión DB sin TLS | 3 | 4 | 12 | Alto | Reducir |
| R-015 | WEB01 | Explotación por versión vulnerable | WEB-H05 Apache potencialmente desactualizado | 3 | 4 | 12 | Alto | Reducir |
| R-016 | Auditoría/Red | Uso abusivo de red AUDIT | FW-H02 AUDIT net hacia Any | 3 | 4 | 12 | Alto | Reducir |
| R-017 | WEB01 | Robo de sesión | WEB-H03 cookie sin atributos seguros | 4 | 4 | 16 | Crítico | Reducir |
| R-018 | Organización | Incapacidad de respuesta | Sin SIEM/IRP inicial | 3 | 5 | 15 | Alto | Reducir |
| R-019 | Sistemas Linux | Acceso remoto no restringido | SSH accesible desde AUDIT en WEB01/DB01 | 3 | 4 | 12 | Alto | Reducir |
| R-020 | Cumplimiento NIS2 | Incumplimiento por controles inmaduros | Varias áreas NIS2 en no cumple/parcial | 4 | 4 | 16 | Crítico | Reducir |


## 3. Estado tras hardening de firewall

| Riesgo | Estado tras remediación | Observación |
|---|---|---|
| R-005 | Reducido | DB01 ya no accesible desde AUDIT por 3306 |
| R-007 | Reducido | Servicios AD filtrados desde AUDIT |
| R-009 | Reducido | Segmentación interzona endurecida |
| R-010 | Reducido/parcial | WebGUI limitada según reglas finales |
| R-016 | Reducido | AUDIT net ya no tiene acceso Any |
| R-019 | Reducido/parcial | SSH limitado por origen |

## 4. Riesgos específicos de identidad añadidos

| ID Riesgo | Hallazgos | Descripción | Nivel |
|---|---|---|---|
| AD-R01 | AD-H01, AD-H02 | Enumeración y ataque a AD desde red no autorizada | Crítico |
| AD-R02 | AD-H03, AD-H04 | Compromiso masivo por contraseña inicial común | Crítico |
| AD-R03 | AD-H05 | Password spraying/fuerza bruta sin bloqueo efectivo | Crítico |
| AD-R04 | AD-H08, AD-H09 | Falta de GPO de hardening y auditoría | Alto |
| AD-R05 | AD-H06 | Compromiso de cuentas sin MFA | Alto |
| AD-R06 | AD-H07, AD-H10 | Gestión inmadura de privilegios | Alto |