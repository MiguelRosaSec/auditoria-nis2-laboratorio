# Casos de uso iniciales de detección en Wazuh

## 1. Objetivo

Validar que la plataforma Wazuh desplegada en MON01 detecta eventos relevantes de seguridad en los sistemas críticos del laboratorio.

---

## 2. Sistemas monitorizados

| Sistema | IP | Agente | Estado |
|---|---:|---|---|
| WEB01 | 10.10.20.10 | Wazuh Linux Agent | Activo |
| DB01 | 10.10.10.30 | Wazuh Linux Agent | Activo |
| DC01 | 10.10.10.10 | Wazuh Windows Agent | Activo |

---

## 3. Casos de uso ejecutados

| ID | Caso de uso | Sistema | Resultado esperado |
|---|---|---|---|
| WAZUH-UC01 | SSH fallido en WEB01 | WEB01 | Evento de autenticación fallida |
| WAZUH-UC02 | Acceso web a `/includes/` | WEB01 | Evento Apache 403 |
| WAZUH-UC03 | Cambio en archivo web | WEB01 | Evento FIM |
| WAZUH-UC04 | SSH fallido en DB01 | DB01 | Evento de autenticación fallida |
| WAZUH-UC05 | Backup generado | DB01 | Evento FIM/actividad backup |
| WAZUH-UC06 | Logon fallido Windows 4625 | DC01 | Evento de autenticación fallida |
| WAZUH-UC07 | Creación/eliminación usuario AD | DC01 | Eventos 4720/4726 |

---

## 4. Evidencias generadas

| Evidencia | Descripción |
|---|---|
| `wazuh_agents_active_initial.txt` | Agentes activos |
| `web01_auth_failed_ssh_local.txt` | SSH fallido local WEB01 |
| `web01_apache_access_test.txt` | Accesos Apache |
| `db01_auth_failed_ssh_local.txt` | SSH fallido local DB01 |
| `db01_backup_generated_test.txt` | Backup generado |
| `dc01_failed_logon_4625_local.txt` | Evento 4625 |
| `dc01_ad_user_created_audit_temp.txt` | Usuario temporal creado |
| Capturas dashboard Wazuh | Eventos detectados |

---

## 5. Relación con NIS2

Estos casos de uso demuestran capacidades de:

- Detección de incidentes.
- Monitorización continua.
- Trazabilidad.
- Investigación de eventos.
- Evaluación de eficacia de controles.
- Gestión de incidentes.