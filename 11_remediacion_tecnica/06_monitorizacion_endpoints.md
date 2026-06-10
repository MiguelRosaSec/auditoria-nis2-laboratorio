
# Monitorización de endpoints críticos

## 1. Objetivo

Configurar la recogida de eventos de seguridad desde WEB01, DB01 y DC01 mediante agentes Wazuh.

---

## 2. Casos de uso iniciales

| Caso de uso | Sistema | Evidencia esperada |
|---|---|---|
| SSH fallido | WEB01/DB01 | Evento auth.log |
| Acceso web | WEB01 | Evento Apache |
| Error web | WEB01 | Apache error.log |
| Cambio backup | DB01 | Evento FIM |
| Login fallido Windows | DC01 | Evento 4625 |
| Gestión de cuentas | DC01 | Eventos 4720/4738 |
| Cambio de política | DC01 | Eventos 4719/4739 |

---

## 3. Estado esperado

| Sistema | Estado |
|---|---|
| WEB01 | Agente activo |
| DB01 | Agente activo |
| DC01 | Agente activo |

---

## 4. Riesgo reducido

La monitorización reduce el riesgo asociado a falta de detección y mejora la capacidad de respuesta ante incidentes.