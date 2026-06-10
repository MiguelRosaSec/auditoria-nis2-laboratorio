
---

# 17. Documento para `07_monitorizacion_wazuh.md`

Pega:

```markdown
# Monitorización inicial con Wazuh

## 1. Objetivo

Definir la arquitectura inicial de monitorización del laboratorio mediante Wazuh.

---

## 2. Arquitectura

| Componente | Sistema | IP |
|---|---|---|
| Wazuh Server | MON01 | 10.10.30.10 |
| Wazuh Dashboard | MON01 | 10.10.30.10 |
| Agente Linux | WEB01 | 10.10.20.10 |
| Agente Linux | DB01 | 10.10.10.30 |
| Agente Windows | DC01 | 10.10.10.10 |

---

## 3. Comunicaciones previstas

| Origen | Destino | Puerto | Uso |
|---|---|---|---|
| WEB01 | MON01 | 1514/TCP | Envío eventos agente |
| DB01 | MON01 | 1514/TCP | Envío eventos agente |
| DC01 | MON01 | 1514/TCP | Envío eventos agente |
| Agentes | MON01 | 1515/TCP | Registro/enrolamiento |
| ADM01/KALI01 | MON01 | 443/TCP | Dashboard |

---

## 4. Eventos de interés

| Sistema | Eventos |
|---|---|
| WEB01 | Apache logs, auth.log, integridad de archivos web |
| DB01 | auth.log, MariaDB logs, cambios en backups |
| DC01 | Logon, failed logon, account management, policy changes |
| pfSense | Bloqueos firewall, accesos WebGUI |

---

## 5. Casos de uso iniciales

| Caso de uso | Descripción |
|---|---|
| Intentos fallidos de login Linux | Detección de fuerza bruta SSH |
| Cambios en archivos web | Detección de modificación del portal |
| Eventos de autenticación AD | Detección de fallos 4625 |
| Cambios de cuentas AD | Eventos 4720/4738 |
| Bloqueos firewall | Evidencia de segmentación |
| Errores Apache | Actividad anómala web |

---

## 6. Relación con NIS2

La monitorización ayuda a cubrir:

- Gestión de incidentes.
- Detección temprana.
- Evidencia de controles.
- Trazabilidad.
- Mejora continua.

## Integración pfSense-Wazuh

La integración directa de logs de pfSense en Wazuh mediante syslog remoto queda fuera del alcance técnico implementado en esta fase del laboratorio.

Durante el proyecto se ha priorizado la monitorización de endpoints críticos mediante agentes Wazuh en:

- WEB01.
- DB01.
- DC01.

La integración de pfSense se mantiene como mejora futura para centralizar eventos de firewall, bloqueos interzona e intentos de acceso no autorizado a la WebGUI.

### Estado

| Control | Estado |
|---|---|
| Agentes Wazuh en endpoints | Implantado |
| Monitorización WEB01 | Implantado |
| Monitorización DB01 | Implantado |
| Monitorización DC01 | Implantado |
| Logs pfSense en Wazuh | Pendiente |
| Alertas firewall en Wazuh | Pendiente |

### Justificación

La integración pfSense-Wazuh requiere configuración adicional de syslog remoto, publicación de puertos en el despliegue Docker y ajuste de decodificación de eventos. Se deja documentada como mejora futura para una fase posterior del laboratorio.