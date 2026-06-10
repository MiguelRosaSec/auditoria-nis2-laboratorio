# Auditoría web inicial de WEB01

## 1. Objetivo

Realizar una auditoría inicial del servidor WEB01 y del portal de clientes de AlmeriaLogiTech S.L.

---

## 2. Sistema auditado

| Elemento | Valor |
|---|---|
| Sistema | WEB01 |
| IP | 10.10.20.10 |
| Zona | DMZ |
| Servicio | Apache/PHP |
| URL | http://10.10.20.10 |

---

## 3. Contexto previo

Durante el descubrimiento inicial con Nmap se identificó que WEB01 expone el puerto 80/TCP con Apache httpd 2.4.52 sobre Ubuntu. No se identificó servicio HTTPS en el puerto 443.

---

## 4. Herramientas utilizadas

| Herramienta | Uso |
|---|---|
| curl | Revisión de disponibilidad y cabeceras |
| WhatWeb | Identificación de tecnologías |
| Nikto | Auditoría web básica |
| Gobuster | Enumeración de rutas |
| sqlmap | Validación controlada de SQL Injection |
| Navegador | Pruebas manuales y capturas |

---

## 5. Comprobación de disponibilidad

```bash
ping -c 4 10.10.20.10
curl -I http://10.10.20.10
curl http://10.10.20.10

6. Identificación de tecnologías
whatweb -v http://10.10.20.10

Resultado esperado:

Servidor Apache.
Sistema Ubuntu.
Aplicación PHP.
7. Revisión de cabeceras HTTP
curl -I http://10.10.20.10

Cabeceras revisadas:

Cabecera	Estado
Strict-Transport-Security	Ausente
Content-Security-Policy	Ausente
X-Frame-Options	Ausente
X-Content-Type-Options	Ausente
Referrer-Policy	Ausente
Permissions-Policy	Ausente
8. Comprobación de HTTPS
curl -k -I https://10.10.20.10
nmap -sV -p 443 10.10.20.10

Resultado esperado:

HTTPS no disponible.
Puerto 443 cerrado o filtrado.
9. Enumeración de rutas
gobuster dir \
  -u http://10.10.20.10 \
  -w ~/auditoria-nis2/02_web/web01/rutas_basicas.txt \
  -o ~/auditoria-nis2/02_web/web01/resultados/web01_gobuster_basico.txt

Rutas esperadas:

Ruta	Descripción
/index.php	Página principal
/login.php	Login
/clientes.php	Clientes
/pedidos.php	Pedidos
/buscar.php	Buscador
/contacto.php	Contacto
/includes/	Directorio de includes
/assets/	Recursos estáticos
10. SQL Injection en login

Payload utilizado:

' OR '1'='1

Resultado esperado:

Autenticación no autorizada.
Redirección a clientes.php.
Acceso sin credenciales válidas.

Clasificación:

Campo	Valor
ID	WEB-H03
Severidad	Crítica
Impacto	Acceso no autorizado
Causa	Concatenación directa de parámetros en consulta SQL
11. SQL Injection en buscador

Payload utilizado:

' OR '1'='1

Resultado esperado:

Manipulación de consulta SQL.
Devolución no controlada de registros.

Clasificación:

Campo	Valor
ID	WEB-H04
Severidad	Crítica
Impacto	Acceso o exposición indebida de datos
Causa	Parámetro q insertado directamente en consulta SQL


12. XSS reflejado

Payload utilizado:

<script>alert('XSS')</script>

Punto vulnerable:

/contacto.php?msg=

Resultado esperado:

Ejecución de JavaScript en navegador.

Clasificación:

Campo	Valor
ID	WEB-H05
Severidad	Alta
Impacto	Robo de sesión, manipulación de contenido o phishing interno
Causa	Salida HTML sin escape


13. Exposición de archivos y directorios

Pruebas realizadas:

curl -i http://10.10.20.10/includes/db.php
curl -i http://10.10.20.10/includes/
curl -i http://10.10.20.10/assets/

Objetivo:

Verificar si existen listados de directorios.
Verificar si se expone código fuente.
Verificar acceso a rutas sensibles.


14. Hallazgos preliminares
ID	Hallazgo	Severidad
WEB-H01	Servicio HTTP sin HTTPS	Alta
WEB-H02	Ausencia de cabeceras de seguridad HTTP	Media
WEB-H03	SQL Injection en login	Crítica
WEB-H04	SQL Injection en buscador	Crítica
WEB-H05	XSS reflejado en contacto	Alta
WEB-H06	Credenciales de base de datos en código	Alta
WEB-H07	Contraseñas de usuarios en texto claro	Alta
WEB-H08	Sesiones sin endurecimiento	Media
WEB-H09	Apache/PHP sin hardening específico	Media
WEB-H10	Acceso desde DMZ a DB01 sin TLS	Alta
15. Evidencias generadas
Evidencia	Descripción
web01_headers.txt	Cabeceras HTTP
web01_whatweb.txt	Identificación de tecnologías
web01_nikto.txt	Resultado Nikto
web01_https_test.txt	Prueba HTTPS
web01_https_nmap.nmap	Escaneo puerto 443
web01_gobuster_basico.txt	Enumeración de rutas
web01_sqli_login_curl.txt	Prueba SQLi login
portal_sqli_login_exitoso.png	Captura SQLi login
portal_sqli_buscador.png	Captura SQLi buscador
portal_xss_contacto.png	Captura XSS
web01_db_php_access.txt	Acceso a db.php
web01_arbol_evidencias.txt	Árbol de evidencias


16. Relación con NIS2

Los hallazgos web se relacionan con medidas de:

Seguridad en desarrollo y mantenimiento.
Gestión de vulnerabilidades.
Control de acceso.
Cifrado de comunicaciones.
Gestión de incidentes.
Evaluación de eficacia de medidas técnicas.
Protección de sistemas de información.


## 18. Resultado real de la auditoría web inicial

A partir de las evidencias recogidas se confirman los siguientes aspectos:

- WEB01 responde correctamente en HTTP.
- El portal se encuentra publicado en `http://10.10.20.10`.
- El servidor expone `Apache/2.4.52 (Ubuntu)`.
- Se crea una cookie `PHPSESSID` sin atributos de seguridad suficientes.
- Faltan cabeceras de seguridad HTTP relevantes.
- Nikto detecta directory indexing en `/includes/`.
- Gobuster identifica rutas de aplicación como `/login.php`, `/clientes.php`, `/buscar.php`, `/contacto.php` y `/logout.php`.
- La aplicación presenta un estado inicial funcional pero no endurecido.

