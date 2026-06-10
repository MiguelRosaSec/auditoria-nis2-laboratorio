# Roadmap del proyecto

## 1. Nombre del proyecto

Auditoría técnica y de cumplimiento NIS2 sobre infraestructura empresarial simulada en VMware.

## 2. Objetivo

Diseñar, construir, auditar, remediar y reauditar una infraestructura empresarial simulada, desplegada íntegramente en VMware, para evaluar su adecuación frente a los requisitos de ciberseguridad de la Directiva NIS2.

## 3. Entorno de trabajo

- Sistema anfitrión: Windows 11.
- Editor: Visual Studio Code.
- Virtualización: VMware.
- Documentación: Markdown.
- Control de versiones: local durante el desarrollo.
- Publicación final: GitHub.

## 4. Fases del proyecto

| Fase | Descripción | Estado |
|---|---|---|
| Fase 0 | Gestión del proyecto y estructura documental | En curso |
| Fase 1 | Contexto de empresa y alcance NIS2 | Pendiente |
| Fase 2 | Diseño de infraestructura VMware | Realizado |
| Fase 3 | Creación de redes virtuales | Realizado |
| Fase 4 | Instalación de pfSense | Realizado |
| Fase 5 | Instalación de Windows Server AD | Realizado |
| Fase 6 | Instalación de servidores Ubuntu | Realizado |
| Fase 7 | Instalación de Kali Linux | Realizado |
| Fase 8 | Configuración de servicios | Pendiente |
| Fase 9 | Estado inicial inseguro controlado | Pendiente |
| Fase 10 | Auditoría técnica inicial | Pendiente |
| Fase 11 | Evaluación de cumplimiento NIS2 | Pendiente |
| Fase 12 | Análisis de riesgos | Pendiente |
| Fase 13 | Plan de remediación | Pendiente |
| Fase 14 | Remediación técnica | Pendiente |
| Fase 15 | Reauditoría | Pendiente |
| Fase 16 | Informes finales | Pendiente |
| Fase 17 | Preparación para GitHub | Pendiente |

## 5. Máquinas virtuales previstas

| VM | Sistema | Rol |
|---|---|---|
| FW01 | pfSense | Firewall perimetral |
| DC01 | Windows Server | Active Directory y DNS |
| WEB01 | Ubuntu Server | Web corporativa y portal vulnerable |
| DB01 | Ubuntu Server | Base de datos |
| KALI01 | Kali Linux | Auditoría técnica |
| BCK01 | Ubuntu Server | Backups |
| MON01 | Ubuntu Server | Wazuh |
| IDS01 | Ubuntu Server | Suricata |
| SRV-LNX01 | Ubuntu Server | Servicios internos |

## 6. Publicación final

El proyecto se publicará en GitHub únicamente cuando:

- La documentación esté finalizada.
- Las evidencias sensibles hayan sido revisadas.
- No existan credenciales reales.
- No existan claves privadas.
- No existan configuraciones exportadas con secretos.
- Las capturas hayan sido anonimizadas si es necesario.
- El README esté preparado para portfolio.