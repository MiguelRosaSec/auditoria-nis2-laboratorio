# Riesgos específicos de identidad y Active Directory

## 1. Objetivo

Analizar los riesgos específicos asociados a Active Directory, identidad, contraseñas, privilegios y exposición de servicios.

---

## 2. Riesgos identificados

| ID Riesgo | Hallazgos relacionados | Activo | Amenaza | Prob. | Impacto | Riesgo | Nivel |
|---|---|---|---|---:|---:|---:|---|
| AD-R01 | AD-H01, AD-H02 | DC01 | Enumeración y ataques AD desde red no autorizada | 4 | 5 | 20 | Crítico |
| AD-R02 | AD-H03, AD-H04 | Usuarios AD | Compromiso masivo por contraseña inicial común | 4 | 5 | 20 | Crítico |
| AD-R03 | AD-H05 | Dominio AD | Password spraying/fuerza bruta sin bloqueo | 5 | 4 | 20 | Crítico |
| AD-R04 | AD-H08, AD-H09 | DC01/Dominio | Falta de auditoría y hardening centralizado | 3 | 4 | 12 | Alto |
| AD-R05 | AD-H06 | Cuentas privilegiadas | Compromiso de credenciales sin MFA | 3 | 5 | 15 | Alto |
| AD-R06 | AD-H07, AD-H10 | Grupos privilegiados | Exceso o mala gestión de privilegios | 3 | 5 | 15 | Alto |

---

## 3. Priorización

| Prioridad | Riesgos |
|---|---|
| P1 | AD-R01, AD-R02, AD-R03 |
| P2 | AD-R04, AD-R05, AD-R06 |

---

## 4. Tratamiento recomendado

| Riesgo | Tratamiento | Acción |
|---|---|---|
| AD-R01 | Reducir | Mantener segmentación y bloquear AD desde AUDIT |
| AD-R02 | Reducir | Contraseñas únicas y cambio obligatorio |
| AD-R03 | Reducir | Política de bloqueo y longitud reforzada |
| AD-R04 | Reducir | GPO base de hardening y auditoría |
| AD-R05 | Reducir | Estrategia MFA para accesos críticos |
| AD-R06 | Reducir | Revisión periódica de grupos privilegiados y modelo Tier |

---

## 5. Relación con NIS2

Estos riesgos afectan principalmente a:

- Control de acceso.
- Gestión de identidades.
- Higiene cibernética.
- Seguridad de sistemas críticos.
- Gestión de incidentes.
- Evaluación de eficacia de controles.

## 6. Estado tras hardening AD

| Riesgo | Estado | Observación |
|---|---|---|
| AD-R01 | Reducido | Segmentación ya limita exposición AD desde AUDIT |
| AD-R02 | Reducido | Contraseñas diferenciadas y cambio obligatorio |
| AD-R03 | Reducido | Longitud mínima 12 y bloqueo de cuenta configurado |
| AD-R04 | Reducido | GPO base y auditoría inicial configuradas |
| AD-R05 | Parcial | MFA documentado, pendiente implantación técnica |
| AD-R06 | Parcial | Grupos Tier creados, pendiente delegación avanzada |