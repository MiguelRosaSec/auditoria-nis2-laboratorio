# Remediación técnica de WEB01

## 1. Objetivo

Aplicar medidas correctivas sobre WEB01 para mitigar las vulnerabilidades críticas y altas identificadas durante la auditoría web inicial.

---

## 2. Hallazgos tratados

| ID | Hallazgo | Acción aplicada |
|---|---|---|
| WEB-H11 | SQL Injection en login | Prepared statements |
| WEB-H12 | SQL Injection en buscador | Prepared statements |
| WEB-H13 | XSS reflejado | Escape de salida con `htmlspecialchars()` |
| WEB-H03 | Cookie sin atributos seguros | Endurecimiento de sesión PHP |
| WEB-H06 | Directory indexing en `/includes/` | `Options -Indexes` y `Require all denied` |
| WEB-H02 | Falta de cabeceras de seguridad | Configuración `mod_headers` |
| WEB-H04 | Versión Apache expuesta | `ServerTokens Prod` y `ServerSignature Off` |
| WEB-H10 | Falta de hardening web | Baseline inicial Apache/PHP |

---

## 3. Copia de seguridad previa

Antes de modificar la aplicación se genera una copia de seguridad del contenido web:


sudo tar -czvf /root/backups-web01/portal_clientes_pre_remediacion_$(date +%F_%H%M).tar.gz /var/www/html


## 4. Corrección de SQL Injection en login

Se sustituye la consulta SQL concatenada por una consulta preparada:

$sql = "SELECT id, usuario, password, rol FROM usuarios WHERE usuario = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("s", $usuario);

Además, se incorpora password_verify() para validar hashes seguros de contraseña.

## 5. Corrección de SQL Injection en buscador

Se sustituye la consulta vulnerable por una consulta preparada con parámetros:

$stmt = $conn->prepare(
    "SELECT id, nombre, empresa, email, ciudad 
     FROM clientes 
     WHERE nombre LIKE ? OR empresa LIKE ? OR ciudad LIKE ?"
);
## 6. Corrección de XSS reflejado

Se aplica escape de salida con:

htmlspecialchars($msg, ENT_QUOTES, 'UTF-8')

Esto evita que entradas HTML o JavaScript sean interpretadas por el navegador.

## 7. Endurecimiento de sesiones

Se configura PHP para usar:

session.cookie_httponly = 1
session.cookie_samesite = Strict
session.use_strict_mode = 1

El atributo Secure se activará cuando HTTPS esté implantado.

## 8. Protección de /includes/

Se desactiva el listado de directorios y se bloquea el acceso directo a /includes/.

Configuración aplicada:

<Directory /var/www/html/includes>
    Options -Indexes
    AllowOverride All
    Require all denied
</Directory>

## 9. Cabeceras HTTP de seguridad

Se activa mod_headers y se configuran cabeceras:

Header always set X-Content-Type-Options "nosniff"
Header always set X-Frame-Options "SAMEORIGIN"
Header always set Referrer-Policy "strict-origin-when-cross-origin"
Header always set Permissions-Policy "geolocation=(), microphone=(), camera=()"
Header always set Content-Security-Policy "default-src 'self'; script-src 'self'; style-src 'self' 'unsafe-inline'; object-src 'none'; base-uri 'self'; frame-ancestors 'self';"

## 10. Ocultación de versión Apache

Se configura:

ServerTokens Prod
ServerSignature Off
TraceEnable Off

## 11. Validaciones posteriores
Prueba	Resultado esperado
SQLi login	No permite autenticación
SQLi buscador	No altera consulta
XSS contacto	No ejecuta JavaScript
/includes/	Devuelve 403
Cabeceras	Cabeceras de seguridad presentes
Apache	Servicio activo y sin errores

## 12. Evidencias esperadas
Evidencia	Descripción
php_lint_login_remediado.txt	Sintaxis login correcta
php_lint_buscar_remediado.txt	Sintaxis buscador correcta
php_lint_contacto_remediado.txt	Sintaxis contacto correcta
apache_configtest_remediado.txt	Configuración Apache válida
web01_headers_remediado.txt	Cabeceras de seguridad
web01_includes_403_remediado.txt	Bloqueo de /includes/
rem_web01_sqli_login_bloqueado.png	SQLi login mitigado
rem_web01_xss_contacto_escapado.png	XSS mitigado

## 13. Relación con NIS2

Esta remediación mejora controles relacionados con:

Seguridad en desarrollo y mantenimiento.
Gestión de vulnerabilidades.
Control de acceso.
Protección de sistemas de información.
Higiene cibernética.
Evaluación de eficacia de medidas técnicas.