# ============================================
# CLAUDE CODE INSTALLATION - QUICK REFERENCE
# ============================================
# Referencia rápida de comandos essentials

# INSTALACIÓN DE UV (Una sola vez)
irm "https://astral.sh/uv/install.ps1" | iex

# VERIFICACIÓN
uv --version
uv self update

# GESTIÓN DE PAQUETES
uv pip install <paquete>           # Instalar paquete
uv pip install -e .                 # Instalar proyecto (editable)
uv pip list                         # Listar paquetes
uv pip uninstall <paquete>         # Desinstalar
uv pip show <paquete>              # Ver detalles

# EJECUCIÓN
uv run python script.py             # Ejecutar script con UV
uv run python -m <module>          # Ejecutar módulo

# CLAUDE CODE CLI
fcc --version                       # Ver versión
fcc claude                          # Abrir Claude CLI
fcc --help                          # Ayuda

# VARIABLES DE ENTORNO
$env:CLAUDE_API_KEY = "tu-api-key"
$env:PYTHONPATH = ".\"

# VERIFICACIÓN DEL WORKSPACE
Test-Path ".\.claude\settings.local.json"
Get-Item ".\.claude\settings.local.json"

# CREAR ENTORNO VIRTUAL (opcional)
uv venv .venv
.\.venv\Scripts\Activate.ps1

# BUSCAR EN DEPENDENCIAS
uv pip search <termo>

# ACTUALIZAR DEPENDENCIAS
uv pip install --upgrade <paquete>
uv pip install --upgrade -e .

# PROBLEMAS COMUNES
# Si UV no funciona: Reinicia PowerShell y ejecuta nuevamente
# Si API key falla: Verifica que está bien configurada en variables de entorno
# Si scripts no ejecutan: Verifica permisos con: Get-ExecutionPolicy

# ============================================
# ESTRUCTURA BÁSICA DEL PROYECTO
# ============================================
# D:\Demo\
#   ├── .claude\settings.local.json
#   ├── .vscode\
#   │   ├── settings.json
#   │   └── extensions.json
#   ├── src\
#   │   └── main.py
#   ├── pyproject.toml
#   ├── requirements.txt
#   └── README.md
