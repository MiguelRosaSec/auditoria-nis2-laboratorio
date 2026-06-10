# Configuración inicial de Active Directory

## 1. Objetivo

Configurar la estructura inicial de Active Directory para la empresa simulada AlmeriaLogiTech S.L., incluyendo unidades organizativas, grupos de seguridad y usuarios ficticios.

---

## 2. Dominio

| Elemento | Valor |
|---|---|
| Dominio | almerialogitech.local |
| NetBIOS | ALMERIALOGITECH |
| Controlador de dominio | DC01 |
| IP DC01 | 10.10.10.10 |

---

## 3. Estructura de OUs

```text
AlmeriaLogiTech
├── Usuarios
│   ├── Direccion
│   ├── IT
│   ├── Operaciones
│   ├── Finanzas
│   ├── RRHH
│   └── AtencionClientes
├── Equipos
├── Servidores
└── Grupos