# Roadmap final de mejora NIS2

## 1. Objetivo

Definir una hoja de ruta final para continuar la mejora de seguridad y cumplimiento NIS2 de AlmeriaLogiTech S.L. tras la auditoría, remediación y reauditoría inicial.

---

## 2. Criterios de priorización

| Prioridad | Criterio |
|---|---|
| P1 | Riesgo crítico o alto, impacto directo en seguridad o cumplimiento |
| P2 | Mejora relevante de madurez técnica u organizativa |
| P3 | Optimización, automatización o mejora evolutiva |
| P4 | Mejora deseable o de largo plazo |

---

## 3. Roadmap por fases

### Fase 1 — Cierre de riesgos críticos pendientes

Horizonte recomendado: 0-30 días.

| ID | Acción | Riesgo tratado | Impacto | Esfuerzo | Responsable |
|---|---|---|---|---|---|
| RM-001 | Activar HTTPS en WEB01 | Credenciales y sesiones en claro | Alto | Medio | Sistemas/Web |
| RM-002 | Activar cookie `Secure` | Robo de sesión | Alto | Bajo | Desarrollo/Web |
| RM-003 | Implantar servidor BCK01 | Pérdida de datos | Alto | Medio | Sistemas |
| RM-004 | Automatizar backups | Recuperación incompleta | Alto | Medio | Sistemas/DBA |
| RM-005 | Definir procedimiento notificación NIS2 | Incumplimiento regulatorio | Alto | Medio | Seguridad/Dirección |
| RM-006 | Implantar MFA en accesos críticos | Compromiso de credenciales | Alto | Alto | Seguridad/Identidad |

---

### Fase 2 — Madurez operativa

Horizonte recomendado: 30-60 días.

| ID | Acción | Riesgo tratado | Impacto | Esfuerzo | Responsable |
|---|---|---|---|---|---|
| RM-007 | Afinar alertas Wazuh | Detección insuficiente | Medio/Alto | Medio | Seguridad |
| RM-008 | Crear dashboards Wazuh | Baja visibilidad | Medio | Medio | Seguridad |
| RM-009 | Integrar pfSense con Wazuh | Falta visibilidad firewall | Medio | Medio/Alto | Seguridad/Redes |
| RM-010 | Definir retención formal de logs | Pérdida de evidencias | Alto | Medio | Seguridad |
| RM-011 | Completar modelo Tier AD | Abuso de privilegios | Alto | Alto | Identidad |
| RM-012 | Revisar grupos privilegiados trimestralmente | Exceso de privilegios | Alto | Bajo | Identidad/Seguridad |

---

### Fase 3 — Gobierno y cumplimiento

Horizonte recomendado: 60-90 días.

| ID | Acción | Riesgo tratado | Impacto | Esfuerzo | Responsable |
|---|---|---|---|---|---|
| RM-013 | Formalizar política de seguridad | Gobierno incompleto | Alto | Medio | Dirección/Seguridad |
| RM-014 | Crear plan anual de auditoría | Falta mejora continua | Medio/Alto | Medio | Auditoría |
| RM-015 | Crear programa de formación | Error humano/phishing | Alto | Medio | RRHH/Seguridad |
| RM-016 | Crear registro de proveedores | Riesgo cadena suministro | Medio/Alto | Medio | Compras/Seguridad |
| RM-017 | Crear cuestionario proveedores | Riesgo terceros | Medio | Medio | Compras/Seguridad |
| RM-018 | Definir RTO/RPO formal | Continuidad insuficiente | Alto | Medio | Dirección/Sistemas |

---

### Fase 4 — Optimización avanzada

Horizonte recomendado: 90-180 días.

| ID | Acción | Riesgo tratado | Impacto | Esfuerzo | Responsable |
|---|---|---|---|---|---|
| RM-019 | TLS en MariaDB | Exposición de datos en tránsito | Medio | Medio | DBA/Sistemas |
| RM-020 | Alta disponibilidad servicios críticos | Caída de servicio | Alto | Alto | Sistemas |
| RM-021 | Simulacros periódicos IR | Respuesta inmadura | Alto | Medio | Seguridad |
| RM-022 | Automatización de despliegue IaC | Configuración inconsistente | Medio | Alto | DevOps |
| RM-023 | Vulnerability management periódico | Vulnerabilidades no detectadas | Alto | Medio | Seguridad |
| RM-024 | Revisión externa independiente | Validación objetiva | Alto | Alto | Auditor externo |

---

## 4. Priorización global

| Prioridad | Acciones |
|---|---|
| P1 | RM-001, RM-002, RM-003, RM-004, RM-005, RM-006 |
| P2 | RM-007, RM-009, RM-010, RM-011, RM-012, RM-018 |
| P3 | RM-008, RM-013, RM-014, RM-015, RM-016, RM-017 |
| P4 | RM-019, RM-020, RM-021, RM-022, RM-023, RM-024 |

---

## 5. Conclusión

El roadmap establece una continuidad lógica tras la auditoría y permite evolucionar desde un estado de cumplimiento parcial hacia un modelo de seguridad más maduro, medible y sostenible.