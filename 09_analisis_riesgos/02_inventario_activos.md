# Inventario de activos para análisis de riesgos

## 1. Objetivo

Identificar los activos tecnológicos y de información relevantes para el análisis de riesgos inicial.

---

## 2. Activos identificados

| ID Activo | Activo | Tipo | Zona | Criticidad | Descripción |
|---|---|---|---|---|---|
| A-001 | FW01 pfSense | Firewall | Perímetro | Crítica | Controla la comunicación entre zonas |
| A-002 | DC01 Active Directory | Identidad/DNS | LAN | Crítica | Gestiona usuarios, autenticación y DNS interno |
| A-003 | WEB01 Portal clientes | Aplicación web | DMZ | Alta | Portal expuesto para clientes |
| A-004 | DB01 MariaDB | Base de datos | LAN | Crítica | Contiene clientes, pedidos y usuarios |
| A-005 | KALI01 | Auditoría | AUDIT | Media | Máquina auditora autorizada |
| A-006 | ADM01 | Administración | LAN | Media | Administración inicial de pfSense |
| A-007 | Red LAN-10 | Red interna | LAN | Crítica | Aloja sistemas internos |
| A-008 | Red DMZ-20 | Red expuesta | DMZ | Alta | Aloja servicios publicados |
| A-009 | Red AUDIT-50 | Red auditoría | AUDIT | Alta | Permite pruebas técnicas controladas |
| A-010 | Credenciales de usuarios | Información | AD/Web/DB | Crítica | Datos de autenticación |
| A-011 | Datos de clientes | Información | DB01 | Crítica | Información de clientes simulados |
| A-012 | Datos de pedidos | Información | DB01 | Alta | Información operativa simulada |