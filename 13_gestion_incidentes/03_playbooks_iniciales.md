# Playbooks iniciales de respuesta a incidentes

## 1. Objetivo

Definir playbooks básicos de actuación ante eventos detectados por Wazuh y otros controles del laboratorio.

---

# Playbook IR-001 — Fuerza bruta SSH

## Detección

Fuente:

- Wazuh.
- `/var/log/auth.log`.
- Alertas de múltiples intentos fallidos.

## Sistemas afectados

- WEB01.
- DB01.

## Severidad inicial

Media. Alta si hay múltiples intentos o acceso exitoso posterior.

## Acciones

1. Identificar IP origen.
2. Revisar número de intentos.
3. Verificar si hubo autenticación exitosa.
4. Bloquear IP en pfSense si procede.
5. Revisar usuarios afectados.
6. Revisar integridad del sistema.
7. Documentar evidencias.

## Evidencias

- Captura Wazuh.
- Extracto `auth.log`.
- Regla firewall aplicada.
- Resultado de revisión de sesiones.

---

# Playbook IR-002 — Cambio no autorizado en archivos web

## Detección

Fuente:

- Wazuh FIM.
- Cambios en `/var/www/html`.

## Sistemas afectados

- WEB01.

## Severidad inicial

Alta si el cambio no está autorizado.

## Acciones

1. Identificar archivo modificado.
2. Validar fecha, usuario y proceso.
3. Comparar con backup o repositorio.
4. Aislar WEB01 si hay indicios de compromiso.
5. Restaurar archivo legítimo.
6. Revisar logs Apache y auth.
7. Crear acción correctiva.

## Evidencias

- Evento Wazuh FIM.
- Hash antes/después si disponible.
- Copia del archivo modificado.
- Logs de acceso.

---

# Playbook IR-003 — Evento 4625 repetido en DC01

## Detección

Fuente:

- Wazuh.
- Windows Security Event ID 4625.

## Sistemas afectados

- DC01.
- Cuentas de dominio.

## Severidad inicial

Media. Alta si hay múltiples cuentas o origen externo.

## Acciones

1. Identificar usuario objetivo.
2. Identificar IP origen.
3. Revisar frecuencia de intentos.
4. Comprobar si hubo evento 4624 posterior.
5. Bloquear origen si procede.
6. Forzar cambio de contraseña si hay riesgo.
7. Revisar cuentas privilegiadas.

## Evidencias

- Evento 4625.
- Eventos 4624 relacionados.
- Captura Wazuh.
- Acción tomada.

---

# Playbook IR-004 — Creación inesperada de usuario AD

## Detección

Fuente:

- Wazuh.
- Windows Security Event ID 4720.

## Sistemas afectados

- DC01.
- Active Directory.

## Severidad inicial

Alta.

## Acciones

1. Identificar usuario creado.
2. Identificar cuenta que realizó la acción.
3. Verificar si el cambio estaba autorizado.
4. Deshabilitar cuenta si no está autorizada.
5. Revisar grupos asignados.
6. Revisar actividad posterior.
7. Documentar incidente.

## Evidencias

- Evento 4720.
- Estado del usuario.
- Miembros de grupos.
- Captura Wazuh.

---

# Playbook IR-005 — Acceso a ruta protegida en WEB01

## Detección

Fuente:

- Wazuh.
- Apache access/error log.
- Acceso a `/includes/`.

## Sistemas afectados

- WEB01.

## Severidad inicial

Baja o media según frecuencia/origen.

## Acciones

1. Identificar IP origen.
2. Revisar user-agent.
3. Revisar otras rutas consultadas.
4. Determinar si es escaneo o acceso aislado.
5. Bloquear origen si hay patrón agresivo.
6. Revisar reglas Apache.
7. Documentar.

## Evidencias

- Apache access.log.
- Evento Wazuh.
- Captura de dashboard.