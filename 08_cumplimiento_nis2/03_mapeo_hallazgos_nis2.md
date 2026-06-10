# Mapeo de hallazgos técnicos contra NIS2

## 1. Objetivo

Relacionar los hallazgos técnicos identificados durante la auditoría inicial con los requisitos de ciberseguridad de la Directiva NIS2.

El objetivo es transformar los resultados técnicos en incumplimientos, riesgos y acciones de adecuación.

---

## 2. Referencia principal

La auditoría toma como referencia principal el artículo 21 de la Directiva NIS2, relativo a medidas de gestión de riesgos de ciberseguridad.

Se consideran especialmente los siguientes ámbitos:

| Ámbito | Descripción |
|---|---|
| Gestión de riesgos | Políticas y medidas para gestionar riesgos |
| Gestión de incidentes | Detección, respuesta y notificación |
| Continuidad | Backup, recuperación y gestión de crisis |
| Cadena de suministro | Seguridad de proveedores |
| Desarrollo seguro | Seguridad en adquisición, desarrollo y mantenimiento |
| Evaluación de controles | Medición de eficacia de medidas |
| Higiene cibernética | Buenas prácticas, hardening y formación |
| Criptografía | Cifrado y protección de comunicaciones |
| Control de acceso | Identidad, autenticación y privilegios |
| Gestión de activos | Inventario y protección de sistemas |
| MFA/comunicaciones seguras | Autenticación robusta y comunicaciones protegidas |

---

## 3. Matriz de mapeo NIS2

