# Descubrimiento inicial con Nmap

## 1. Objetivo

Realizar el descubrimiento inicial de hosts, puertos y servicios del laboratorio de auditoría NIS2 utilizando KALI01 como máquina auditora.

---

## 2. Máquina origen

| Elemento | Valor |
|---|---|
| Máquina | KALI01 |
| IP | 10.10.50.10 |
| Red | AUDIT-50 |
| Rol | Máquina auditora |

---

## 3. Alcance del descubrimiento

| Red | Subred | Finalidad |
|---|---|---|
| LAN | 10.10.10.0/24 | Sistemas internos |
| DMZ | 10.10.20.0/24 | Servicios expuestos |
| AUDIT | 10.10.50.0/24 | Red de auditoría |

---

## 4. Descubrimiento de hosts

Comandos ejecutados:

```bash
sudo nmap -sn 10.10.10.0/24 -oA ~/auditoria-nis2/01_nmap/01_ping_lan_10
sudo nmap -sn 10.10.20.0/24 -oA ~/auditoria-nis2/01_nmap/02_ping_dmz_20
sudo nmap -sn 10.10.50.0/24 -oA ~/auditoria-nis2/01_nmap/03_ping_audit_50