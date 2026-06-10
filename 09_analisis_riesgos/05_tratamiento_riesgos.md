# Tratamiento inicial de riesgos

## 1. Objetivo

Definir el tratamiento recomendado para los riesgos identificados durante la auditoría inicial.

---

## 2. Tratamiento por riesgo

| ID Riesgo | Nivel | Tratamiento | Acción principal | Responsable simulado | Prioridad |
|---|---|---|---|---|---|
| R-001 | Crítico | Reducir | Corregir SQL Injection en login | Desarrollo/IT | P1 |
| R-002 | Crítico | Reducir | Corregir SQL Injection en buscador | Desarrollo/IT | P1 |
| R-003 | Crítico | Reducir | Corregir XSS y endurecer cookies | Desarrollo/IT | P1 |
| R-004 | Crítico | Reducir | Activar HTTPS | IT/Sistemas | P1 |
| R-005 | Crítico | Reducir | Restringir MariaDB por origen/firewall | Sistemas/DBA | P1 |
| R-006 | Crítico | Reducir | Aplicar mínimo privilegio a appuser | DBA | P1 |
| R-007 | Crítico | Reducir | Restringir exposición AD desde AUDIT | Sistemas/Seguridad | P1 |
| R-008 | Crítico | Reducir | Contraseñas únicas y política robusta | IT/Identidad | P1 |
| R-009 | Crítico | Reducir | Endurecer reglas interzona | Redes/Seguridad | P1 |
| R-010 | Alto | Reducir | Limitar WebGUI pfSense | Redes/Seguridad | P2 |
| R-011 | Crítico | Reducir | Desactivar directory indexing | Sistemas/Web | P1 |
| R-012 | Medio | Reducir | Añadir cabeceras HTTP seguras | Sistemas/Web | P3 |
| R-013 | Alto | Reducir | Implantar backups y prueba restore | Sistemas | P2 |
| R-014 | Alto | Reducir | Activar TLS DB o restringir tráfico | Sistemas/DBA | P2 |
| R-015 | Alto | Reducir | Validar parches Apache | Sistemas/Web | P2 |
| R-016 | Alto | Reducir | Restringir regla AUDIT temporal | Seguridad | P2 |
| R-017 | Crítico | Reducir | HttpOnly/Secure/SameSite | Desarrollo/IT | P1 |
| R-018 | Alto | Reducir | Crear IRP y monitorización | Seguridad | P2 |
| R-019 | Alto | Reducir | Restringir SSH por origen | Sistemas | P2 |
| R-020 | Crítico | Reducir | Plan integral de adecuación NIS2 | Dirección/Seguridad | P1 |

---

## 3. Acciones inmediatas recomendadas

| Prioridad | Acción |
|---|---|
| P1 | Corregir SQL Injection en login y buscador |
| P1 | Corregir XSS reflejado |
| P1 | Activar HTTPS |
| P1 | Restringir MariaDB solo a WEB01/APP01 |
| P1 | Aplicar mínimo privilegio al usuario de base de datos |
| P1 | Endurecer reglas de pfSense |
| P1 | Corregir contraseñas comunes en AD |
| P2 | Implantar backups de DB01 |
| P2 | Limitar SSH por origen |
| P2 | Desactivar directory indexing |
| P2 | Aplicar hardening Apache/PHP |
| P2 | Crear procedimiento de respuesta a incidentes |
| P3 | Cabeceras de seguridad HTTP |
| P3 | Monitorización y alertas |
| P3 | Registro de proveedores y políticas documentales |

---

## 4. Conclusión

La mayoría de riesgos críticos se concentran en tres áreas:

1. Aplicación web.
2. Base de datos.
3. Segmentación y control de acceso.

La remediación debe comenzar por las vulnerabilidades explotables confirmadas y por los controles que reducen mayor impacto de forma inmediata.