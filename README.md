# Deco → AdGuard Sync — Home Assistant Add-on

Sincroniza automáticamente los clientes del **TP-Link Deco XE75 Pro** con **AdGuard Home**, usando la API de ambos.

## Instalación

1. En Home Assistant ir a **Settings → Add-ons → Add-on Store**
2. Click en los 3 puntos (arriba a la derecha) → **Repositories**
3. Agregar la URL de este repo: `https://github.com/TU_USUARIO/TU_REPO`
4. Buscar **"Deco → AdGuard Sync"** e instalar

## Configuración

| Opción | Descripción | Ejemplo |
|---|---|---|
| `deco_host` | URL del Deco principal | `https://10.0.2.1` |
| `deco_pass` | Contraseña de administración local del Deco | `micontrasena` |
| `agh_host` | URL de AdGuard Home | `https://10.0.2.232:3002` |
| `agh_user` | Usuario de AdGuard Home | `admin` |
| `agh_pass` | Contraseña de AdGuard Home | `micontrasena` |
| `min_ip_suffix` | Último octeto mínimo de IP a exportar | `100` (exporta desde 10.0.2.100) |
| `run_on_start` | Correr sync al iniciar el add-on | `true` |

## Funcionamiento

- Al iniciar corre una sincronización inmediata (si `run_on_start: true`)
- Luego sincroniza automáticamente **cada 6 horas**
- Los clientes que ya existen en AdGuard Home (por nombre o por IP) se saltean
- Los nuevos se crean con `use_global_settings: true` y `use_global_blocked_services: true`
