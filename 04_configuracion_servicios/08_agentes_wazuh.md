## Incidencia resuelta: conectividad hacia MON01/Wazuh

Durante la configuración de agentes Wazuh se detectó que WEB01, DB01, DC01 y ADM01 no podían conectar correctamente con los servicios publicados en MON01 tras aplicar las reglas de pfsense.

### Síntomas observados

- ADM01 no podía acceder al dashboard de Wazuh.
- WEB01 no conectaba correctamente con MON01 por los puertos de agente.
- DB01 no conectaba correctamente con MON01 por los puertos de agente.
- DC01 no conectaba correctamente con MON01 por los puertos de agente.

### Comprobaciones realizadas

En MON01 se verificó que los puertos estaban publicados:

```bash
sudo ss -tulpen | egrep ':443|:1514|:1515'
docker ps --format "table {{.Names}}\t{{.Ports}}\t{{.Status}}"
sudo ufw status verbose
```

## Acción correctiva

Se reinició completamente la pila Docker de Wazuh con las reglas ya implementadas en pfsense:

cd /opt/wazuh-docker/single-node
docker compose down
docker compose up -d
Resultado

Tras recrear/levantar la pila, los servicios de Wazuh volvieron a aceptar conexiones correctamente y se recuperó el acceso al dashboard y a los puertos necesarios para agentes.

Conclusión

La incidencia no estaba causada por las reglas de pfSense ni por UFW en MON01, sino por el estado operativo de los contenedores Wazuh.

## Incidencia resuelta: incompatibilidad de versión del agente WEB01

Durante la instalación del agente Wazuh en WEB01 se detectó que el agente no se registraba correctamente en MON01.

### Error observado

```text
ERROR: Agent version must be lower or equal to manager version (from manager)
ERROR: Unable to add agent (from manager)
```
Causa raíz

El agente instalado en WEB01 tenía una versión superior a la versión del Wazuh Manager desplegado en MON01.

### Acción correctiva

Se desinstaló el agente incompatible y se instaló una versión compatible con el Wazuh Manager.

Resultado

Tras ajustar la versión del agente, WEB01 quedó correctamente registrado y operativo en Wazuh.

curl -sO https://packages.wazuh.com/4.x/apt/pool/main/w/wazuh-agent/wazuh-agent_4.12.0-1_amd64.deb

sudo WAZUH_MANAGER="10.10.30.10" WAZUH_AGENT_NAME="DB01" dpkg -i ./wazuh-agent_4.12.0-1_amd64.deb


# Instalación de agentes Wazuh

## 1. Objetivo

Instalar agentes Wazuh en los sistemas críticos del laboratorio para centralizar eventos de seguridad en MON01.

---

## 2. Servidor Wazuh

| Elemento | Valor |
|---|---|
| Servidor | MON01 |
| IP | 10.10.30.10 |
| Servicio | Wazuh Manager |
| Dashboard | https://10.10.30.10 |

---

## 3. Agentes instalados

| Agente | IP | Sistema | Grupo |
|---|---:|---|---|
| WEB01 | 10.10.20.10 | Linux | linux, web, dmz |
| DB01 | 10.10.10.30 | Linux | linux, database, lan |
| DC01 | 10.10.10.10 | Windows | windows, active-directory, domain-controller |

---

## 4. Comunicaciones permitidas

| Origen | Destino | Puerto | Uso |
|---|---|---|---|
| WEB01 | MON01 | 1514/TCP | Eventos agente |
| WEB01 | MON01 | 1515/TCP | Enrolamiento |
| DB01 | MON01 | 1514/TCP | Eventos agente |
| DB01 | MON01 | 1515/TCP | Enrolamiento |
| DC01 | MON01 | 1514/TCP | Eventos agente |
| DC01 | MON01 | 1515/TCP | Enrolamiento |

---

## 5. Instalación Linux

Los agentes Linux se instalan indicando el manager:

```bash
sudo WAZUH_MANAGER="10.10.30.10" WAZUH_AGENT_NAME="WEB01" dpkg -i ./wazuh-agent_4.12.0-1_amd64.deb
sudo systemctl enable wazuh-agent
sudo systemctl start wazuh-agent
```

## 6. Instalación Windows

El agente Windows se instala mediante MSI:

 Invoke-WebRequest -Uri "https://packages.wazuh.com/4.x/windows/wazuh-agent-4.12.0-1.msi" -OutFile "wazuh-agent-4.12.0-1.msi"

.\wazuh-agent_4.12.0-1.msi /q WAZUH_MANAGER="10.10.30.10" WAZUH_AGENT_NAME="DC01"
Start-Service WazuhSvc
Set-Service -Name WazuhSvc -StartupType Automatic

## 7. Monitorización específica
| Sistema | Configuración adicional         |
| ------- | ------------------------------- |
| WEB01   | Logs Apache access/error        |
| DB01    | Logs MariaDB/auth y FIM backups |
| DC01    | EventChannel Security/System    |

## 8. Evidencias
| Evidencia                       | Descripción                   |
| ------------------------------- | ----------------------------- |
| web01_wazuh_agent_status.txt    | Estado agente WEB01           |
| db01_wazuh_agent_status.txt     | Estado agente DB01            |
| dc01_wazuh_agent_status.txt     | Estado agente DC01            |
| mon01_wazuh_agents_list.txt     | Lista de agentes              |
| wazuh_agents_active_summary.png | Dashboard con agentes activos |

## 9. Relación con NIS2

La instalación de agentes mejora:

Monitorización.
Detección de incidentes.
Trazabilidad.
Gestión de eventos.
Evaluación de eficacia de controles.