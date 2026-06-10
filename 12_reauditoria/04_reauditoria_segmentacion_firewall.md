# Reauditoría de segmentación y firewall

## 1. Objetivo

Verificar la eficacia de las reglas de hardening aplicadas en FW01 pfSense tras sustituir las reglas temporales permisivas por un modelo de mínimo privilegio.

---

## 2. Sistema evaluado

| Elemento | Valor |
|---|---|
| Firewall | FW01 pfSense |
| Zonas | LAN, DMZ, AUDIT, BACKUP, MONITORING |
| Máquina auditora | KALI01 |
| IP KALI01 | 10.10.50.10 |
| Servidor web | WEB01 |
| IP WEB01 | 10.10.20.10 |
| Servidor base de datos | DB01 |
| IP DB01 | 10.10.10.30 |
| Controlador de dominio | DC01 |
| IP DC01 | 10.10.10.10 |

---

## 3. Hallazgos revalidados

| ID | Hallazgo | Resultado esperado |
|---|---|---|
| NET-H01 | Red AUDIT con acceso amplio | Mitigado |
| NET-H02 | Segmentación permisiva | Mitigado/parcial |
| NET-H03 | Servicios internos accesibles desde AUDIT | Mitigado |
| FW-H01 | Reglas permisivas | Mitigado |
| FW-H02 | AUDIT net hacia Any | Mitigado |
| FW-H03 | DMZ con salida amplia | Mitigado/parcial |
| FW-H05 | WebGUI visible desde varias interfaces | Mitigado si solo ADM01 accede |

---

## 4. Pruebas desde KALI01

### 4.1 Acceso permitido a WEB01

```bash
curl -I http://10.10.20.10
sudo nmap -sS -sV -Pn -p 80,443 10.10.20.10
```

Resultado esperado:

WEB01 accesible por HTTP.
HTTPS pendiente si aún no se ha implantado.

### 4.2 Bloqueo hacia DB01
nc -vz 10.10.10.30 3306
sudo nmap -sS -Pn -p 3306 10.10.10.30

Resultado esperado:

3306 filtrado o no accesible desde AUDIT.

### 4.3 Bloqueo de SSH hacia DB01
sudo nmap -sS -Pn -p 22 10.10.10.30

Resultado esperado:

SSH filtrado o limitado según política.

### 4.4 Bloqueo de servicios AD críticos
sudo nmap -sS -Pn -p 53,88,135,139,389,445,464,593,636,3268,3269 10.10.10.10

Resultado esperado:

Servicios AD críticos filtrados desde AUDIT, salvo DNS si se mantiene permitido.

### 4.5 Restricción de WebGUI pfSense
curl -I http://10.10.50.1
curl -k -I https://10.10.50.1

Resultado esperado:

WebGUI no accesible desde AUDIT.

## 5. Pruebas desde WEB01

### 5.1 Conectividad permitida
ping -c 4 10.10.20.1
nslookup db01.almerialogitech.local
nslookup archive.ubuntu.com
mariadb -h 10.10.10.30 -u appuser -p almerialogitech -e "SELECT COUNT(*) AS total_clientes FROM clientes;"
curl -I http://archive.ubuntu.com
curl -I https://archive.ubuntu.com

Resultado esperado:

Gateway DMZ accesible.
DNS interno y externo funcional.
DB01 accesible por 3306.
Salida HTTP/HTTPS funcional.

### 5.2 Bloqueo hacia servicios LAN no autorizados
nc -vz 10.10.10.10 445
nmap -sS -Pn -p 445 10.10.10.10

Resultado esperado:

SMB de DC01 filtrado o no accesible desde DMZ.

## 6. Evidencias generadas
| Evidencia                                | Descripción                  |
| ---------------------------------------- | ---------------------------- |
| `kali_web01_http_allowed.txt`            | KALI01 accede a WEB01        |
| `web01_web_ports_post_firewall.nmap`     | Puertos web de WEB01         |
| `kali_db01_3306_blocked_by_firewall.txt` | Bloqueo MariaDB desde KALI01 |
| `db01_3306_post_firewall.nmap`           | Nmap de 3306 post-hardening  |
| `db01_ssh_post_firewall.nmap`            | Nmap de SSH post-hardening   |
| `dc01_ad_ports_post_firewall.nmap`       | Puertos AD desde KALI01      |
| `kali_pfsense_http_audit_post.txt`       | WebGUI HTTP desde AUDIT      |
| `kali_pfsense_https_audit_post.txt`      | WebGUI HTTPS desde AUDIT     |
| `web01_db01_allowed_after_firewall.txt`  | WEB01 accede a DB01          |
| `web01_dns_after_firewall.txt`           | WEB01 resuelve DNS           |
| `web01_dc01_445_blocked_post.txt`        | Bloqueo WEB01 hacia SMB DC01 |
| Capturas de logs pfSense                 | Eventos bloqueados           |

## 7. Comparativa antes/después
| Control               | Antes                        | Después                     | Estado           |
| --------------------- | ---------------------------- | --------------------------- | ---------------- |
| AUDIT hacia LAN       | Permitido ampliamente        | Bloqueado salvo excepciones | Mitigado         |
| AUDIT hacia DB01 3306 | Accesible                    | Filtrado/bloqueado          | Mitigado         |
| AUDIT hacia AD        | Servicios visibles           | Servicios filtrados         | Mitigado         |
| DMZ hacia LAN         | Permisivo                    | Solo WEB01→DB01/DNS         | Mitigado         |
| WEB01 hacia DB01      | Permitido                    | Permitido controlado        | Correcto         |
| WebGUI pfSense        | Visible en varias interfaces | Limitada a administración   | Mitigado/parcial |
| Logging de bloqueos   | No priorizado                | Activado en reglas críticas | Mejorado         |

## 8. Riesgo residual

| Riesgo residual                  | Estado                            |
| -------------------------------- | --------------------------------- |
| HTTPS en WEB01                   | Pendiente                         |
| TLS MariaDB                      | Pendiente                         |
| Monitorización centralizada      | Pendiente                         |
| Reglas BACKUP/MONITORING finales | Pendiente hasta crear BCK01/MON01 |
| Ventanas formales de auditoría   | Pendiente documental              |

## 9. Relación con NIS2

La mejora de segmentación y firewall contribuye a:

Seguridad de redes y sistemas.
Control de acceso.
Gestión de riesgos.
Reducción de superficie de ataque.
Evaluación de eficacia de medidas.
Protección de activos críticos.
Detección mediante logs de firewall.

## 10. Conclusión

La reauditoría permite verificar que el acceso entre zonas se ha reducido conforme al principio de mínimo privilegio.

El entorno mantiene la funcionalidad necesaria, pero reduce la exposición de servicios internos frente a redes no autorizadas.