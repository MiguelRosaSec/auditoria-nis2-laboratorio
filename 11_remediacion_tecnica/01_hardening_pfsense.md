# Hardening de pfSense y segmentación interzona

## 1. Objetivo

Aplicar medidas de hardening sobre FW01 pfSense para reducir la exposición entre zonas y sustituir las reglas temporales permisivas por un modelo de mínimo privilegio.

---

## 2. Hallazgos tratados

| ID | Hallazgo | Acción aplicada |
|---|---|---|
| NET-H01 | Red AUDIT con acceso amplio a LAN y DMZ | Reglas AUDIT restringidas |
| NET-H02 | Segmentación inicial permisiva | Modelo deny-by-default |
| NET-H03 | Servicios internos accesibles desde AUDIT | Bloqueo hacia LAN salvo excepciones |
| FW-H01 | Reglas excesivamente permisivas | Sustitución por reglas específicas |
| FW-H02 | AUDIT net hacia Any | Eliminación de regla amplia |
| FW-H03 | DMZ con salida amplia | Reglas DMZ específicas |
| FW-H05 | WebGUI visible en varias interfaces | Acceso limitado a administración |

---

## 3. Copia de seguridad previa

Antes de modificar reglas se exporta la configuración de pfSense:

pfsense_pre_hardening_config.xml


## 4. Aliases creados
Hosts
Alias	Valor
HOST_DC01	10.10.10.10
HOST_DB01	10.10.10.30
HOST_WEB01	10.10.20.10
HOST_KALI01	10.10.50.10
HOST_ADM01	10.10.10.100
Redes
Alias	Valor
NET_LAN	10.10.10.0/24
NET_DMZ	10.10.20.0/24
NET_MONITORING	10.10.30.0/24
NET_BACKUP	10.10.40.0/24
NET_AUDIT	10.10.50.0/24

## 5. Reglas LAN

Se sustituyen reglas amplias por reglas específicas para administración, DNS, NTP, salida web y administración controlada de servidores.

## 6. Reglas DMZ

Se permite únicamente:

WEB01 hacia DB01 por 3306/TCP.
WEB01 hacia DC01 por DNS.
WEB01 hacia Internet por HTTP/HTTPS para actualizaciones.
WEB01 hacia NTP.

El resto de tráfico DMZ hacia LAN queda bloqueado.

## 7. Reglas AUDIT

Se elimina la regla AUDIT net -> any.

Se permite únicamente tráfico necesario para pruebas autorizadas y se bloquea el acceso amplio hacia LAN y DMZ.

## 8. Restricción de WebGUI

La administración de pfSense se limita a la máquina autorizada ADM01 desde LAN.

## 9. Logging

Se activa logging en reglas de bloqueo críticas para disponer de evidencias de intentos denegados.

## 10. Pruebas posteriores
Prueba	Resultado esperado
KALI01 accede a WEB01 HTTP	Permitido
KALI01 accede a DB01 3306	Bloqueado/filtrado
KALI01 accede a DB01 SSH	Bloqueado/filtrado
KALI01 accede a puertos AD críticos	Bloqueado/filtrado
WEB01 accede a DB01 3306	Permitido
WEB01 resuelve DNS interno	Permitido
ADM01 accede a WebGUI pfSense	Permitido
Otras redes acceden a WebGUI	Bloqueado

## 11. Evidencias generadas
Evidencia	Descripción
pfsense_aliases_hosts.png	Aliases de hosts
pfsense_aliases_networks.png	Aliases de redes
pfsense_rules_lan_hardened.png	Reglas LAN endurecidas
pfsense_rules_dmz_hardened.png	Reglas DMZ endurecidas
pfsense_rules_audit_hardened.png	Reglas AUDIT endurecidas
db01_ports_after_pfsense.nmap	DB01 filtrado desde KALI01
dc01_ad_ports_after_pfsense.nmap	DC01 filtrado desde KALI01
kali_web01_http_allowed.txt	WEB01 accesible desde auditoría
kali_db01_3306_blocked_by_pfsense.txt	DB01 bloqueado desde auditoría
web01_db01_allowed_after_pfsense.txt	WEB01 autorizado hacia DB01

## 12. Relación con NIS2

Esta remediación mejora controles relacionados con:

Seguridad de redes.
Control de acceso.
Gestión de riesgos.
Protección de sistemas críticos.
Evaluación de eficacia de medidas.
Detección y registro de eventos.
Reducción de superficie de ataque.

## Incidencia resuelta: resolución DNS externa desde WEB01

Durante la validación de reglas DMZ se detectó que WEB01 no podía resolver dominios externos, aunque sí tenía conectividad con su gateway, resolución interna y conexión con DB01.

### Síntoma observado
```bash
curl -I http://archive.ubuntu.com
```
Se modificó la configuración de Netplan para usar como DNS interno el controlador de dominio DC01:

nameservers:
  addresses:
    - 10.10.10.10
  search:
    - almerialogitech.local