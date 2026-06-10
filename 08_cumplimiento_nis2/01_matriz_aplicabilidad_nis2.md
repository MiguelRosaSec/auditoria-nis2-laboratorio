# Matriz de aplicabilidad NIS2

## 1. Objetivo

Determinar qué áreas de NIS2 son aplicables al laboratorio de AlmeriaLogiTech S.L. y cómo se evaluarán técnicamente.

---

## 2. Entidad evaluada

| Elemento | Valor |
|---|---|
| Empresa simulada | AlmeriaLogiTech S.L. |
| Sector | Logística y distribución alimentaria |
| Tipo simulado | Entidad importante |
| Laboratorio | VMware local |
| Alcance | Técnico y organizativo simulado |

---

## 3. Matriz de aplicabilidad

| Área NIS2 | Aplicable | Justificación | Evidencia/proceso evaluado |
|---|---|---|---|
| Gestión de riesgos | Sí | La empresa depende de sistemas críticos | Matriz de riesgos |
| Gestión de incidentes | Sí | Debe detectar y responder a incidentes | Wazuh/procedimiento IRP futuro |
| Continuidad de negocio | Sí | Debe recuperar sistemas y datos | Backups DB01/BCK01 |
| Seguridad de cadena de suministro | Sí | Depende de proveedores tecnológicos | Registro proveedores simulado |
| Seguridad en desarrollo/mantenimiento | Sí | Existe portal web propio | Auditoría WEB01 |
| Evaluación de eficacia de medidas | Sí | Se realiza auditoría y reauditoría | Comparativa antes/después |
| Higiene cibernética | Sí | Requiere hardening y buenas prácticas | Linux/Windows/pfSense |
| Criptografía | Sí | Se tratan credenciales y datos | HTTPS/TLS/DB |
| Control de acceso | Sí | Existen usuarios, AD y login web | DC01/WEB01 |
| Gestión de activos | Sí | Existen servidores críticos | Inventario activos |
| MFA/comunicaciones seguras | Sí | Accesos administrativos y login | MFA documental/futuro |
| Formación y concienciación | Sí | Riesgo por credenciales y phishing | Plan formativo simulado |