# Plan de direccionamiento IP

## 1. Objetivo

Definir el direccionamiento IP del laboratorio de auditoría NIS2 desplegado sobre VMware.

El plan de direccionamiento permite identificar de forma clara cada zona de red, gateway, sistema, función y dependencia de comunicación.

---

## 2. Esquema de redes

| Zona | Subred | Máscara | Gateway |
|---|---|---|---|
| LAN | 10.10.10.0/24 | 255.255.255.0 | 10.10.10.1 |
| DMZ | 10.10.20.0/24 | 255.255.255.0 | 10.10.20.1 |
| MONITORING | 10.10.30.0/24 | 255.255.255.0 | 10.10.30.1 |
| BACKUP | 10.10.40.0/24 | 255.255.255.0 | 10.10.40.1 |
| AUDIT | 10.10.50.0/24 | 255.255.255.0 | 10.10.50.1 |

---

## 3. Rango reservado por tipo de activo

| Rango | Uso |
|---|---|
| .1 | Gateway de zona |
| .2 - .9 | Reservado para infraestructura |
| .10 - .19 | Servicios críticos |
| .20 - .29 | Servidores auxiliares |
| .30 - .39 | Bases de datos |
| .40 - .49 | Documental/almacenamiento |
| .50 - .59 | Monitorización/auditoría |
| .100 - .199 | Clientes o DHCP futuro |
| .200 - .254 | Reservado |

---

## 4. Direccionamiento LAN

| IP | Hostname | Sistema | Rol |
|---|---|---|---|
| 10.10.10.1 | FW01-LAN | pfSense | Gateway LAN |
| 10.10.10.10 | DC01 | Windows Server | Active Directory/DNS |
| 10.10.10.20 | SRV-LNX01 | Ubuntu Server | Servicios internos |
| 10.10.10.30 | DB01 | Ubuntu Server | Base de datos |
| 10.10.10.40 | DOC01 | Ubuntu Server | Repositorio documental |

---

## 5. Direccionamiento DMZ

| IP | Hostname | Sistema | Rol |
|---|---|---|---|
| 10.10.20.1 | FW01-DMZ | pfSense | Gateway DMZ |
| 10.10.20.10 | WEB01 | Ubuntu Server | Web corporativa |
| 10.10.20.20 | APP01 | Ubuntu Server | Portal clientes |
| 10.10.20.30 | MAIL01 | Ubuntu Server | Correo laboratorio |

Nota: en la fase inicial WEB01 y APP01 podrán estar en la misma máquina para reducir consumo de recursos.

---

## 6. Direccionamiento MONITORING

| IP | Hostname | Sistema | Rol |
|---|---|---|---|
| 10.10.30.1 | FW01-MON | pfSense | Gateway MONITORING |
| 10.10.30.10 | MON01 | Ubuntu Server | Wazuh/SIEM |
| 10.10.30.20 | IDS01 | Ubuntu Server | Suricata IDS |

---

## 7. Direccionamiento BACKUP

| IP | Hostname | Sistema | Rol |
|---|---|---|---|
| 10.10.40.1 | FW01-BCK | pfSense | Gateway BACKUP |
| 10.10.40.10 | BCK01 | Ubuntu Server | Servidor de backups |

---

## 8. Direccionamiento AUDIT

| IP | Hostname | Sistema | Rol |
|---|---|---|---|
| 10.10.50.1 | FW01-AUDIT | pfSense | Gateway AUDIT |
| 10.10.50.10 | KALI01 | Kali Linux | Máquina auditora |

---

## 9. DNS interno

El dominio interno simulado será:

```text
almerialogitech.local