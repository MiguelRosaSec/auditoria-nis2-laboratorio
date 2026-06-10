# Estrategia MFA

## 1. Objetivo

Definir una estrategia de autenticación multifactor para AlmeriaLogiTech S.L. como medida de mejora frente a NIS2.

---

## 2. Alcance recomendado

| Servicio | MFA recomendado | Prioridad |
|---|---|---|
| VPN | Sí | Alta |
| Acceso administrativo remoto | Sí | Alta |
| Cuentas privilegiadas AD | Sí | Alta |
| Correo corporativo/cloud | Sí | Alta |
| Portal de clientes | Evaluar | Media |
| Aplicaciones internas | Evaluar | Media |

---

## 3. Justificación

El uso de MFA reduce el riesgo de compromiso derivado de robo de credenciales, password spraying, phishing y reutilización de contraseñas.

---

## 4. Estado actual

En el laboratorio actual no se ha implantado MFA técnico sobre Active Directory local.

Se documenta como medida pendiente de madurez y como acción futura del plan de adecuación.

---

## 5. Acción recomendada

Evaluar soluciones como:

- MFA en VPN/firewall.
- Integración con proveedor de identidad.
- Protección de cuentas privilegiadas.
- Políticas de acceso condicional en entornos cloud.