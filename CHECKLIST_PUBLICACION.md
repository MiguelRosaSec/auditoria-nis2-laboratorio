# Checklist de publicación en GitHub

## 1. Limpieza de secretos

| Revisión | Estado |
|---|---|
| No hay contraseñas en claro | Pendiente |
| No hay hashes reales publicados | Pendiente |
| No hay claves privadas | Pendiente |
| No hay tokens/API keys | Pendiente |
| No hay ficheros `.env` | Pendiente |
| No hay backups SQL reales | Pendiente |
| No hay capturas con credenciales | Pendiente |

---

## 2. Limpieza de evidencias

| Revisión | Estado |
|---|---|
| Capturas revisadas | Pendiente |
| Logs anonimizados | Pendiente |
| IPs públicas eliminadas | Pendiente |
| Usuarios sensibles anonimizados | Pendiente |
| Datos personales eliminados | Pendiente |
| Ficheros `.pcap` eliminados | Pendiente |

---

## 3. Calidad documental

| Revisión | Estado |
|---|---|
| README completo | Pendiente |
| Índice documental creado | Pendiente |
| Disclaimer añadido | Pendiente |
| Informes finales incluidos | Pendiente |
| Roadmap final incluido | Pendiente |
| Ortografía revisada | Pendiente |
| Enlaces internos revisados | Pendiente |

---

## 4. Git

| Revisión | Estado |
|---|---|
| `.gitignore` creado | Pendiente |
| Repositorio inicializado | Pendiente |
| Primer commit realizado | Pendiente |
| Rama principal definida | Pendiente |
| Repositorio remoto configurado | Pendiente |
| Push inicial realizado | Pendiente |

---

## 5. Revisión final

Antes de publicar, ejecutar:

```powershell
Select-String -Path .\**\* -Pattern "password","contraseña","secret","token","AppPassword","AdminLab","ClienteLab","OperadorLab","Tmp-" -CaseSensitive:$false