# Creación de redes virtuales en VMware

## 1. Objetivo

Crear las redes virtuales necesarias en VMware para segmentar el laboratorio de auditoría NIS2.

Estas redes permitirán simular una infraestructura empresarial con separación entre LAN, DMZ, monitorización, backups y red de auditoría.

---

## 2. Entorno

| Elemento | Valor |
|---|---|
| Sistema anfitrión | Windows 11 |
| Plataforma | VMware |
| Herramienta | Virtual Network Editor |
| Proyecto | auditoria-nis2-vmware |

---

## 3. Redes creadas

| VMnet | Zona | Tipo | Subred | Máscara | DHCP VMware |
|---|---|---|---|---|---|
| VMnet10 | LAN | Host-only | 10.10.10.0 | 255.255.255.0 | Desactivado |
| VMnet20 | DMZ | Host-only | 10.10.20.0 | 255.255.255.0 | Desactivado |
| VMnet30 | MONITORING | Host-only | 10.10.30.0 | 255.255.255.0 | Desactivado |
| VMnet40 | BACKUP | Host-only | 10.10.40.0 | 255.255.255.0 | Desactivado |
| VMnet50 | AUDIT | Host-only | 10.10.50.0 | 255.255.255.0 | Desactivado |


---

## 4. Configuración aplicada

Se han creado cinco redes virtuales internas en VMware.  
Todas ellas se han configurado sin DHCP de VMware para evitar conflictos con el direccionamiento manual y con pfSense.

pfSense será el sistema encargado de actuar como gateway de cada zona.

---

## 5. Gateways previstos

| Zona | Gateway previsto |
|---|---|
| LAN | 10.10.10.1 |
| DMZ | 10.10.20.1 |
| MONITORING | 10.10.30.1 |
| BACKUP | 10.10.40.1 |
| AUDIT | 10.10.50.1 |

---

## 6. Justificación técnica

La segmentación mediante redes VMnet permite separar los sistemas según su función y nivel de exposición.

Esta arquitectura facilita:

- Separar sistemas internos y expuestos.
- Controlar el tráfico entre zonas.
- Aplicar reglas de firewall con pfSense.
- Simular una DMZ empresarial.
- Auditar movimiento lateral.
- Analizar la mejora tras la remediación.
- Generar evidencias técnicas alineadas con NIS2.

---

## 7. Evidencias generadas

Evidencias recomendadas:

| Evidencia | Ubicación sugerida |
|---|---|
| Captura del Virtual Network Editor con VMnet10 | 07_evidencias/01_capturas/vmware_vmnet10_lan.png |
| Captura del Virtual Network Editor con VMnet20 | 07_evidencias/01_capturas/vmware_vmnet20_dmz.png |
| Captura del Virtual Network Editor con VMnet30 | 07_evidencias/01_capturas/vmware_vmnet30_monitoring.png |
| Captura del Virtual Network Editor con VMnet40 | 07_evidencias/01_capturas/vmware_vmnet40_backup.png |
| Captura del Virtual Network Editor con VMnet50 | 07_evidencias/01_capturas/vmware_vmnet50_audit.png |
| Salida de ipconfig | 07_evidencias/02_logs/windows_ipconfig_vmware.txt |

---

## 8. Verificación

Comando ejecutado en Windows:

```powershell
ipconfig

## Observación sobre ipconfig y route print

Durante la verificación desde Windows 11 se comprobó que las redes LAN-10, DMZ-20, MONITORING-30, BACKUP-40 y AUDIT-50 no aparecen en `ipconfig` ni en `route print`.

Esto se debe a que en VMware Virtual Network Editor se ha desmarcado la opción:

`Connect a host virtual adapter to this network`

Por tanto, Windows 11 no crea interfaces virtuales asociadas a esas redes.

Esta configuración se considera correcta para el laboratorio, ya que el host Windows no debe participar directamente en las redes internas. El enrutamiento entre zonas será gestionado exclusivamente por pfSense.


