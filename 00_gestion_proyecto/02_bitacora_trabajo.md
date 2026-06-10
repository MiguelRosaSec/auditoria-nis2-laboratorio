# Bitácora de trabajo

## 27/05/2026 — Creación de redes virtuales VMware

### Acción realizada

Se han creado las redes virtuales LAN-10, DMZ-20, MONITORING-30, BACKUP-40 y AUDIT-50 en VMware Virtual Network Editor.

### Objetivo

Preparar la segmentación de red del laboratorio de auditoría NIS2.

### Resultado

Las redes han quedado configuradas como Host-only/custom y sin DHCP de VMware.

### Evidencias

- Capturas del Virtual Network Editor.
- Salida de `ipconfig /all`.

### Observaciones

pfSense será el encargado de actuar como gateway y firewall entre las distintas zonas.


## 27/05/2026 — Instalación de pfSense FW01

### Acción realizada

Se inicia la instalación de pfSense como firewall principal del laboratorio.

### Objetivo

Crear la máquina FW01 con seis interfaces de red para separar WAN, LAN, DMZ, MONITORING, BACKUP y AUDIT.

### Configuración prevista

| Interfaz | Red |
|---|---|
| WAN | NAT/Bridged |
| LAN | LAN-10 |
| OPT1 | DMZ-20 |
| OPT2 | MONITORING-30 |
| OPT3 | BACKUP-40 |
| OPT4 | AUDIT-50 |

### Evidencias previstas

- Capturas de adaptadores VMware.
- Capturas de instalación.
- Captura de asignación de interfaces.
- Captura del dashboard inicial.

### Observaciones

El host Windows no está conectado directamente a las redes internas, por lo que la administración de pfSense se hará desde una VM de administración en LAN-10.


## 27/05/2026 — Configuración base de pfSense

### Acción realizada

Se ha configurado pfSense como firewall/router central del laboratorio.

### Interfaces configuradas

| Interfaz | Red | IP |
|---|---|---|
| LAN | LAN-10 | 10.10.10.1 |
| DMZ | DMZ-20 | 10.10.20.1 |
| MONITORING | MONITORING-30 | 10.10.30.1 |
| BACKUP | BACKUP-40 | 10.10.40.1 |
| AUDIT | AUDIT-50 | 10.10.50.1 |

### Administración

La administración se ha realizado desde una VM Ubuntu conectada a LAN-10.

### Resultado

pfSense queda preparado para enrutar y filtrar tráfico entre las distintas zonas del laboratorio.

### Observaciones

Se han configurado reglas temporales permisivas para facilitar la fase de construcción. Estas reglas serán tratadas como debilidad inicial controlada y posteriormente serán endurecidas.


---

# 22. Actualizar bitácora

## 27/05/2026 — Instalación y configuración de DC01

### Acción realizada

Se instala Windows Server como DC01 y se configura como controlador de dominio principal del dominio almerialogitech.local.

### Configuración aplicada

| Elemento | Valor |
|---|---|
| Hostname | DC01 |
| IP | 10.10.10.10 |
| Gateway | 10.10.10.1 |
| Dominio | almerialogitech.local |
| Rol | AD DS + DNS |

### Resultado

El dominio queda operativo y se crea la estructura inicial de OUs, grupos y usuarios simulados.

### Debilidades controladas

Se introducen usuarios con contraseña inicial común y sin obligación de cambio en primer inicio para simular una mala práctica que será auditada posteriormente.

### Evidencias

- Capturas de instalación.
- Capturas de ADUC.
- Salidas PowerShell.
- Verificación de servicios AD.


## 27/05/2026 — Instalación y configuración de DB01

### Acción realizada

Se instala Ubuntu Server como DB01 en la red LAN-10 y se configura MariaDB como motor de base de datos.

### Configuración aplicada

| Elemento | Valor |
|---|---|
| Hostname | db01 |
| IP | 10.10.10.30 |
| Gateway | 10.10.10.1 |
| DNS | 10.10.10.10 |
| Servicio | MariaDB |
| Puerto | 3306/TCP |

### Debilidades controladas

- MariaDB escucha en 0.0.0.0.
- Usuario appuser permitido desde cualquier origen.
- appuser con privilegios excesivos.
- Sin TLS configurado.
- Sin backup inicial.
- UFW inactivo.

### Resultado

DB01 queda operativo como servidor de base de datos interno para el futuro portal de clientes.


## 27/05/2026 — Instalación y configuración de WEB01

### Acción realizada

Se instala Ubuntu Server como WEB01 en la red DMZ-20 y se configura Apache, PHP y cliente MariaDB.

