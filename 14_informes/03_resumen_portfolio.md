# Proyecto de auditoría y adecuación NIS2 — Resumen para portfolio

## Descripción

Proyecto completo de simulación de auditoría NIS2 sobre una empresa ficticia, AlmeriaLogiTech S.L., desarrollado íntegramente en entorno local mediante VMware.

El proyecto incluye diseño de infraestructura, despliegue de sistemas, auditoría técnica, explotación controlada de debilidades, remediación, reauditoría, monitorización y respuesta a incidentes.

---

## Tecnologías utilizadas

| Tecnología | Uso |
|---|---|
| VMware | Virtualización local |
| pfSense | Firewall y segmentación |
| Ubuntu Server | Servidores Linux |
| Windows Server | Active Directory |
| Apache/PHP | Portal web |
| MariaDB | Base de datos |
| Wazuh | Monitorización/SIEM |
| Kali Linux | Auditoría técnica |
| PowerShell | Administración Windows/AD |
| Bash | Administración Linux |
| Nmap/Nikto/curl | Validación técnica |

---

## Componentes desplegados

| Sistema | Función |
|---|---|
| FW01 | Firewall pfSense |
| WEB01 | Portal web vulnerable/remediado |
| DB01 | Base de datos MariaDB |
| DC01 | Active Directory/DNS |
| MON01 | Wazuh SIEM |
| KALI01 | Auditoría técnica |
| ADM01 | Administración |

---

## Fases del proyecto

1. Diseño del laboratorio.
2. Construcción de máquinas.
3. Auditoría técnica inicial.
4. Identificación de hallazgos.
5. Análisis de riesgos.
6. Plan de remediación.
7. Hardening de WEB01.
8. Hardening de DB01.
9. Hardening de pfSense.
10. Auditoría y hardening de Active Directory.
11. Despliegue de Wazuh.
12. Casos de uso de detección.
13. Procedimiento de respuesta a incidentes.
14. Simulacro controlado.
15. Informes técnico y ejecutivo.

---

## Resultados principales

| Área | Resultado |
|---|---|
| Web | SQLi y XSS mitigados |
| DB | Acceso y privilegios reducidos |
| Red | Segmentación endurecida |
| AD | Política de contraseñas y GPO reforzadas |
| Monitorización | Wazuh con agentes activos |
| Incidentes | Procedimiento y simulacro realizados |
| Cumplimiento | Mejora parcial frente a NIS2 |

---

## Valor profesional demostrado

Este proyecto demuestra competencias en:

- Auditoría técnica.
- Gestión de riesgos.
- Hardening de sistemas.
- Segmentación de red.
- Seguridad web.
- Administración de Active Directory.
- Monitorización con SIEM.
- Respuesta a incidentes.
- Documentación GRC.
- Adecuación normativa NIS2.