# Validación controlada de SQL Injection y XSS en WEB01

## 1. Objetivo

Documentar la validación controlada de vulnerabilidades críticas en el portal de clientes de WEB01.

Las pruebas se realizan exclusivamente dentro del laboratorio propio de AlmeriaLogiTech S.L. con fines de auditoría técnica inicial y posterior remediación.

---

## 2. Sistema auditado

| Elemento | Valor |
|---|---|
| Sistema | WEB01 |
| IP | 10.10.20.10 |
| Zona | DMZ |
| Aplicación | Portal de clientes |
| URL base | http://10.10.20.10 |
| Máquina auditora | KALI01 |
| Red auditora | AUDIT-50 |

---

## 3. Vulnerabilidades validadas

| ID | Vulnerabilidad | Ubicación | Estado |
|---|---|---|---|
| WEB-H11 | SQL Injection en login | `/login.php` | Confirmado |
| WEB-H12 | SQL Injection en buscador | `/buscar.php?q=` | Confirmado |
| WEB-H13 | XSS reflejado | `/contacto.php?msg=` | Confirmado |

---

# WEB-H11 — SQL Injection en login

## Clasificación

| Campo | Valor |
|---|---|
| ID | WEB-H11 |
| Severidad | Crítica |
| Estado | Confirmado |
| Activo afectado | WEB01 |
| Ruta afectada | `/login.php` |
| Parámetros afectados | `usuario`, `password` |
| Categoría | Inyección SQL / Control de acceso |

## Descripción

El formulario de login permite manipular la consulta SQL mediante entrada no validada en los campos `usuario` y `password`.

La aplicación concatena directamente los valores introducidos por el usuario dentro de la consulta SQL, sin utilizar consultas preparadas ni validación suficiente.

## Evidencia

Se introduce un payload SQL en el formulario de login y se obtiene acceso al área autenticada del portal.

Payload utilizado:

```text
' OR '1'='1' --

Causa raíz

La causa principal es el uso de consultas SQL concatenadas:

$sql = "SELECT * FROM usuarios WHERE usuario = '$usuario' AND password = '$password'";

La aplicación no utiliza:

Prepared statements.
Validación robusta de entrada.
Hashing seguro de contraseñas.
Controles defensivos ante manipulación de consulta.
Recomendación

Aplicar consultas preparadas con parámetros.

Ejemplo de corrección:

$stmt = $conn->prepare("SELECT * FROM usuarios WHERE usuario = ?");
$stmt->bind_param("s", $usuario);
$stmt->execute();
$result = $stmt->get_result();

Además:

Usar password_hash() para almacenar contraseñas.
Usar password_verify() para validarlas.
No revelar información adicional en errores.
Registrar intentos de autenticación anómalos.
Aplicar bloqueo por intentos fallidos.
Implantar MFA si procede.
Forzar HTTPS.
Relación con NIS2

Este hallazgo se relaciona con:

Seguridad en adquisición, desarrollo y mantenimiento.
Gestión de vulnerabilidades.
Control de acceso.
Protección de sistemas de información.
Gestión de riesgos de ciberseguridad.