### Configuración aplicada

| Elemento | Valor |
|---|---|
| Hostname | web01 |
| IP | 10.10.20.10 |
| Gateway | 10.10.20.1 |
| DNS | 10.10.10.10 |
| Servicio web | Apache |
| Puerto | 80/TCP |

### Pruebas realizadas

- Conectividad con gateway DMZ.
- Resolución DNS interna.
- Conectividad con DC01.
- Conectividad con DB01.
- Prueba del servicio HTTP.
- Prueba de conexión MariaDB remota hacia DB01.

### Debilidades controladas

- HTTP sin HTTPS.
- Apache sin hardening.
- Sin cabeceras de seguridad.
- PHP sin endurecimiento.
- UFW inactivo o permisivo.
- Conexión a DB01 sin TLS.

### Resultado

WEB01 queda operativo como servidor web en la DMZ para alojar el futuro portal de clientes vulnerable.


---

## 27/05/2026 — Creación del portal de clientes vulnerable

### Acción realizada

Se crea una aplicación PHP en WEB01 conectada a MariaDB en DB01.

### Funcionalidades

- Página principal.
- Login.
- Listado de clientes.
- Listado de pedidos.
- Buscador.
- Página de contacto.
- Cierre de sesión.

### Vulnerabilidades controladas

- SQL Injection en login.
- SQL Injection en buscador.
- XSS reflejado en contacto.
- XSS reflejado en buscador.
- Credenciales de base de datos en código.
- Contraseñas en texto claro.
- Sin HTTPS.
- Sesiones básicas.

### Resultado

El portal queda operativo y preparado para la auditoría técnica inicial.

## 27/05/2026 — Instalación de KALI01

### Acción realizada

Se instala Kali Linux como máquina auditora en la red AUDIT-50.

### Configuración aplicada

| Elemento | Valor |
|---|---|
| Hostname | kali01 |
| IP | 10.10.50.10 |
| Gateway | 10.10.50.1 |
| DNS | 10.10.10.10 |
| Red | AUDIT-50 |

### Herramientas principales

- Nmap.
- Nikto.
- WhatWeb.
- OWASP ZAP.
- Burp Suite.
- sqlmap.
- testssl.sh.
- Herramientas de enumeración AD.

### Resultado

KALI01 queda preparada para iniciar la auditoría técnica inicial contra WEB01, DB01, DC01 y pfSense.



---


## 27/05/2026 — Auditoría inicial de descubrimiento con Nmap

### Acción realizada

Se inicia la auditoría técnica inicial desde KALI01 mediante descubrimiento de hosts y enumeración de puertos.

### Alcance

- LAN 10.10.10.0/24.
- DMZ 10.10.20.0/24.
- AUDIT 10.10.50.0/24.

### Herramienta utilizada

- Nmap.

### Evidencias generadas

- Informes `.nmap`, `.gnmap` y `.xml`.
- Resumen de puertos abiertos.
- Resumen de hosts detectados.

### Resultado

Se obtiene el primer inventario técnico real de sistemas y servicios expuestos.


---

## 29/05/2026 — Auditoría web inicial de WEB01

### Acción realizada

Se inicia la auditoría web inicial del portal de clientes desplegado en WEB01.

### Sistema auditado

| Elemento | Valor |
|---|---|
| Sistema | WEB01 |
| IP | 10.10.20.10 |
| Servicio | Apache/PHP |
| URL | http://10.10.20.10 |

### Herramientas utilizadas

- curl.
- WhatWeb.
- Nikto.
- Gobuster.
- sqlmap.
- Navegador.

### Resultado esperado

Identificación de vulnerabilidades web controladas como SQL Injection, XSS reflejado, ausencia de HTTPS y falta de cabeceras de seguridad.


---

## 29/05/2026 — Formalización de hallazgos WEB01

### Acción realizada

Se analizan las evidencias obtenidas durante la auditoría web inicial de WEB01 y se formalizan los primeros hallazgos técnicos.

### Evidencias revisadas

- web01_headers.txt
- web01_curl_headers.txt
- web01_whatweb.txt
- web01_nikto.txt
- web01_gobuster_common.txt
- web01_gobuster_common_php.txt
- web01_index_html.txt
- web01_ping.txt

### Hallazgos confirmados

- HTTP sin HTTPS.
- Ausencia de cabeceras de seguridad.
- Cookie de sesión sin atributos de seguridad.
- Divulgación de versión Apache.
- Apache potencialmente desactualizado.
- Directory indexing en `/includes/`.
- Enumeración de rutas sensibles.
- Falta de hardening general.

