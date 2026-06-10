# Aplicación portal de clientes

## 1. Objetivo

Crear una aplicación web PHP vulnerable de forma controlada para simular el portal de clientes de AlmeriaLogiTech S.L.

La aplicación será utilizada en la auditoría técnica inicial para identificar vulnerabilidades web, mapearlas contra NIS2 y aplicar posteriormente medidas de remediación.

---

## 2. Sistema

| Elemento | Valor |
|---|---|
| Servidor | WEB01 |
| IP | 10.10.20.10 |
| Zona | DMZ |
| Lenguaje | PHP |
| Servidor web | Apache |
| Base de datos | MariaDB en DB01 |
| Base de datos usada | almerialogitech |

---

## 3. Estructura de archivos

```text
/var/www/html/
├── index.php
├── login.php
├── clientes.php
├── pedidos.php
├── buscar.php
├── contacto.php
├── logout.php
├── includes/
│   ├── db.php
│   ├── header.php
│   └── footer.php
└── assets/
    └── css/
        └── style.css


4. Funcionalidades
Funcionalidad	Archivo
Página principal	index.php
Login	login.php
Listado de clientes	clientes.php
Listado de pedidos	pedidos.php
Buscador	buscar.php
Contacto	contacto.php
Cierre de sesión	logout.php
5. Base de datos

Se añade la tabla usuarios a la base de datos almerialogitech.

Usuarios iniciales:

Usuario	Rol
admin	administrador
cliente	cliente
operador	operador

Las contraseñas se almacenan inicialmente en texto claro como debilidad controlada.

6. Vulnerabilidades introducidas
Vulnerabilidad	Ubicación	Descripción
SQL Injection	login.php	Consulta concatenada con usuario y contraseña
SQL Injection	buscar.php	Parámetro q insertado directamente en consulta SQL
XSS reflejado	contacto.php	Parámetro msg mostrado sin escape
XSS reflejado	buscar.php	Parámetro q mostrado en input sin escape
Credenciales en código	includes/db.php	Usuario y contraseña de DB en texto claro
Contraseñas en texto claro	Tabla usuarios	Passwords sin hash
Errores detallados	includes/db.php	Mensajes de error de conexión visibles
Sin HTTPS	Apache	Tráfico en HTTP
Sesiones básicas	login.php	Sin endurecimiento de cookies
7. Justificación de laboratorio

Las vulnerabilidades han sido introducidas de forma intencionada en un entorno controlado para permitir:

Auditoría técnica web.
Generación de evidencias.
Análisis de riesgos.
Mapeo contra NIS2.
Remediación posterior.
Comparativa antes/después.
8. Pruebas funcionales
Prueba	Resultado esperado
Acceso a index.php	Página principal visible
Login con admin/admin123	Acceso correcto
Listado de clientes	Datos desde DB01
Listado de pedidos	Datos desde DB01
Buscador	Búsqueda funcional
Contacto con parámetro msg	Mensaje reflejado
9. Pruebas de vulnerabilidad controladas
Prueba	Payload	Resultado esperado
SQLi login	' OR '1'='1	Acceso no autorizado posible
SQLi buscador	' OR '1'='1	Manipulación de consulta
XSS contacto	<script>alert('XSS')</script>	Ejecución de script
XSS buscador	<script>alert('XSS')</script>	Reflejo no escapado
10. Evidencias generadas
Evidencia	Descripción
portal_home.png	Página principal
portal_login.png	Login
portal_clientes.png	Listado de clientes
portal_pedidos.png	Listado de pedidos
portal_busqueda.png	Buscador
portal_sqli_login.png	Evidencia SQL Injection en login
portal_xss_contacto.png	Evidencia XSS reflejado
portal_headers.txt	Cabeceras HTTP
portal_file_tree.txt	Estructura de archivos
php_lint_*.txt	Validación sintáctica PHP
11. Relación con NIS2

La aplicación permite evaluar medidas relacionadas con:

Seguridad en adquisición, desarrollo y mantenimiento de sistemas.
Gestión de vulnerabilidades.
Control de acceso.
Seguridad de comunicaciones.
Gestión de incidentes.
Evaluación de eficacia de medidas técnicas.
Protección de datos tratados por sistemas de información.