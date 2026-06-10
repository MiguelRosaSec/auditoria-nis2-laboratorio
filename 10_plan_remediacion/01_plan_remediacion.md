# Plan de remediación inicial

## 1. Objetivo

Definir el plan inicial de remediación para corregir los hallazgos técnicos y organizativos identificados durante la auditoría inicial del laboratorio NIS2 de AlmeriaLogiTech S.L.

---

## 2. Alcance

El plan cubre las siguientes áreas:

- Aplicación web.
- Servidor web.
- Base de datos.
- Active Directory.
- Firewall y segmentación.
- Cifrado de comunicaciones.
- Backups y continuidad.
- Monitorización.
- Gestión de incidentes.
- Documentación de cumplimiento.

---

## 3. Criterios de prioridad

| Prioridad | Criterio | Plazo objetivo |
|---|---|---|
| P1 | Riesgo crítico o explotable de forma directa | 0-15 días |
| P2 | Riesgo alto o control estructural relevante | 15-30 días |
| P3 | Mejora de seguridad o madurez | 30-60 días |
| P4 | Buena práctica o mejora documental | 60-90 días |

---

## 4. Resumen ejecutivo del plan

La auditoría inicial evidencia riesgos críticos en la aplicación web, la base de datos, la segmentación de red y el control de acceso.

Las acciones prioritarias deben centrarse en:

1. Corregir SQL Injection.
2. Corregir XSS reflejado.
3. Activar HTTPS.
4. Endurecer cookies de sesión.
5. Restringir acceso a MariaDB.
6. Aplicar mínimo privilegio en base de datos.
7. Endurecer reglas de pfSense.
8. Corregir debilidades de Active Directory.
9. Implantar backups.
10. Preparar monitorización e incident response.

---

## 5. Matriz resumen de remediación

| ID Acción | Hallazgo/Riesgo | Acción correctiva | Prioridad | Responsable | Plazo | Estado |
|---|---|---|---|---|---|---|
| REM-001 | WEB-H11 / R-001 | Corregir SQLi en login | P1 | Desarrollo/IT | 15 días | Cerrada |
| REM-002 | WEB-H12 / R-002 | Corregir SQLi en buscador | P1 | Desarrollo/IT | 15 días | Cerrada |
| REM-003 | WEB-H13 / R-003 | Corregir XSS reflejado | P1 | Desarrollo/IT | 15 días | Cerrada |
| REM-004 | WEB-H01 / R-004 | Activar HTTPS | P1 | Sistemas | 15 días | Pendiente |
| REM-005 | WEB-H03 / R-017 | Endurecer cookies de sesión | P1 | Desarrollo/IT | 15 días | Parcial |
| REM-006 | DB-H01/R-005 | Restringir exposición MariaDB | P1 | Sistemas/DBA | 15 días | Cerrada |
| REM-007 | DB-H02/R-005 | Restringir origen de appuser | P1 | DBA | 15 días | Cerrada |
| REM-008 | DB-H03/R-006 | Aplicar mínimo privilegio a appuser | P1 | DBA | 15 días | Cerrada |
| REM-009 | NET-H01/FW-H02/R-009 | Endurecer reglas AUDIT | P1 | Redes/Seguridad | 15 días |Cerrada |
| REM-010 | AD-H03/R-008 | Eliminar contraseña común inicial | P1 | Identidad/IT | 15 días | Cerrada |
| REM-011 | AD-H04/R-008 | Forzar cambio de contraseña al iniciar sesión | P1 | Identidad/IT | 15 días | Cerrada |
| REM-012 | WEB-H06/R-011 | Desactivar directory indexing | P1 | Sistemas/Web | 15 días | Cerrada |
| REM-013 | DB-H05/R-013 | Implantar backup de DB01 | P2 | Sistemas | 30 días | Cerrada |
| REM-014 | FW-H01/R-009 | Aplicar política deny-by-default interzona | P2 | Redes/Seguridad | 30 días | Cerrada |
| REM-015 | AD-H05/R-008 | Endurecer política de contraseñas AD | P2 | Identidad/IT | 30 días | Cerrada |
| REM-016 | WEB-H02/R-012 | Configurar cabeceras HTTP seguras | P2 | Sistemas/Web | 30 días | Cerrada |
| REM-017 | WEB-H04/R-015 | Ocultar versión Apache | P2 | Sistemas/Web | 30 días | Cerrada |
| REM-018 | WEB-H05/R-015 | Validar y actualizar Apache | P2 | Sistemas/Web | 30 días | Realizada |
| REM-019 | DB-H04/R-014 | Evaluar TLS en MariaDB | P2 | DBA/Sistemas | 30 días | Pendiente |
| REM-020 | R-018 | Crear procedimiento de respuesta a incidentes | P2 | Seguridad | 30 días | Cerrada/pendiente |
| REM-021 | R-018 | Desplegar monitorización inicial | P3 | Seguridad/Sistemas | 60 días | Cerrada |
| REM-022 | DB-H06/R-005 | Activar UFW restrictivo en DB01 | P2 | Sistemas | 30 días | Cerrada |
| REM-023 | R-019 | Restringir SSH por origen | P2 | Sistemas/Redes | 30 días | Cerrada |
| REM-024 | AD-H06 | Definir estrategia MFA | P3 | Seguridad/Identidad | 60 días | Parcial |
| REM-025 | Cumplimiento NIS2 | Actualizar matriz de cumplimiento tras remediación | P3 | Consultor/Auditor | 60 días | Pendiente |

---

## 6. Evidencias esperadas

Para cerrar acciones será necesario generar evidencias como:

- Código corregido.
- Capturas de configuración.
- Nuevas salidas de Nmap.
- Nuevas salidas de Nikto.
- Pruebas SQLi fallidas tras corrección.
- Pruebas XSS neutralizadas.
- Configuración HTTPS.
- Reglas pfSense endurecidas.
- Grants actualizados de MariaDB.
- Política de contraseñas AD.
- Logs de backup.
- Prueba de restauración.
- Matriz de cumplimiento actualizada.

---

## 7. Resultado esperado

Tras ejecutar el plan de remediación, se espera reducir los riesgos críticos y altos, mejorar el cumplimiento NIS2 y generar evidencias para la reauditoría.