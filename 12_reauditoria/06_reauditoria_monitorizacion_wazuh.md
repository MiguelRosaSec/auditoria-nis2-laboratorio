# Reauditoría de monitorización Wazuh

## 1. Objetivo

Verificar que la plataforma Wazuh recoge eventos de seguridad desde los sistemas críticos del laboratorio.

---

## 2. Alcance

| Sistema | Tipo de eventos |
|---|---|
| WEB01 | SSH, Apache, FIM |
| DB01 | SSH, MariaDB, backups |
| DC01 | Windows Security, Active Directory |
| MON01 | Estado de agentes |

---

## 3. Validaciones realizadas

| Validación | Resultado esperado |
|---|---|
| Agentes activos | WEB01, DB01 y DC01 activos |
| SSH fallido WEB01 | Evento detectado |
| SSH fallido DB01 | Evento detectado |
| Acceso `/includes/` | Evento Apache detectado |
| Backup DB01 | Evento de actividad/FIM |
| Login fallido DC01 | Evento 4625 |
| Creación usuario AD | Evento 4720 |
| Borrado usuario AD | Evento 4726 |

---

## 4. Estado de cumplimiento

| Control | Estado |
|---|---|
| Monitorización centralizada | Implantada parcialmente |
| Detección de autenticación fallida | Validada |
| Detección de eventos web | Validada |
| Detección de eventos AD | Validada |
| FIM en activos críticos | Parcial |
| Gestión de incidentes | Pendiente procedimiento completo |

---

## 5. Riesgo residual

| Riesgo | Estado |
|---|
| Afinado de reglas Wazuh | Pendiente |
| Integración pfSense logs | Pendiente |
| Playbooks de respuesta | Pendiente |
| Retención formal de logs | Pendiente |
| Alertas por correo/Telegram | Pendiente |

---

## 6. Conclusión

La reauditoría confirma que Wazuh proporciona una primera capacidad de monitorización y detección sobre los activos críticos.

La solución queda implantada de forma inicial, pendiente de afinado, integración de firewall y procedimientos de respuesta.

| Integración pfSense-Wazuh | Pendiente | No implementada en esta fase |

La monitorización implantada cubre los activos WEB01, DB01 y DC01 mediante agentes Wazuh. La integración de logs pfSense queda identificada como mejora futura para ampliar la visibilidad de red.