### Resultado

Los hallazgos web iniciales quedan documentados profesionalmente para su posterior mapeo contra NIS2 y tratamiento en el plan de remediación.

## 29/05/2026 — Matriz inicial de hallazgos y mapeo NIS2

### Acción realizada

Se consolida la matriz inicial de hallazgos técnicos y se realiza el primer mapeo contra áreas de NIS2.

### Documentos creados

- `06_auditoria_tecnica_inicial/06_matriz_hallazgos_tecnicos.md`
- `08_cumplimiento_nis2/01_matriz_aplicabilidad_nis2.md`
- `08_cumplimiento_nis2/02_matriz_cumplimiento_nis2.md`
- `08_cumplimiento_nis2/03_mapeo_hallazgos_nis2.md`

### Resultado

Los hallazgos técnicos quedan vinculados a riesgos, evidencias, severidad y áreas de cumplimiento NIS2.

## 29/05/2026 — Análisis de riesgos inicial

### Acción realizada

Se crea el análisis de riesgos inicial a partir de los hallazgos técnicos confirmados.

### Documentos creados

- `09_analisis_riesgos/01_metodologia_riesgos.md`
- `09_analisis_riesgos/02_inventario_activos.md`
- `09_analisis_riesgos/03_catalogo_amenazas.md`
- `09_analisis_riesgos/04_matriz_riesgos.md`
- `09_analisis_riesgos/05_tratamiento_riesgos.md`

### Resultado

Se identifican 20 riesgos principales, priorizados por probabilidad, impacto y criticidad.

### Áreas más críticas

- Portal web.
- Base de datos.
- Active Directory.
- Segmentación de red.
- Control de acceso.
- Cifrado.
- Continuidad.

## 29/05/2026 — Plan de remediación inicial

### Acción realizada

Se crea el plan inicial de remediación a partir de la matriz de hallazgos y del análisis de riesgos.

### Documentos creados

- `10_plan_remediacion/01_plan_remediacion.md`
- `10_plan_remediacion/02_acciones_tecnicas.md`
- `10_plan_remediacion/03_acciones_organizativas.md`
- `10_plan_remediacion/04_priorizacion.md`
- `10_plan_remediacion/05_evidencias_cierre.md`

### Resultado

Se define una hoja de ruta de remediación priorizada, con acciones técnicas y organizativas, responsables simulados, plazos y evidencias de cierre.

## 29/05/2026 — Reauditoría web de WEB01

### Acción realizada

Se realiza la reauditoría web de WEB01 tras aplicar medidas de remediación.

### Pruebas realizadas

- Validación de cabeceras HTTP.
- Validación de cookie de sesión.
- Repetición de Nikto.
- Repetición de Gobuster.
- Prueba SQL Injection en login.
- Prueba SQL Injection en buscador.
- Prueba XSS reflejado.
- Validación de bloqueo de `/includes/`.

### Resultado esperado

Las vulnerabilidades SQL Injection y XSS deben aparecer mitigadas, y el servidor debe evidenciar mejoras de hardening.

### Riesgos residuales

- HTTPS pendiente.
- Cookie Secure pendiente.
- Base de datos pendiente de hardening.
- Reglas pfSense pendientes de endurecimiento.


## 02/06/2026 — Remediación de DB01 y MariaDB

### Acción realizada

Se aplican medidas de hardening sobre DB01 y MariaDB.

### Hallazgos tratados

- DB-H01 MariaDB escuchando en todas las interfaces.
- DB-H02 appuser permitido desde cualquier origen.
- DB-H03 privilegios excesivos.
- DB-H05 ausencia de backups.
- DB-H06 UFW inactivo.
- DB-H07 SSH accesible ampliamente.

### Resultado esperado

DB01 queda restringido para aceptar conexiones MariaDB únicamente desde WEB01, con usuario de aplicación limitado, firewall local activo y backup operativo con prueba de restauración.

## 02/06/2026 — Reauditoría de DB01

### Acción realizada

Se realiza la reauditoría de DB01 tras aplicar medidas de hardening sobre MariaDB y firewall local.

### Pruebas realizadas

- Verificación de escucha MariaDB.
- Verificación de usuario appuser.
- Verificación de privilegios.
- Verificación de UFW.
- Conexión permitida desde WEB01.
- Bloqueo de acceso desde KALI01.
- Generación de backup.
- Prueba de restauración.

### Resultado esperado

DB01 debe mantener servicio para WEB01, pero no debe exponer MariaDB a redes no autorizadas.

## 02/06/2026 — Hardening de pfSense y segmentación interzona

