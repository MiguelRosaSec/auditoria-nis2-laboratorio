# Procedimiento de respuesta a incidentes de ciberseguridad

## 1. Objetivo

Definir el procedimiento inicial de respuesta a incidentes de ciberseguridad para AlmeriaLogiTech S.L., en el contexto del laboratorio de adecuación NIS2.

El objetivo es establecer un flujo claro para detectar, analizar, contener, erradicar, recuperar y documentar incidentes de seguridad.

---

## 2. Alcance

Este procedimiento aplica a los siguientes activos del laboratorio:

| Activo | Descripción |
|---|---|
| FW01 | Firewall pfSense |
| DC01 | Active Directory / DNS |
| WEB01 | Portal web de clientes |
| DB01 | Base de datos MariaDB |
| MON01 | Wazuh SIEM/XDR |
| Redes | LAN, DMZ, AUDIT, MONITORING, BACKUP |

---

## 3. Fuentes de detección

| Fuente | Eventos detectables |
|---|---|
| Wazuh | Alertas de agentes, autenticación, FIM, eventos Windows |
| WEB01 | Logs Apache, auth.log, cambios en `/var/www/html` |
| DB01 | auth.log, MariaDB, backups |
| DC01 | Eventos Windows Security, AD, GPO, cuentas |
| pfSense | Bloqueos firewall, accesos WebGUI, tráfico interzona |
| Revisión manual | Evidencias recogidas por administrador/auditor |

---

## 4. Fases del procedimiento

| Fase | Descripción |
|---|---|
| 1. Detección | Identificación de evento sospechoso o alerta |
| 2. Registro | Apertura de entrada en registro de incidentes |
| 3. Clasificación | Determinar criticidad, alcance e impacto |
| 4. Contención | Limitar propagación o daño |
| 5. Análisis | Determinar causa raíz y sistemas afectados |
| 6. Erradicación | Eliminar causa del incidente |
| 7. Recuperación | Restaurar servicio y validar funcionamiento |
| 8. Comunicación | Informar a responsables internos |
| 9. Lecciones aprendidas | Documentar mejoras y acciones preventivas |

---

## 5. Flujo operativo

1. Se recibe alerta en Wazuh o se detecta evento anómalo.
2. Se registra el incidente con identificador único.
3. Se recopilan evidencias iniciales.
4. Se clasifica el incidente según severidad.
5. Se decide si requiere contención inmediata.
6. Se ejecuta el playbook correspondiente.
7. Se documentan acciones realizadas.
8. Se valida que el riesgo ha sido reducido.
9. Se cierra el incidente con lecciones aprendidas.

---

## 6. Roles y responsabilidades

| Rol | Responsabilidad |
|---|---|
| Dirección | Aprobar decisiones de alto impacto |
| Responsable de Seguridad | Coordinar respuesta al incidente |
| Sistemas | Ejecutar contención, recuperación y hardening |
| Redes | Modificar reglas firewall y segmentación |
| DBA | Revisar base de datos, backups y restauración |
| Responsable AD | Revisar cuentas, grupos y eventos de identidad |
| Auditor/Consultor | Verificar evidencias y cumplimiento |

---

## 7. Severidad de incidentes

| Severidad | Criterio |
|---|---|
| Crítica | Compromiso de sistema crítico, exfiltración, ransomware o acceso administrativo |
| Alta | Acceso no autorizado, explotación confirmada o afectación relevante |
| Media | Actividad sospechosa o intento de ataque sin compromiso confirmado |
| Baja | Evento menor, intento bloqueado o anomalía sin impacto |
| Informativa | Evento registrado para trazabilidad |

---

## 8. Evidencias mínimas

Para cada incidente se recopilarán, cuando aplique:

| Evidencia | Ejemplo |
|---|---|
| Fecha y hora | Timestamp del evento |
| Sistema afectado | WEB01, DB01, DC01 |
| Origen | IP origen o usuario |
| Alerta Wazuh | Captura o exportación |
| Logs locales | Apache, auth.log, Security.evtx |
| Acciones de contención | Regla firewall, bloqueo usuario |
| Resultado | Mitigado, en seguimiento, falso positivo |
| Lecciones aprendidas | Mejoras recomendadas |

---

## 9. Comunicación interna

Los incidentes se comunicarán al responsable de seguridad y, si tienen impacto alto o crítico, a dirección.

La comunicación debe incluir:

- Qué ha ocurrido.
- Qué sistemas están afectados.
- Qué impacto tiene.
- Qué acciones se han tomado.
- Qué acciones quedan pendientes.
- Si existe riesgo para datos o continuidad.

---

## 10. Relación con NIS2

Este procedimiento contribuye a los requisitos de:

- Gestión de incidentes.
- Continuidad de negocio.
- Gestión de riesgos.
- Seguridad de redes y sistemas.
- Evaluación de eficacia de medidas.
- Gobierno de ciberseguridad.
- Notificación y escalado de incidentes.

---

## 11. Estado del procedimiento

| Campo | Valor |
|---|---|
| Estado | Inicial |
| Versión | 1.0 |
| Responsable | Responsable de Seguridad |
| Fecha | 04/06/2026 |
| Próxima revisión | Tras simulacro de incidente |