# Matriz de cumplimiento inicial NIS2

## 1. Objetivo

Evaluar el estado inicial de cumplimiento del laboratorio frente a las áreas principales de NIS2.

---

## 2. Escala de cumplimiento

| Estado | Descripción |
|---|---|
| No cumple | No existe medida o es claramente insuficiente |
| Parcial | Existe medida básica, incompleta o no probada |
| Cumple | Medida implantada y evidenciada |
| No evaluado | Pendiente de revisión |

---

## 3. Evaluación inicial

| Área NIS2 | Estado inicial | Evidencia | Principales hallazgos |
|---|---|---|---|
| Gestión de riesgos | Parcial | Auditoría inicial en curso | Falta matriz formal consolidada |
| Gestión de incidentes | No cumple | Sin IRP/SIEM inicial | Sin procedimiento ni monitorización central |
| Continuidad de negocio | No cumple | DB01 sin backup | Sin prueba de restauración |
| Cadena de suministro | No cumple | Sin registro proveedores | No evaluado formalmente |
| Desarrollo seguro | No cumple | WEB01 vulnerable | SQLi, XSS, credenciales en código |
| Evaluación de controles | Parcial | Nmap/Nikto/Gobuster | Auditoría inicial sí, reauditoría pendiente |
| Higiene cibernética | Parcial | Hardening no aplicado | Apache/PHP/DB/AD sin endurecer |
| Criptografía | No cumple | HTTP, DB sin TLS | Sin HTTPS ni TLS DB |
| Control de acceso | No cumple | SQLi login, AD débil | Bypass login, contraseñas comunes |
| Gestión de activos | Parcial | Inventario técnico inicial | Falta clasificación formal |
| MFA/comunicaciones seguras | No cumple | Sin MFA | Sin MFA en accesos críticos |
| Monitorización/logging | Parcial/No cumple | Logs locales | Sin Wazuh/SIEM todavía |

---

## 4. Conclusión

El estado inicial muestra un cumplimiento bajo frente a NIS2. El laboratorio dispone de servicios funcionales, pero las medidas de seguridad son inmaduras o inexistentes en varios dominios clave.

Las áreas prioritarias de mejora son:

- Seguridad de aplicación web.
- Control de acceso.
- Cifrado de comunicaciones.
- Segmentación de red.
- Backups y continuidad.
- Gestión de vulnerabilidades.
- Monitorización.
- Gestión de incidentes.

## 5. Relación con análisis de riesgos

El análisis de riesgos inicial identifica 20 riesgos principales, de los cuales una parte significativa se clasifica como crítica o alta.

Las áreas con mayor exposición son:

| Área | Riesgos principales |
|---|---|
| Desarrollo seguro | R-001, R-002, R-003 |
| Criptografía | R-004, R-014 |
| Control de acceso | R-001, R-005, R-006, R-008, R-017 |
| Seguridad de redes | R-007, R-009, R-016 |
| Continuidad | R-013 |
| Gestión de incidentes | R-018 |
| Gestión de vulnerabilidades | R-015, R-020 |

Estos riesgos justifican el estado inicial de cumplimiento bajo frente a NIS2.

## 6. Mejora de cumplimiento tras hardening AD

| Área NIS2 | Estado inicial | Estado tras hardening AD | Observación |
|---|---|---|---|
| Control de acceso | No cumple | Parcial | Política de contraseñas reforzada y cambio obligatorio |
| Higiene cibernética | Parcial | Parcial/Cumple parcialmente | Se aplican controles básicos de identidad |
| Gestión de vulnerabilidades | Parcial | Parcial | Se reducen debilidades críticas AD |
| Evaluación de controles | Parcial | Parcial | Se realiza reauditoría |
| MFA | No cumple | Parcial/documental | Estrategia definida, pendiente implantación |
| Monitorización | Parcial/No cumple | Parcial | Auditoría configurada, pendiente SIEM |

## 7. Mejora de cumplimiento tras implantación de Wazuh

| Área NIS2 | Estado inicial | Estado tras Wazuh | Observación |
|---|---|---|---|
| Gestión de incidentes | No cumple | Parcial | Existe monitorización inicial |
| Monitorización/logging | Parcial/No cumple | Parcial | Agentes en WEB01, DB01 y DC01 |
| Evaluación de controles | Parcial | Parcial | Se generan eventos de prueba |
| Seguridad de sistemas | Parcial | Parcial | Se monitorizan activos críticos |
| Continuidad | Parcial | Parcial | Se monitoriza backup DB01 parcialmente |

## 8. Mejora de cumplimiento tras procedimiento de incidentes

| Área NIS2 | Estado inicial | Estado tras procedimiento | Observación |
|---|---|---|---|
| Gestión de incidentes | No cumple | Parcial | Procedimiento inicial creado |
| Monitorización/logging | Parcial | Parcial | Wazuh genera eventos |
| Evaluación de controles | Parcial | Parcial | Casos de uso documentados |
| Gobierno de seguridad | Parcial | Parcial | Roles y flujo definidos |
| Continuidad | No cumple/Parcial | Parcial | Procedimiento contempla recuperación |

## 9. Mejora tras simulacro de respuesta a incidentes

| Área NIS2 | Estado antes | Estado tras simulacro | Observación |
|---|---|---|---|
| Gestión de incidentes | Parcial | Parcial mejorado | Simulacro ejecutado |
| Monitorización | Parcial | Parcial validado | Wazuh detecta evento |
| Contención | Parcial | Parcial validado | pfSense usado para bloqueo |
| Evaluación de controles | Parcial | Parcial validado | Se prueba detección y respuesta |
| Mejora continua | Parcial | Parcial | Lecciones aprendidas documentadas |