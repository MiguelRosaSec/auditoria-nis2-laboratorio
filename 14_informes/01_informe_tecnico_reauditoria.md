# Informe técnico de reauditoría y estado de mejora

## 1. Resumen ejecutivo

Durante el proyecto se ha realizado una auditoría técnica inicial del entorno simulado de AlmeriaLogiTech S.L., identificando debilidades relevantes en aplicación web, base de datos, segmentación de red, Active Directory y capacidades de monitorización.

Posteriormente se han aplicado medidas de remediación técnica y se ha ejecutado una reauditoría para validar la mejora del entorno.

El resultado global muestra una reducción significativa del riesgo técnico inicial, especialmente en:

- Aplicación web.
- Base de datos.
- Segmentación.
- Identidad.
- Monitorización.
- Respuesta a incidentes.

---

## 2. Alcance técnico

| Activo | Función | Estado |
|---|---|---|
| FW01 | Firewall pfSense | Endurecido parcialmente |
| WEB01 | Portal web clientes | Remediado |
| DB01 | MariaDB | Remediado |
| DC01 | Active Directory / DNS | Endurecido |
| MON01 | Wazuh SIEM/XDR | Implantado |
| KALI01 | Máquina auditora | Utilizada para pruebas |
| ADM01 | Administración | Utilizada para gestión |

---

## 3. Auditoría inicial

La auditoría inicial identificó vulnerabilidades y debilidades como:

| Área | Hallazgos relevantes |
|---|---|
| WEB01 | SQL Injection, XSS, cabeceras ausentes, directory indexing |
| DB01 | MariaDB expuesto, usuario amplio, privilegios excesivos, sin backup |
| pfSense | Reglas interzona permisivas |
| DC01 | Política de contraseñas débil, ausencia de GPO hardening, AD expuesto |
| Monitorización | Ausencia inicial de SIEM |
| Incidentes | Ausencia de procedimiento formal |

---

## 4. Remediaciones aplicadas

| Área | Medidas aplicadas |
|---|---|
| WEB01 | Prepared statements, escape HTML, cabeceras, bloqueo `/includes/` |
| DB01 | Usuario limitado, privilegios mínimos, UFW, backup y restore |
| pfSense | Segmentación interzona, bloqueo AUDIT→LAN, restricción WebGUI |
| DC01 | Política contraseñas, bloqueo cuenta, grupos Tier, GPO hardening |
| MON01 | Wazuh desplegado con agentes en WEB01, DB01 y DC01 |
| Incidentes | Procedimiento IR, playbooks y simulacro controlado |

---

## 5. Comparativa antes/después

| Control | Antes | Después | Estado |
|---|---|---|---|
| SQL Injection login | Explotable | Bloqueado | Mitigado |
| SQL Injection buscador | Explotable | Bloqueado | Mitigado |
| XSS reflejado | Ejecutable | Escapado | Mitigado |
| Directory indexing | Visible | 403 Forbidden | Mitigado |
| Cabeceras seguridad | Ausentes | Presentes | Mitigado |
| MariaDB | Expuesto ampliamente | Limitado a WEB01 | Mitigado |
| appuser | `%` y privilegios amplios | Origen y permisos limitados | Mitigado |
| Backups DB | No implantados | Backup y restore probados | Mitigado |
| AUDIT→LAN | Permisivo | Bloqueado | Mitigado |
| DC01 desde AUDIT | Servicios visibles | Filtrados | Mitigado |
| Contraseñas AD | Longitud 7 / sin bloqueo | Longitud 12 / bloqueo 5 | Mitigado |
| GPO hardening | No existía | Creada | Mitigado |
| Monitorización | No implantada | Wazuh con agentes | Parcial |
| Incidentes | Sin procedimiento | Procedimiento y simulacro | Parcial |

---

## 6. Reauditoría

Las pruebas posteriores confirmaron:

- SQL Injection ya no permite autenticación ni alteración de consultas.
- XSS reflejado queda neutralizado mediante escape de salida.
- `/includes/` devuelve `403 Forbidden`.
- MariaDB no es accesible desde redes no autorizadas.
- WEB01 mantiene acceso controlado a DB01.
- DB01 dispone de backup y prueba de restauración.
- AUDIT no puede acceder ampliamente a LAN.
- DC01 no expone servicios críticos a AUDIT.
- Active Directory tiene política de contraseñas reforzada.
- Wazuh recibe eventos de WEB01, DB01 y DC01.
- Se ha ejecutado un simulacro de incidente SSH contra WEB01.

---

## 7. Riesgo residual

| Riesgo residual | Estado |
|---|---|
| HTTPS en WEB01 | Pendiente |
| Cookie Secure | Pendiente de HTTPS |
| TLS MariaDB | Pendiente |
| MFA real | Pendiente |
| Modelo Tier completo | Pendiente |
| Monitorización pfSense en Wazuh | Pendiente |
| Alertas avanzadas Wazuh | Pendiente |
| Retención formal de logs | Pendiente |
| Integración de backups externos | Pendiente |
| Procedimiento de notificación NIS2 avanzado | Pendiente |

---

## 8. Estado de cumplimiento técnico

| Dominio | Estado inicial | Estado tras proyecto |
|---|---|---|
| Seguridad aplicación web | Bajo | Medio/Alto |
| Seguridad base de datos | Bajo | Medio/Alto |
| Segmentación red | Bajo | Medio |
| Identidad y acceso | Bajo/Medio | Medio |
| Monitorización | No implantada | Inicial/parcial |
| Respuesta incidentes | No documentada | Inicial/parcial |
| Continuidad | No implantada | Parcial |
| Gobierno técnico | Bajo | Parcial |

---

## 9. Integración pfSense-Wazuh

La integración de logs de pfSense en Wazuh mediante syslog remoto no se implementa en esta fase.

Se deja documentada como mejora futura debido a incidencias técnicas durante la configuración y a la priorización de la monitorización mediante agentes en endpoints críticos.

Estado:

| Control | Estado |
|---|---|
| Logs endpoints Wazuh | Implantado |
| Logs firewall pfSense en Wazuh | Pendiente |
| Dashboards firewall | Pendiente |
| Alertas firewall | Pendiente |

---

## 10. Conclusión técnica

El entorno mejora significativamente respecto al estado inicial.

Se han mitigado vulnerabilidades críticas en WEB01, DB01, segmentación y Active Directory. Además, se ha implantado una primera capacidad de monitorización y respuesta a incidentes mediante Wazuh y procedimientos documentados.

El entorno no queda en estado final maduro, pero sí alcanza un nivel demostrable de mejora técnica alineada con NIS2, manteniendo un plan claro de riesgos residuales y mejoras futuras.