| ID Hallazgo | Hallazgo | Área NIS2 afectada | Riesgo principal | Severidad | Evidencia | Acción recomendada |
|---|---|---|---|---|---|---|
| NET-H01 | Red AUDIT con acceso amplio a LAN y DMZ | Seguridad de redes / Gestión de riesgos | Movimiento lateral y exposición de servicios internos | Alta | Nmap / reglas pfSense | Restringir reglas AUDIT por ventana y destino |
| NET-H02 | Segmentación inicial permisiva entre zonas | Seguridad de redes | Compromiso propagable entre zonas | Alta | Reglas pfSense | Aplicar política deny-by-default |
| NET-H03 | Servicios internos accesibles desde AUDIT | Gestión de activos / Seguridad de redes | Exposición innecesaria de servicios críticos | Alta | Nmap | Limitar acceso por origen, puerto y necesidad |
| FW-H01 | Reglas firewall excesivamente permisivas | Gestión de riesgos / Seguridad de redes | Tráfico no autorizado | Alta | pfSense | Endurecer reglas interzona |
| FW-H02 | AUDIT net hacia Any | Gestión de riesgos / Control de acceso | Uso abusivo de red auditora | Alta | pfSense | Crear reglas temporales controladas y registradas |
| FW-H05 | DNS/WebGUI visibles en varias interfaces | Control de acceso / Hardening | Administración expuesta | Media/Alta | Nmap | Restringir WebGUI a red administrativa |
| WEB-H01 | HTTP sin HTTPS | Criptografía / Comunicaciones seguras | Interceptación de credenciales y sesiones | Alta | Cabeceras/Nmap | Habilitar HTTPS y redirección HTTP→HTTPS |
| WEB-H02 | Ausencia de cabeceras de seguridad | Desarrollo seguro / Hardening | Mayor exposición a ataques web | Media | Nikto | Configurar cabeceras HTTP seguras |
| WEB-H03 | Cookie sin HttpOnly/Secure/SameSite | Control de acceso / Sesiones | Robo o reutilización de sesión | Alta | Nikto/cabeceras | Endurecer cookies de sesión |
| WEB-H04 | Versión Apache expuesta | Gestión de vulnerabilidades | Fingerprinting | Media | WhatWeb | Ocultar banners/versiones |
| WEB-H05 | Apache potencialmente desactualizado | Gestión de vulnerabilidades | Exposición a CVE conocidas | Media | Nikto | Validar y aplicar actualizaciones |
| WEB-H06 | Directory indexing en `/includes/` | Desarrollo seguro / Gestión de activos | Exposición de estructura interna | Alta | Nikto/Gobuster | Desactivar directory listing |
| WEB-H07 | Rutas sensibles enumerables | Desarrollo seguro / Control de acceso | Reconocimiento y ataque dirigido | Media | Gobuster | Proteger rutas y revisar autorización |
| WEB-H10 | Falta de hardening web general | Higiene cibernética | Superficie de ataque elevada | Alta | Nikto/WhatWeb | Aplicar baseline de hardening Apache/PHP |
| WEB-H11 | SQL Injection en login | Desarrollo seguro / Control de acceso | Acceso no autorizado | Crítica | Captura SQLi login | Prepared statements y rediseño login |
| WEB-H12 | SQL Injection en buscador | Desarrollo seguro / Protección de datos | Exposición/manipulación de datos | Crítica | Captura SQLi buscador | Parametrizar consultas y validar entrada |
| WEB-H13 | XSS reflejado | Desarrollo seguro / Sesiones | Robo de sesión o ejecución JS | Alta | Captura XSS | Escape de salida y CSP |
| DB-H01 | MariaDB expuesto en 0.0.0.0 | Seguridad de redes / Gestión de activos | Exposición innecesaria de base de datos | Alta | Nmap/ss | Escuchar solo en interfaz necesaria y filtrar |
| DB-H02 | `appuser` desde `%` | Control de acceso | Conexión desde cualquier origen | Alta | SHOW GRANTS | Restringir origen a WEB01 |
| DB-H03 | Privilegios excesivos de appuser | Control de acceso / Mínimo privilegio | Escalada de impacto | Alta | SHOW GRANTS | Aplicar mínimo privilegio |
| DB-H04 | DB sin TLS | Criptografía | Interceptación de credenciales/datos | Alta | Configuración | Activar TLS MariaDB |
| DB-H05 | Sin backup inicial | Continuidad | Pérdida de datos y disponibilidad | Alta | Revisión | Diseñar backups y pruebas de restauración |
| DB-H06 | UFW inactivo | Hardening | Mayor superficie local | Media | ufw status | Activar UFW restrictivo |
| AD-H01 | Servicios AD accesibles desde AUDIT | Seguridad de redes / Identidad | Enumeración y ataques AD | Alta | Nmap | Restringir exposición de DC01 |
| AD-H02 | SMB/LDAP/Kerberos expuestos fuera de LAN | Control de acceso / Identidad | Enumeración y movimiento lateral | Alta | Nmap | Limitar acceso por zona |
| AD-H03 | Usuarios con contraseña inicial común | Control de acceso / Higiene cibernética | Compromiso masivo de cuentas | Alta | Procedimiento + PasswordLastSet homogéneo | Contraseñas únicas y cambio obligatorio |
| AD-H04 | Sin cambio obligatorio al iniciar sesión | Control de acceso | Persistencia de credenciales débiles | Alta | Configuración AD | Forzar cambio al primer inicio |
| AD-H05 | Política de contraseñas débil | Higiene cibernética / Control de acceso | Password spraying y fuerza bruta | Alta | MinPasswordLength 7 / LockoutThreshold 0 | Longitud 12+ y bloqueo de cuenta |
| AD-H06 | Sin MFA | MFA / Control de acceso | Mayor impacto por robo de credenciales | Media/Alta | Diseño actual | MFA en accesos críticos |
| AD-H08 | Falta de GPO de hardening base | Higiene cibernética / Evaluación de controles | Configuración insegura no centralizada | Media/Alta | Solo GPOs por defecto | Crear GPO de hardening |
| AD-H09 | Auditoría avanzada no configurada | Gestión de incidentes / Detección | Baja capacidad de investigación | Media | Sin GPO específica | Activar auditoría avanzada |
| AD-H10 | Falta revisión periódica grupos privilegiados | Control de acceso / Privilegios | Exceso de privilegios no detectado | Alta | Primera revisión inicial | Revisión periódica formal |