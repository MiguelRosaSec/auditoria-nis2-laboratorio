# Informe ejecutivo de adecuación NIS2

## 1. Resumen ejecutivo

Durante el proyecto se ha realizado una simulación completa de auditoría, análisis de riesgos, remediación técnica y mejora de cumplimiento en un entorno corporativo ficticio denominado AlmeriaLogiTech S.L.

El objetivo principal ha sido evaluar el nivel inicial de seguridad de la organización frente a requisitos y buenas prácticas alineadas con NIS2, identificar riesgos relevantes y aplicar medidas técnicas y organizativas para mejorar la postura de ciberseguridad.

El proyecto ha incluido la construcción de una infraestructura local con firewall, servidores, Active Directory, aplicación web, base de datos, monitorización y procedimientos de respuesta a incidentes.

---

## 2. Alcance del proyecto

El alcance incluye los siguientes activos:

| Activo | Función |
|---|---|
| FW01 | Firewall y segmentación de red |
| WEB01 | Portal web de clientes |
| DB01 | Base de datos corporativa |
| DC01 | Active Directory y DNS interno |
| MON01 | Plataforma de monitorización Wazuh |
| KALI01 | Máquina de auditoría técnica |
| ADM01 | Estación de administración |

El proyecto cubre:

- Auditoría técnica inicial.
- Identificación de hallazgos.
- Análisis de riesgos.
- Plan de remediación.
- Aplicación de medidas técnicas.
- Reauditoría.
- Monitorización.
- Respuesta a incidentes.
- Elaboración de informes.

---

## 3. Situación inicial

La auditoría inicial identificó una postura de seguridad inmadura, con debilidades relevantes en varias áreas críticas.

| Área | Situación inicial |
|---|---|
| Aplicación web | Vulnerabilidades SQL Injection y XSS |
| Base de datos | Exposición excesiva y privilegios amplios |
| Red | Segmentación permisiva entre zonas |
| Identidad | Política de contraseñas débil y ausencia de controles avanzados |
| Monitorización | Sin SIEM implantado inicialmente |
| Incidentes | Sin procedimiento formal de respuesta |
| Continuidad | Backups no formalizados inicialmente |

Estas debilidades suponían un riesgo elevado para la confidencialidad, integridad y disponibilidad de los sistemas.

---

## 4. Riesgos principales identificados

| Riesgo | Impacto potencial | Nivel inicial |
|---|---|---|
| Compromiso del portal web | Acceso no autorizado y exposición de datos | Crítico |
| Explotación de SQL Injection | Lectura o manipulación de información | Crítico |
| Robo o abuso de credenciales | Acceso indebido a sistemas internos | Crítico |
| Movimiento lateral | Compromiso de sistemas internos | Crítico |
| Exposición de Active Directory | Ataques contra identidad corporativa | Alto/Crítico |
| Ausencia de monitorización | Detección tardía de incidentes | Alto |
| Falta de procedimiento IR | Respuesta descoordinada ante incidentes | Alto |
| Ausencia de backups validados | Pérdida de datos o recuperación incompleta | Alto |

---

## 5. Medidas aplicadas

Durante el proyecto se han aplicado medidas de mejora en diferentes áreas.

### 5.1 Seguridad web

Se corrigieron vulnerabilidades críticas en el portal web:

- SQL Injection en login.
- SQL Injection en buscador.
- XSS reflejado.
- Exposición de directorios internos.
- Falta de cabeceras de seguridad.

Resultado:

| Control | Estado |
|---|---|
| Consultas preparadas | Implantado |
| Escape de salida HTML | Implantado |
| Bloqueo de `/includes/` | Implantado |
| Cabeceras HTTP de seguridad | Implantado |
| HTTPS | Pendiente |

---

### 5.2 Seguridad de base de datos

Se aplicaron controles sobre DB01 y MariaDB:

- Restricción de acceso a MariaDB.
- Limitación del usuario de aplicación.
- Aplicación de mínimo privilegio.
- Activación de firewall local.
- Implantación de backup.
- Prueba de restauración.

Resultado:

| Control | Estado |
|---|---|
| Acceso DB limitado a WEB01 | Implantado |
| Usuario `appuser` restringido | Implantado |
| Privilegios mínimos | Implantado |
| Backup operativo | Implantado |
| Restore validado | Implantado |
| TLS MariaDB | Pendiente |

---

### 5.3 Segmentación y firewall

Se endurecieron reglas de pfSense:

- Eliminación de reglas permisivas.
- Bloqueo de AUDIT hacia LAN.
- Restricción de acceso a DB01.
- Limitación de exposición de DC01.
- Restricción de WebGUI de pfSense.

Resultado:

| Control | Estado |
|---|---|
| Segmentación interzona | Mejorada |
| AUDIT hacia LAN | Bloqueado salvo excepciones |
| DB01 desde redes no autorizadas | Bloqueado |
| DC01 desde AUDIT | Filtrado |
| WebGUI pfSense | Restringida |

---

### 5.4 Active Directory

Se aplicaron medidas de hardening sobre DC01:

- Política de contraseñas reforzada.
- Bloqueo de cuenta tras intentos fallidos.
- Cambio obligatorio de contraseña.
- Grupos Tier iniciales.
- GPO base de hardening.
- Auditoría de eventos.

Resultado:

