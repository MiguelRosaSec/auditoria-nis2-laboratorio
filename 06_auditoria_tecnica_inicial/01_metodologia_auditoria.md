# Metodología de auditoría técnica inicial

## 1. Objetivo

Definir la metodología utilizada para realizar la auditoría técnica inicial del laboratorio NIS2 de AlmeriaLogiTech S.L.

---

## 2. Alcance técnico

La auditoría inicial incluirá:

| Sistema | IP | Área |
|---|---|---|
| FW01 | 10.10.10.1 / 10.10.20.1 / 10.10.50.1 | Firewall |
| DC01 | 10.10.10.10 | Active Directory/DNS |
| DB01 | 10.10.10.30 | Base de datos |
| WEB01 | 10.10.20.10 | Web/App |
| KALI01 | 10.10.50.10 | Máquina auditora |

---

## 3. Principios de la auditoría

La auditoría se realizará bajo los siguientes principios:

- Entorno propio y controlado.
- No afectación a terceros.
- Pruebas limitadas al laboratorio.
- Evidencias documentadas.
- Trazabilidad de comandos.
- Clasificación de hallazgos por criticidad.
- Mapeo posterior contra NIS2.
- Remediación y reauditoría.

---

## 4. Fases

| Fase | Descripción |
|---|---|
| 1 | Descubrimiento de hosts |
| 2 | Enumeración de puertos y servicios |
| 3 | Auditoría web |
| 4 | Auditoría de base de datos |
| 5 | Auditoría de Active Directory |
| 6 | Auditoría de firewall y segmentación |
| 7 | Consolidación de hallazgos |
| 8 | Mapeo contra NIS2 |
| 9 | Plan de remediación |

---

## 5. Herramientas

| Herramienta | Uso |
|---|---|
| Nmap | Descubrimiento y enumeración |
| Nikto | Auditoría web básica |
| WhatWeb | Identificación de tecnologías |
| OWASP ZAP | Auditoría web dinámica |
| Burp Suite | Pruebas manuales |
| sqlmap | Validación controlada SQLi |
| testssl.sh | Evaluación TLS |
| smbclient | Pruebas SMB |
| ldap-utils | Pruebas LDAP |
| PingCastle/Purple Knight | Auditoría AD desde Windows |

---

## 6. Clasificación de severidad

| Severidad | Criterio |
|---|---|
| Crítica | Explotable, impacto alto y afecta sistemas críticos |
| Alta | Impacto relevante sobre confidencialidad, integridad o disponibilidad |
| Media | Debilidad significativa con mitigantes |
| Baja | Riesgo limitado o mejora técnica |
| Observación | Buena práctica o recomendación |

---

## 7. Evidencias

Cada hallazgo deberá estar soportado por:

- Comando ejecutado.
- Fecha de ejecución.
- Sistema origen.
- Sistema destino.
- Resultado obtenido.
- Captura o salida de herramienta.
- Interpretación técnica.
- Riesgo asociado.
- Requisito NIS2 relacionado.