                              INTERNET / RED HOST
                                      |
                                      |
                              [ WAN - VMware NAT ]
                                      |
                                  [ FW01 ]
                                pfSense Firewall
                                      |
        ----------------------------------------------------------------
        |              |                |               |              |
       LAN            DMZ          MONITORING         BACKUP          AUDIT
   VMnet10        VMnet20          VMnet30           VMnet40        VMnet50
10.10.10.0/24  10.10.20.0/24   10.10.30.0/24    10.10.40.0/24 10.10.50.0/24
        |              |                |               |              |
     DC01           WEB01            MON01            BCK01         KALI01
     DB01           APP01            IDS01
  SRV-LNX01         MAIL01


# Diseño de red VMware

## 1. Objetivo

Diseñar la arquitectura de red virtual del laboratorio NIS2 desplegado en VMware, definiendo las zonas de red, subredes, gateways, adaptadores virtuales, direccionamiento IP y reglas iniciales de comunicación.

El objetivo es simular una infraestructura empresarial segmentada, controlada por un firewall pfSense, sobre la que posteriormente se desplegarán servicios, se introducirán debilidades controladas, se realizará una auditoría técnica inicial y se aplicarán medidas de remediación.

---

## 2. Entorno de trabajo

| Elemento | Descripción |
|---|---|
| Sistema anfitrión | Windows 11 |
| Plataforma de virtualización | VMware |
| Editor/documentación | Visual Studio Code |
| Firewall virtual | pfSense |
| Máquina auditora | Kali Linux |
| Servidores | Windows Server y Ubuntu Server |

---

## 3. Zonas de red

| Zona | Red VMware | Subred | Descripción |
|---|---|---|---|
| WAN | NAT/Bridged | DHCP externo | Salida a Internet |
| LAN | LAN-10 | 10.10.10.0/24 | Sistemas internos |
| DMZ | DMZ-20 | 10.10.20.0/24 | Servicios expuestos |
| MONITORING | MONITORING-30 | 10.10.30.0/24 | Monitorización, SIEM e IDS |
| BACKUP | BACKUP-40 | 10.10.40.0/24 | Copias de seguridad |
| AUDIT | AUDIT-50 | 10.10.50.0/24 | Auditoría técnica |

---

## 4. Diagrama lógico

```text
                              INTERNET / RED HOST
                                      |
                                      |
                              [ WAN - VMware NAT ]
                                      |
                                  [ FW01 ]
                                pfSense Firewall
                                      |
        ----------------------------------------------------------------
        |              |                |               |              |
       LAN            DMZ          MONITORING         BACKUP          AUDIT
      LAN-10        DMZ-20        MONITORING-30      BACKUP-40       AUDIT-50
10.10.10.0/24  10.10.20.0/24   10.10.30.0/24    10.10.40.0/24 10.10.50.0/24
        |              |                |               |              |
     DC01           WEB01            MON01            BCK01         KALI01
     DB01           APP01            IDS01
  SRV-LNX01         MAIL01