| Control | Estado |
|---|---|
| Longitud mínima 12 caracteres | Implantado |
| Bloqueo de cuenta | Implantado |
| Cambio obligatorio | Implantado |
| GPO hardening | Implantado |
| Grupos Tier | Inicial |
| MFA | Pendiente/documental |

---

### 5.5 Monitorización

Se implantó Wazuh en MON01 con agentes en:

- WEB01.
- DB01.
- DC01.

Se generaron casos de uso iniciales:

- SSH fallido.
- Eventos Apache.
- Cambios en archivos web.
- Eventos de backup.
- Eventos Windows/AD.
- Login fallido 4625.
- Creación/eliminación de usuario AD.

Resultado:

| Control | Estado |
|---|---|
| SIEM inicial | Implantado |
| Agentes Wazuh | Activos |
| Casos de detección | Probados |
| Integración pfSense-Wazuh | Pendiente |
| Alertas avanzadas | Pendiente |

---

### 5.6 Respuesta a incidentes

Se creó un procedimiento inicial de respuesta a incidentes con:

- Clasificación de incidentes.
- Roles y responsabilidades.
- Playbooks iniciales.
- Registro de incidentes.
- Simulacro controlado.

Se ejecutó el simulacro `INC-0008`:

```text
Intentos repetidos de SSH contra WEB01
```
Resultado:

| Capacidad            | Estado       |
| -------------------- | ------------ |
| Detección            | Validada     |
| Clasificación        | Definida     |
| Contención           | Probada      |
| Registro             | Implantado   |
| Lecciones aprendidas | Documentadas |

## 6. Estado de mejora global

| Área                   | Estado inicial | Estado tras proyecto |
| ---------------------- | -------------- | -------------------- |
| Aplicación web         | Bajo           | Medio/Alto           |
| Base de datos          | Bajo           | Medio/Alto           |
| Segmentación de red    | Bajo           | Medio                |
| Active Directory       | Bajo/Medio     | Medio                |
| Monitorización         | No implantada  | Parcial              |
| Respuesta a incidentes | No documentada | Parcial              |
| Continuidad            | No implantada  | Parcial              |
| Gobierno de seguridad  | Bajo           | Parcial              |

## 7. Riesgo residual

Aunque el entorno ha mejorado significativamente, quedan riesgos residuales y acciones futuras.

| Riesgo residual                                 | Prioridad |
| ----------------------------------------------- | --------- |
| Activar HTTPS en WEB01                          | Alta      |
| Activar atributo Secure en cookies              | Alta      |
| Evaluar TLS en MariaDB                          | Media     |
| Implantar MFA real                              | Alta      |
| Completar modelo Tier AD                        | Media     |
| Integrar pfSense con Wazuh                      | Media     |
| Configurar alertas avanzadas Wazuh              | Media     |
| Definir retención formal de logs                | Media     |
| Implantar servidor de backups dedicado          | Alta      |
| Crear procedimiento formal de notificación NIS2 | Alta      |
| Realizar simulacros periódicos                  | Media     |

## 8. Valor aportado al negocio

Las mejoras realizadas reducen riesgos relevantes para la organización:

| Mejora                             | Valor para negocio                       |
| ---------------------------------- | ---------------------------------------- |
| Corrección de vulnerabilidades web | Reduce riesgo de brecha de datos         |
| Segmentación de red                | Limita movimiento lateral                |
| Hardening de AD                    | Reduce riesgo de compromiso de identidad |
| Backups y restore                  | Mejora continuidad                       |
| Monitorización Wazuh               | Mejora detección temprana                |
| Procedimiento IR                   | Mejora capacidad de respuesta            |
| Reauditoría                        | Evidencia eficacia de controles          |

## 9. Conclusión ejecutiva

El proyecto ha permitido transformar un entorno inicialmente vulnerable en una infraestructura con controles técnicos, monitorización y procesos de respuesta mucho más maduros.

Aunque todavía quedan medidas pendientes para alcanzar un nivel de madurez alto, la organización dispone ahora de una base sólida para continuar su adecuación a NIS2.

El resultado es positivo: se han reducido riesgos críticos, se ha mejorado la visibilidad de seguridad y se ha demostrado capacidad de respuesta ante incidentes controlados.

## 10. Próximas acciones recomendadas

| Prioridad | Acción                                                   |
| --------- | -------------------------------------------------------- |
| P1        | Activar HTTPS en WEB01                                   |
| P1        | Implantar servidor de backups dedicado                   |
| P1        | Definir procedimiento de notificación de incidentes NIS2 |
| P1        | Implantar MFA en accesos críticos                        |
| P2        | Afinar alertas Wazuh                                     |
| P2        | Integrar logs pfSense en SIEM                            |
| P2        | Completar modelo Tier en AD                              |
| P2        | Crear plan anual de auditorías                           |
| P3        | Crear cuadro de mando de seguridad                       |
| P3        | Ejecutar simulacros periódicos                           |

## 11. Roadmap final

Se ha elaborado un roadmap de mejora para priorizar las acciones pendientes tras el cierre del proyecto.

El roadmap se divide en:

- Cierre de riesgos críticos pendientes.
- Madurez operativa.
- Gobierno y cumplimiento.
- Optimización avanzada.

Las acciones prioritarias son:

1. Activar HTTPS en WEB01.
2. Implantar servidor de backups dedicado.
3. Formalizar notificación NIS2.
4. Implantar MFA.
5. Afinar alertas Wazuh.
6. Completar modelo Tier AD.