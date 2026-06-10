# Instalación de KALI01

## 1. Objetivo

Instalar y configurar KALI01 como máquina auditora del laboratorio de auditoría NIS2.

KALI01 se ubicará en la red AUDIT-50 y será utilizada para realizar pruebas controladas de descubrimiento, análisis de servicios, auditoría web y validación de vulnerabilidades.

---

## 2. Datos de la máquina

| Elemento | Valor |
|---|---|
| Nombre VM | KALI01 |
| Hostname | kali01 |
| Sistema | Kali Linux |
| Rol | Máquina auditora |
| Red VMware | AUDIT-50 |
| IP | 10.10.50.10 |
| Gateway | 10.10.50.1 |
| DNS | 10.10.10.10 |
| Dominio búsqueda | almerialogitech.local |

---

## 3. Recursos asignados

| Recurso | Valor |
|---|---|
| CPU | 2 vCPU |
| RAM | 4 GB |
| Disco | 60 GB |
| Adaptador red | AUDIT-50 |

---

## 4. Configuración de red

La máquina se configura con IP estática mediante NetworkManager.

```bash
sudo nmcli connection modify "Wired connection 1" \
  ipv4.addresses 10.10.50.10/24 \
  ipv4.gateway 10.10.50.1 \
  ipv4.dns "10.10.10.10 1.1.1.1" \
  ipv4.dns-search "almerialogitech.local" \
  ipv4.method manual

5. Registro DNS

Se crea un registro DNS tipo A en DC01:

FQDN	IP
kali01.almerialogitech.local	10.10.50.10
6. Herramientas instaladas

Herramientas previstas:

Herramienta	Uso
nmap	Descubrimiento y enumeración de servicios
nikto	Auditoría básica web
whatweb	Identificación de tecnologías web
dirb/gobuster/feroxbuster	Enumeración web
sqlmap	Validación controlada de SQL Injection
OWASP ZAP	Auditoría web dinámica
Burp Suite	Pruebas manuales web
testssl.sh	Auditoría TLS
enum4linux-ng	Enumeración SMB
smbclient	Acceso y pruebas SMB
ldap-utils	Consultas LDAP
BloodHound/Neo4j	Análisis AD en fase posterior
7. Pruebas de conectividad
Prueba	Comando	Resultado esperado
Gateway AUDIT	ping 10.10.50.1	Correcto
DC01	ping 10.10.10.10	Correcto
DB01	ping 10.10.10.30	Correcto
WEB01	ping 10.10.20.10	Correcto
DNS interno	nslookup web01.almerialogitech.local	Correcto
Internet	ping 8.8.8.8	Correcto
8. Primer reconocimiento

Se ejecutan pruebas iniciales de descubrimiento:

sudo nmap -sn 10.10.10.0/24 -oA ~/auditoria-nis2/01_nmap/ping_lan_10
sudo nmap -sn 10.10.20.0/24 -oA ~/auditoria-nis2/01_nmap/ping_dmz_20
sudo nmap -sn 10.10.50.0/24 -oA ~/auditoria-nis2/01_nmap/ping_audit_50

Y un escaneo inicial de WEB01:

nmap -sV -sC -p 80,443 10.10.20.10 -oA ~/auditoria-nis2/01_nmap/web01_http_initial
9. Debilidad controlada asociada

Durante esta fase existe una regla temporal en pfSense que permite a AUDIT-50 comunicarse ampliamente con otras redes.

Debilidad	Riesgo
AUDIT net hacia any	Capacidad de escaneo y acceso amplio
Falta de restricciones por ventana de auditoría	Mayor exposición interna

Esta regla se mantiene temporalmente para realizar la auditoría técnica inicial y será eliminada o restringida en la fase de remediación.

10. Evidencias generadas
Evidencia	Descripción
kali01_ip_a.txt	Configuración IP
kali01_ip_route.txt	Tabla de rutas
kali01_resolv_conf.txt	DNS configurado
kali01_hostnamectl.txt	Hostname
kali01_ping_gateway_audit.txt	Ping a gateway AUDIT
kali01_ping_dc01.txt	Ping a DC01
kali01_ping_db01.txt	Ping a DB01
kali01_ping_web01.txt	Ping a WEB01
kali01_nslookup_dc01.txt	Resolución DNS DC01
kali01_nslookup_db01.txt	Resolución DNS DB01
kali01_nslookup_web01.txt	Resolución DNS WEB01
kali01_nmap_version.txt	Versión Nmap
kali01_nikto_version.txt	Versión Nikto
kali01_whatweb_version.txt	Versión WhatWeb
web01_http_initial.*	Escaneo inicial HTTP de WEB01
nikto_web01_initial.txt	Informe Nikto inicial
11. Relación con NIS2

KALI01 permite realizar pruebas técnicas asociadas a:

Evaluación de eficacia de medidas.
Gestión de vulnerabilidades.
Detección de servicios expuestos.
Auditoría de seguridad web.
Validación de controles de red.
Identificación de riesgos técnicos.
Preparación de evidencias para cumplimiento.




