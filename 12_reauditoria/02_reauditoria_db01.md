# Reauditoría de DB01 tras remediación

## 1. Objetivo

Verificar la eficacia de las medidas de remediación aplicadas sobre DB01 y MariaDB.

---

## 2. Sistema reauditorado

| Elemento | Valor |
|---|---|
| Sistema | DB01 |
| IP | 10.10.10.30 |
| Zona | LAN |
| Servicio principal | MariaDB |
| Puerto | 3306/TCP |
| Máquina auditora | KALI01 |
| Origen autorizado | WEB01 10.10.20.10 |

---

## 3. Hallazgos revalidados

| Hallazgo | Prueba realizada | Resultado esperado |
|---|---|---|
| DB-H01 MariaDB en `0.0.0.0` | `ss -tulpen` | Escucha en `10.10.10.30:3306` |
| DB-H02 appuser desde `%` | `SELECT user,host` | Solo `10.10.20.10` |
| DB-H03 privilegios excesivos | `SHOW GRANTS` | Sin `ALL PRIVILEGES` |
| DB-H05 sin backup | Script backup | Backup generado |
| DB-H05 sin restore | Restauración prueba | Restore correcto |
| DB-H06 UFW inactivo | `ufw status` | UFW activo |
| DB-H07 SSH amplio | Nmap desde Kali | Filtrado o limitado |

---

## 4. Comandos ejecutados en DB01


sudo ss -tulpen | grep 3306
sudo systemctl status mariadb --no-pager
sudo ufw status verbose
sudo mariadb -e "SELECT user, host FROM mysql.user WHERE user='appuser';"
sudo mariadb -e "SHOW GRANTS FOR 'appuser'@'10.10.20.10';"
sudo /usr/local/sbin/backup_almerialogitech.sh
sudo ls -lh /opt/backups/mysql/

## 5. Comandos ejecutados desde WEB01
mariadb -h 10.10.10.30 -u appuser -p almerialogitech -e "SHOW TABLES; SELECT COUNT(*) AS total_clientes FROM clientes;"

Resultado esperado:

Conexión permitida.
Consulta correcta.
Aplicación sigue operativa.

## 6. Comandos ejecutados desde KALI01
nc -vz 10.10.10.30 3306
sudo nmap -sS -Pn -p 3306 10.10.10.30
sudo nmap -sS -Pn -p 22 10.10.10.30

Resultado esperado:

Puerto 3306 filtrado o no accesible desde AUDIT.
SSH filtrado o limitado según política final.

## 7. Evidencias generadas
Evidencia	Descripción
db01_3306_bind_post.txt	MariaDB escucha en IP concreta
db01_mariadb_status_post.txt	Servicio MariaDB activo
db01_appuser_hosts_post.txt	Origen del usuario appuser
db01_appuser_grants_post.txt	Privilegios reducidos
db01_ufw_status_post.txt	Firewall local activo
web01_db_connection_allowed_post.txt	WEB01 puede conectar
kali_db01_3306_nc_post.txt	KALI01 no accede a 3306
db01_3306_post.nmap	Escaneo Nmap post-remediación
db01_backup_execution_post.txt	Ejecución de backup
db01_backup_files_post.txt	Fichero de backup generado
db01_restore_test_post.txt	Restauración validada

## 8. Comparativa antes/después
Control	Antes	Después	Estado
Escucha MariaDB	0.0.0.0:3306	10.10.10.30:3306	Mitigado
Origen appuser	%	10.10.20.10	Mitigado
Privilegios appuser	ALL PRIVILEGES	SELECT	Mitigado
Firewall local	Inactivo	UFW activo	Mitigado
Acceso desde KALI	3306 abierto	3306 filtrado/no accesible	Mitigado
Backup	No configurado	Script operativo	Mitigado
Restore	No probado	Restauración verificada	Mitigado

## 9. Riesgo residual
Riesgo residual	Estado
TLS en MariaDB	Pendiente
Automatización periódica con cron	Pendiente
Envío a servidor BCK01	Pendiente
Monitorización MariaDB	Pendiente
Reglas pfSense definitivas	Pendiente

## 10. Relación con NIS2

La remediación de DB01 mejora controles relacionados con:

Control de acceso.
Gestión de privilegios.
Seguridad de redes.
Continuidad de negocio.
Copias de seguridad.
Restauración.
Protección de datos.
Gestión de vulnerabilidades.
Evaluación de eficacia de medidas técnicas.

## 11. Conclusión

La reauditoría de DB01 permite verificar que las principales debilidades iniciales de base de datos han sido mitigadas.

DB01 mantiene funcionalidad para WEB01, pero reduce significativamente la exposición desde redes no autorizadas.