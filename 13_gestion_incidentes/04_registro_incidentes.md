# Registro inicial de incidentes

## 1. Objetivo

Mantener un registro trazable de incidentes y eventos relevantes detectados durante el laboratorio.

---

## 2. Formato de registro

| Campo | Descripción |
|---|---|
| ID incidente | Identificador único |
| Fecha/hora | Momento de detección |
| Detectado por | Wazuh, administrador, auditor |
| Sistema afectado | WEB01, DB01, DC01, etc. |
| Categoría | INC-AUTH, INC-WEB, INC-AD, etc. |
| Severidad | Crítica, Alta, Media, Baja, Informativa |
| Descripción | Resumen del evento |
| Evidencia | Captura/log asociado |
| Acción tomada | Contención, análisis, cierre |
| Estado | Abierto, En análisis, Contenido, Cerrado |
| Responsable | Rol asignado |

---

## 3. Registro inicial de eventos de prueba

| ID | Fecha | Sistema | Categoría | Severidad | Descripción | Estado |
|---|---|---|---|---|---|---|
| INC-0001 | 04/06/2026 | WEB01 | INC-AUTH | Baja | Intento SSH fallido controlado | Cerrado |
| INC-0002 | 04/06/2026 | WEB01 | INC-WEB | Baja/Media | Acceso controlado a `/includes/` | Cerrado |
| INC-0003 | 04/06/2026 | WEB01 | INC-FIM | Media | Cambio controlado en archivo web | Cerrado |
| INC-0004 | 04/06/2026 | DB01 | INC-AUTH | Baja | Intento SSH fallido controlado | Cerrado |
| INC-0005 | 04/06/2026 | DB01 | INC-DB | Informativa | Generación de backup | Cerrado |
| INC-0006 | 04/06/2026 | DC01 | INC-AUTH | Baja/Media | Evento 4625 controlado | Cerrado |
| INC-0007 | 04/06/2026 | DC01 | INC-AD | Media | Creación/eliminación de usuario temporal | Cerrado |

---

## 4. Plantilla de incidente

| Campo | Valor |
|---|---|
| ID incidente | INC-XXXX |
| Fecha/hora |  |
| Detectado por |  |
| Sistema afectado |  |
| Categoría |  |
| Severidad |  |
| Descripción |  |
| Evidencia |  |
| Acción tomada |  |
| Estado |  |
| Responsable |  |
| Lecciones aprendidas |  |


| INC-0008 | 04/06/2026 | WEB01 | INC-AUTH | Media | Intentos repetidos de SSH desde KALI01 contra WEB01 detectados por Wazuh | Cerrado |

## INC-0008 — Simulacro de fuerza bruta SSH contra WEB01

| Campo | Valor |
|---|---|
| ID incidente | INC-0008 |
| Fecha/hora | 09/06/2026 |
| Detectado por | Wazuh / auth.log |
| Sistema afectado | WEB01 |
| IP afectada | 10.10.20.10 |
| Origen | KALI01 / 10.10.50.10 |
| Categoría | INC-AUTH |
| Severidad | Media |
| Descripción | Intentos repetidos de autenticación SSH con usuario inexistente |
| Evidencia | Wazuh, auth.log, pfSense logs |
| Acción tomada | Bloqueo temporal de SSH desde KALI01 hacia WEB01 en pfSense |
| Estado | Cerrado |
| Responsable | Seguridad/Sistemas |
| Lecciones aprendidas | Wazuh detecta eventos de autenticación fallida y pfSense permite contención rápida por origen/destino/puerto |