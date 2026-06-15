# Documentación: Instalación de Claude Code con UV

> **Fecha de creación:** 15 de junio de 2026  
> **Repositorio:** [Samael2626/Free_Claude_Config](https://github.com/Samael2626/Free_Claude_Config)  
> **Ambiente:** Windows PowerShell

---

## Tabla de Contenidos

1. [Descripción General](#descripción-general)
2. [Requisitos Previos](#requisitos-previos)
3. [Proceso de Instalación](#proceso-de-instalación)
4. [Instalación de UV](#instalación-de-uv)
5. [Configuración de Claude Code](#configuración-de-claude-code)
6. [Verificación de la Instalación](#verificación-de-la-instalación)
7. [Solución de Problemas](#solución-de-problemas)
8. [Estructura del Proyecto](#estructura-del-proyecto)

---

## Descripción General

Claude Code es un conjunto de herramientas que integran Claude (modelo de IA) con un entorno de desarrollo local. Este proyecto permite trabajar con agentes de IA para tareas de desarrollo mediante:

- **UV**: Un gestor de paquetes Python ultra-rápido escrito en Rust
- **CLI Tools**: Herramientas de línea de comandos para interactuar con Claude
- **Workspace Configuration**: Configuración personalizada para VS Code

---

## Requisitos Previos

Antes de comenzar, asegúrate de tener:

- **Windows 10/11** con PowerShell 5.1 o superior
- **Conexión a Internet** (para descargar UV y dependencias)
- **Espacios libres** en el disco (mínimo 2GB recomendado)
- **Visual Studio Code** (recomendado, no obligatorio)
- **Cuenta GitHub** (opcional, para clonar el repositorio)

---

## Proceso de Instalación

### Paso 1: Clonar el Repositorio

```powershell
# Navega a la carpeta donde deseas el proyecto
cd D:\Demo

# Clona el repositorio
git clone https://github.com/Samael2626/Free_Claude_Config.git

# Entra en la carpeta del proyecto
cd Free_Claude_Config
```

---

## Instalación de UV

UV es un gestor de paquetes Python moderno y rápido. Su instalación es automática mediante un script de Astral.

### Comando de Instalación

```powershell
irm "https://astral.sh/uv/install.ps1" | iex
```

**Explicación del comando:**
- `irm` = Invoke-RestMethod (descarga contenido remoto)
- `https://astral.sh/uv/install.ps1` = Script de instalación de UV desde Astral
- `| iex` = Invoke-Expression (ejecuta el script descargado)

### Resultado Esperado

```
✓ UV instalado correctamente
✓ Agregado al PATH de sistema
✓ Disponible en cualquier terminal PowerShell
```

### Verificación de UV

```powershell
uv --version
# Resultado esperado: uv 0.x.x
```

### Actualización de UV

```powershell
uv self update
# Resultado esperado: Exit code 0
```

---

## Configuración de Claude Code

### Instalación de Dependencias

Una vez UV esté instalado, usa el archivo `pyproject.toml` o `requirements.txt` para instalar las dependencias:

```powershell
# Opción 1: Usando UV (recomendado)
uv pip install -e .

# Opción 2: Instalación manual de paquetes
uv pip install <paquete>
```

### Configuración del Workspace

El proyecto incluye configuración personalizada en `.claude/settings.local.json`:

```json
{
  "permissions": {
    "allow": [
      "Bash(dir F:\\\\Brain\\\\10-Proyectos *)"
    ]
  }
}
```

**Qué hace:**
- Define permisos para ejecutar comandos Bash
- Permite explorar directorios específicos
- Personalizable según tus necesidades

### Configuración Adicional en VS Code

Si usas VS Code, configura los siguientes archivos:

**`.vscode/settings.json`:**
```json
{
  "python.defaultInterpreterPath": "${workspaceFolder}/.venv/bin/python",
  "python.linting.enabled": true,
  "python.formatting.provider": "black"
}
```

**`.vscode/extensions.json`:**
```json
{
  "recommendations": [
    "ms-python.python",
    "ms-python.vscode-pylance",
    "GitHub.copilot"
  ]
}
```

---

## Verificación de la Instalación

### Test 1: Comprobar UV

```powershell
uv --version
uv pip list  # Lista paquetes instalados
```

### Test 2: Comprobar Claude Code CLI

```powershell
fcc --version      # Versión de CLI
fcc claude         # Iniciar sesión o interactuar con Claude
```

**Nota:** Si `fcc claude` devuelve exit code 1, consulta la [Solución de Problemas](#solución-de-problemas).

### Test 3: Comprobar Permisos

```powershell
# Verifica que .claude/settings.local.json existe
Test-Path ".\.claude\settings.local.json"
```

---

## Solución de Problemas

### Problema: UV no se encuentra después de instalar

**Solución:**
```powershell
# 1. Cierra y reabre PowerShell
# 2. Verifica que UV está en el PATH
$env:PATH -split ";"

# 3. Reinstala UV si es necesario
irm "https://astral.sh/uv/install.ps1" | iex
```

### Problema: `fcc claude` falla con exit code 1

**Causas posibles:**
- Falta de autenticación con API de Claude
- Dependencias no instaladas correctamente
- Versión incompatible de Python

**Soluciones:**
```powershell
# 1. Reinstala dependencias
uv pip install --upgrade claude-cli

# 2. Verifica Python
python --version  # Debe ser 3.8+

# 3. Configura variables de entorno
$env:CLAUDE_API_KEY = "tu-api-key"

# 4. Intenta de nuevo
fcc claude
```

### Problema: Permisos denegados en `.claude/settings.local.json`

**Solución:**
```powershell
# 1. Verifica propiedades del archivo
Get-Item ".\.claude\settings.local.json" | Format-List

# 2. Otorga permisos si es necesario
icacls ".\.claude\settings.local.json" /grant:r "$env:USERNAME`:F"
```

---

## Estructura del Proyecto

```
D:\Demo\
├── .claude/
│   └── settings.local.json      # Configuración de permisos y workspace
├── .vscode/                      # Configuración de VS Code
│   ├── settings.json
│   └── extensions.json
├── .gitignore
├── pyproject.toml               # Configuración de UV y dependencias
├── requirements.txt             # Dependencias Python (alternativo)
├── README.md                    # Documentación principal
├── INSTALACION.md               # Este archivo
└── src/                         # Código fuente del proyecto
    └── main.py
```

---

## Comandos Rápidos

| Comando | Descripción |
|---------|-------------|
| `uv --version` | Muestra versión de UV |
| `uv pip install <paquete>` | Instala un paquete |
| `uv pip list` | Lista paquetes instalados |
| `uv self update` | Actualiza UV a la última versión |
| `uv run python script.py` | Ejecuta un script Python con UV |
| `fcc --version` | Muestra versión de Claude CLI |
| `fcc claude` | Inicia Claude Code CLI |

---

## Próximos Pasos

1. **Configura autenticación:** Obtén tu API key de Claude y configúrala
2. **Personaliza permisos:** Ajusta `.claude/settings.local.json` según necesites
3. **Instala extensiones:** Abre VS Code y instala las extensiones recomendadas
4. **Prueba un proyecto:** Crea tu primer script Python usando Claude Code

---

## Referencias

- 📚 [Documentación de UV](https://github.com/astral-sh/uv)
- 🤖 [Documentación de Claude](https://console.anthropic.com/docs)
- 🔧 [VS Code Python Extension](https://marketplace.visualstudio.com/items?itemName=ms-python.python)
- 📦 [PyPI - Python Package Index](https://pypi.org)

---

## Notas Importantes

⚠️ **Seguridad:**
- Nunca compartas tu `CLAUDE_API_KEY` públicamente
- Mantén `.claude/settings.local.json` fuera del control de versiones (incluye en `.gitignore`)

✅ **Best Practices:**
- Usa entornos virtuales aislados para cada proyecto
- Mantén UV actualizado regularmente
- Documenta cambios en la configuración

📝 **Contribuciones:**
Si encuentras problemas o mejoras, abre un issue en el [repositorio de GitHub](https://github.com/Samael2626/Free_Claude_Config)

---

**Última actualización:** 15 de junio de 2026  
**Autor:** Documentación automática de Claude Code  
**Estado:** ✅ Activo y mantenido
