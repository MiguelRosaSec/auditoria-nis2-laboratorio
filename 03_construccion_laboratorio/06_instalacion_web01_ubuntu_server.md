# Instalación de WEB01 Ubuntu Server

## 1. Objetivo

Instalar y configurar WEB01 como servidor Ubuntu Server ubicado en la DMZ del laboratorio, destinado a alojar la web corporativa y el futuro portal de clientes de AlmeriaLogiTech S.L.

---

## 2. Datos de la máquina

| Elemento | Valor |
|---|---|
| Nombre VM | WEB01 |
| Hostname | web01 |
| Sistema | Ubuntu Server |
| Rol | Servidor web |
| Red VMware | DMZ-20 |
| IP | 10.10.20.10 |
| Gateway | 10.10.20.1 |
| DNS | 10.10.10.10 |
| Dominio | almerialogitech.local |

---

## 3. Recursos asignados

| Recurso | Valor |
|---|---|
| CPU | 1-2 vCPU |
| RAM | 2 GB |
| Disco | 30 GB |
| Adaptador red | DMZ-20 |

---

## 4. Configuración de red

La máquina se configura con direccionamiento estático mediante Netplan.

```yaml
network:
  version: 2
  ethernets:
    ens33:
      addresses:
        - 10.10.20.10/24
      routes:
        - to: default
          via: 10.10.20.1
      nameservers:
        addresses:
          - 10.10.10.10
          - 1.1.1.1
        search:
          - almerialogitech.local
```

## 5. Registro DNS

Se crea un registro DNS tipo A en DC01:

FQDN	IP
web01.almerialogitech.local	10.10.20.10

6. Paquetes instalados

Paquetes base:

sudo apt update
sudo apt upgrade -y
sudo apt install -y vim curl wget net-tools dnsutils htop ufw chrony unzip git

Stack web:

sudo apt install -y apache2 php libapache2-mod-php php-mysql mariadb-client
7. Servicio Apache

Apache queda instalado y activo como servicio web principal.

Servicio	Estado esperado
apache2	active/running

Puerto principal:

Puerto	Protocolo	Uso
80	TCP	HTTP
8. Página corporativa inicial

Se crea una página básica en:

/var/www/html/index.html

Contenido:

<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>AlmeriaLogiTech S.L.</title>
</head>
<body>
  <h1>AlmeriaLogiTech S.L.</h1>
  <p>Portal corporativo de la empresa simulada para el laboratorio de auditoría NIS2.</p>
  <p>Servidor: WEB01</p>
  <p>Zona: DMZ</p>
</body>
</html>
9. Conectividad con DB01

WEB01 se conecta a DB01 mediante MariaDB por el puerto 3306/TCP.

Origen	Destino	Puerto
WEB01 10.10.20.10	DB01 10.10.10.30	3306/TCP

Esta comunicación es necesaria para el portal de clientes, pero será auditada posteriormente para verificar si cumple el principio de mínimo privilegio y segmentación segura.

10. Debilidades iniciales controladas
Debilidad	Riesgo
HTTP sin HTTPS	Interceptación de tráfico
Apache con configuración por defecto	Exposición de información
Sin cabeceras de seguridad	Mayor riesgo web
PHP sin hardening específico	Mayor superficie de ataque
UFW inactivo o permisivo	Falta de filtrado local
Conexión DB sin TLS	Tráfico interno sin cifrar
Acceso desde DMZ a DB01	Riesgo si WEB01 se compromete
11. Pruebas realizadas
Prueba	Comando	Resultado esperado
IP	ip a	10.10.20.10/24
Ruta	ip route	default via 10.10.20.1
Ping gateway	ping 10.10.20.1	Correcto
Ping DC01	ping 10.10.10.10	Correcto
Ping DB01	ping 10.10.10.30	Correcto
DNS DC01	nslookup dc01.almerialogitech.local	Correcto
DNS DB01	nslookup db01.almerialogitech.local	Correcto
Apache	systemctl status apache2	Activo
HTTP local	curl http://localhost	Correcto
Puerto 3306 DB01	nc -vz 10.10.10.30 3306	Correcto
MariaDB remoto	SHOW TABLES	Correcto
12. Evidencias generadas
Evidencia	Descripción
web01_ip_a.txt	Configuración IP
web01_ip_route.txt	Tabla de rutas
web01_resolvectl_status.txt	DNS configurado
web01_hostnamectl.txt	Hostname
web01_ping_gateway.txt	Conectividad con pfSense
web01_ping_dc01.txt	Conectividad con DC01
web01_ping_db01.txt	Conectividad con DB01
web01_nslookup_dc01.txt	Resolución DNS de DC01
web01_nslookup_db01.txt	Resolución DNS de DB01
web01_nslookup_web01.txt	Resolución DNS de WEB01
web01_apache_status.txt	Estado de Apache
web01_listening_ports.txt	Puertos en escucha
web01_ufw_status.txt	Estado de firewall local
web01_curl_headers_localhost.txt	Cabeceras HTTP
web01_curl_homepage.txt	Página web inicial
web01_nc_db01_3306.txt	Prueba puerto 3306
web01_mariadb_remote_test.txt	Consulta remota a DB01
13. Relación con NIS2

WEB01 permite auditar controles relacionados con:

Seguridad de aplicaciones web.
Segmentación entre DMZ y LAN.
Control de acceso a datos.
Cifrado de comunicaciones.
Gestión de vulnerabilidades.
Seguridad en desarrollo y mantenimiento.
Monitorización.
Gestión de incidentes.
Reducción de superficie de exposición.

