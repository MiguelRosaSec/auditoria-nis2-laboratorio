# Simulacro de incidente INC-0008 — Fuerza bruta SSH contra WEB01

## 1. Objetivo

Validar el procedimiento de respuesta a incidentes mediante un simulacro controlado de intentos repetidos de autenticación SSH contra WEB01.

---

## 2. Escenario

| Elemento | Valor |
|---|---|
| ID incidente | INC-0008 |
| Tipo | Intentos repetidos SSH |
| Categoría | INC-AUTH |
| Origen | KALI01 |
| IP origen | 10.10.50.10 |
| Destino | WEB01 |
| IP destino | 10.10.20.10 |
| Puerto | 22/TCP |
| Herramienta de detección | Wazuh |
| Contención | pfSense |

---

## 3. Fase 1 — Preparación

Antes del simulacro se valida:

- Agente WEB01 activo en Wazuh.
- Servicio SSH activo en WEB01.
- Reglas pfSense funcionales.
- Procedimiento IR-001 disponible.

---

## 4. Fase 2 — Ejecución del evento

Desde KALI01 se realizan varios intentos fallidos de SSH contra WEB01 usando un usuario inexistente.

```bash
ssh usuariofalso@10.10.20.10
```

## 5. Fase 3 — Detección

La actividad queda registrada en:

/var/log/auth.log de WEB01.
Alertas/eventos de Wazuh asociadas al agente WEB01.

Evidencias:

| Evidencia                           | Descripción                    |
| ----------------------------------- | ------------------------------ |
| `web01_auth_log_post_incidente.txt` | Log posterior al incidente     |
| `web01_auth_usuariofalso.txt`       | Filtro por usuario inexistente |
| Captura Wazuh                       | Evento detectado               |

## 6. Fase 4 — Clasificación

El incidente se clasifica como:

| Campo        | Valor                           |
| ------------ | ------------------------------- |
| Categoría    | INC-AUTH                        |
| Severidad    | Media                           |
| Impacto      | Intento de acceso no autorizado |
| Probabilidad | Media                           |
| Estado       | Confirmado controlado           |

## 7. Fase 5 — Contención

Se aplica una regla en pfSense para bloquear tráfico SSH desde KALI01 hacia WEB01.

| Campo   | Valor       |
| ------- | ----------- |
| Acción  | Block       |
| Origen  | HOST_KALI01 |
| Destino | HOST_WEB01  |
| Puerto  | 22/TCP      |
| Logging | Activado    |

## 8. Fase 6 — Verificación

Desde KALI01 se valida que el puerto SSH queda filtrado o no accesible.
```bash
nc -vz 10.10.20.10 22
sudo nmap -sS -Pn -p 22 10.10.20.10
```
Resultado esperado: 22/tcp filtered

## 9. Fase 7 — Cierre

El incidente se cierra tras comprobar:

Detección correcta en Wazuh.
Evidencia local en WEB01.
Contención aplicada en pfSense.
Verificación de bloqueo.
Registro en matriz de incidentes.

## 10. Lecciones aprendidas

| Lección                             | Mejora propuesta                     |
| ----------------------------------- | ------------------------------------ |
| Wazuh detecta intentos SSH fallidos | Crear alerta específica por umbral   |
| pfSense permite contención rápida   | Documentar regla temporal de bloqueo |
| auth.log aporta evidencia local     | Centralizar retención de logs        |
| Respuesta manual efectiva           | Automatizar playbooks en fase futura |

## 11. Relación con NIS2

Este simulacro evidencia capacidades relacionadas con:

Gestión de incidentes.
Detección y monitorización.
Contención.
Trazabilidad.
Evaluación de eficacia de controles.
Mejora continua.


