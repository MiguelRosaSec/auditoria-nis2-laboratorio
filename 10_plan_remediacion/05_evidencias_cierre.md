# Evidencias esperadas para cierre de remediación

## 1. Objetivo

Definir las evidencias necesarias para cerrar cada acción correctiva.

---

## 2. Evidencias técnicas

| Acción | Evidencia esperada |
|---|---|
| Corregir SQLi login | Captura o salida demostrando que el payload no autentica |
| Corregir SQLi buscador | Payload SQL no altera resultados |
| Corregir XSS | Payload aparece escapado como texto |
| Activar HTTPS | `curl -I https://...` con respuesta válida |
| Redirigir HTTP a HTTPS | `301/302` desde HTTP |
| Endurecer cookies | `Set-Cookie` con `HttpOnly`, `Secure`, `SameSite` |
| Cabeceras HTTP | `curl -I` mostrando CSP, X-Content-Type-Options, etc. |
| Desactivar directory indexing | `/includes/` devuelve 403 |
| Ocultar Apache | Cabecera Server sin versión detallada |
| Restringir MariaDB | Nmap desde AUDIT no muestra 3306 abierto |
| Mínimo privilegio DB | `SHOW GRANTS` limitado |
| Activar backup | Log de backup correcto |
| Probar restore | Captura/restauración verificada |
| Reglas pfSense | Captura reglas nuevas |
| Política AD | Captura GPO aplicada |
| Contraseñas AD | Usuarios sin contraseña común |
| Monitorización | Eventos recibidos en SIEM |

---

## 3. Evidencias documentales

| Acción | Evidencia |
|---|---|
| Procedimiento de incidentes | Documento IRP |
| Política de backups | Política aprobada |
| Registro de activos | Inventario actualizado |
| Registro de proveedores | Matriz proveedores |
| Política de control de acceso | Documento aprobado |
| Política de contraseñas | Documento aprobado |
| Matriz NIS2 actualizada | Nueva evaluación |
| Informe de reauditoría | Comparativa antes/después |