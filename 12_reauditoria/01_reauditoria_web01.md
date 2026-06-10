# Reauditoría web de WEB01 tras remediación

## 1. Objetivo

Verificar la eficacia de las medidas de remediación aplicadas sobre WEB01 tras la auditoría web inicial.

---

## 2. Sistema reauditorado

| Elemento | Valor |
|---|---|
| Sistema | WEB01 |
| IP | 10.10.20.10 |
| Servicio | Apache/PHP |
| URL | http://10.10.20.10 |
| Máquina auditora | KALI01 |

---

## 3. Hallazgos revalidados

| Hallazgo | Prueba realizada | Resultado esperado |
|---|---|---|
| WEB-H11 SQL Injection login | Payload SQL en login | No autentica |
| WEB-H12 SQL Injection buscador | Payload SQL en parámetro `q` | No altera consulta |
| WEB-H13 XSS reflejado | Payload `<script>` | No ejecuta JS |
| WEB-H03 Cookie insegura | Revisión `Set-Cookie` | HttpOnly/SameSite |
| WEB-H06 Directory indexing | GET `/includes/` | 403 Forbidden |
| WEB-H02 Cabeceras seguridad | `curl -I` | Cabeceras presentes |
| WEB-H04 Versión Apache | WhatWeb/curl | Menor divulgación |
| WEB-H10 Hardening general | Nikto/Gobuster | Menos hallazgos |

---

## 4. Comandos ejecutados


curl -I http://10.10.20.10
curl -I http://10.10.20.10/login.php
nikto -h http://10.10.20.10 -output web01_nikto_post.txt
whatweb -v http://10.10.20.10
gobuster dir -u http://10.10.20.10 -w rutas_basicas.txt
curl -i -s -X POST http://10.10.20.10/login.php -d "usuario=' OR '1'='1' --" -d "password=test"
curl -i http://10.10.20.10/includes/
curl -i "http://10.10.20.10/contacto.php?msg=%3Cscript%3Ealert('XSS')%3C/script%3E"

## 5. Evidencias generadas
Evidencia	Descripción
web01_headers_post.txt	Cabeceras tras remediación
web01_cookie_post.txt	Cookie tras remediación
web01_whatweb_post.txt	Identificación tecnológica post-remediación
web01_nikto_post.txt	Nikto tras remediación
web01_gobuster_post_basico.txt	Enumeración post-remediación
web01_sqli_login_post.txt	SQLi login bloqueado
web01_sqli_buscador_post.txt	SQLi buscador bloqueado
web01_xss_contacto_post.txt	XSS escapado
web01_includes_post.txt	/includes/ bloqueado
apache_configtest_post.txt	Configuración Apache válida
php_lint_*_post.txt	Sintaxis PHP correcta

## 6. Estado de cierre
Hallazgo	Estado tras reauditoría
WEB-H11	Mitigado
WEB-H12	Mitigado
WEB-H13	Mitigado
WEB-H03	Parcialmente mitigado, pendiente Secure con HTTPS
WEB-H06	Mitigado
WEB-H02	Mitigado si cabeceras presentes
WEB-H04	Mitigado/parcial según cabecera Server
WEB-H10	Parcialmente mitigado

## 7. Riesgos residuales
Riesgo residual	Motivo
HTTPS pendiente	Aún no se ha implantado TLS
Cookie Secure pendiente	Requiere HTTPS
MariaDB expuesto	Pendiente remediación DB01
Reglas pfSense permisivas	Pendiente hardening firewall
Active Directory expuesto	Pendiente hardening AD/red

## 8. Conclusión

La reauditoría permite comprobar que las vulnerabilidades críticas de SQL Injection y XSS han sido mitigadas en WEB01.

La aplicación mejora significativamente su nivel de seguridad, aunque permanecen controles pendientes relacionados con TLS, base de datos, firewall y Active Directory.