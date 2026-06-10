# Configuración inicial del servidor web

## 1. Objetivo

Configurar WEB01 como servidor web de la empresa simulada AlmeriaLogiTech S.L., alojado en la DMZ del laboratorio.

---

## 2. Sistema

| Elemento | Valor |
|---|---|
| Servidor | WEB01 |
| IP | 10.10.20.10 |
| Zona | DMZ |
| Servicio web | Apache |
| Lenguaje | PHP |
| Puerto | 80/TCP |

---

## 3. Servicios instalados

| Servicio | Uso |
|---|---|
| apache2 | Servidor HTTP |
| PHP | Ejecución de aplicación web |
| php-mysql | Conexión PHP con MariaDB |
| mariadb-client | Pruebas de conexión a DB01 |

---

## 4. Comunicación con base de datos

| Origen | Destino | Puerto | Motivo |
|---|---|---|---|
| WEB01 | DB01 | 3306/TCP | Conexión del portal de clientes con MariaDB |

---

## 5. Estado inicial inseguro

| Debilidad | Descripción | Riesgo |
|---|---|---|
| HTTP sin TLS | El servicio usa puerto 80 | Interceptación de tráfico |
| Sin cabeceras de seguridad | No hay hardening HTTP | Mayor exposición web |
| Apache por defecto | Configuración base no endurecida | Divulgación de información |
| PHP sin hardening | Configuración estándar | Mayor superficie de ataque |
| UFW inactivo | Sin filtrado local | Exposición de servicios |
| Acceso a DB01 desde DMZ | Conexión necesaria pero sensible | Riesgo ante compromiso de WEB01 |

---

## 6. Justificación de laboratorio

WEB01 se mantiene inicialmente en un estado funcional pero no endurecido para permitir una auditoría técnica realista.

Posteriormente se aplicarán medidas de remediación como HTTPS, cabeceras de seguridad, hardening de Apache/PHP, restricción de firewall y control estricto de comunicaciones hacia DB01.

---

## 7. Relación con NIS2

Este servidor permite evaluar:

- Seguridad de aplicaciones.
- Seguridad de comunicaciones.
- Gestión de vulnerabilidades.
- Segmentación de red.
- Protección de información sensible.
- Evaluación de eficacia de medidas técnicas.