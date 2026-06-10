# Clasificación de incidentes de ciberseguridad

## 1. Objetivo

Definir una taxonomía inicial de incidentes de ciberseguridad para AlmeriaLogiTech S.L.

---

## 2. Categorías de incidentes

| Código | Categoría | Descripción |
|---|---|---|
| INC-AUTH | Autenticación | Intentos fallidos, fuerza bruta, cuentas bloqueadas |
| INC-WEB | Aplicación web | SQLi, XSS, acceso a rutas protegidas, errores Apache |
| INC-FIM | Integridad de archivos | Cambios no autorizados en archivos críticos |
| INC-AD | Active Directory | Creación/modificación de cuentas, grupos, GPO |
| INC-DB | Base de datos | Accesos anómalos, errores MariaDB, cambios de backup |
| INC-NET | Red/firewall | Bloqueos, escaneos, tráfico no autorizado |
| INC-MAL | Malware | Detección de malware o comportamiento anómalo |
| INC-AVAIL | Disponibilidad | Caída de servicio, DoS, saturación |
| INC-DATA | Datos | Exposición, pérdida o exfiltración de información |

---

## 3. Matriz de severidad

| Severidad | Descripción | Ejemplos |
|---|---|---|
| Crítica | Impacto grave o compromiso confirmado | Ransomware, exfiltración, DA comprometido |
| Alta | Explotación o acceso no autorizado probable | SQLi explotada, cuenta admin comprometida |
| Media | Intentos o actividad sospechosa relevante | Múltiples SSH fallidos, 4625 repetidos |
| Baja | Evento aislado sin impacto | Un intento fallido puntual |
| Informativa | Evento útil para contexto | Backup generado, login correcto |

---

## 4. Criterios de impacto

| Impacto | Descripción |
|---|---|
| Confidencialidad | Acceso o exposición de datos |
| Integridad | Modificación no autorizada |
| Disponibilidad | Interrupción de servicio |
| Legal/cumplimiento | Riesgo de incumplimiento NIS2 |
| Reputacional | Daño a confianza o imagen |
| Operativo | Afectación a procesos internos |

---

## 5. Priorización de respuesta

| Severidad | Tiempo objetivo de análisis | Tiempo objetivo de contención |
|---|---:|---:|
| Crítica | 1 hora | 2 horas |
| Alta | 4 horas | 8 horas |
| Media | 1 día | 2 días |
| Baja | 3 días | 5 días |
| Informativa | Según revisión periódica | No aplica |

---

## 6. Ejemplos aplicados al laboratorio

| Evento | Categoría | Severidad inicial |
|---|---|---|
| SQL Injection exitosa en WEB01 | INC-WEB | Crítica |
| XSS reflejado confirmado | INC-WEB | Alta |
| SSH fallido aislado | INC-AUTH | Baja |
| 10 SSH fallidos en 5 minutos | INC-AUTH | Media/Alta |
| Creación inesperada de usuario AD | INC-AD | Alta |
| Cambio en `/var/www/html` no autorizado | INC-FIM | Alta |
| Acceso a `/includes/` bloqueado | INC-WEB | Baja/Media |
| DB01 puerto 3306 accesible desde AUDIT | INC-NET | Alta |
| Backup generado correctamente | Informativa | Informativa |