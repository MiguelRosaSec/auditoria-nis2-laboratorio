# Instalación de Windows Server DC01

## 1. Objetivo

Instalar la máquina virtual DC01 con Windows Server para actuar como controlador de dominio y servidor DNS interno de la empresa simulada AlmeriaLogiTech S.L.

---

## 2. Datos de la máquina

| Elemento | Valor |
|---|---|
| Nombre VM | DC01 |
| Sistema | Windows Server |
| Rol | Active Directory Domain Services + DNS |
| Red VMware | LAN-10 |
| IP | 10.10.10.10 |
| Gateway | 10.10.10.1 |
| DNS | 10.10.10.10 |
| Dominio | almerialogitech.local |

---

## 3. Recursos asignados

| Recurso | Valor |
|---|---|
| CPU | 2 vCPU |
| RAM | 4 GB |
| Disco | 60 GB |
| Adaptador red | LAN-10 |

---

## 4. Instalación del sistema operativo

Se instaló Windows Server en edición Desktop Experience para facilitar la administración gráfica, la generación de evidencias y la configuración inicial del entorno.

Opciones principales:

| Parámetro | Valor |
|---|---|
| Tipo instalación | Custom |
| Edición | Standard Desktop Experience |
| Disco | 60 GB |
| Usuario inicial | Administrator |

---

## 5. Configuración inicial

Acciones realizadas:

- Instalación de VMware Tools.
- Cambio de nombre del servidor a DC01.
- Configuración de IP estática.
- Verificación de conectividad con pfSense.
- Preparación para instalación de Active Directory.

---

## 6. Configuración IP

| Parámetro | Valor |
|---|---|
| IP | 10.10.10.10 |
| Máscara | 255.255.255.0 |
| Gateway | 10.10.10.1 |
| DNS | 10.10.10.10 |

---

## 7. Instalación de Active Directory

Se instaló el rol Active Directory Domain Services mediante PowerShell:

```powershell
Install-WindowsFeature AD-Domain-Services -IncludeManagementTools


## 8.Promover servidor

Install-ADDSForest `
  -DomainName "almerialogitech.local" `
  -DomainNetbiosName "ALMERIALOGITECH" `
  -InstallDNS `
  -SafeModeAdministratorPassword (Read-Host -AsSecureString "Introduce la contraseña DSRM") `
  -Force