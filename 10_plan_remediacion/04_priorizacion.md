# Priorización del plan de remediación

## 1. Objetivo

Establecer el orden recomendado de ejecución de las acciones correctivas.

---

## 2. Criterios de priorización

La priorización se basa en:

- Severidad del hallazgo.
- Nivel de riesgo.
- Explotabilidad.
- Impacto sobre activos críticos.
- Dependencias entre acciones.
- Relación con NIS2.
- Facilidad de implementación.
- Reducción inmediata del riesgo.

---

## 3. Fase 1 — Remediación crítica inmediata

Plazo recomendado: 0-15 días.

| Orden | Acción | Motivo |
|---|---|---|
| 1 | Corregir SQL Injection en login | Riesgo crítico de acceso no autorizado |
| 2 | Corregir SQL Injection en buscador | Riesgo crítico de exposición de datos |
| 3 | Corregir XSS reflejado | Riesgo alto sobre sesiones |
| 4 | Endurecer cookies de sesión | Reduce robo de sesión |
| 5 | Desactivar directory indexing | Reduce exposición interna |
| 6 | Activar HTTPS | Protege credenciales y sesiones |
| 7 | Restringir MariaDB por origen | Reduce exposición de datos |
| 8 | Aplicar mínimo privilegio en DB | Reduce impacto |
| 9 | Endurecer regla AUDIT | Reduce exposición lateral |
| 10 | Corregir contraseñas comunes AD | Reduce riesgo identidad |

---

## 4. Fase 2 — Remediación alta estructural

Plazo recomendado: 15-30 días.

| Orden | Acción | Motivo |
|---|---|---|
| 1 | Política deny-by-default en pfSense | Control interzona |
| 2 | Endurecer política de contraseñas AD | Control de identidad |
| 3 | Restringir exposición AD desde AUDIT | Protección DC01 |
| 4 | Restringir SSH por origen | Reducción superficie |
| 5 | Activar UFW en servidores | Defensa local |
| 6 | Validar parches Apache/PHP | Gestión vulnerabilidades |
| 7 | Implantar backups DB01 | Continuidad |
| 8 | Probar restauración | Evidencia de recuperación |

---

## 5. Fase 3 — Madurez y cumplimiento

Plazo recomendado: 30-60 días.

| Orden | Acción | Motivo |
|---|---|---|
| 1 | Monitorización inicial | Detección |
| 2 | Procedimiento de respuesta a incidentes | Gestión incidentes |
| 3 | Registro de activos | Gestión activos |
| 4 | Registro de proveedores | Cadena suministro |
| 5 | Política de seguridad | Gobierno |
| 6 | Formación de usuarios | Higiene cibernética |
| 7 | Estrategia MFA | Control de acceso |
| 8 | Reauditoría técnica | Evaluación de eficacia |

---

## 6. Dependencias

| Acción | Depende de |
|---|---|
| Cookies Secure | HTTPS activo |
| HSTS | HTTPS validado |
| Reauditoría web | Corrección SQLi/XSS/HTTPS |
| Reauditoría DB | Restricción DB y permisos |
| Reauditoría red | Reglas pfSense endurecidas |
| Monitorización | Instalación de agentes/SIEM |
| Gestión incidentes | Definición de roles y logs |

---

## 7. Resultado esperado

La priorización permite ejecutar primero las acciones de mayor reducción de riesgo, manteniendo un orden lógico y verificable.