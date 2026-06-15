# 🚀 Free Claude Config - Instalación y Setup

Configuración completa e instalación de **Claude Code** con **UV** (gestor de paquetes Python ultra-rápido).

## 📋 ¿Qué es esto?

Este repositorio contiene:
- ✅ Documentación step-by-step de instalación
- ✅ Scripts de verificación automática
- ✅ Configuración de workspace para VS Code
- ✅ Referencia rápida de comandos
- ✅ Solución de problemas común

## 🚀 Inicio Rápido

### 1. Instala UV (si no lo tienes)
```powershell
irm "https://astral.sh/uv/install.ps1" | iex
```

### 2. Clona este repositorio
```powershell
git clone https://github.com/Samael2626/Free_Claude_Config.git
cd Free_Claude_Config
```

### 3. Instala dependencias
```powershell
uv pip install -e .
```

### 4. Verifica la instalación
```powershell
.\VERIFICAR_INSTALACION.ps1
```

## 📚 Documentación

Tenemos tres niveles de documentación para todos los niveles:

| Archivo | Descripción | Para quién |
|---------|------------|----------|
| **[LEEME.md](LEEME.md)** | Guía rápida (5 min) | Usuarios impacientes |
| **[INSTALACION.md](INSTALACION.md)** | Documentación completa | Usuarios que quieren entender todo |
| **[INSTALACION.html](INSTALACION.html)** | Versión web con estilos | Lectura en navegador |

## 🔧 Comandos Esenciales

```powershell
# Verificar instalación
.\VERIFICAR_INSTALACION.ps1

# Ver comandos disponibles
Get-Content .\COMANDOS_RAPIDOS.ps1

# UV
uv --version
uv pip install <paquete>
uv pip list

# Claude CLI
fcc --version
fcc claude
```

## ✅ Checklist de Instalación

- [ ] UV instalado (`uv --version` funciona)
- [ ] Python 3.8+ disponible
- [ ] Git configurado
- [ ] Dependencias instaladas
- [ ] Verificación pasó sin errores
- [ ] API key configurada

## 🆘 Problemas Comunes

### ❌ "UV no se encuentra"
```powershell
# Reinstala UV
irm "https://astral.sh/uv/install.ps1" | iex
# Reinicia PowerShell
```

### ❌ "fcc claude falla"
Ver sección "Solución de Problemas" en [INSTALACION.md](INSTALACION.md)

### ❌ "Python no encontrado"
Instala Python desde [python.org](https://www.python.org) (3.8 mínimo)

Para más problemas, consulta [INSTALACION.md](INSTALACION.md#solución-de-problemas)

## 📁 Estructura del Proyecto

```
Free_Claude_Config/
├── 📄 README.md                     ← Aquí
├── 📄 LEEME.md                      ← Inicio rápido
├── 📄 INSTALACION.md                ← Documentación completa
├── 🌐 INSTALACION.html              ← Versión web
├── ⚡ COMANDOS_RAPIDOS.ps1          ← Referencia rápida
├── 🔍 VERIFICAR_INSTALACION.ps1     ← Script de validación
├── .gitignore
└── .claude/
    └── settings.local.json          ← Configuración local
```

## 🎯 Próximos Pasos

1. Ejecuta `.\VERIFICAR_INSTALACION.ps1` para validar todo
2. Lee [LEEME.md](LEEME.md) para instrucciones rápidas
3. Configura tu `CLAUDE_API_KEY`
4. ¡Comienza a usar Claude Code!

## 🔗 Enlaces Útiles

- 📦 [UV - Python Package Manager](https://github.com/astral-sh/uv)
- 🤖 [Claude API Documentation](https://console.anthropic.com/docs)
- 🐍 [Python Official](https://www.python.org)
- 🔧 [VS Code](https://code.visualstudio.com)
- 🔐 [Git Guide](https://git-scm.com)

## 📝 Scripts Incluidos

### VERIFICAR_INSTALACION.ps1
Script que valida automáticamente:
- UV instalado correctamente
- Python disponible (3.8+)
- Git configurado
- Estructura del proyecto
- Paquetes de UV
- Claude CLI
- Variables de entorno

Uso:
```powershell
.\VERIFICAR_INSTALACION.ps1
```

### COMANDOS_RAPIDOS.ps1
Referencia de todos los comandos esenciales. Copiar y pegar lo que necesites.

## 💡 Tips & Best Practices

✅ **Seguridad:**
- Nunca commits tu `CLAUDE_API_KEY`
- Usa variables de entorno para credenciales
- Keep `.claude/settings.local.json` en `.gitignore`

✅ **Desarrollo:**
- Actualiza UV regularmente: `uv self update`
- Usa entornos virtuales para cada proyecto
- Documenta cambios importantes

✅ **Performance:**
- UV es mucho más rápido que pip (escrito en Rust)
- Cachea dependencias automáticamente
- Paralleliza instalaciones

## 🤝 Contribuciones

¿Encontraste un error? ¿Mejoras? Abre un [issue](https://github.com/Samael2626/Free_Claude_Config/issues)

## 📄 Licencia

Este proyecto es de código abierto.

## 📞 Soporte

Para problemas:
1. Consulta [INSTALACION.md](INSTALACION.md)
2. Ejecuta `.\VERIFICAR_INSTALACION.ps1`
3. Abre un [issue](https://github.com/Samael2626/Free_Claude_Config/issues)

---

**Última actualización:** 15 de junio de 2026  
**Estado:** ✅ Listo para usar  
**Versión:** 1.0

Hecho con ❤️ por Samuel
