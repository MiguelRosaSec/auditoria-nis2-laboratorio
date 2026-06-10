# Configuración base de pfSense

## 1. Objetivo

Configurar pfSense como firewall/router central del laboratorio de auditoría NIS2, habilitando las interfaces necesarias para segmentar las zonas LAN, DMZ, MONITORING, BACKUP y AUDIT.

---

## 2. Sistema configurado

| Elemento | Valor |
|---|---|
| Hostname | FW01 |
| Sistema | pfSense CE |
| Rol | Firewall/router |
| Administración | ADM01 desde LAN-10 |

---

## 3. Máquina de administración

| Elemento | Valor |
|---|---|
| Nombre | ADM01 |
| Sistema | Ubuntu |
| Red VMware | LAN-10 |
| IP | 10.10.10.100 |
| Gateway | 10.10.10.1 |
| Uso | Administración inicial de pfSense |

---

## 4. Interfaces configuradas

| Interfaz | Red VMware | IP | Máscara | Estado |
|---|---|---|---|---|
| WAN | NAT/Bridged | DHCP | DHCP | Activa |
| LAN | LAN-10 | 10.10.10.1 | /24 | Activa |
| DMZ | DMZ-20 | 10.10.20.1 | /24 | Activa |
| MONITORING | MONITORING-30 | 10.10.30.1 | /24 | Activa |
| BACKUP | BACKUP-40 | 10.10.40.1 | /24 | Activa |
| AUDIT | AUDIT-50 | 10.10.50.1 | /24 | Activa |

---

## 5. Reglas iniciales de firewall

Durante la fase de construcción del laboratorio se han configurado reglas temporales permisivas para permitir instalación, actualizaciones, administración y auditoría inicial.

| Interfaz | Regla | Justificación |
|---|---|---|
| LAN | LAN net hacia any | Administración inicial |
| DMZ | DMZ net hacia any | Instalación y actualizaciones |
| MONITORING | MONITORING net hacia any | Instalación de servicios de monitorización |
| BACKUP | BACKUP net hacia any | Instalación de servicios de backup |
| AUDIT | AUDIT net hacia any | Auditoría técnica inicial |

Estas reglas serán revisadas y endurecidas durante la fase de remediación.

---

## 6. NAT saliente

El NAT saliente se mantiene en modo automático:

```text
Automatic outbound NAT rule generation