### Acción realizada

Se sustituyen reglas temporales permisivas por reglas específicas de mínimo privilegio.

### Hallazgos tratados

- NET-H01.
- NET-H02.
- NET-H03.
- FW-H01.
- FW-H02.
- FW-H03.
- FW-H05.

### Resultado esperado

La red AUDIT deja de tener acceso amplio a LAN y DMZ, WEB01 mantiene acceso autorizado a DB01, y la administración de pfSense queda restringida.

## 02/06/2026 — Reauditoría de segmentación y firewall

### Acción realizada

Se realiza la reauditoría de las reglas de pfSense tras aplicar hardening de segmentación interzona.

### Pruebas realizadas

- Acceso desde KALI01 a WEB01.
- Bloqueo desde KALI01 a DB01 por 3306.
- Bloqueo desde KALI01 a DB01 por SSH.
- Bloqueo desde KALI01 a servicios críticos de DC01.
- Validación de WebGUI pfSense.
- Validación de WEB01 hacia DB01.
- Validación de WEB01 hacia DNS e Internet.
- Revisión de logs de bloqueo en pfSense.

### Resultado esperado

La red AUDIT deja de tener acceso amplio a LAN, DMZ queda limitada a comunicaciones necesarias y pfSense aplica un modelo de mínimo privilegio.

## 02/06/2026 — Auditoría técnica inicial de Active Directory

### Acción realizada

Se inicia la auditoría técnica inicial de DC01 antes de aplicar hardening de Active Directory.

### Áreas revisadas

- Dominio.
- Bosque.
- Política de contraseñas.
- Usuarios.
- Grupos.
- Grupos privilegiados.
- GPOs.
- Servicios críticos.
- DNS.
- Eventos de seguridad.
- Exposición de servicios AD.

### Resultado

Se genera una línea base inicial de Active Directory para justificar las medidas posteriores de hardening y permitir una comparativa antes/después.

## 02/06/2026 — Cierre de hallazgos AD y riesgos de identidad

### Acción realizada

Se analizan las evidencias de la auditoría inicial de Active Directory y se formalizan los hallazgos de identidad.

### Evidencias revisadas

- `ad_password_policy_summary_initial.txt`
- `ad_lab_users_password_initial_evidence.txt`
- `ad_privileged_groups_initial.txt`
- `ad_gpos_all_initial.csv`
- `ad_critical_services_initial.txt`

### Hallazgos confirmados

- Política de contraseñas con longitud mínima insuficiente.
- Ausencia de bloqueo de cuenta.
- Usuarios de laboratorio con evidencia de creación homogénea.
- Ausencia de GPO específica de hardening.
- Revisión inicial de grupos privilegiados.
- Servicios críticos de AD operativos.

### Resultado

Se formalizan los hallazgos AD y se crea un análisis de riesgos específico de identidad.

## 02/06/2026 — Hardening inicial de Active Directory

### Acción realizada

Se aplican medidas iniciales de hardening sobre DC01 y Active Directory tras la auditoría técnica inicial.

### Medidas aplicadas

- Política de contraseñas reforzada.
- Bloqueo de cuenta configurado.
- Contraseñas temporales únicas para usuarios.
- Cambio obligatorio de contraseña al primer inicio.
- Grupos Tier creados.
- Revisión formal de grupos privilegiados.
- GPO base de hardening creada.
- Auditoría de eventos configurada.
- Estrategia MFA documentada.

### Resultado

Active Directory mejora su postura de seguridad inicial y reduce riesgos críticos de identidad.

## 02/06/2026 — Reauditoría de Active Directory

### Acción realizada

Se realiza la reauditoría de DC01 tras aplicar medidas de hardening de Active Directory.

### Pruebas realizadas

- Validación de política de contraseñas.
- Validación de bloqueo de cuenta.
- Validación de usuarios con cambio obligatorio.
- Validación de grupos Tier.
- Validación de GPO de hardening.
- Validación de auditoría de eventos.
- Validación de servicios críticos.
- Validación de exposición AD desde AUDIT.

### Resultado esperado

Los hallazgos críticos de identidad quedan mitigados o reducidos, quedando riesgos residuales relacionados con MFA, monitorización centralizada y modelo Tier completo.

## 02/06/2026 — Instalación de MON01 y Wazuh

### Acción realizada

Se inicia la implantación de MON01 como servidor de monitorización centralizada mediante Wazuh.

### Configuración prevista

| Elemento | Valor |
|---|---|
| Hostname | mon01 |
| IP | 10.10.30.10 |
| Red | MONITORING-30 |
| Servicio | Wazuh |
| Despliegue | Docker single-node |

