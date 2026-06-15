# 🚀 Claude Code - Guía de Instalación

Bienvenido a **Claude Code**, un sistema integrado que combina IA y desarrollo local.

## ⚡ Inicio Rápido (5 minutos)

### 1️⃣ Instala UV (si no lo tienes)
```powershell
irm "https://astral.sh/uv/install.ps1" | iex
```

### 2️⃣ Clona el repositorio
```powershell
git clone https://github.com/Samael2626/Free_Claude_Config.git
cd Free_Claude_Config
```

### 3️⃣ Instala dependencias
```powershell
uv pip install -e .
```

### 4️⃣ Verifica la instalación
```powershell
# Ejecuta el script de verificación
.\VERIFICAR_INSTALACION.ps1
```

---

## 📚 Documentación Completa

Hay tres niveles de documentación disponibles:

### 📄 **INSTALACION.md** (Recomendado para lectura)
Documentación completa en Markdown con:
- Explicación de cada paso
- Solución de problemas
- Comandos y ejemplos
- Estructura del proyecto

**Abre en:** VS Code o GitHub

### 🌐 **INSTALACION.html** (Formato visual)
Versión web con interfaz gráfica:
- Tabla de contenidos interactiva
- Colores y estilos profesionales
- Fácil de navegar en navegador
- Incluye todas las secciones

**Abre con:** Cualquier navegador web

### ⚡ **COMANDOS_RAPIDOS.ps1** (Referencia rápida)
Archivo de referencia con todos los comandos esenciales:
- Instalación
- Verificación
- Gestión de paquetes
- Variables de entorno

**Copia y pega:** Los comandos que necesites

---

## 🔧 Comandos Esenciales

| Comando | Qué hace |
|---------|----------|
| `uv --version` | Muestra versión de UV |
| `uv pip install <paquete>` | Instala un paquete |
| `uv pip list` | Lista paquetes |
| `uv self update` | Actualiza UV |
| `fcc claude` | Abre Claude CLI |
| `.\VERIFICAR_INSTALACION.ps1` | Verifica todo está bien |

---

## ✅ Verificación Rápida

Ejecuta esto para verificar que todo funciona:

```powershell
# Script automático (recomendado)
.\VERIFICAR_INSTALACION.ps1

# O manual:
uv --version
python --version
git --version
```

---

## 🆘 Problemas Comunes

### ❌ "UV no encontrado"
```powershell
# Solución: Reinicia PowerShell y ejecuta:
irm "https://astral.sh/uv/install.ps1" | iex
```

### ❌ "fcc claude falla"
Consulta la sección "Solución de Problemas" en **INSTALACION.md**

### ❌ "Python no encontrado"
Necesitas Python 3.8+. Instálalo desde [python.org](https://www.python.org)

---

## 📁 Archivos de este Proyecto

```
D:\Demo\
├── 📄 LEEME.md                      ← Empezar aquí
├── 📄 INSTALACION.md                ← Documentación completa
├── 🌐 INSTALACION.html              ← Versión web (abre en navegador)
├── ⚡ COMANDOS_RAPIDOS.ps1          ← Referencia de comandos
├── 🔍 VERIFICAR_INSTALACION.ps1     ← Script de validación
├── .claude/
│   └── settings.local.json
├── .vscode/
│   └── settings.json
└── src/
    └── main.py
```

---

## 🎯 Próximos Pasos

1. ✅ Ejecuta `.\VERIFICAR_INSTALACION.ps1`
2. 📚 Lee `INSTALACION.md` si necesitas más detalles
3. 🔑 Configura tu `CLAUDE_API_KEY`
4. 🚀 Comienza a usar Claude Code

---

## 🔗 Enlaces Útiles

- 🌟 **Repositorio:** https://github.com/Samael2626/Free_Claude_Config
- 📦 **UV Docs:** https://github.com/astral-sh/uv
- 🤖 **Claude API:** https://console.anthropic.com
- 🐍 **Python:** https://www.python.org

---

## 💡 Consejos

- **Actualiza regularmente:** `uv self update`
- **Mantén segura tu API key** (no la compartas)
- **Usa entornos virtuales** para cada proyecto
- **Consulta la documentación** si algo no funciona

---

## ❓ ¿Preguntas?

Consulta **INSTALACION.md** o abre un issue en el repositorio.

---

**Última actualización:** 15 de junio de 2026  
**Versión:** 1.0  
**Estado:** ✅ Listo para usar
