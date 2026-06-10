# Instalación de MON01 con Wazuh

## 1. Objetivo

Instalar MON01 como servidor de monitorización y SIEM/XDR del laboratorio NIS2 de AlmeriaLogiTech S.L.

---

## 2. Datos de la máquina

| Elemento | Valor |
|---|---|
| Nombre | MON01 |
| Hostname | mon01 |
| Sistema | Ubuntu Server |
| Red | MONITORING-30 |
| IP | 10.10.30.10 |
| Gateway | 10.10.30.1 |
| DNS | 10.10.10.10 |
| Servicio | Wazuh |

---

## 3. Recursos asignados

| Recurso | Valor |
|---|---|
| CPU | 4 vCPU |
| RAM | 8 GB |
| Disco | 80 GB |
| Adaptador | MONITORING-30 |

---

## 4. Configuración de red

```yaml
network:
  version: 2
  ethernets:
    ens33:
      addresses:
        - 10.10.30.10/24
      routes:
        - to: default
          via: 10.10.30.1
      nameservers:
        addresses:
          - 10.10.10.10
        search:
          - almerialogitech.local
```

## 5. Registro DNS

Se crea el registro:
| FQDN                        | IP          |
| --------------------------- | ----------- |
| mon01.almerialogitech.local | 10.10.30.10 |

## 6. Instalación Docker

Se instala Docker y Docker Compose Plugin:

sudo apt install -y docker.io docker-compose-plugin

## 7. Parámetro del kernel

Se configura:

vm.max_map_count=262144

Este parámetro es necesario para el indexador.

## 8. Despliegue Wazuh

Se utiliza el repositorio Docker oficial:

sudo git clone https://github.com/wazuh/wazuh-docker.git -b v4.12.0 /opt/wazuh-docker
cd /opt/wazuh-docker/single-node
docker compose -f generate-indexer-certs.yml run --rm generator
docker compose up -d

## 9. Componentes desplegados

| Componente      | Función                    |
| --------------- | -------------------------- |
| Wazuh manager   | Recibe y analiza eventos   |
| Wazuh indexer   | Indexa y almacena eventos  |
| Wazuh dashboard | Interfaz web               |
| Wazuh agents    | Se instalarán en endpoints |


## 10. Acceso al dashboard

URL:

https://10.10.30.10

El acceso debe limitarse a equipos autorizados.

## 11. Evidencias generadas

| Evidencia                      | Descripción         |
| ------------------------------ | ------------------- |
| `mon01_hostnamectl.txt`        | Información sistema |
| `mon01_ip_a.txt`               | Configuración IP    |
| `mon01_docker_version.txt`     | Versión Docker      |
| `mon01_vm_max_map_count.txt`   | Parámetro kernel    |
| `mon01_docker_ps_wazuh.txt`    | Contenedores Wazuh  |
| `mon01_wazuh_logs_initial.txt` | Logs iniciales      |
| `wazuh_dashboard_login.png`    | Login dashboard     |
| `wazuh_dashboard_home.png`     | Dashboard           |

## 12. Relación con NIS2

MON01 permite cubrir medidas relacionadas con:

Detección de incidentes.
Monitorización.
Registro de eventos.
Gestión de incidentes.
Evaluación de eficacia de medidas.
Trazabilidad de actividad.