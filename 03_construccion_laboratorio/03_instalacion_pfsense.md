# Instalación de pfSense en VMware

## 1. Objetivo

Instalar y configurar la máquina virtual FW01 con pfSense, que actuará como firewall y router principal del laboratorio de auditoría NIS2.

FW01 será responsable de separar y controlar el tráfico entre las zonas LAN, DMZ, MONITORING, BACKUP y AUDIT.

---

## 2. Entorno

| Elemento | Valor |
|---|---|
| Plataforma | VMware Workstation Pro |
| Sistema anfitrión | Windows 11 |
| Máquina virtual | FW01 |
| Sistema instalado | pfSense CE |
| Rol | Firewall/router |

---

## 3. Recursos asignados

| Recurso | Valor |
|---|---|
| CPU | 1-2 vCPU |
| RAM | 2 GB |
| Disco | 20 GB |
| Firmware | BIOS |
| Sistema invitado | FreeBSD 64-bit |

---

## 4. Adaptadores de red

| Adaptador | Red VMware | Rol |
|---|---|---|
| Adaptador 1 | NAT/Bridged | WAN |
| Adaptador 2 | LAN-10 | LAN |
| Adaptador 3 | DMZ-20 | DMZ |
| Adaptador 4 | MONITORING-30 | MONITORING |
| Adaptador 5 | BACKUP-40 | BACKUP |
| Adaptador 6 | AUDIT-50 | AUDIT |

---

## 5. Instalación

Se instaló pfSense CE desde imagen ISO oficial utilizando el instalador en modo consola.

Opciones seleccionadas:

| Parámetro | Valor |
|---|---|
| Instalación | Install |
| Keymap | Default |
| Particionado | Auto UFS |
| VLANs | No |
| Reinicio tras instalación | Sí |

---

## 6. Asignación de interfaces

| Interfaz pfSense | Rol | Red |
|---|---|---|
| WAN | WAN | NAT/Bridged |
| LAN | LAN | LAN-10 |
| OPT1 | DMZ | DMZ-20 |
| OPT2 | MONITORING | MONITORING-30 |
| OPT3 | BACKUP | BACKUP-40 |
| OPT4 | AUDIT | AUDIT-50 |

---

## 7. Direccionamiento configurado

| Interfaz | IP | Máscara |
|---|---|---|
| LAN | 10.10.10.1 | /24 |
| DMZ | 10.10.20.1 | /24 |
| MONITORING | 10.10.30.1 | /24 |
| BACKUP | 10.10.40.1 | /24 |
| AUDIT | 10.10.50.1 | /24 |
| WAN | DHCP | DHCP |

---

## 8. Administración inicial

Debido a que el host Windows 11 no está conectado directamente a LAN-10, la administración inicial de pfSense se realizará desde una máquina virtual de administración ubicada en LAN-10.

Máquina prevista:

| VM | Red | IP |
|---|---|---|
| ADM01 | LAN-10 | 10.10.10.100 |

URL de administración:

```text
https://10.10.10.1