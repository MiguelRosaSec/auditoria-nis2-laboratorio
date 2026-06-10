# Registro de decisiones técnicas

## Decisión 001: Uso de VMware como plataforma de virtualización

**Fecha:** 27/05/2026

**Decisión:**  
El laboratorio se desplegará íntegramente sobre VMware en un equipo anfitrión con Windows 11.

**Motivo:**  
VMware permite simular una infraestructura empresarial realista mediante varias máquinas virtuales, redes virtuales aisladas, múltiples adaptadores de red y snapshots para pruebas de auditoría, remediación y restauración.

**Alternativas valoradas:**

- Docker.
- VirtualBox.
- WSL2.
- Laboratorio cloud.

**Justificación:**  
Se descarta Docker como plataforma principal porque el objetivo es simular sistemas completos, incluyendo firewall, Active Directory, servidores Linux independientes, máquina auditora y segmentación de red realista.

**Impacto:**  
El proyecto será más pesado en recursos, pero más realista y útil para demostrar competencias de administración de sistemas, redes, seguridad y cumplimiento normativo.

---

## Decisión 002: Documentación local antes de publicación en GitHub

**Fecha:** 27/05/2026

**Decisión:**  
Toda la documentación, evidencias y configuraciones se mantendrán inicialmente en local. GitHub se utilizará solo al final del proyecto.

**Motivo:**  
Durante la construcción y auditoría del laboratorio pueden generarse evidencias, configuraciones o capturas con información sensible o no depurada.

**Impacto:**  
Se reduce el riesgo de publicar accidentalmente credenciales, claves, configuraciones internas o evidencias no anonimizadas.

---

## Decisión 003: Uso de estado inicial inseguro controlado

**Fecha:** 27/05/2026

**Decisión:**  
La infraestructura se configurará inicialmente con debilidades controladas para permitir una auditoría técnica inicial y una posterior remediación.

**Motivo:**  
El objetivo del proyecto no es solo montar sistemas seguros, sino demostrar capacidad de identificación de riesgos, documentación de hallazgos, tratamiento y mejora continua.

**Impacto:**  
Se podrán generar hallazgos técnicos reales y mapearlos contra requisitos NIS2.