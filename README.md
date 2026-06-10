# Proyecto de Auditoría y Adecuación NIS2 — AlmeriaLogiTech S.L.

## 1. Descripción

Este repositorio documenta un proyecto completo de simulación de auditoría, análisis de riesgos, remediación técnica, reauditoría, monitorización y respuesta a incidentes en un entorno corporativo ficticio llamado **AlmeriaLogiTech S.L.**

El proyecto está orientado a demostrar competencias prácticas en ciberseguridad, administración de sistemas, auditoría técnica, hardening, monitorización y cumplimiento normativo alineado con la Directiva NIS2.

---

## 2. Objetivo

El objetivo principal es simular un ciclo completo de mejora de ciberseguridad:

```text
Diseño del entorno
→ Auditoría inicial
→ Identificación de hallazgos
→ Análisis de riesgos
→ Plan de remediación
→ Hardening técnico
→ Reauditoría
→ Monitorización
→ Respuesta a incidentes
→ Informes finales
→ Roadmap de mejora

```
## 3. Infraestructura del laboratorio

El entorno se ha desplegado en local mediante VMware.

| Sistema | Función                                |
| ------- | -------------------------------------- |
| FW01    | Firewall pfSense y segmentación de red |
| DC01    | Active Directory y DNS                 |
| WEB01   | Portal web de clientes                 |
| DB01    | Base de datos MariaDB                  |
| MON01   | Wazuh SIEM/XDR                         |
| KALI01  | Máquina de auditoría técnica           |
| ADM01   | Estación de administración             |


## 4. Tecnologías utilizadas

| Tecnología          | Uso                                        |
| ------------------- | ------------------------------------------ |
| VMware              | Virtualización local                       |
| pfSense             | Firewall, segmentación y control interzona |
| Ubuntu Server       | Servidores Linux                           |
| Windows Server      | Active Directory / DNS                     |
| Apache / PHP        | Aplicación web                             |
| MariaDB             | Base de datos                              |
| Wazuh               | Monitorización y SIEM                      |
| Kali Linux          | Auditoría técnica                          |
| Nmap / Nikto / curl | Validación técnica                         |
| PowerShell          | Administración Windows y AD                |
| Bash                | Administración Linux                       |
| Git / GitHub        | Control de versiones y portfolio           |


## 5. Fases del proyecto

| Fase | Descripción                  |
| ---- | ---------------------------- |
| 01   | Planificación del proyecto   |
| 02   | Diseño de arquitectura       |
| 03   | Construcción del laboratorio |
| 04   | Configuración de servicios   |
| 05   | Inventario de activos        |
| 06   | Auditoría técnica inicial    |
| 07   | Evidencias                   |
| 08   | Mapeo NIS2                   |
| 09   | Análisis de riesgos          |
| 10   | Plan de remediación          |
| 11   | Remediación técnica          |
| 12   | Reauditoría                  |
| 13   | Gestión de incidentes        |
| 14   | Informes                     |
| 15   | Roadmap y cierre             |

## 6. Resultados principales

| Área                   | Resultado                                |
| ---------------------- | ---------------------------------------- |
| Seguridad web          | SQL Injection y XSS mitigados            |
| Base de datos          | Acceso y privilegios restringidos        |
| Segmentación           | Reglas interzona endurecidas             |
| Active Directory       | Política de contraseñas y GPO reforzadas |
| Monitorización         | Wazuh desplegado con agentes activos     |
| Respuesta a incidentes | Procedimiento y simulacro realizados     |
| Cumplimiento           | Mejora parcial alineada con NIS2         |

## 7. Documentos principales

| Documento                      | Ubicación                                       |
| ------------------------------ | ----------------------------------------------- |
| Informe técnico de reauditoría | `14_informes/01_informe_tecnico_reauditoria.md` |
| Informe ejecutivo NIS2         | `14_informes/02_informe_ejecutivo_nis2.md`      |
| Resumen portfolio              | `14_informes/03_resumen_portfolio.md`           |
| Roadmap final                  | `15_plan_mejora/01_roadmap_mejora_final.md`     |
| Registro de riesgos residuales | `15_plan_mejora/03_riesgos_residuales.md`       |
| Cierre del proyecto            | `15_plan_mejora/04_cierre_proyecto.md`          |

## 8. Estado del proyecto
Completado con riesgos residuales documentados.

El proyecto no representa una certificación oficial ni una auditoría legal real, sino una simulación técnica y documental orientada a portfolio profesional y aprendizaje avanzado.

## 9. Riesgos residuales principales

| Riesgo residual              | Estado    |
| ---------------------------- | --------- |
| HTTPS en WEB01               | Pendiente |
| MFA real                     | Pendiente |
| Modelo Tier completo en AD   | Pendiente |
| Integración pfSense-Wazuh    | Pendiente |
| Alertas avanzadas Wazuh      | Pendiente |
| Servidor de backups dedicado | Pendiente |

## 10. Autor

Proyecto desarrollado por:

Miguel Angel Rosa Caparrós

Perfil orientado a administración de sistemas, ciberseguridad, auditoría técnica, hardening, monitorización y cumplimiento normativo.