### Objetivo

Cubrir controles de detección, monitorización, registro de eventos y gestión de incidentes asociados a NIS2.

## 02/06/2026 — Instalación de agentes Wazuh

### Acción realizada

Se inicia la instalación de agentes Wazuh en WEB01, DB01 y DC01.

### Sistemas monitorizados

- WEB01.
- DB01.
- DC01.

### Eventos previstos

- Logs de autenticación Linux.
- Logs Apache.
- Logs MariaDB.
- Cambios en backups.
- Eventos de seguridad Windows.
- Eventos de Active Directory.

### Resultado esperado

Los agentes deben aparecer activos en el dashboard de Wazuh y generar eventos iniciales de seguridad.

## 04/06/2026 — Casos de uso iniciales Wazuh

### Acción realizada

Se generan eventos controlados para validar la monitorización inicial con Wazuh.

### Casos ejecutados

- SSH fallido en WEB01.
- Acceso web a rutas protegidas.
- Cambio controlado en archivo web.
- SSH fallido en DB01.
- Backup generado en DB01.
- Evento 4625 en DC01.
- Creación y eliminación de usuario temporal en AD.

### Resultado esperado

Los eventos deben aparecer en Wazuh asociados a sus respectivos agentes.


## 04/06/2026 — Procedimiento inicial de respuesta a incidentes

### Acción realizada

Se crea el procedimiento inicial de respuesta a incidentes de ciberseguridad.

### Documentos creados

- `13_gestion_incidentes/01_procedimiento_respuesta_incidentes.md`
- `13_gestion_incidentes/02_clasificacion_incidentes.md`
- `13_gestion_incidentes/03_playbooks_iniciales.md`
- `13_gestion_incidentes/04_registro_incidentes.md`

### Resultado

El laboratorio pasa a disponer de un procedimiento documentado para gestionar incidentes detectados por Wazuh y otros controles técnicos.

## 09/06/2026 — Simulacro de incidente INC-0008

### Acción realizada

Se ejecuta un simulacro controlado de intentos repetidos de SSH contra WEB01 desde KALI01.

### Fases ejecutadas

- Generación del evento.
- Detección en Wazuh.
- Revisión de logs locales.
- Clasificación del incidente.
- Contención en pfSense.
- Verificación del bloqueo.
- Registro y cierre del incidente.

### Resultado

El laboratorio demuestra capacidad inicial de detección y respuesta ante incidentes de autenticación.

## 09/06/2026 — Informe técnico de reauditoría

### Acción realizada

Se crea el informe técnico de reauditoría y estado de mejora del entorno.

### Contenido

- Resumen ejecutivo.
- Alcance técnico.
- Hallazgos iniciales.
- Remediaciones aplicadas.
- Comparativa antes/después.
- Riesgo residual.
- Estado técnico de cumplimiento.
- Mejoras futuras.

### Resultado

El proyecto dispone de un informe técnico consolidado que resume la evolución del entorno desde el estado vulnerable inicial hasta el estado remediado parcial.

## 09/06/2026 — Informe ejecutivo NIS2

### Acción realizada

Se crea el informe ejecutivo de adecuación NIS2 y un resumen profesional para portfolio.

### Documentos creados

- `14_informes/02_informe_ejecutivo_nis2.md`
- `14_informes/03_resumen_portfolio.md`

### Resultado

El proyecto dispone de una versión ejecutiva orientada a dirección/cliente y de un resumen adaptado para presentación profesional.

## 09/06/2026 — Roadmap final y cierre del proyecto

### Acción realizada

Se crea el plan de mejora final, backlog, registro de riesgos residuales y documento de cierre del proyecto.

### Documentos creados

- `15_plan_mejora/01_roadmap_mejora_final.md`
- `15_plan_mejora/02_backlog_mejoras.md`
- `15_plan_mejora/03_riesgos_residuales.md`
- `15_plan_mejora/04_cierre_proyecto.md`

### Resultado

El proyecto queda cerrado documentalmente con riesgos residuales identificados y una hoja de ruta de mejora continua.

## 04/06/2026 — Preparación de repositorio GitHub

### Acción realizada

Se prepara el proyecto para su publicación en GitHub como portfolio profesional.

### Archivos creados

- `README.md`
- `.gitignore`
- `DISCLAIMER.md`
- `INDICE_DOCUMENTAL.md`
- `CHECKLIST_PUBLICACION.md`

### Resultado

El proyecto queda estructurado para publicación, pendiente de revisión final de secretos y evidencias sensibles antes del push.
