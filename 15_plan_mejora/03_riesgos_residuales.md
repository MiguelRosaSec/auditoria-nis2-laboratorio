# Registro de riesgos residuales

## 1. Objetivo

Documentar los riesgos que permanecen tras las medidas de remediación aplicadas durante el proyecto.

---

## 2. Riesgos residuales técnicos

| ID | Riesgo residual | Motivo | Nivel residual | Tratamiento |
|---|---|---|---|---|
| RR-001 | Tráfico HTTP en WEB01 | HTTPS no implantado | Alto | Reducir |
| RR-002 | Cookie sin atributo Secure | Depende de HTTPS | Alto | Reducir |
| RR-003 | MariaDB sin TLS | Comunicación interna no cifrada | Medio | Evaluar/Reducir |
| RR-004 | MFA no implantado | Solo estrategia documental | Alto | Reducir |
| RR-005 | Modelo Tier incompleto | Grupos creados sin delegación completa | Medio/Alto | Reducir |
| RR-006 | pfSense no integrado en Wazuh | Logs firewall no centralizados | Medio | Reducir |
| RR-007 | Wazuh sin alertas avanzadas | Solo casos básicos | Medio | Reducir |
| RR-008 | Backups en mismo entorno | Sin BCK01 dedicado | Alto | Reducir |
| RR-009 | Retención de logs no formalizada | No existe política detallada | Medio | Reducir |
| RR-010 | Sin alta disponibilidad | Servicios únicos | Medio/Alto | Aceptar temporalmente/Reducir |

---

## 3. Riesgos residuales organizativos

| ID | Riesgo residual | Motivo | Nivel residual | Tratamiento |
|---|---|---|---|---|
| RR-ORG-001 | Política de seguridad no aprobada formalmente | Documento pendiente | Medio/Alto | Reducir |
| RR-ORG-002 | Notificación NIS2 no formalizada | Procedimiento pendiente | Alto | Reducir |
| RR-ORG-003 | Formación no implantada | Plan pendiente | Medio/Alto | Reducir |
| RR-ORG-004 | Cadena de suministro no evaluada | Registro proveedores pendiente | Medio | Reducir |
| RR-ORG-005 | RTO/RPO no aprobados | BIA pendiente | Alto | Reducir |
| RR-ORG-006 | Auditorías periódicas no planificadas | Plan anual pendiente | Medio | Reducir |

---

## 4. Aceptación temporal

Algunos riesgos se aceptan temporalmente durante el laboratorio por limitaciones de alcance:

| Riesgo | Justificación |
|---|---|
| Alta disponibilidad no implantada | Laboratorio local con recursos limitados |
| MFA no implantado técnicamente | Requiere solución adicional |
| pfSense-Wazuh pendiente | Integración compleja fuera de fase |
| TLS MariaDB pendiente | Riesgo reducido por segmentación |
| BCK01 pendiente | Se priorizó backup local y restore |

---

## 5. Conclusión

El entorno presenta una reducción significativa de riesgos críticos, pero conserva riesgos residuales que deben ser tratados en siguientes fases para avanzar hacia un nivel de madurez superior.