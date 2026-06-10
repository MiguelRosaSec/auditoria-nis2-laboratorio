# Remediación técnica de DB01 y MariaDB

## 1. Objetivo

Aplicar medidas de hardening sobre DB01 y MariaDB para reducir la exposición de la base de datos y mejorar el cumplimiento de controles técnicos relacionados con NIS2.

---

## 2. Hallazgos tratados

| ID | Hallazgo | Acción aplicada |
|---|---|---|
| DB-H01 | MariaDB accesible en `0.0.0.0:3306` | `bind-address` restringido a `10.10.10.30` |
| DB-H02 | `appuser` permitido desde `%` | Usuario limitado a `10.10.20.10` |
| DB-H03 | Privilegios excesivos | Privilegios reducidos a `SELECT` |
| DB-H05 | Sin backup configurado | Script de backup implantado |
| DB-H06 | UFW inactivo | UFW activado con reglas restrictivas |
| DB-H07 | SSH accesible ampliamente | SSH restringido por origen |

---

## 3. Copia de seguridad previa

Antes de modificar la configuración se genera una copia lógica de la base de datos:

```bash
sudo mysqldump almerialogitech > ~/backups-db01/almerialogitech_pre_hardening_FECHA.sql
```

## 4. Restricción de usuario de aplicación

Se elimina el usuario amplio:

DROP USER IF EXISTS 'appuser'@'%';

Y se crea usuario restringido al origen autorizado:

CREATE USER IF NOT EXISTS 'appuser'@'10.10.20.10' IDENTIFIED BY '[REDACTADO]';
GRANT SELECT ON almerialogitech.* TO 'appuser'@'10.10.20.10';
FLUSH PRIVILEGES;

## 5. Restricción de escucha MariaDB

Se cambia:

bind-address = 0.0.0.0

por:

bind-address = 10.10.10.30

## 6. Firewall local UFW

Reglas principales:

sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow from 10.10.10.100 to any port 22 proto tcp
sudo ufw allow from 10.10.20.10 to any port 3306 proto tcp
sudo ufw enable

## 7. Backup operativo

Se crea el script:

/usr/local/sbin/backup_almerialogitech.sh

El backup se almacena en:

/opt/backups/mysql/

## 8. Prueba de restauración

Se realiza restauración sobre una base temporal:

almerialogitech_restore_test

Resultado esperado:

Tablas restauradas correctamente.
Consulta de control ejecutada correctamente.
Base temporal eliminada tras la prueba.

## 9. Evidencias generadas
Evidencia	Descripción
db01_3306_bind_post.txt	MariaDB escuchando en IP específica
db01_ufw_status_post.txt	UFW activo y restrictivo
db01_appuser_grants_post.txt	Privilegios reducidos
db01_appuser_hosts_post.txt	Usuario limitado a WEB01
db01_backup_files_post.txt	Backup generado
db01_restore_test_post.txt	Restauración verificada
evidencias-web01-db_connection_post.txt	WEB01 conecta correctamente a DB01
kali_db01_3306_blocked_post.txt	KALI01 no accede a MariaDB

## 10. Estado tras remediación
Hallazgo	Estado
DB-H01	Mitigado
DB-H02	Mitigado
DB-H03	Mitigado
DB-H05	Mitigado
DB-H06	Mitigado
DB-H07	Mitigado/parcial, según reglas SSH finales

## 11. Riesgo residual

Queda pendiente evaluar:

TLS en MariaDB.
Automatización periódica de backups.
Envío de backups a BCK01.
Monitorización de logs MariaDB.
Reglas definitivas en pfSense.

## 12. Relación con NIS2

Esta remediación mejora controles relacionados con:

Control de acceso.
Mínimo privilegio.
Seguridad de redes.
Continuidad de negocio.
Protección de datos.
Gestión de vulnerabilidades.
Evaluación de eficacia de medidas técnicas.