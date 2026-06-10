
# Reauditoría de respuesta a incidentes

## 1. Objetivo

Verificar la eficacia inicial del procedimiento de respuesta a incidentes mediante un simulacro controlado.

---

## 2. Simulacro ejecutado

| Campo | Valor |
|---|---|
| ID | INC-0008 |
| Tipo | Fuerza bruta SSH simulada |
| Sistema | WEB01 |
| Origen | KALI01 |
| Herramienta de detección | Wazuh |
| Contención | pfSense |

---

## 3. Capacidades evaluadas

| Capacidad | Resultado esperado |
|---|---|
| Detección | Wazuh genera evento |
| Evidencia local | auth.log registra intentos |
| Clasificación | Incidente INC-AUTH Media |
| Contención | Bloqueo en pfSense |
| Verificación | Puerto 22 filtrado |
| Registro | INC-0008 documentado |
| Cierre | Lecciones aprendidas |

---

## 4. Evidencias generadas

| Evidencia | Descripción |
|---|---|
| `web01_auth_log_post_incidente.txt` | Log local WEB01 |
| `web01_auth_usuariofalso.txt` | Intentos con usuario inexistente |
| `inc_0008_wazuh_web01_ssh_failed_01.png` | Detección en Wazuh |
| `inc_0008_pfsense_block_rule_kali_web01_ssh.png` | Regla de contención |
| `web01_ssh_after_containment.nmap` | Verificación Nmap |
| `inc_0008_pfsense_log_block_ssh.png` | Log bloqueo firewall |

---

## 5. Resultado

El simulacro valida que el laboratorio dispone de una capacidad inicial de respuesta a incidentes basada en:

- Monitorización con Wazuh.
- Evidencia local.
- Contención mediante pfSense.
- Registro formal del incidente.
- Cierre documentado.

---

## 6. Riesgo residual

| Riesgo | Estado |
|---|---|
| Respuesta manual | Pendiente automatización |
| Alertas por umbral | Pendiente afinado Wazuh |
| Notificación externa | Pendiente procedimiento formal avanzado |
| Integración pfSense-Wazuh | Pendiente |
| Métricas MTTD/MTTR | Pendiente |

---

## 7. Conclusión

La reauditoría confirma que el procedimiento inicial de respuesta a incidentes es funcional para un escenario controlado de autenticación fallida repetida.

Quedan pendientes mejoras de automatización, correlación y notificación.