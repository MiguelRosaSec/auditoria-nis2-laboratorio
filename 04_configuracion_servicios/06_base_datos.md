# Configuración inicial de base de datos

## 1. Objetivo

Configurar el servicio MariaDB en DB01 para alojar la base de datos utilizada por el portal de clientes de AlmeriaLogiTech S.L.

---

## 2. Sistema

| Elemento | Valor |
|---|---|
| Servidor | DB01 |
| IP | 10.10.10.30 |
| Servicio | MariaDB |
| Puerto | 3306/TCP |
| Base de datos | almerialogitech |

---

## 3. Tablas creadas

| Tabla | Descripción |
|---|---|
| clientes | Clientes simulados |
| pedidos | Pedidos asociados a clientes |

---

## 4. Usuario de aplicación

| Usuario | Origen | Privilegios |
|---|---|---|
| appuser | % | ALL PRIVILEGES sobre almerialogitech |

---

## 5. Estado inicial inseguro

| Debilidad | Descripción | Riesgo |
|---|---|---|
| bind-address 0.0.0.0 | MariaDB escucha en todas las interfaces | Exposición innecesaria |
| appuser desde % | Usuario permitido desde cualquier origen | Acceso no controlado |
| ALL PRIVILEGES | Permisos excesivos | Impacto elevado ante compromiso |
| Sin TLS | Tráfico DB sin cifrado | Interceptación de credenciales/datos |
| Sin backups | No hay recuperación definida | Pérdida de disponibilidad/integridad |
| UFW inactivo | No hay filtrado local | Mayor superficie de ataque |

---

## 6. Justificación de laboratorio

Estas debilidades se introducen de forma controlada para permitir una auditoría técnica inicial, generar hallazgos, realizar análisis de riesgos y aplicar posteriormente medidas de remediación.

---

## 7. Relación con NIS2

La configuración de DB01 se relaciona con requisitos de NIS2 vinculados a:

- Seguridad de redes y sistemas.
- Gestión de riesgos.
- Control de acceso.
- Cifrado.
- Continuidad de negocio.
- Gestión de incidentes.
- Seguridad en adquisición, desarrollo y mantenimiento.