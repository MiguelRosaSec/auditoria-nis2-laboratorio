# Instalación de DB01 Ubuntu Server

## 1. Objetivo

Instalar y configurar DB01 como servidor Ubuntu Server en la red LAN-10 para alojar la base de datos de la empresa simulada AlmeriaLogiTech S.L.

---

## 2. Datos de la máquina

| Elemento | Valor |
|---|---|
| Nombre VM | DB01 |
| Hostname | db01 |
| Sistema | Ubuntu Server |
| Rol | Servidor de base de datos |
| Red VMware | LAN-10 |
| IP | 10.10.10.30 |
| Gateway | 10.10.10.1 |
| DNS | 10.10.10.10 |
| Dominio | almerialogitech.local |

---

## 3. Recursos asignados

| Recurso | Valor |
|---|---|
| CPU | 1-2 vCPU |
| RAM | 2 GB |
| Disco | 40 GB |
| Adaptador red | LAN-10 |

---

## 4. Configuración de red

La máquina se configura con direccionamiento estático mediante Netplan.

```yaml
network:
  version: 2
  ethernets:
    ens33:
      addresses:
        - 10.10.10.30/24
      routes:
        - to: default
          via: 10.10.10.1
      nameservers:
        addresses:
          - 10.10.10.10
          - 1.1.1.1
        search:
          - almerialogitech.local

### Registro DNS

Se crea un registro DNS tipo A en DC01:

FQDN	IP
db01.almerialogitech.local	10.10.10.30
6. Instalación de paquetes base

Paquetes instalados:

sudo apt update
sudo apt upgrade -y
sudo apt install -y vim curl wget net-tools dnsutils htop ufw chrony
7. Instalación de MariaDB

MariaDB se instala mediante APT:

sudo apt install -y mariadb-server mariadb-client

Verificación:

sudo systemctl status mariadb
sudo systemctl enable mariadb
8. Configuración inicial de MariaDB

Se modifica el parámetro bind-address para permitir conexiones remotas:

bind-address = 0.0.0.0

Esta configuración se realiza de forma intencionada para simular un estado inicial inseguro y permitir su posterior auditoría.

9. Base de datos creada

Base de datos:

almerialogitech

Tablas iniciales:

Tabla	Finalidad
clientes	Clientes simulados
pedidos	Pedidos logísticos simulados
10. Usuario de aplicación

Se crea el usuario:

appuser

Configuración inicial:

Parámetro	Valor
Usuario	appuser
Origen	%
Privilegios	ALL PRIVILEGES sobre almerialogitech
Contraseña	[REDACTADA EN DOCUMENTACIÓN PÚBLICA]

Esta configuración representa una debilidad controlada por exceso de privilegios y origen no restringido.

11. Debilidades iniciales controladas
Debilidad	Riesgo
MariaDB escucha en 0.0.0.0	Exposición amplia del servicio
Usuario appuser permitido desde %	Conexión desde cualquier origen
Privilegios excesivos	Incumplimiento de mínimo privilegio
Sin TLS en conexión DB	Riesgo de interceptación
Sin backup configurado	Riesgo de pérdida de datos
UFW inactivo	Falta de filtrado local
12. Pruebas realizadas
Prueba	Comando	Resultado esperado
IP	ip a	10.10.10.30/24
Ruta	ip route	default via 10.10.10.1
DNS interno	nslookup db01.almerialogitech.local	10.10.10.30
Ping gateway	ping 10.10.10.1	Correcto
Ping DC01	ping 10.10.10.10	Correcto
Servicio MariaDB	systemctl status mariadb	Activo
Puerto 3306	ss -tulpen	Escucha en 0.0.0.0:3306
Usuario appuser	SHOW GRANTS	Permisos visibles
13. Evidencias generadas
Evidencia	Descripción
db01_ip_a.txt	Configuración IP
db01_ip_route.txt	Tabla de rutas
db01_resolvectl_status.txt	DNS configurado
db01_hostnamectl.txt	Hostname
db01_ping_gateway.txt	Conectividad con pfSense
db01_ping_dc01.txt	Conectividad con DC01
db01_nslookup_dc01.txt	Resolución DNS de DC01
db01_nslookup_db01.txt	Resolución DNS de DB01
db01_listening_ports.txt	Puertos en escucha
db01_mariadb_status.txt	Estado de MariaDB
db01_ufw_status.txt	Estado de firewall local
db01_appuser_grants.txt	Permisos de appuser
db01_database_sample.txt	Datos simulados de prueba
14. Relación con NIS2

DB01 permite auditar controles relacionados con:

Gestión de activos críticos.
Protección de bases de datos.
Control de acceso.
Mínimo privilegio.
Seguridad de comunicaciones.
Continuidad de negocio.
Copias de seguridad.
Gestión de vulnerabilidades.
Monitorización y registro.